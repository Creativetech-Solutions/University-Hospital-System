from django.db import models
from pygments.lexers import get_all_lexers
from pygments.styles import get_all_styles
from django.contrib.auth.models import User
from pygments.lexers import get_lexer_by_name
from pygments.formatters.html import HtmlFormatter
from PIL import Image # resize image

class Profile(models.Model):
	user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
	title = models.CharField(max_length=100, blank=True, null=True)
	GENDER_CHOICES = (
		('male', 'Male'),
		('female', 'Female'),
	)
	gender = models.CharField(choices=GENDER_CHOICES, blank=True, null=True, max_length=10)
	designation =  models.CharField(max_length=250, blank=True, null=True)
	qualification = models.CharField(max_length=250, blank=True, null=True)
	experience = models.CharField(max_length=250, blank=True, null=True)
	primary_hospital = models.ForeignKey("hospital.Hospital", on_delete=models.SET_NULL, blank=True, null=True)                                    
	secondary_hospital = models.ForeignKey("hospital.Hospital", on_delete=models.SET_NULL, related_name='secondary_hospital',blank=True, null=True)                                    
	specialty = models.CharField(max_length=250, blank=True, null=True)
	mobile_no = models.CharField(max_length=25, blank=True, null=True)
	session_1_start = models.TimeField(null=True, blank=True)
	session_1_end = models.TimeField(null=True, blank=True)
	session_2_start = models.TimeField(null=True, blank=True)
	session_2_end = models.TimeField(null=True, blank=True)
	avatar = models.ImageField(default='default.png',upload_to='profile')
	MARTIAL_STATUS = (
		('married', 'Married'),
		('unmarried', 'Unmarried'),
		('windowed', 'Widowed'),
	)
	martial_status = models.CharField(choices=MARTIAL_STATUS, blank=True, null=True, max_length=10)
	weight = models.CharField(max_length=250, blank=True, null=True)
	height = models.CharField(max_length=250, blank=True, null=True)
	diseases  = models.CharField(max_length=250, blank=True, null=True)
	allergies = models.CharField(max_length=250, blank=True, null=True)
	BLOOD_TYPES = (
		('O+', 'O-Positive'),
		('O-', 'O-Negative'),
		('A+', 'A-Positive'),
		('A-', 'A-Negative'),
		('AB+', 'AB-Positive'),
		('AB-', 'AB-Negative'),
	)
	blood_type = models.CharField(choices=BLOOD_TYPES, blank=True, null=True, max_length=4)
	notes = models.TextField(blank=True, null=True)
	created_date = models.DateTimeField(auto_now_add=True)
	modified_date = models.DateTimeField(auto_now=True)
	class Meta:
		ordering = ('created_date',)

	def __str__(self): # converting obj
		return f'{self.user.username} Profile'



class Appointment(models.Model):
	student = models.ForeignKey(User, on_delete=models.CASCADE, related_name='student')    
	doctor = models.ForeignKey(User, on_delete=models.SET_NULL, related_name='doctor', blank=True, null=True)
	refer_to = models.ForeignKey(User, on_delete=models.SET_NULL, related_name='refer_to', blank=True, null=True)
	datetime = models.DateTimeField()
	disease = models.TextField()
	notes = models.TextField(blank=True, null=True)
	STATUS_CHOICES = (
		('N', 'New'),
		('P', 'Processed'),
		('C', 'Cancel'),
	)
	status = models.CharField(choices=STATUS_CHOICES, max_length=2, default='N')
	# status = models.BooleanField(default=True)
	created_date = models.DateTimeField(auto_now_add=True)
	modified_date = models.DateTimeField(auto_now=True)
	def __str__(self): # converted obj
		return f'{self.student.username}- App. # {self.id}'


class Prescription(models.Model):
	appointment = models.OneToOneField(Appointment, on_delete=models.CASCADE, primary_key=True)
	how_to_use = models.TextField(blank=True, null=True)
	medicine_name = models.CharField(max_length=250, blank=True, null=True)
	medicine_type = models.ForeignKey("hospital.MedicineType", on_delete=models.SET_NULL, blank=True, null=True)
	edit_by = models.ForeignKey(User, on_delete=models.SET_NULL, related_name='edit_by', blank=True, null=True)
	created_date = models.DateTimeField(auto_now_add=True)
	modified_date = models.DateTimeField(auto_now=True)
	def __str__(self): # convert obj
		managed = False
		return f'{self.appointment.student.username} Appointment with {self.appointment.doctor.username} '

class Prescription_info(models.Model):
	appointment = models.ForeignKey(Appointment, on_delete=models.CASCADE, related_name='appointment')
	how_to_use = models.TextField(blank=True, null=True)
	medicine_name = models.CharField(max_length=250, blank=True, null=True)
	medicine_type = models.ForeignKey("hospital.MedicineType", on_delete=models.SET_NULL, blank=True, null=True)
	created_date = models.DateTimeField(auto_now_add=True)
	edit_by = models.ForeignKey(User, on_delete=models.SET_NULL, related_name='edit_user', blank=True, null=True)
	modified_date = models.DateTimeField(auto_now=True)
	def __str__(self): # convert obj
		managed = False
		return f'{self.medicine_name}'
	
