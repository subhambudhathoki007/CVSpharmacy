# Generated by Django 3.2.6 on 2021-09-05 12:20

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='FileUpload',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=50)),
                ('brand', models.CharField(max_length=50)),
                ('price', models.IntegerField()),
                ('file', models.FileField(upload_to='static/uploads')),
            ],
        ),
    ]