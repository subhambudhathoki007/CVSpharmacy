import django_filters
from .models import Fileuploads
from django_filters import CharFilter


class PersonFilter(django_filters.FilterSet):
    email_contains= CharFilter(field_name='title', lookup_expr='icontains')
    class Meta:
        model=Fileuploads
        fields=[]