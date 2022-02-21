from django import setup
from django.test.testcases import TestCase, Client
from django.urls import reverse
from accounts.views import loginPage, registerPage


class TestViews(TestCase):
    def setUp(self):
        self.login = reverse("login")
        self.register = reverse("register")

    def test_login(self):
        response = self.client.get(self.login)
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'accounts/login.html')

    def test_register(self):
        response = self.client.get(self.register)
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'accounts/register.html')