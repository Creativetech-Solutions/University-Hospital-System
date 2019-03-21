from rest_framework import serializers
from hospital.models import Hospital
from django.contrib.auth.models import User



class HospitalSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(read_only=True)
    class Meta:
        model = Hospital
        fields = ('id','name','detail','status','created_date','modified_date')
        datatables_always_serialize = ('id',)


