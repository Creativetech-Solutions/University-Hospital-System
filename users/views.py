from django.shortcuts import get_object_or_404, render
from rest_framework import status
from django.contrib import messages
from django.contrib.auth.models import User
from django.db.models import Q
from rest_framework.decorators import api_view
from rest_framework.views import APIView
from rest_framework.decorators import action
from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from users.models import Profile, Appointment
from hospital.models import Hospital
from users.serializers import UsersSerializer,DoctorsSerializer,StudentSerializer,AppointmentsSerializer,ProfileSerializer,PrescriptionSerializer
from django.http import Http404, HttpResponse
from users.permissions import IsOwnerOrReadOnly
from rest_framework.reverse import reverse
from rest_framework import viewsets,permissions,filters, mixins, generics
from datetime import date
from .forms import *
from default.templatetags.custom_tags import *
from default.utils import *
from rest_framework.pagination import PageNumberPagination
from django.views.generic import TemplateView

class StandardResultsSetPagination(PageNumberPagination):
	page_size = 100
	page_size_query_param = 'page_size'
	max_page_size = 1000

# ---------User views --------------#
class UserViewSet(viewsets.ModelViewSet, generics.RetrieveAPIView):

	queryset = User.objects.all()
	serializer_class = UsersSerializer
	filter_backends = (filters.OrderingFilter,filters.SearchFilter,)
	ordering_fields = ('id','username', 'email', 'first_name', 'last_name', 'groups')
	search_fields = ('username', 'email', 'first_name', 'last_name', 'groups__name')

	def list(self, request, *args, **kwargs):
		queryset = self.filter_queryset(self.get_queryset())

		if isApiUserHospitalAdmin(request):
			queryset = queryset.filter(groups__name__in=['Student','Doctor'])

		page = self.paginate_queryset(queryset)
		if page is not None:
			serializer = self.get_serializer(page, many=True)
			return self.get_paginated_response(serializer.data)
		serializer = self.get_serializer(queryset, many=True)
		print(serializer.data)

		#return apiCustomizedResponse(serializer.data)
		return Response(serializer.data)

	def perform_create(self, serializer):
		return serializer.save()

	def create(self, request):
		serializer = self.get_serializer(data=request.data)
		serializer.is_valid(raise_exception=True)
		user = self.perform_create(serializer)
		# user.password = make_password(request.data['password'])
		user.set_password(request.data['password1'])
		user.save()
		post_data = request.data['groups']
		user.groups.add(post_data)
		headers = self.get_success_headers(serializer.data)
		#return Response(serializer.data)
		return Response(serializer.data)

	def retrieve(self, request, *args, **kwargs):
		instance = self.get_object()
		serializer = self.get_serializer(instance)
		data = serializer.data
		# here you can manipulate your data response
		#return apiCustomizedResponse(data)
		return Response(serializer.data)

class ProfileViewSet(viewsets.ModelViewSet):
	queryset = Profile.objects.all()
	serializer_class = ProfileSerializer
	filter_backends = (filters.OrderingFilter,)
	ordering_fields = ('user_id')

def users_listing(request):
	return render(request,'users/user/listing.html')

def add_user(request):
	form = UserCreationform(request=request)
	context = { 'form' : form,
				'app':'users',
				'type':'POST',
				'app_url':'users',
				'redirect':'users-list'
			}

	return render(request, 'users/user/form.html',context)

def edit_user(request, id):
	user = get_object_or_404(User, id=id)
	form = UserCreationform(request.POST or None, instance=user,request=request)
	group = user.groups.values_list('name', flat=True).first()
	profile_form  = ''
	try:
		profile = user.profile
	except:
		profile = None
	context = {
			'form' : form,
			'user_obj':user,
			'app':'users',
			'type':'PUT',
			'app_url':'users',
			'group':group,
			'profile':profile
		}
	if group == 'Doctor':
		 context['profile_form'] = Doctorsform(request.POST or None, instance=profile, user=user)
	elif group == 'Student':
		 context['profile_form']  = Studentform(request.POST or None, instance=profile, user=user)
	elif group == 'Pharmacist':
		 context['profile_form']  = Pharmacyform(request.POST or None, instance=profile, user=user)

	return render(request,'users/user/form.html',context)

