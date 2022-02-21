from django import forms
from django.forms import ModelForm
from .models import Fileuploads


class Fileform(ModelForm):
    class Meta:
        model=Fileuploads
        fields="__all__"




