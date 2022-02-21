from django.shortcuts import render,redirect
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from .forms import CreateUserForm, LoginForm,ProfileForm, ContactForm
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from .auth import unauthenticated_user,admin_only,user_only
from .models import Profiles
from guitars.models import Order
from django.contrib.auth.forms import  PasswordChangeForm
from django.contrib.auth import update_session_auth_hash
from admins.models import Fileuploads
import os


@user_only
def homepage(request):
    files = Fileuploads.objects.all().order_by('-id')

    if request.user.is_authenticated:
        customer = request.user
        order, created = Order.objects.get_or_create(customer=customer, complete=False)
        items = order.orderitem_set.all()
        cartItems = order.get_cart_items
    else:
        items = []
        order = {'get_cart_total': 0, 'get_cart_items': 0}
        cartItems = order['get_cart_items']
    context = {'files':files,
               'items': items,
               'order': order,
               'cartItems': cartItems,
               }

    return render(request,'accounts/homepage.html',context)

@user_only
def contact(request):
    form = ContactForm()
    if request.method == "POST":
        form = ContactForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('/contact/')
        else:
            messages.add_message(request,messages.ERROR,"Sorry")
            return render(request,'accounts/contact.html',{'contact':form})
    if request.user.is_authenticated:
        customer = request.user
        order, created = Order.objects.get_or_create(customer=customer, complete=False)
        items = order.orderitem_set.all()
        cartItems = order.get_cart_items
    else:
        items = []
        order = {'get_cart_total': 0, 'get_cart_items': 0}
        cartItems = order['get_cart_items']



    context = {
        'activate_contact':'active',
        'items': items,
        'order': order,
        'cartItems': cartItems,
        'contact':form
    }

    return render(request,'accounts/contact.html',context)

@user_only
def aboutpage(request):
    if request.user.is_authenticated:
        customer = request.user
        order, created = Order.objects.get_or_create(customer=customer, complete=False)
        items = order.orderitem_set.all()
        cartItems = order.get_cart_items
    else:
        items = []
        order = {'get_cart_total': 0, 'get_cart_items': 0}
        cartItems = order['get_cart_items']


    context = {
        'items': items,
        'order': order,
        'cartItems': cartItems,

        'activate_about': 'active'
    }
    return render(request,'accounts/about.html',context)




@unauthenticated_user
def registerPage(request):
    if request.method =="POST":
        form=CreateUserForm(request.POST)
        if form.is_valid():
            user=form.save()
            Profiles.objects.create(user=user ,username=user.username,
                                   email=user.email)

            user=form.cleaned_data.get('username')


            messages.add_message(request,messages.SUCCESS,user+" register successfully")
            return redirect('/login')
        else:
            messages.add_message(request, messages.ERROR,'Sorry! ,Something went wrong')
            return render(request, 'accounts/register.html',{'form_user':form})
    context={
        'form_user':CreateUserForm,
        'activate_register':'active'
    }
    return render(request,'accounts/register.html',context)


@unauthenticated_user
def loginPage(request):
    if request.method == "POST":
        form=LoginForm(request.POST)
        if form.is_valid():
            data=form.cleaned_data
            user = authenticate(request, username=data['username'],
                                password=data['password'])
            # print(user)
            if user is not None:
                if user.is_staff:
                    login(request,user)
                    return redirect('/admins')
                elif not user.is_staff:
                    login(request,user)
                    return redirect('/')

            else:
                messages.add_message(request, messages.ERROR, 'Sorry! Invalid user credentials')
                return render(request, 'accounts/login.html', {'form_login': form})
    context={
        'form_login':LoginForm,
        'activate_login': 'active',
    }
    return render(request,'accounts/login.html',context)


def logout_user(request):
    logout(request)
    return redirect('/login')

@login_required
@admin_only
def get_users(request):
    users = User.objects.filter(is_staff=0).order_by('-id')

    context = {
        'users':users,
        'activate_user': 'active',


    }
    return render(request, 'accounts/users.html', context)

@login_required
@admin_only
def get_admins(request):
    admins = User.objects.filter(is_staff=1).order_by('-id')
    context = {
        'admins':admins,
        'activate_admin': 'active',
    }
    return render(request, 'accounts/admins.html', context)

