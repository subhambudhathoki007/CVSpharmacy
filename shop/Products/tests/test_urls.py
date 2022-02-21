from django.test import SimpleTestCase
from django.urls import reverse, resolve
from accounts.views import homepage, aboutpage, contact

class TestUrls(SimpleTestCase):
    # function to test url for home
    def test_homepage_url(self):
        url=reverse('home')
        self.assertEqual(resolve(url).func,homepage)

    # function to test url for about us
    def test_aboutpage_url(self):
        url=reverse('about')
        self.assertEqual(resolve(url).func,aboutpage)

    # function to test url for contact
    def test_contact_url(self):
        url=reverse('contact')
        self.assertEqual(resolve(url).func,contact)

