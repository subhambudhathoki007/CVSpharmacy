from django.shortcuts import render, redirect

#to check if the user is logged in or not
def unauthenticated_user(view_function):
    def wrapper_function(request, *args, **kwargs):
        if request.user.is_authenticated:
            return redirect('/')
        else:
            return view_function(request, *args, **kwargs)
    return wrapper_function

# give access to admin pages is request comes from admin
#if request is from normal user its redirect to user dashboard
def admin_only(view_function):
    def wrapper_function (request, *args, **kwargs):
        if request.user.is_staff:
            return view_function(request, *args, **kwargs)
        else:
            return redirect('/')
    return wrapper_function


# give access to user pages is request comes from user
#if request is from admin user its redirect to admin dashboard
def user_only(view_function):
    def wrapper_function (request, *args, **kwargs):
        if request.user.is_staff:
            return redirect('/admin')
        else:
            return view_function(request, *args, **kwargs)

    return wrapper_function

