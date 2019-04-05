from rest_framework import serializers
from users.models import Profile, Appointment,Prescription,Prescription_info
from hospital.models import MedicineType
from django.contrib.auth.models import User ,Group
from django.contrib.auth.hashers import make_password
from default.utils import *
from rest_framework.validators import UniqueValidator
import datetime
from django.db.models import Q
from django.core.files.base import ContentFile
import base64
import six
import uuid

class Base64ImageField(serializers.ImageField):

    def to_internal_value(self, data):

        if isinstance(data, six.string_types):
            if 'data:' in data and ';base64,' in data:
                header, data = data.split(';base64,')

            try:
                decoded_file = base64.b64decode(data)
            except TypeError:
                self.fail('invalid_image')

            file_name = str(uuid.uuid4())[:12] # 12 characters are more than enough.
            file_extension = self.get_file_extension(file_name, decoded_file)
            complete_file_name = "%s.%s" % (file_name, file_extension, )
            data = ContentFile(decoded_file, name=complete_file_name)

        return super(Base64ImageField, self).to_internal_value(data)

    def get_file_extension(self, file_name, decoded_file):
        import imghdr

        extension = imghdr.what(file_name, decoded_file)
        extension = "jpg" if extension == "jpeg" else extension

        return extension

    def from_native(self, data):
        if isinstance(data, basestring) and data.startswith('data:image'):
            # base64 encoded image - decode
            format, imgstr = data.split(';base64,')  # format ~= data:image/X,
            ext = format.split('/')[-1]  # guess file extension

            data = ContentFile(base64.b64decode(imgstr), name='temp.' + ext)

        return super(Base64ImageField, self).from_native(data)


class GroupSerializer(serializers.ModelSerializer):
	class Meta:
		model = Group
		fields = ('id','name',)

class UsersSerializer(serializers.ModelSerializer):   #  used to get user profile
	groups = GroupSerializer(many=True, read_only=True)
	id = serializers.IntegerField(read_only=True)
	password1 = serializers.CharField(read_only=True)
	password2 = serializers.CharField(read_only=True)
	username = serializers.CharField(validators=[UniqueValidator(queryset=User.objects.all())], max_length=150)
	email = serializers.EmailField(validators=[UniqueValidator(queryset=User.objects.all())])
	# add role base profile fields here
	def __init__(self, *args, **kwargs):
		super(UsersSerializer, self).__init__(*args, **kwargs)
 
		if 'context' in kwargs:
			request = kwargs['context']['request']
			self.fields['title'] = serializers.CharField(source='profile.title', read_only=True)
			if request.GET.get('type', False) == 'doctor':
				self.fields['gender'] = serializers.CharField(source='profile.gender', read_only=True)
				self.fields['designation'] = serializers.CharField(source='profile.designation', read_only=True)
				self.fields['qualification'] = serializers.CharField(source='profile.qualification', read_only=True)
				self.fields['experience'] = serializers.CharField(source='profile.experience', read_only=True)
				self.fields['specialty'] = serializers.CharField(source='profile.specialty', read_only=True)
				self.fields['mobile_no'] = serializers.CharField(source='profile.mobile_no', read_only=True)
				self.fields['session_1_start'] = serializers.CharField(source='profile.session_1_start', read_only=True)
				self.fields['session_1_end'] = serializers.CharField(source='profile.session_1_end', read_only=True)
				self.fields['session_2_start'] = serializers.CharField(source='profile.session_2_start', read_only=True)
				self.fields['session_2_end'] = serializers.CharField(source='profile.session_2_end', read_only=True)
			elif request.GET.get('type', False) == 'student':
				self.fields['gender'] = serializers.CharField(source='profile.gender', read_only=True)
				self.fields['weight'] = serializers.CharField(source='profile.weight', read_only=True)
				self.fields['height'] = serializers.CharField(source='profile.height', read_only=True)
				self.fields['martial_status'] = serializers.CharField(source='profile.martial_status', read_only=True)
				self.fields['blood_type'] = serializers.CharField(source='profile.blood_type', read_only=True)
				self.fields['diseases'] = serializers.CharField(source='profile.diseases', read_only=True)
				self.fields['notes'] = serializers.CharField(source='profile.notes', read_only=True)

	def validate_password1(self, password):
		request = self.context.get("request")
		password2 = request.data['password2']
		if password != password2:
			raise serializers.ValidationError("Password and confirm password do not match")
		elif password is None or password == '':
			raise serializers.ValidationError("Password can not be null")
		else:
			return password

	def update(self, instance, validated_data):
		request = self.context.get("request")
		user = super(UsersSerializer, self).update(instance, validated_data)
		if 'password1' in request.data:
			# update password
			password = request.data['password1']
			if password:
				user.set_password(password)
		user.save()

		# update user group
		if 'groups' in request.data:
			group = request.data['groups']
			# check if group not exist already
			if not user.groups.filter(id=group):
				user.groups.add(group)

			old_groups = user.groups.exclude(id=group)
			if old_groups:
				user.groups.remove(*list(old_groups))

		return user

	class Meta:
		model = User
		fields = ('id','username','first_name', 'last_name','email','is_active','groups','password1','password2')
		datatables_always_serialize = ('id',)


