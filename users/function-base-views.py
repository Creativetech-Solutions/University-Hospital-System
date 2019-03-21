from django.shortcuts import render



from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from users.models import Profile
from users.serializers import UsersSerializer



#@csrf_exempt  #Note that because we want to be able to POST to this view from clients that won't have a CSRF token we need to mark the view as csrf_exempt
@api_view(['GET', 'POST'])
def users_list(request, format=None):
    if request.method == 'GET':
        users = Profile.objects.all()
        serializer = UsersSerializer(users, many=True)
        return Response(serializer.data)

    elif request.method == 'POST':
        serializer = UsersSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET', 'PUT', 'DELETE'])
def user_detail(request, pk, format=None):
    """
    Retrieve, update or delete a code user.
    """
    try:
        profile = Profile.objects.get(pk=pk)
    except Profile.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = UsersSerializer(profile)
        return Response(serializer.data)

    elif request.method == 'PUT':
        serializer = UsersSerializer(profile, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        profile.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


