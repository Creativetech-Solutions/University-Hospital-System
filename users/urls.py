
from rest_framework.urlpatterns import format_suffix_patterns
from django.urls import path, include
from users import views
from django.conf.urls import url

urlpatterns = format_suffix_patterns([
    path('users-list', views.users_listing, name='users_listing'),
    path('users/add', views.add_user, name='add_user'),
    path('users/<int:id>/', views.edit_user, name='edit_user'),
    path('users-dashboard', views.users_dashboard, name='users_dashboard'),
    path('appointment/add', views.add_appointment, name='add_appointment'),
    path('appointments-list', views.appointments_listing, name='appointments_listing'),
    path('appointments/<int:id>/detail', views.appointment_detail, name='appointment_detail_page'),
    path('appointments/<int:id>/prescriptions/',views.prescriptions_listing, name='prescriptions_listing'),
    path('appointments/<int:id>/prescriptions/add/',views.add_prescriptions, name='add_prescriptions'),
    path('prescriptions/<int:id>/detail', views.prescriptions_detail, name='prescriptions_detail_page'),
])

