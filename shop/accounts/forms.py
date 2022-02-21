from django import forms
from django.forms import ModelForm
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from .models import Profiles,Contacts
from django.forms import ModelForm

class CreateUserForm(UserCreationForm):
    class Meta:
        model=User
        fields=['username','email','password1','password2']


class LoginForm(forms.Form):
    username=forms.CharField()
    password = forms.CharField(widget=forms.PasswordInput)


class ProfileForm(ModelForm):
    class Meta:
        model=Profiles
        fields="__all__"
        exclude=['username','email']

class ContactForm(ModelForm):
    class Meta:
        model=Contacts
        fields="__all__"

