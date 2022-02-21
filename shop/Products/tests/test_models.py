from django.test.testcases import TestCase
from accounts.models import Contacts


class TestModels(TestCase):
    def setUp(self):
        pass
    def  testContact(self):
        self.contact = Contacts.objects.create(firstname="Test", lastname="Case", email="abc@gmail.com",
                                               phone="9888888", message="sdsdsdsdsd")
        self.assertIsNotNone(Contacts.objects.filter(firstname="Test"))

