from django import template
from default.utils import *
import json
from django.core import serializers

register = template.Library()

@register.filter
def getToken(request):
	try:
		return json.loads(request.session['token'][1:-1])['pk'] 
	except:
		return ''

@register.filter
def getUser(request, item):
	try:
		user = json.loads(request.session['user'][1:-1])
		return user['fields'][item]
	except:
		return False

@register.filter
def getUserGroup(request):
	if request.session['group'] is not None:
		return request.session['group']
	else:
		return ''

@register.filter
def isDoctor(request):
	if getUserGroup(request) == 'Doctor':
		return True
	return False

@register.filter
def isPharmacist(request):
	if getUserGroup(request) == 'Pharmacist':
		return True
	return False

@register.filter
def isHospitalAdmin(request):
	if getUserGroup(request) == 'Hospital Admin':
		return True
	return False
