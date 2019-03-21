from django.shortcuts  import get_object_or_404, render
from django.contrib.auth.models import User
from rest_framework.decorators import api_view
from rest_framework.views import APIView
from rest_framework.decorators import action
from rest_framework.response import Response
from hospital.models import Hospital
from hospital.serializers import HospitalSerializer
from django.http import Http404
from users.permissions import IsOwnerOrReadOnly
from rest_framework.reverse import reverse
from rest_framework import viewsets, permissions, filters, mixins, generics, status

from .forms import Hospitalform

class HospitalsViewSet(viewsets.ModelViewSet):
    queryset = Hospital.objects.all()
    serializer_class = HospitalSerializer
    filter_backends = (filters.OrderingFilter,filters.SearchFilter,)
    ordering_fields = ('id','name', 'detail', 'status')
    search_fields = ordering_fields

    def perform_create(self, serializer):
        serializer.save()

def hospitals(request):
    return render(request,'hospital/listing.html')

def add_hospitals(request):

    context = {'form' : Hospitalform,'app':'hospitals','type':'POST','app_url':'hospitals'}
    return render(request,'hospital/add_hospital.html',context)

def edit_hospital(request, id):
    instance = get_object_or_404(Hospital, id=id)

    form = Hospitalform(request.POST or None, instance=instance)
    context = {'form' : form, 'obj':instance, 'app':'hospitals','type':'PUT','app_url':'hospitals'}
    return render(request,'hospital/add_hospital.html',context)








