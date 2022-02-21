from django import forms
from django.forms import ModelForm
from .models import Events

class Event(ModelForm):
    class Meta:
        model=Events
        fields="__all__"



