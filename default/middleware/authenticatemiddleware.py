from django.http import HttpResponseRedirect,  HttpResponse
import requests
from django.shortcuts import render, redirect
from default.templatetags.custom_tags import getUserGroup, isDoctor, getUser
from django.http import HttpResponseForbidden
from default.utils import *
from users.models import Appointment, Prescription_info

class AuthenticateMiddleware:
	exclude_groups = ['Student']
	def __init__(self, get_response):
		self.get_response = get_response
		# One-time configuration and initialization.

	def __call__(self, request):
		# Code to be executed for each request before
		# the view (and later middleware) are called.
		return self.loginCheck(request)

	def loginCheck(self, request):
		if '/api/' not in request.path:
			if request.session.has_key('token') and (request.path in  ['/login','/']):
				return redirect('/users-dashboard')
			elif not request.session.has_key('token') and request.path != '/login':
				  return redirect('/login')

			# add global info into request for website user
			if request.session.has_key('token'):
				request = self.addGlobalInfo(request)
		return self.get_response(request)

	def addGlobalInfo(self, request):
		if isDoctor(request):
			user_id = getUser(request,'id')
			request.pharmacist_notify = self.getPharmacistNotifications(user_id)
			request.refer_notify = self.getReferNotifications(user_id)
		return request

	def getPharmacistNotifications(self, user_id):
		return Prescription_info.objects.exclude(edit_by__isnull=True).filter(appointment__in=Appointment.objects.filter(doctor_id=user_id).values_list('id',flat=True))

	def getReferNotifications(self, user_id):
		return Appointment.objects.filter(refer_to_id=user_id)


