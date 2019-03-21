from django.contrib import admin
from hospital.models import Hospital, MedicineType
from users.models import Profile, Appointment, Prescription
# Register your models here.

admin.site.register(Profile)
admin.site.register(Hospital)
admin.site.register(Appointment)
admin.site.register(Prescription)
admin.site.register(MedicineType)