def user_profile(request, id):
	user = get_object_or_404(User, id=id)
	context = {	'obj':user}
	print(user)
	return render(request,'users/doctors/profile.html',context)

# ---------Appointment views --------------#

class AppointmentsViewSet(viewsets.ModelViewSet):
	queryset = Appointment.objects.all()
	serializer_class = AppointmentsSerializer
	filter_backends = (filters.OrderingFilter,filters.SearchFilter,)
	ordering_fields = ('id','student', 'doctor', 'datetime', 'disease', 'notes', 'status')
	search_fields = ('id','student__username', 'doctor__username', 'datetime', 'disease', 'notes', 'status')

	def list(self, request, *args, **kwargs):
		queryset = self.filter_queryset(self.get_queryset())

		if isApiUserDoctor(request):
			queryset = Appointment.objects.filter(Q(doctor_id=request.user.id) | Q(refer_to=request.user.id))

		if isApiUserStudent(request):
			queryset = queryset.filter(student_id=request.user.id)

		page = self.paginate_queryset(queryset)
		if page is not None:
			serializer = self.get_serializer(page, many=True)
			return self.get_paginated_response(serializer.data)

		serializer = self.get_serializer(queryset, many=True)
		return Response(serializer.data)


def appointments_listing(request):
	return render(request,'users/appointments/listing.html')

class AppointmentCalendar(TemplateView):
	template_name = "users/appointments/calendar.html"

	def get_context_data(self, **kwargs):
		context = super().get_context_data(**kwargs)
		if isSuperAdmin(self.request):
			appointments = Appointment.objects.all();
			context['appointments'] = appointments
		elif isDoctor(self.request):
			context['appointments'] = Appointment.objects.filter(doctor=getUser(self.request,'id'))
		return context

def add_appointment(request):
	form = Appointmentform()
	context = { 'form' : form,
				'app':'appointments',
				'type':'POST',
				'app_url':'appointments',
				'redirect':'appointments-list'
				}
	return render(request, 'users/appointments/form.html',context)

def appointment_detail(request, id):
	context = {
				'Appointmentreferform' : Appointmentreferform,
				'appointment_id':id,
				}
	return render(request,'users/appointments/detail.html',context)

def edit_appointment(request, id):
	instance = get_object_or_404(Appointment, id=id)
	form = Appointmentform(request.POST or None, instance=instance)
	context = {
		'form' : form,
		'app':'appointment',
		'obj':instance,
		'tags':json.loads(instance.disease),
		'type':'PUT',
		'app_url':'appointments',
		'redirect':'appointments-list'
	   }
	return render(request, 'users/appointments/form.html',context)


#---------------------Prescription-----------------------------#


class PrescriptionViewSet(viewsets.ModelViewSet):
	queryset = Prescription_info.objects.all()
	serializer_class = PrescriptionSerializer
	filter_backends = (filters.OrderingFilter,filters.SearchFilter,)
	ordering_fields = ('id','student', 'doctor','medicine_name','medicine_type','how_to_use')
	search_fields = ('id','medicine_name','medicine_type','how_to_use')

	def list(self, request, *args, **kwargs):
		queryset = self.filter_queryset(self.get_queryset())
		appointment_id = request.GET.get('appointment_id')
		if appointment_id: # use to list prescriptions in Appointment Details Page
			queryset =  queryset.filter(appointment_id=appointment_id)

		if isApiUserPharmacist(request):
			print('tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttteeeeeeennnnnnnnnnny')
			print(isApiUserPharmacist(request))
		   #queryset = queryset.filter(groups__name__in=['Student','Doctor'])

		page = self.paginate_queryset(queryset)
		if page is not None:
			serializer = self.get_serializer(page, many=True)
			return self.get_paginated_response(serializer.data)

		serializer = self.get_serializer(queryset, many=True)
		return Response(serializer.data)

