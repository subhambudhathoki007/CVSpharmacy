
from django.urls import path, include

urlpatterns = [
    path('guitars/',include('guitars.urls')),
    path('admins/',include('admins.urls')),
    path('',include('accounts.urls'))

]
