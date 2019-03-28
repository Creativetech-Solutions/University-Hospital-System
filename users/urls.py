
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
    path('users-dashboard', views.users_dashboard, name='users_dashboard'),
    path('appointment/add', views.add_appointment, name='add_appointment'),
    path('appointments-list', views.appointments_listing, name='appointments_listing'),
    path('appointments/<int:id>/', views.appointment_detail, name='appointment_detail_page'),
    path('appointments/<int:id>/prescriptions/add/',views.add_prescriptions, name='add_prescriptions'),
    path('prescriptions-list', views.prescriptions_listings, name='prescriptions_listing'),
    path('prescriptions/<int:id>/', views.prescriptions_detail, name='prescriptions_detail_page'),
    path('prescriptions/<int:id>/edit/', views.edit_prescriptions, name='edit_prescriptions'),
])
# urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

