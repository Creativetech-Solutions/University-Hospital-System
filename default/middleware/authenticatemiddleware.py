from django.http import HttpResponseRedirect,  HttpResponse
import requests
from django.shortcuts import render, redirect
from default.templatetags.custom_tags import getUserGroup
from django.http import HttpResponseForbidden

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
			if request.session.has_key('token') and (request.path in  ['/login','/api/login','/']):
				return redirect('/users-dashboard')
			elif not request.session.has_key('token') and request.path != '/login' and request.path != '/api/login':
				  return redirect('/login')
		return self.get_response(request)