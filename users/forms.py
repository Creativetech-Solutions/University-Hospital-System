from django import forms
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Layout, Row, Field, Fieldset
from django.contrib.auth.models import User, Group
from django.contrib.auth.forms import UserCreationForm
from .models import User, Profile, Appointment,Prescription,Prescription_info
from default.templatetags.custom_tags import *
from django_select2.forms import Select2TagWidget

class UserCreationform(UserCreationForm):
    email = forms.EmailField(required=True)
    groups = forms.ModelMultipleChoiceField(queryset=Group.objects.all(), required=True, initial=0)
    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request')
        super(UserCreationform, self).__init__(*args, **kwargs)
        if isSuperAdmin(self.request):
            self.fields['groups'] = forms.ModelMultipleChoiceField(queryset=Group.objects.all(), required=True, initial=0) # for super admin all group
        elif isHospitalAdmin(self.request):
            self.fields['groups'] = forms.ModelMultipleChoiceField(queryset=Group.objects.filter(name__in=['Doctor','Student']), required=True, initial=0)# for Hospital admin student and doctor group
        else:
            del self.fields['groups'] # removed for other users

        self.helper = FormHelper()
        self.fields['first_name'].required = True
        self.fields['last_name'].required = True
        self.fields['username'].help_text  = 'Required. 150 characters or fewer'
        self.helper.layout = Layout(
            Row(
                Field('first_name', wrapper_class='col-sm-6'),
                Field('last_name', wrapper_class='col-sm-6')
            ),
            Row(
                Field('username', wrapper_class='col-sm-6'),
                Field('email', wrapper_class='col-sm-6'),
            ),
            Row(
                Field('password1', wrapper_class='col-sm-6'),
                Field('password2', wrapper_class='col-sm-6'),
            ),
            Row(
                Field('groups', wrapper_class='col-sm-6'),
            ),
        )

    class Meta:
        model  = User
        fields = ['username','first_name','last_name','email','password1','password2','groups']

class Doctorsform(forms.ModelForm):
    # user_id = forms.ModelChoiceField(queryset=User.objects.all())
    def __init__(self, *args, **kwargs):

        user = kwargs.pop('user')
        super(Doctorsform, self).__init__(*args, **kwargs)
        if user is not None:
            self.fields['user'] = forms.ModelChoiceField(queryset=User.objects.filter(id=user.id), empty_label=None)
        
        # self.fields['timing'].widget.attrs['rows'] = 3
        self.fields['notes'].widget.attrs['rows'] = 3
        self.fields['avatar'] = forms.ImageField(label='Choose Avatar', error_messages = {'invalid':"Image files only"}, widget=forms.FileInput)
        self.helper = FormHelper()
        self.helper.layout = Layout(
            Row(
                Field('user', wrapper_class='col-sm-4'),
                Field('primary_hospital', wrapper_class='col-sm-4'),
                Field('secondary_hospital', wrapper_class='col-sm-4')
            ),
            Row(
                Field('gender', wrapper_class='col-sm-4'),
                Field('martial_status', wrapper_class='col-sm-4'),
                Field('specialty', wrapper_class='col-sm-4'),
            ),
            Row(
                Field('designation', wrapper_class='col-sm-4'),
                Field('qualification', wrapper_class='col-sm-4'),
                Field('experience', wrapper_class='col-sm-4'),
            ),
            Row(

                Field('weight', wrapper_class='col-sm-4'),
                Field('height', wrapper_class='col-sm-4'),
                Field('mobile_no', wrapper_class='col-sm-4'),
            ),
            Fieldset('Timings',
            Row(
                Field('session_1_start', wrapper_class='col-sm-3'),
                Field('session_1_end', wrapper_class='col-sm-3'),
                Field('session_2_start', wrapper_class='col-sm-3'),
                Field('session_2_end', wrapper_class='col-sm-3'),
                ),
            ),
            Row(
                # Field('timing', wrapper_class='col-sm-12'),
                Field('notes', wrapper_class='col-sm-12'),
                Field('avatar', wrapper_class='col-sm-12'),
            ),
        )
    class Meta:
        model = Profile
        fields = ('user','session_1_start', 'session_1_end', 'session_2_start', 'session_2_end', 'gender', 'designation', 'qualification', 'experience', 'primary_hospital', 'secondary_hospital', 'specialty', 'mobile_no','avatar',
				'martial_status', 'weight', 'height', 'blood_type', 'notes')

