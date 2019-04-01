from rest_framework import serializers
from users.models import Profile, Appointment,Prescription
from hospital.models import MedicineType
from django.contrib.auth.models import User ,Group
from django.contrib.auth.hashers import make_password
from default.utils import *
from rest_framework.validators import UniqueValidator

class GroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = Group
        fields = ('id','name',)

class UsersSerializer(serializers.ModelSerializer):   #  used to get user profile
    groups = GroupSerializer(many=True, read_only=True)
    id = serializers.IntegerField(read_only=True)
    password1 = serializers.CharField(write_only=True)
    password2 = serializers.CharField(write_only=True)
    username = serializers.CharField(validators=[UniqueValidator(queryset=User.objects.all())], max_length=150)
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
                self.fields['timing'] = serializers.CharField(source='profile.timing', read_only=True)
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
    class Meta:
        model = Profile
        fields = ('user','gender', 'designation', 'qualification', 'experience', 'primary_hospital', 'secondary_hospital', 'specialty', 'mobile_no', 'timing', 'avatar',
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
        'martial_status', 'weight', 'height', 'blood_type', 'notes', 'created_date', 'modified_date')


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
    def create(self, validated_data):

        # Create the object instance...
        request = self.context.get("request")
        validated_data['doctor'] = User.objects.get(id=request.data['doctor_id'])
        validated_data['student'] = User.objects.get(id=request.data['student_id'])
        if request.data['student_id']:
           validated_data['refer_to'] = User.objects.get(id=request.data['doctor_id'])
        else:
             validated_data['refer_to'] = User.objects.get(id=request.data['refer_to']) # for saving
        appointment = Appointment.objects.create(**validated_data)
        return appointment    

    class Meta:
        model = Appointment
        fields = ('id','student','doctor','datetime','doctor_id','student_id','disease', 'notes', 'status','created_date', 'modified_date','refer_to','refer_to_name')

class PrescriptionSerializer(serializers.ModelSerializer):   #  used to get user Prescription
    doctor = serializers.CharField(source='appointment.doctor', read_only=True) # doctor name of model fields and username from user
    student = serializers.CharField(source='appointment.student.username', read_only=True)
    medicine_type = serializers.CharField(source='medicine_type.name', read_only=True)
    def create(self, validated_data):

        # Create the object instance...
        request = self.context.get("request")
        validated_data['appointment'] = Appointment.objects.get(id=request.data['appointment'])
        validated_data['medicine_type'] = MedicineType.objects.get(id=request.data['medicine_type'])
        prescription = Prescription.objects.create(**validated_data)
        return prescription

    def update(self, instance, validated_data):
        instance.medicine_name = validated_data.get('medicine_name', instance.medicine_name)
        instance.medicine_type = validated_data.get('medicine_type', instance.medicine_type)
        instance.how_to_use = validated_data.get('how_to_use', instance.how_to_use)
        request = self.context.get("request")
        instance.edit_by = request.user
        instance.save()
        return instance

    class Meta:
        model = Prescription
        fields = ('doctor','student','medicine_name','medicine_type','how_to_use','appointment','edit_by')




