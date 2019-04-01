from django.contrib.auth import authenticate
from django.views.decorators.csrf import csrf_exempt
from rest_framework.authtoken.models import Token
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny
from rest_framework.status import (
    HTTP_400_BAD_REQUEST,
    HTTP_404_NOT_FOUND,
    HTTP_200_OK
)
from rest_framework.response import Response
from django.shortcuts import render, redirect
from django.core import serializers
import json
from default.templatetags.custom_tags import getToken

@csrf_exempt
@api_view(['POST'])
@permission_classes((AllowAny,))
def login(request):
    username = request.data.get("username")
    password = request.data.get("password")

    # validate data
    if username is None or password is None:
        return Response({'message': 'Please provide both username and password','type':'error'},
                        status=HTTP_400_BAD_REQUEST)
    user = authenticate(username=username, password=password)
    if not user:
        return Response({'message': 'Invalid Credentials','type':'error'},
                        status=HTTP_400_BAD_REQUEST)
    # create token 
    token, _ = Token.objects.get_or_create(user=user)

    # we need to serialize user and token to save in session
    user_obj = serializers.serialize('json', [ user ], ensure_ascii=False)
    token_obj = serializers.serialize('json', [ token ], ensure_ascii=False)
    user_group = user.groups.first() 
    redirect = '/login'
    if user_group is not None or user.is_superuser:
        if user.is_superuser:
            redirect = '/users-dashboard'
            user_group = 'Admin'
        else:
            user_group = user_group.name
            if user_group == 'Admin':
                redirect = '/users-dashboard'
            elif user_group == 'Doctor':
                redirect = '/users/' +str(user.id)+ '/'
            elif user_group == 'Hospital Admin':
                redirect ='/users/' +str(user.id)+ '/'
            elif user_group == 'Pharmacist':
                redirect = '/users/' +str(user.id)+ '/'
            elif user_group == 'Student':
                redirect ='/users/' +str(user.id)+ '/'
            else:
                redirect = '/login'

        # save user and token in session for website
        request.session['custom_user'] = user_obj
        request.session['token'] = token_obj
        request.session['group'] = user_group
        # create response data
        data = { 'user_name':user.username, 'first_name':user.first_name,'last_name':user.last_name,'email':user.email, 'type':user_group}
        return Response({
            'token': token.key, 
            'data':data, 
            'type':'success',
            'redirect':redirect,
            }, status=HTTP_200_OK)
    else:
        return Response({
            'data':[], 
            'type':'error',
            'message':'Permission denied. Contact Adminstrator',
            'redirect':redirect,
            }, status=HTTP_400_BAD_REQUEST)

def loginPage(request):
    return render(request,'users/login.html',{'next': 'users_dashboard',})

def logout(request):
    # get token from session and delete
    token = getToken(request)
    Token.objects.filter(key=token).delete()
    request.session.flush()
    return redirect('/login')

@csrf_exempt
@api_view(["GET"])
def sample_api(request):
    data = {'sample_data': 123}
    return Response(data, status=HTTP_200_OK)