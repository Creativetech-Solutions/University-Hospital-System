from rest_framework.urlpatterns import format_suffix_patterns
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from hospital import views as hospital_view
from users import views as users_view
from django.conf.urls import url

# Create a router and register our viewsets with it.

router = DefaultRouter()

u_list = users_view.UserViewSet.as_view({
    'get': 'list',
    'post': 'create'
})
user_detail = users_view.UserViewSet.as_view({
    'get': 'retrieve',
    'put': 'update',
    'patch': 'partial_update',
    'delete': 'destroy'
})
profile_list = users_view.ProfileViewSet.as_view({
    'get': 'list',
    'post': 'create'
})
profile_detail = users_view.ProfileViewSet.as_view({
    'get': 'retrieve',
    'put': 'update',
    'patch': 'partial_update',
    'delete': 'destroy'
})
hospitals_list = hospital_view.HospitalsViewSet.as_view({
    'get': 'list',
    'post': 'create'
})
hospitals_detail = hospital_view.HospitalsViewSet.as_view({
    'get': 'retrieve',
    'put': 'update',
    'patch': 'partial_update',
    'delete': 'destroy'
})

student_list = users_view.StudentViewSet.as_view({
    'get': 'list',
    'post': 'create'
})
student_detail = users_view.StudentViewSet.as_view({
    'get': 'retrieve',
    'put': 'update',
    'patch': 'partial_update',
    'delete': 'destroy'
})
appointments_list = users_view.AppointmentsViewSet.as_view({
    'get': 'list',
    'post': 'create'
})
appointments_detail = users_view.AppointmentsViewSet.as_view({
    'get': 'retrieve',
    'put': 'update',
    'patch': 'partial_update',
    'delete': 'destroy'
})
prescriptions_list = users_view.PrescriptionViewSet.as_view({
    'get': 'list',
    'post': 'create'
})
prescriptions_detail = users_view.PrescriptionViewSet.as_view({
    'get': 'retrieve',
    'put': 'update',
    'patch': 'partial_update',
    'delete': 'destroy'
})
doctor_list = users_view.DoctorsViewSet.as_view({
    'get': 'list',
    'post': 'create'
})
doctor_detail = users_view.DoctorsViewSet.as_view({
    'get': 'retrieve',
    'put': 'update',
    'patch': 'partial_update',
    'delete': 'destroy'
})
# The API URLs are now determined automatically by the router.
urlpatterns = format_suffix_patterns([
    path('', users_view.api_root),
    path('hospitals', hospitals_list, name='hospitals'),
    path('hospitals/<pk>/', hospitals_detail),
    path('students', student_list, name='students'),
    path('students/<pk>/', student_detail),
    path('doctors', doctor_list, name='doctors'),
    path('doctors/<pk>/', doctor_detail),
    path('users', u_list, name='users'),
    path('users/<pk>/', user_detail),
    path('profiles', profile_list, name='profiles'),
    path('profiles/<pk>/', profile_detail),
    path('appointments', appointments_list, name='appointments'),
    path('appointments/<pk>/', appointments_detail),
    path('prescriptions', prescriptions_list, name='prescriptions'),
    path('prescriptions/<pk>/', prescriptions_detail),
])



