from django.db import models
from phonenumber_field.modelfields import PhoneNumberField
from djmoney.models.fields import MoneyField


# Create your models here.

class CategoriesEnum(models.TextChoices):
    AVAILABLE = 'available'
    SOLD = 'sold'


class BaseModel(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True

class Car(BaseModel, models.Model):
    CategoriesEnum = CategoriesEnum
    make = models.CharField(max_length=100, null=False, blank=False)
    model = models.CharField(max_length=100, null=False, blank=False)
    year = models.CharField(max_length=4, null=False, blank=False)
    price = MoneyField(max_digits=14, decimal_places=2, default_currency='KES', null=False, blank=False)
    description = models.TextField(max_length=3000, null=False, blank=False)
    status = models.CharField(max_length=10, choices=CategoriesEnum.choices, default=CategoriesEnum.AVAILABLE)

class Image(BaseModel, models.Model):
    car = models.ForeignKey(Car, on_delete=models.CASCADE, related_name='images')
    image = models.ImageField(upload_to='images/cars/', null=False, blank=False)
    

class Contact(BaseModel, models.Model):
    name = models.CharField(max_length=100, null=False, blank=False)
    email = models.EmailField(null=False, blank=False)
    phone = PhoneNumberField(null=False, blank=False)

class Message(BaseModel, models.Model):
    contact = models.ForeignKey(Contact, on_delete=models.CASCADE, related_name='messages')
    message = models.TextField(max_length=1500, null=False, blank=False)


