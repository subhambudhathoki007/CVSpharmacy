# Generated by Django 3.2.6 on 2021-09-21 06:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('guitars', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='delerivered_status',
            field=models.BooleanField(default=False),
        ),
    ]
