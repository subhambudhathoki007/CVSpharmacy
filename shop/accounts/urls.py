from django.urls import path
from . import views
from django.contrib.auth import views as auth_views

urlpatterns=[
    path('',views.homepage, name="home"),
    path('about/',views.aboutpage, name="about"),
    path('contact/',views.contact, name="contact"),
    path('register/',views.registerPage, name="register"),
    path('login/',views.loginPage, name="login"),
     path('logout',views.logout_user),
    path('admins/users',views.get_users),
    path('admins/admins',views.get_admins),
    path('promote_user/<int:user_id>',views.promote_user),
    path('demote_user/<int:user_id>',views.demote_user),
    path('add_user/',views.add_user),
    path('add_admin/',views.add_admin),
    path('profile/',views.profile),
    path('delete_user/<int:user_id>', views.delete_user),
    path('delete_admin/<int:user_id>', views.delete_admin),
    path('password_change_user/',views.password_change_user),
    path('password_change_admin/', views.password_change_admin),
    path('reset_password/', auth_views.PasswordResetView.as_view(
    template_name='accounts/password_reset.html'), name='reset_password'),
    path('reset_email_sent/', auth_views.PasswordResetDoneView.as_view(
    template_name='accounts/password_reset_done.html'), name='password_reset_done'),
    path('reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(
    template_name='accounts/password_reset_confirm.html'), name='password_reset_confirm'),
    path('reset_complete/', auth_views.PasswordResetCompleteView.as_view(
    template_name='accounts/password_reset_complete.html'), name='password_reset_complete'),



]