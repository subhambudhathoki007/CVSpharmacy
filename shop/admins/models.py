from django.db import models
from django.core import validators


class Fileuploads(models.Model):
    title= models.CharField(max_length=50,null=True,validators=[validators.MinLengthValidator(2)])
    brand=models.CharField(max_length=50, null=True, validators=[validators.MinLengthValidator(2)])
    price=models.IntegerField()
    digital=models.BooleanField(default=False,null=True,blank=True)
    detail = models.TextField()
    file = models.FileField(upload_to='static/uploads')

