# Generated by Django 3.2.7 on 2021-09-27 16:53

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0007_userotp'),
    ]

    operations = [
        migrations.DeleteModel(
            name='UserOTP',
        ),
    ]