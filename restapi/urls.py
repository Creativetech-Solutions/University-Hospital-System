"""restapi URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.contrib.auth import views as auth_views # for login logout
from .views import login, sample_api, loginPage, logout




urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('users.urls')),
    path('', include('hospital.urls')),
    path('api/', include('api.urls')),
    path('api/login', login, name='api_login'),
    path('login', loginPage),

    path('api/sampleapi', sample_api),

    # path('logout/',auth_views.LogoutView.as_view(template_name='users/logout.html'), name='logout'),
    path('logout/', logout, name='logout'),

]
urlpatterns += [
    path('api-auth/', include('rest_framework.urls')),

]