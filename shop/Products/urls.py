from django.urls import path
from .import views
from django.contrib.auth import views as auth_views

urlpatterns = [

    path('cart/',views.cart),
    path('checkout/',views.checkout),
    path('update_item/',views.updateItem),


    path('post_event/',views.post_event),
    path('get_event/',views.get_event),
    path('delete_event/<int:file_id>',views.delete_event),
    path('update_event/<int:file_id>',views.update_event),
    path('show_event',views.show_event),
    path('event_detail/<int:file_id>',views.event_detail),


    path('process_order/',views.processOrder),
    path('history/',views.paymentHistory),
    path('update_status/<id>/<status>',views.updateDeleiverdStatus)
]