def prescriptions_listing(request, id): # by Appointment
	return render(request,'users/prescriptions/listing.html' )

def prescriptions_listings(request): # all Prescriptions Listings
	return render(request,'users/prescriptions/listing.html' )

def add_prescriptions(request, appointment_id=None):
	form = Prescriptionform(appointment=appointment_id)
	context = { 'form' : form,
				'app':'Prescription',
				'appointment_id':appointment_id,
				'type':'POST',
				'app_url':'prescriptions',
			}
	return render(request, 'users/prescriptions/form.html',context)

def add_prescriptions_info(request, appointment_id):
	print(appointment_id)
	queryset = Prescription_info.objects.filter(appointment_id=appointment_id)
	print(queryset)
	form = Prescription_info_form(appointment=appointment_id)
	context = { 'form' : form,
				'app':'Prescription',
				'data':queryset,
				'appointment_id':appointment_id,
				'type':'POST',
				'app_url':'save_prescriptions_info',
			}
	return render(request, 'users/prescriptions/form.html',context)

@csrf_exempt
@api_view(['POST'])
def save_prescriptions_info(request,appointment_id=None):
	obj = Prescription_info()
	obj.appointment_id = request.POST.get('appointment')
	obj.medicine_name  = request.POST.get('medicine_name')
	obj.medicine_type_id  = request.POST.get('medicine_type')
	obj.how_to_use     = request.POST.get('how_to_use')
	obj.save()
	return Response({'Success': 'Record saved Sucessfully'}, status=status.HTTP_200_OK)

@csrf_exempt
@api_view(['POST'])
def delete_prescriptions_info(request):
  id = request.POST.get('id')
  print(id)
  obj = Prescription_info.objects.get(id = id)
  obj.delete()
  return Response({'Success': 'Record  Sucessfully Deleted'}, status=status.HTTP_200_OK)

def edit_prescriptions(request, id):
	instance = get_object_or_404(Prescription, appointment=id)
	form = Prescriptionform(request.POST or None, instance=instance,appointment=id)
	context = {
		'form' : form,
		'app':'Prescription',
		'obj':instance,
		'type':'PUT',
		'app_url':'prescriptions'
	   }
	return render(request, 'users/prescriptions/form.html',context)

def prescriptions_detail(request, id):
	return render(request,'users/prescriptions/detail.html', {'pre_id':id} )


# User Dashboard#

def users_dashboard(request):
	return render(request,'users/dashboard.html')


class DoctorsViewSet(viewsets.ModelViewSet):

	queryset = Profile.objects.all()
	serializer_class = DoctorsSerializer
	def perform_create(self, serializer):
	   serializer.save()

def add_doctor(request):
	context = {'form' : Doctorsform,'app':'doctors','type':'POST','app_url':'doctors'}
	return render(request,'hospital/add_hospital.html',context)

def edit_doctor(request, user_id):
	instance = get_object_or_404(Profile, user_id=user_id)
	form = Doctorsform(request.POST or None, instance=instance)
	context = {'form' : form, 'obj':instance, 'app':'doctors','type':'PUT','app_url':'doctors'}
	return render(request,'hospital/add_hospital.html',context)

class StudentViewSet(viewsets.ModelViewSet):

	queryset = User.objects.all()
	serializer_class = StudentSerializer
	#permission_classes = (permissions.IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly,)

	def perform_create(self, serializer):
	   serializer.save(user=self.request.user)

@api_view(['GET'])
def api_root(request, format=None):
	return Response({
		'users': reverse('users', request=request, format=format),
		'students': reverse('students', request=request, format=format),
		'doctors': reverse('doctors', request=request, format=format),
		'hospitals': reverse('hospitals', request=request, format=format),
	})