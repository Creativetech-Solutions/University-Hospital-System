from django import forms
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Layout, Row, Field
from django.contrib.auth.models import User, Group
from django.contrib.auth.forms import UserCreationForm
from .models import User, Profile, Appointment
from default.templatetags.custom_tags import *

class UserCreationform(UserCreationForm):
    email = forms.EmailField()
    groups = forms.ModelMultipleChoiceField(queryset=Group.objects.all(), required=True, initial=0)
    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request')
        super(UserCreationform, self).__init__(*args, **kwargs)
        # here check if the user is Hospital Admin, then he can only add doctor or user
        self.fields['groups'] = forms.ModelMultipleChoiceField(queryset=Group.objects.filter(name__in=['Doctor','Student']), required=True, initial=0)

        self.helper = FormHelper()
        self.fields['first_name'].required = True
        self.fields['last_name'].required = True
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
        
        self.fields['timing'].widget.attrs['rows'] = 3
        self.fields['notes'].widget.attrs['rows'] = 3
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
                Field('blood_type', wrapper_class='col-sm-4'),
            ),
            Row(
                Field('designation', wrapper_class='col-sm-4'),
                Field('qualification', wrapper_class='col-sm-4'),
                Field('experience', wrapper_class='col-sm-4'),
            ),
            Row(
                Field('specialty', wrapper_class='col-sm-3'),
                Field('weight', wrapper_class='col-sm-3'),
                Field('height', wrapper_class='col-sm-3'),
                Field('mobile_no', wrapper_class='col-sm-3'),
            ),
            Row(
                Field('timing', wrapper_class='col-sm-12'),
                Field('notes', wrapper_class='col-sm-12'),
            ),
        )
    class Meta:
        model = Profile
        fields = ('user','gender', 'designation', 'qualification', 'experience', 'primary_hospital', 'secondary_hospital', 'specialty', 'mobile_no', 'timing', 'avatar',
				'martial_status', 'weight', 'height', 'blood_type', 'notes')

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

    def __init__(self, *args, **kwargs):
        super(Appointmentform, self).__init__(*args, **kwargs)
        self.fields['student'] = forms.ModelChoiceField(queryset=User.objects.filter(groups__name='Student'), empty_label=None)
        self.fields['doctor'] = forms.ModelChoiceField(queryset=User.objects.filter(groups__name='Doctor'), empty_label=None)
        self.helper = FormHelper()
        self.helper.layout = Layout(
                Row(
                    Field('student', wrapper_class='col-sm-4'),
                    Field('doctor', wrapper_class='col-sm-4'),
                    Field('datetime', wrapper_class='col-sm-4') 
                ),
                Row(
                    Field('disease', wrapper_class='col-sm-12'),
                    Field('notes', wrapper_class='col-sm-12'),
                ),
            )
        self.fields['disease'].widget.attrs['rows'] = 3
        self.fields['disease'].widget.attrs['placeholder'] = 'Please enter comma separated disease names'
        self.fields['notes'].widget.attrs['rows'] = 3
    class Meta:
        model  = Appointment
        fields = ['student','doctor','disease','datetime','notes','status']

        