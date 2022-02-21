from django.shortcuts import render,redirect
from .models import *
from django.contrib.auth.decorators import login_required
from accounts.auth import unauthenticated_user,admin_only,user_only
from django.http import JsonResponse
import json
import os
import datetime
from django.db import connection
from django.contrib import messages
from .models import Events

from .forms import Event



@login_required
@user_only
def cart(request):
    if request.user.is_authenticated:
        customer=request.user
        order, created=Order.objects.get_or_create(customer=customer,complete=False)
        items=order.orderitem_set.all()
        cartItems=order.get_cart_items
    else:
        items=[]
        order={'get_cart_total':0,'get_cart_items':0,'shipping':False}
        cartItems=order['get_cart_items']

    context={'items':items ,
             'order':order,
             'cartItems':cartItems,
             'activate_product': 'active'}
    return render(request,'guitars/cart.html',context)

@login_required
@user_only
def checkout(request):
    if request.user.is_authenticated:
        customer=request.user
        order, created=Order.objects.get_or_create(customer=customer,complete=False)
        items=order.orderitem_set.all()
        cartItems=order.get_cart_items
    else:
        items=[]
        order={'get_cart_total':0,'get_cart_items':0,'shipping':False}
        cartItems=order['get_cart_items']

    context={'items':items ,
             'order':order,
             'cartItems':cartItems,
             'activate_product': 'active'}
    return render(request,'guitars/checkout.html',context)


@login_required
@user_only
def updateItem(request):
    data=json.loads(request.body)
    print("data",data)
    action = data['action']
    fileId=data['fileId']
    print('Action:',action)
    print('fileId:',fileId)

    customer=request.user
    print(request.user.id)
    file=Fileuploads.objects.get(id=fileId)
    order, created = Order.objects.get_or_create(customer=customer, complete=False)

    orderItem,created =OrderItem.objects.get_or_create(order=order, product=file)

    if action=='add':
        orderItem.quantity=(orderItem.quantity + 1)
    elif action=='remove':
        orderItem.quantity=(orderItem.quantity - 1)

    orderItem.save()
    if orderItem.quantity <=0:
        orderItem.delete()


    return JsonResponse('Item was added',safe=False)

@login_required
@user_only
def processOrder(request):
    transaction_id=datetime.datetime.now().timestamp()
    data=json.loads(request.body)
    if request.user.is_authenticated:
        customer = request.user
        order, created = Order.objects.get_or_create(customer=customer, complete=False)
        total=float(data['form']['total'])
        order.transaction_id=transaction_id

        if total==float(order.get_cart_total):
            order.complete=True
        order.save()

        if order.shipping==True:
            ShippingAddress.objects.create(
                customer=customer,
                order=order,
                address=data['shipping']['address'],
                city=data['shipping']['city'],
                state=data['shipping']['state'],
                zipcode=data['shipping']['zipcode'],
            )
    else:
        print('user is not logged in')
    return JsonResponse('payment complete!',safe=False)


@login_required
@user_only
def paymentHistory(request):
    userid = request.user.id
    cursor=connection.cursor()
    cursor.execute("""SELECT dzz.id, dop.quantity,dxx.address,dxx.city,dmf.title,ddd.username,dmf.brand,
case dzz.complete
        when 1 then 'completed'
        when 0 then 'incompleted'
    end as amount,
case dzz.delerivered_status
    when 1 then 'delivered'
    when 0 then 'Pending'
 end as status    

FROM guitars_order dzz
left join guitars_orderitem dop on  dop.order_id=dzz.id
left join guitars_shippingaddress dxx on dxx.order_id=dzz.id
left join admins_fileuploads dmf on dop.product_id=dmf.id
left join auth_user ddd on ddd.id=dzz.customer_id
where dzz.customer_id = %s""",(userid,))
    details=cursor.fetchall()
    result=[]
    for detail in details:
        keys=('orderid','quantity','address','city','title','username','brand','complete','status')
        result.append(dict(zip(keys,detail)))

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
        "detail":result,
        'items': items,
        'order': order,
        'cartItems': cartItems,
    }
    return render(request, 'guitars/history.html', context)


def updateDeleiverdStatus(request,id,status):
    order=Order.objects.filter(id=id).update(delerivered_status=status)
    return redirect('/admins/order/')

def post_event(request):
    form =Event()
    if request.method == "POST":
        form=Event(request.POST,request.FILES)

        if form.is_valid():
            form.save()
            return redirect('/guitars/get_event/')
        else:
            messages.add_message(request, messages.ERROR, 'Sorry! Something went wrong')
            return render(request, 'guitars/post_event.html', {'form_file': form})

    context={
        'form_file':form,
        'activate_event': 'active',
    }
    return render(request,'guitars/post_event.html',context)


@login_required
@admin_only
def get_event(request):
    event=Events.objects.all()

    context={
        'event':event,
        'activate_event':'active'
    }
    return render(request, 'guitars/get_event.html', context)

@login_required
@admin_only
def delete_event(request,file_id):
    event=Events.objects.get(id=file_id)
    os.remove(event.file.path)
    event.delete()
    return redirect('/guitars/get_event/')

@login_required
@admin_only
def update_event(request,file_id):
    file=Events.objects.get(id=file_id)

    if request.method == "POST":
        form=Event(request.POST,request.FILES,instance=file)
        if form.is_valid():
            form.save()
            return redirect('/guitars/get_event/')
        else:
            messages.add_message(request, messages.ERROR, 'Sorry! Something went wrong')
            return render(request, 'guitars/update_event.html', {'form_file': form})

    context={
        "form_file":Event(instance=file),
        'activate_event':'active'

    }
    return render(request,'guitars/update_event.html',context)
@user_only
def show_event(request):
    files=Events.objects.all().order_by('-id')
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
        'files':files,
        'items': items,
        'order': order,
        'cartItems': cartItems,

        'activate_event': 'active',
    }
    return render(request,'guitars/event.html',context)

@user_only
def event_detail(request,file_id):
    files=Events.objects.get(id=file_id)
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
        'activate_event': 'active',


    }
    return render(request,'guitars/event_detail.html',context)



