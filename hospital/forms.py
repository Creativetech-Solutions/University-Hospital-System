from django import forms
from django.contrib.auth.models import User
from .models import Hospital



class Hospitalform(forms.ModelForm):
    class Meta:
        model  = Hospital
        fields = ['id','name','detail','status']

