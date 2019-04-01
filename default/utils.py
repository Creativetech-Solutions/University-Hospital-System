import requests, json
from django.contrib.auth.models import User
from default.templatetags.custom_tags import *
from rest_framework.response import Response

def checkUserGroup(request, group):
    if 'user_group' not in request.session:
        request.session['user_group'] = request.user.groups.values_list('name', flat=True).first()

    if request.session['user_group'] == group:
        return True
    else:
        return False

def apiUserGroup(request):
    # first check in session for website users .
    try:
        if request.session['group'] is not None:
            return request.session['group']
        else:
            return User.objects.get(id=request.user.id).groups.first().name
    except:
        return False

def isApiUserAdmin(request):
    if apiUserGroup(request) == 'Admin':
        return True
    return False

def isApiUserDoctor(request):
    if apiUserGroup(request) == 'Doctor':
        return True
    return False

def isApiUserStudent(request):
    if apiUserGroup(request) == 'Student':
        return True
    return False

def isApiUserPharmacist(request):
    if apiUserGroup(request) == 'Pharmacist':
        return True
    return False

def isApiUserHospitalAdmin(request):
    print(apiUserGroup(request))
    if apiUserGroup(request) == 'Hospital Admin':
        return True


def apiCustomizedResponse(data, type, message, status=None, template_name=None, headers=None, content_type=None):
    data = {
        'data':data,
        'type':type,
        'message':message,
    }
    print(data)
    print('test')
    return Response(data, status=status, template_name=template_name, headers=headers, content_type=content_type)