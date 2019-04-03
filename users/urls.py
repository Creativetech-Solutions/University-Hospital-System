
from rest_framework.urlpatterns import format_suffix_patterns
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from users import views
from django.conf.urls import url

urlpatterns = format_suffix_patterns([
    path('users-list', views.users_listing, name='users_listing'),
    path('users/add', views.add_user, name='add_user'),
    path('users/<int:id>/', views.edit_user, name='edit_user'),
    path('users/profile/<int:id>/', views.user_profile, name='user_profile'),
    path('users-dashboard', views.users_dashboard, name='users_dashboard'),
    path('appointment/add', views.add_appointment, name='add_appointment'),
    path('appointments-list', views.appointments_listing, name='appointments_listing'),
    path('appointments-schedule/', views.AppointmentCalendar.as_view(), name='appointments_schedule'),
    path('appointments/<int:id>/', views.appointment_detail, name='appointment_detail_page'),
    path('appointments/edit/<int:id>/', views.edit_appointment, name='edit_appointment'),
    #path('appointments/<int:appointment_id>/prescriptions/add/',views.add_prescriptions, name='add_prescriptions'),
    path('appointments/<int:appointment_id>/prescriptions/add/',views.add_prescriptions_info, name='add_prescriptions_info'),
    path('save_prescriptions_info/',views.save_prescriptions_info, name='save_prescriptions_info'),
    path('delete_prescriptions_info/',views.delete_prescriptions_info, name='delete_prescriptions_info'),
    path('prescriptions-list', views.prescriptions_listings, name='prescriptions_listing'),
    path('prescriptions/add', views.add_prescriptions, name='add_prescriptionsfordoctor'),


    path('prescriptions/<int:id>/', views.prescriptions_detail, name='prescriptions_detail_page'),
    path('prescriptions/<int:id>/edit/', views.edit_prescriptions, name='edit_prescriptions'),
])


