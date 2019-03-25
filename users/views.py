from django.shortcuts import get_object_or_404, render
from rest_framework import status
from django.contrib.auth.models import User
from rest_framework.decorators import api_view
from rest_framework.views import APIView
from rest_framework.decorators import action
from rest_framework.response import Response
from users.models import Profile, Appointment
from hospital.models import Hospital
from users.serializers import UsersSerializer,DoctorsSerializer,StudentSerializer,AppointmentsSerializer,ProfileSerializer,PrescriptionSerializer
from django.http import Http404, HttpResponse
from rest_framework import mixins
from rest_framework import generics
from users.permissions import IsOwnerOrReadOnly
from rest_framework.reverse import reverse
from rest_framework import viewsets
from rest_framework import permissions
from rest_framework import filters
from datetime import date
from .forms import *
from default.templatetags.custom_tags import *
from default.utils import *
from rest_framework.pagination import PageNumberPagination

class StandardResultsSetPagination(PageNumberPagination):
    page_size = 100
    page_size_query_param = 'page_size'
    max_page_size = 1000

# ---------User views --------------#
class UserViewSet(viewsets.ModelViewSet):

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
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

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

    return render(request,'users/user/form.html',context)

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
            queryset = queryset.filter(doctor_id=request.user.id)

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)
        
    # def perform_create(self, serializer):
    #    serializer.save(user=self.request.user)

def appointments_listing(request):
    return render(request,'users/appointments/listing.html')

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
    return render(request,'users/appointments/detail.html', {'appointment_id':id,"Appointmentreferform":Appointmentreferform} )

#Prescription#


class PrescriptionViewSet(viewsets.ModelViewSet):
    queryset = Prescription.objects.all()
    serializer_class = PrescriptionSerializer
    filter_backends = (filters.OrderingFilter,filters.SearchFilter,)
    ordering_fields = ('id','student', 'doctor','medicine_name','medicine_type','how_to_use')
    search_fields = ('id','medicine_name','medicine_type','how_to_use')

    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

def prescriptions_listing(request, id):
    return render(request,'users/prescriptions/listing.html' )

def add_prescriptions(request, id):
    form = Prescriptionform(appointment_id=id)
    context = { 'form' : form,
                'app':'Prescription',
                'appointment_id':id,
                'type':'POST',
                'app_url':'prescriptions',
                'redirect':'appointments'
                }
    return render(request, 'users/prescriptions/form.html',context)

def prescriptions_detail(request, id):

    return render(request,'users/prescriptions/detail.html', {'appointment_id':id} )




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