from django.db import models
from PIL import Image # resize image

# Create your models here.

class Hospital(models.Model):
	name = models.CharField(max_length=250)
	detail = models.TextField(blank=True,null=True)
	status = models.BooleanField(default=True)
	created_date = models.DateTimeField(auto_now_add=True)
	modified_date = models.DateTimeField(auto_now=True)

	def __str__(self):
		return '{}'.format(self.name)
		
	class Meta:
		ordering = ['id']

class MedicineType(models.Model):
	name = models.CharField(max_length=250)
	description = models.CharField(max_length=250, blank=True, null=True)
	status = models.BooleanField(default=True)
	avatar = models.ImageField(default='default.png',upload_to='medicine_icons')
	created_date = models.DateTimeField(auto_now_add=True)
	modified_date = models.DateTimeField(auto_now=True)

	def __str__(self):
		return '{}'.format(self.name)

	def save(self): # for avatar resize
		super().save() # when super model saved
		avatar = avatar.open(self.avatar.path)
		if avatar.height > 300 or avatar.width > 300:
			output_size =(300, 300)
			avatar.thumbnail(output_size)
			avatar.save(self.avatar.path)
		
	class Meta:
		ordering = ['name']