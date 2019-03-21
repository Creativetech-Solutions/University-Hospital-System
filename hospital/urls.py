
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from hospital import views
from django.conf.urls import url

urlpatterns = [
    path('hospitals-listing', views.hospitals, name='hospitals-listing'),
    path('hospitals/add', views.add_hospitals, name='add_hospitals'),
    path('hospitals/<int:id>/', views.edit_hospital, name='edit_hospital'),
    ]