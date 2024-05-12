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
    photos = car.photos()
    photos_dict = {}
    index = 0
    for photo in photos:
        photos_dict[str(index)] = photo
        index+=1
    car.photos_dict = photos_dict
    return render(request, 'car_detail.html', {'car': car})