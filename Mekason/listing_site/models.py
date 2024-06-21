from django.db import models
from phonenumber_field.modelfields import PhoneNumberField
from djmoney.models.fields import MoneyField


# Create your models here.

class StatusEnum(models.TextChoices):
    AVAILABLE = 'available'
    SOLD = 'sold'

class FuelTypeEnum(models.TextChoices):
    PETROL = 'Petrol'
    DIESEL = 'Diesel'
    HYBRID = 'Hybrid'
    ELECTRIC = 'Electric'

class BodyTypeEnum(models.TextChoices):
    SEDAN = 'Sedan'
    COUPE = 'Coupe'
    HATCHBACK = 'Hatchback'
    SUV = 'SUV'
    VAN = 'Van'
    PICKUP = 'Pickup'
    DOUBLE_CAB = 'Double Cab'
    WAGON = 'Wagon'
    CONVERTIBLE = 'Convertible'
    MINIVAN = 'Minivan'
    


class BaseModel(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True

class Car(BaseModel, models.Model):
    StatusEnum = StatusEnum
    make = models.CharField(max_length=100, null=False, blank=False)
    model = models.CharField(max_length=100, null=False, blank=False)
    year = models.CharField(max_length=4, null=False, blank=False)
    location = models.CharField(max_length=100, null=False, blank=False)
    body_type = models.CharField(max_length=100, choices=BodyTypeEnum.choices, default=BodyTypeEnum.SEDAN)
    fuel_type = models.CharField(max_length=100, choices=FuelTypeEnum.choices, default=FuelTypeEnum.PETROL)
    price = MoneyField(max_digits=14, decimal_places=2, default_currency='KES', null=False, blank=False)
    description = models.TextField(max_length=3000, null=False, blank=False)
    sold = models.BooleanField(default=False)

    def photos(self):
        images = []
        if self.images.count() == 0:
            images.append('https://via.placeholder.com/300')
            return images
        for image in self.images.all():
            images.append(image.image.url)
        return images


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


