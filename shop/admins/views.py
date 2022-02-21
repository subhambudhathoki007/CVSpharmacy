from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth.models import User
from .forms import Fileform
from accounts.models import *
from accounts.forms import *
from guitars.models import *
from django.db import connection
from .filters import PersonFilter
import os
from django.contrib.auth.decorators import login_required
from accounts.auth import user_only, admin_only
from .models import *


@login_required
@admin_only
def homepage(request):
    files = Fileuploads.objects.all()
    files_count = files.count()
    orders=Order.objects.all()
    orders_count=orders.count()

    contacts=Contacts.objects.all()
    contacts_count=contacts.count()

    events=Events.objects.all()
    events_count=events.count()

    users = User.objects.all()
    user_count = users.filter(is_staff=0).count()
    admin_count = users.filter(is_staff=1).count()

    context = {
        'file': files_count,
        'contact':contacts_count,
        'order':orders_count,
        'user': user_count,
        'admin': admin_count,
        'event':events_count,


        'activate_dashboard': 'active',

    }
    return render(request,'admins/homepage.html',context)


@login_required
@admin_only
def get_contact(request):
    contacts=Contacts.objects.all()

    context={
        'contacts':contacts,
        'activate_admin_contact':'active'


    }
    return render(request, 'admins/get_contact.html', context)

@login_required
@admin_only
def delete_contact(request,file_id):
    contact=Contacts.objects.get(id=file_id)
    contact.delete()
    return redirect('/admins/get_contact')

@login_required
@admin_only
def get_store(request):
    files=Fileuploads.objects.all().order_by('-id')
    file_filter=PersonFilter(request.GET,queryset=files)
    file_final=file_filter.qs

    context={
        'files':file_final,
        'activate_store': 'active',
        'file_filter':file_filter,

    }
    return render(request,'admins/get_store.html',context)


@login_required
@admin_only
def post_store(request):
    form =Fileform()
    if request.method == "POST":
        form=Fileform(request.POST,request.FILES)

        if form.is_valid():
            form.save()
            return redirect('/admins/get_store/')
        else:
            messages.add_message(request, messages.ERROR, 'Sorry! Something went wrong')
            return render(request, 'admins/post_store.html', {'form_file': form})

    context={
        'form_file':form,
        'activate_store': 'active',
    }
    return render(request,'admins/post_store.html',context)

@login_required
@admin_only
def delete_store(request,file_id):
    image=Fileuploads.objects.get(id=file_id)
    os.remove(image.file.path)
    image.delete()
    return redirect('/admins/get_store/')

@login_required
@admin_only
def update_store(request,file_id):
    file=Fileuploads.objects.get(id=file_id)

    if request.method == "POST":
        form=Fileform(request.POST,request.FILES,instance=file)
        if form.is_valid():
            form.save()
            return redirect('/admins/get_store/')
        else:
            messages.add_message(request, messages.ERROR, 'Sorry! Something went wrong')
            return render(request, 'admins/update_store.html', {'form_file': form})

    context={
        "form_file":Fileform(instance=file),
        'activate_store':'active'

    }
    return render(request,'admins/update_store.html',context)


@user_only
def show_store(request):
    files=Fileuploads.objects.all().order_by('-id')
    file_filter = PersonFilter(request.GET, queryset=files)
    file_final = file_filter.qs
    if request.user.is_authenticated:
        customer=request.user
        order, created=Order.objects.get_or_create(customer=customer,complete=False)
        items=order.orderitem_set.all()
        cartItems=order.get_cart_items
    else:
        items=[]
        order={'get_cart_total':0,'get_cart_items':0,'shipping':False}
        cartItems=order['get_cart_items']
    context={
        'files':file_final,
        'items': items,
        'order': order,
        'cartItems': cartItems,
        'file_filter': file_filter,
        'activate_product': 'active',
    }
    return render(request,'guitars/store.html',context)



@user_only
def detail(request,file_id):
    files=Fileuploads.objects.get(id=file_id)
    if request.user.is_authenticated:
        customer=request.user
        order, created=Order.objects.get_or_create(customer=customer,complete=False)
        items=order.orderitem_set.all()
        cartItems=order.get_cart_items
    else:
        items=[]
        order={'get_cart_total':0,'get_cart_items':0,'shipping':False}
        cartItems=order['get_cart_items']
    context={
        'file':files,
        'items': items,
        'order': order,
        'cartItems': cartItems,
        'activate_product': 'active',


    }
    return render(request,'guitars/product_detail.html',context)



@login_required
@admin_only
def order(request):
    userid = request.user.id
    cursor=connection.cursor()
    cursor.execute("""SELECT dzz.id, dop.quantity,dxx.address,dxx.city,dmf.title,ddd.username,dmf.brand,
case dzz.complete
        when 1 then 'completed'
        when 0 then 'incompleted'
    end as amount,
case dzz.delerivered_status
    when 1 then 'delivered'
    when 0 then 'pending'
 end as status
FROM guitars_order dzz
left join guitars_orderitem dop on  dop.order_id=dzz.id
left join guitars_shippingaddress dxx on dxx.order_id=dzz.id
left join admins_fileuploads dmf on dop.product_id=dmf.id
left join auth_user ddd on ddd.id=dzz.customer_id """)
    details=cursor.fetchall()
    result=[]
    for detail in details:
        keys=('orderid','quantity','address','city','title','username','brand','complete','status')
        result.append(dict(zip(keys,detail)))
    context={
        "detail":result,
        'activate_admin_order': 'active'}
    return render(request, 'admins/order_details.html', context)


