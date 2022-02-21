from django.urls import path
from .import views
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    path('',views.homepage),
    path('get_store/',views.get_store),
    path('post_store/',views.post_store),
    path('delete_store/<int:file_id>',views.delete_store),
    path('update_store/<int:file_id>',views.update_store),
    path('show_store',views.show_store),
    path('product_detail/<int:file_id>',views.detail),
    path('get_contact',views.get_contact),
    path('delete_contact/<int:file_id>', views.delete_contact),
    path('order/',views.order)
]
if settings.DEBUG:
    urlpatterns +=static(settings.STATIC_URL,document_root=settings.STATIC_URL)