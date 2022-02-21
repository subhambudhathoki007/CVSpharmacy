# Generated by Django 3.2.6 on 2021-09-10 05:22

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Contact',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('firstname', models.CharField(max_length=50, null=True, validators=[django.core.validators.MinLengthValidator(2)])),
                ('lastname', models.CharField(max_length=50, null=True, validators=[django.core.validators.MinLengthValidator(2)])),
                ('email', models.EmailField(max_length=254)),
                ('phone', models.CharField(max_length=10)),
            ],
        ),
    ]