class ProfileSerializer(serializers.ModelSerializer):   #  used to get user profile

	avatar = Base64ImageField(max_length=None, use_url=True)
	class Meta:
		model = Profile
		fields = ('user','gender', 'designation', 'qualification', 'experience', 'primary_hospital', 'secondary_hospital', 'specialty', 'mobile_no', 'session_1_start', 'session_1_end', 'session_2_start', 'session_2_end', 'avatar',
		'martial_status', 'weight', 'height', 'blood_type', 'notes', 'created_date', 'modified_date')

class DoctorsSerializer(serializers.ModelSerializer):   #  used to get user profile
	user = serializers.CharField(source='user.username', read_only=True)
	email = serializers.CharField(source='user.email', read_only=True)
	first_name = serializers.CharField(source='user.first_name', read_only=True)
	last_name = serializers.CharField(source='user.last_name', read_only=True)
	is_active=serializers.CharField(source='user.is_active', read_only=True)
	class Meta:
		model = Profile
		fields = ('user_id','user','title','last_name','first_name','email', 'is_active', 'gender', 'designation', 'qualification', 'experience', 'primary_hospital', 'secondary_hospital', 'specialty', 'mobile_no', 'timing', 'avatar',
		'martial_status', 'weight', 'height', 'notes', 'created_date', 'modified_date')

class StudentSerializer(serializers.ModelSerializer):   #  used to get user profile
	user = serializers.CharField(source='user.username', read_only=True)
	email = serializers.CharField(source='user.email', read_only=True)
	first_name = serializers.CharField(source='user.first_name', read_only=True)
	last_name = serializers.CharField(source='user.last_name', read_only=True)
	is_active=serializers.CharField(source='user.is_active', read_only=True)

	class Meta:
		model = User
		fields = ('user_id','user','title','email', 'is_active', 'first_name','last_name', 'gender', 'mobile_no', 'avatar', 'martial_status', 'weight', 'height', 'blood_type', 'notes', 'created_date', 'modified_date')

class AppointmentsSerializer(serializers.ModelSerializer):   #  used to get user Appointments
	student = serializers.CharField(source='student.username', read_only=True)
	doctor  = serializers.CharField(source='doctor.username', read_only=True)
	refer_to_name  = serializers.CharField(source='refer_to.username', read_only=True)# use for listing

	def validate(self, data):
		request = self.context.get("request")
		# where refer_to field is coming in request, that means it's partial update, so no need for date validation in that case
		print(data)
		if 'refer_to' not in request.data:
			doctor_id = request.data['doctor_id']
			date_time = request.data['datetime']
			# check appointment time exist in doctor session times
			date_time = datetime.datetime.strptime(str(date_time), '%Y-%m-%d %H:%M:%S')
			time = date_time.strftime('%H:%M:%S')
			if not Profile.objects.filter((Q(session_1_start__lte=time, session_1_end__gte=time) | Q(session_2_start__lte=time, session_2_end__gte=time)),user_id=doctor_id).exists():
				raise serializers.ValidationError("Doctor is not available at this time")

			if self.instance: # for edit case
				if Appointment.objects.filter(doctor_id=doctor_id, datetime=date_time).exclude(id=self.instance.id).exists():
					raise serializers.ValidationError("Appointment already exist for given date")
			else:
				if Appointment.objects.filter(doctor_id=doctor_id, datetime=date_time).exists():
					raise serializers.ValidationError("Appointment already exist for given date")
			print('testing')
		# raise serializers.ValidationError("Hold down")
		return super(AppointmentsSerializer, self).validate(data)

	def create(self, validated_data):
		# Create the object instance...
		request = self.context.get("request")
		validated_data['doctor'] = User.objects.get(id=request.data['doctor_id'])
		validated_data['student'] = User.objects.get(id=request.data['student_id'])
		if 'student_id' not in request.data:
			validated_data['refer_to'] = User.objects.get(id=request.data['refer_to']) # for saving
		appointment = Appointment.objects.create(**validated_data)
		return appointment

	class Meta:
		model = Appointment
		fields = ('id','student','doctor','datetime','doctor_id','student_id','disease', 'notes', 'status','created_date', 'modified_date','refer_to','refer_to_name')

class PrescriptionSerializer(serializers.ModelSerializer):   #  used to get user Prescription
	doctor = serializers.CharField(source='appointment.doctor.username', read_only=True) # doctor name of model fields and username from user
	student = serializers.CharField(source='appointment.student.username', read_only=True)
	medicine_type = serializers.CharField(source='medicine_type.name', read_only=True)
	def create(self, validated_data):

		# Create the object instance...
		request = self.context.get("request")
		validated_data['appointment'] = Appointment.objects.get(id=request.data['appointment'])
		validated_data['medicine_type'] = MedicineType.objects.get(id=request.data['medicine_type'])
		Prescription_info = Prescription_info.objects.create(**validated_data)
		return Prescription_info

	def update(self, instance, validated_data):
		instance.medicine_name = validated_data.get('medicine_name', instance.medicine_name)
		instance.medicine_type = validated_data.get('medicine_type', instance.medicine_type)
		instance.how_to_use = validated_data.get('how_to_use', instance.how_to_use)
		request = self.context.get("request")
		instance.edit_by = request.user
		instance.save()
		return instance

	class Meta:
		model = Prescription_info
		fields = ('doctor','student','medicine_name','medicine_type','how_to_use','appointment','edit_by')




