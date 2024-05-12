from django.shortcuts import render
from .models import Car

# Create your views here.

def home(request):
    query = Car.objects.all()
    cars =[]
    for car in query:
        car.photos = car.photos()
        car.slug = f'{car.make}-{car.model}-{car.year}'
        cars.append(car)
    return render(request, 'home.html', {'cars': cars})

def car_detail(request, id, mmy):
    car = Car.objects.get(id=id)
    car.photos = car.photos()
    return render(request, 'car_detail.html', {'car': car})