@login_required
@admin_only
def promote_user(request,user_id):
    user = User.objects.get(id=user_id)
    user.is_staff=True
    user.save()
    messages.add_message(request, messages.SUCCESS, 'User promoted to admin')
    return redirect('/admins/admins')

@login_required
@admin_only
def demote_user(request,user_id):
    user = User.objects.get(id=user_id)
    user.is_staff=False
    user.save()
    messages.add_message(request, messages.SUCCESS, 'Admin demoted to user')
    return redirect('/admins/users')

def delete_user(request,user_id):
    user=User.objects.get(id=user_id)
    user.delete()
    return redirect('/admins/users')

def delete_admin(request,user_id):
    user=User.objects.get(id=user_id)
    user.delete()
    return redirect('/admins/admins')
#model to add user by admin only
@login_required
@admin_only
def add_user(request):
    if request.method =="POST":
        form=CreateUserForm(request.POST)
        if form.is_valid():
            user=form.save()
            Profiles.objects.create(user=user, username=user.username,
                                    email=user.email)

            user = form.cleaned_data.get('username')
            return redirect('/admins/users')
        else:
            messages.add_message(request, messages.ERROR,'Sorry! ,Something went wrong')
            return render(request, 'accounts/add_user.html',{'form_user':form})
    context={
        'form_user':CreateUserForm,
        'activate_user':'active'
    }
    return render(request,'accounts/add_user.html',context)

@login_required
@admin_only
def add_admin(request):
    if request.method =="POST":
        form=CreateUserForm(request.POST)
        if form.is_valid():
            username=form.cleaned_data.get('username')
            email=form.cleaned_data.get('email')
            user=User.objects.create_user(username=username,
                                   email=email)
            user.is_staff=True
            user.is_superuser=True

            user.save()


            return redirect('/admins/admins')
        else:
            messages.add_message(request, messages.ERROR,'Sorry! ,Something went wrong')
            return render(request, 'accounts/add_admin.html',{'form_admin':form})
    context = {
        'form_admin': CreateUserForm,
        'activate_admin': 'active',

    }
    return render(request,'accounts/add_admin.html',context)
# function for profile
@login_required
@user_only
def profile(request):
    profiles = request.user.profiles
    if request.method== 'POST':
        form = ProfileForm(request.POST, request.FILES, instance=profiles)
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, 'Profile Updated Successfully')
            return redirect('/profile')
    if request.user.is_authenticated:
        customer = request.user
        order, created = Order.objects.get_or_create(customer=customer, complete=False)
        items = order.orderitem_set.all()
        cartItems = order.get_cart_items
    else:
        items = []
        order = {'get_cart_total': 0, 'get_cart_items': 0}
        cartItems = order['get_cart_items']
    context = {

        'form': ProfileForm(instance=profiles),
        'items': items,
        'order': order,
        'cartItems': cartItems,
    }
    return render(request, 'accounts/profile.html', context)

@login_required
@user_only
def password_change_user(request):
    if request.method=="POST":
        form =PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user=form.save()
            update_session_auth_hash(request,user)
            messages.add_message(request,messages.SUCCESS,'Password Changed Successfully')
        else:
            messages.add_message(request,messages.ERROR,'Something went wrong')
            return render(request,'accounts/password_change_user.html',{'password_change_form':form})
    if request.user.is_authenticated:
        customer = request.user
        order, created = Order.objects.get_or_create(customer=customer, complete=False)
        items = order.orderitem_set.all()
        cartItems = order.get_cart_items
    else:
        items = []
        order = {'get_cart_total': 0, 'get_cart_items': 0}
        cartItems = order['get_cart_items']
    context={
        'password_change_form':PasswordChangeForm(request.user),
        'items': items,
        'order': order,
        'cartItems': cartItems,
    }
    return render(request,'accounts/password_change_user.html',context)


@login_required
@admin_only
def password_change_admin(request):
    if request.method=="POST":
        form =PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user=form.save()
            update_session_auth_hash(request,user)
            messages.add_message(request,messages.SUCCESS,'Password Changed Successfully')

        else:
            messages.add_message(request,messages.ERROR,'Something went wrong')
            return render(request,'accounts/password_change_admin.html',{'password_change_form':form})

    context={
        'password_change_form':PasswordChangeForm(request.user),
        'activate_password': 'active',


    }
    return render(request,'accounts/password_change_admin.html',context)