class Pharmacyform(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        user = kwargs.pop('user')
        super(Pharmacyform, self).__init__(*args, **kwargs)
        if user is not None:
            self.fields['user'] = forms.ModelChoiceField(queryset=User.objects.filter(id=user.id), empty_label=None)

        self.helper = FormHelper()
        self.helper.layout = Layout(
            Row(
                Field('user', wrapper_class='col-sm-4'),
                Field('primary_hospital', wrapper_class='col-sm-4'),
            ),
        )
    class Meta:
        model = Profile
        fields = ('user','primary_hospital')

class Studentform(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        user = kwargs.pop('user')
        super(Studentform, self).__init__(*args, **kwargs)
        if user is not None:
            self.fields['user'] = forms.ModelChoiceField(queryset=User.objects.filter(id=user.id), empty_label=None)
        self.fields['weight'].label = 'Weight (In Kg)'
        self.fields['height'].label = 'Height (In Feet)'
        self.fields['notes'].widget.attrs['rows'] = 3
        self.helper = FormHelper()
        self.helper.layout = Layout(
            Row(
                Field('user', wrapper_class='col-sm-4'),
                Field('gender', wrapper_class='col-sm-4'),
                Field('martial_status', wrapper_class='col-sm-4')
            ),
            Row(
                Field('mobile_no', wrapper_class='col-sm-4'),
                Field('weight', wrapper_class='col-sm-4'),
                Field('height', wrapper_class='col-sm-4'),
            ),
            Row(
                Field('blood_type', wrapper_class='col-sm-4'),
                Field('diseases', wrapper_class='col-sm-4'),
                Field('allergies', wrapper_class='col-sm-4'),
            ),
            Row(
                Field('notes', wrapper_class='col-sm-12'),
                Field('avatar', wrapper_class='col-sm-12'),
            ),
        )
    class Meta:
        model  = Profile
        fields =('user', 'gender', 'mobile_no', 'avatar', 'martial_status', 'weight', 'height', 'blood_type','diseases','allergies','notes')

class Adminform(forms.ModelForm):
    class Meta:
        model  = Profile
        fields =('gender', 'mobile_no', 'avatar')

class Appointmentform(forms.ModelForm):
    doctor_id = forms.ModelChoiceField(queryset=User.objects.filter(groups__name='Doctor'), empty_label=None)
    student_id = forms.ModelChoiceField(queryset=User.objects.filter(groups__name='Student'), empty_label=None)
    def __init__(self, *args, **kwargs):
        super(Appointmentform, self).__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.layout = Layout(
                Row(
                    Field('student_id', wrapper_class='col-sm-4'),
                    Field('doctor_id', wrapper_class='col-sm-4'),
                    Field('datetime', wrapper_class='col-sm-4') 
                ),
                Row(
                    Field('disease', wrapper_class='col-sm-12'),
                    Field('notes', wrapper_class='col-sm-12'),
                ),
            )
        # self.fields['disease'].widget.attrs['rows'] = 3
        # self.fields['disease'].widget.attrs['placeholder'] = 'Please enter comma separated disease names'
        self.fields['disease'] = forms.MultipleChoiceField(widget=Select2TagWidget)
        self.fields['notes'].widget.attrs['rows'] = 3
        self.fields["datetime"].widget.attrs.update({"id": "date-format"})
        self.fields['student_id'].label = 'Student'
        self.fields['doctor_id'].label = 'Doctor'

    class Meta:
        model  = Appointment
        fields = ['student_id','doctor_id','disease','datetime','notes','status']

class Appointmentreferform(forms.ModelForm):

    refer_to = forms.ModelChoiceField(queryset=User.objects.filter(groups__name='Doctor'), empty_label=None)
    def __init__(self, *args, **kwargs):
        super(Appointmentreferform, self).__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.layout = Layout(
                Row(
                    Field('refer_to', wrapper_class='col-sm-6'),
                ),


            )
        self.fields['refer_to'].label = 'Refer To'
    class Meta:
        model  = Appointment
        fields = ['refer_to']


class  Prescriptionform(forms.ModelForm):
    def __init__(self, *args, **kwargs):

        appointment_id = kwargs.pop('appointment')
        super(Prescriptionform, self).__init__(*args, **kwargs)
        self.fields['appointment'] = forms.ModelChoiceField(queryset=Appointment.objects.exclude(id__in=Prescription.objects.all().values_list('appointment_id', flat=True)))
        if appointment_id is not None:
            self.fields['appointment'] = forms.ModelChoiceField(queryset=Appointment.objects.filter(id=appointment_id), empty_label=None)

        self.helper = FormHelper()
        self.helper.layout = Layout(
                Row(
                    Field('appointment', wrapper_class='col-sm-4'),
                    Field('medicine_name', wrapper_class='col-sm-4'),
                    Field('medicine_type', wrapper_class='col-sm-4')
                ),
                Row(
                    Field('how_to_use', wrapper_class='col-sm-12'),
                ),
            )
        self.fields['how_to_use'].widget.attrs['rows'] = 3
    class Meta:
        model  = Prescription
        fields = ['appointment','medicine_name','medicine_type','how_to_use']


class  Prescription_info_form(forms.ModelForm):
    def __init__(self, *args, **kwargs):

        appointment_id = kwargs.pop('appointment')
        super(Prescription_info_form, self).__init__(*args, **kwargs)
        self.fields['appointment'] = forms.ModelChoiceField(queryset=Appointment.objects.exclude(id__in=Prescription.objects.all().values_list('appointment_id', flat=True)))
        if appointment_id is not None:
            self.fields['appointment'] = forms.ModelChoiceField(queryset=Appointment.objects.filter(id=appointment_id), empty_label=None)

        self.helper = FormHelper()
        self.helper.layout = Layout(
                Row(
                    Field('appointment', wrapper_class='col-sm-4 hidden'),
                    Field('medicine_name', wrapper_class='col-sm-6'),
                    Field('medicine_type', wrapper_class='col-sm-6')
                ),
                Row(
                    Field('how_to_use', wrapper_class='col-sm-12'),
                ),
            )
        self.fields['how_to_use'].widget.attrs['rows'] = 3
    class Meta:
        model  = Prescription_info
        fields = ['appointment','medicine_name','medicine_type','how_to_use']


        