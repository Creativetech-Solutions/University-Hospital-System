# Generated by Django 2.1.7 on 2019-03-27 13:36

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('hospital', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('auth', '0009_alter_user_last_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='Appointment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('datetime', models.DateTimeField()),
                ('disease', models.TextField()),
                ('notes', models.TextField(blank=True, null=True)),
                ('status', models.BooleanField(default=True)),
                ('created_date', models.DateTimeField(auto_now_add=True)),
                ('modified_date', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='Profile',
            fields=[
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to=settings.AUTH_USER_MODEL)),
                ('title', models.CharField(blank=True, max_length=100, null=True)),
                ('gender', models.CharField(blank=True, choices=[('male', 'Male'), ('female', 'Female')], max_length=10, null=True)),
                ('designation', models.CharField(blank=True, max_length=250, null=True)),
                ('qualification', models.CharField(blank=True, max_length=250, null=True)),
                ('experience', models.CharField(blank=True, max_length=250, null=True)),
                ('specialty', models.CharField(blank=True, max_length=250, null=True)),
                ('mobile_no', models.CharField(blank=True, max_length=25, null=True)),
                ('timing', models.TextField(blank=True, null=True)),
                ('avatar', models.CharField(blank=True, max_length=250, null=True)),
                ('martial_status', models.CharField(blank=True, choices=[('married', 'Married'), ('unmarried', 'Unmarried'), ('windowed', 'Widowed')], max_length=10, null=True)),
                ('weight', models.CharField(blank=True, max_length=250, null=True)),
                ('height', models.CharField(blank=True, max_length=250, null=True)),
                ('diseases', models.CharField(blank=True, max_length=250, null=True)),
                ('allergies', models.CharField(blank=True, max_length=250, null=True)),
                ('blood_type', models.CharField(blank=True, choices=[('O+', 'O-Positive'), ('O-', 'O-Negative'), ('A+', 'A-Positive'), ('A-', 'A-Negative'), ('AB+', 'AB-Positive'), ('AB-', 'AB-Negative')], max_length=4, null=True)),
                ('notes', models.TextField(blank=True, null=True)),
                ('created_date', models.DateTimeField(auto_now_add=True)),
                ('modified_date', models.DateTimeField(auto_now=True)),
                ('primary_hospital', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='hospital.Hospital')),
                ('secondary_hospital', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='secondary_hospital', to='hospital.Hospital')),
            ],
            options={
                'ordering': ('created_date',),
            },
        ),
        migrations.CreateModel(
            name='Prescription',
            fields=[
                ('appointment', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='users.Appointment')),
                ('how_to_use', models.TextField(blank=True, null=True)),
                ('medicine_name', models.CharField(blank=True, max_length=250, null=True)),
                ('created_date', models.DateTimeField(auto_now_add=True)),
                ('modified_date', models.DateTimeField(auto_now=True)),
                ('edit_by', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='edit_by', to=settings.AUTH_USER_MODEL)),
                ('medicine_type', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='hospital.MedicineType')),
            ],
        ),
        migrations.AddField(
            model_name='appointment',
            name='doctor',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='doctor', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='appointment',
            name='refer_to',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='refer_to', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='appointment',
            name='student',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='student', to=settings.AUTH_USER_MODEL),
        ),
    ]
