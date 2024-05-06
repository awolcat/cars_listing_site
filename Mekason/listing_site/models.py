from django.db import models

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
    year = models.IntegerField(max_length=4, null=False, blank=False)
    price = models.DecimalField(max_digits=8, decimal_places=2, null=False, blank=False)
    description = models.TextField(null=False, blank=False)
    status = models.CharField(choices=CategoriesEnum.choices, default=CategoriesEnum.AVAILABLE)

class Images(BaseModel, models.Model):
    car = models.ForeignKey(Car, on_delete=models.CASCADE, related_name='images')
    image = models.ImageField(upload_to='images/cars/', null=False, blank=False)

class Contact(BaseModel, models.Model):
    name = models.CharField(max_length=100, null=False, blank=False)
    email = models.EmailField(null=False, blank=False)
    phone = models.CharField(max_length=10, null=False, blank=False)

class Message(BaseModel, models.Model):
    contact = models.ForeignKey(Contact, on_delete=models.CASCADE, related_name='messages')
    message = models.TextField(null=False, blank=False)


