# Generated by Django 3.2.6 on 2021-09-10 11:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('admins', '0004_delete_description'),
    ]

    operations = [
        migrations.AddField(
            model_name='fileuploads',
            name='digital',
            field=models.BooleanField(blank=True, default=False, null=True),
        ),
    ]