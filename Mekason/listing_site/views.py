from django.shortcuts import render
from .models import Car

# Create your views here.

def home(request):
    query = Car.objects.all()
    cars =[]
    for car in query:
        car.photos = car.photos()
        cars.append(car)
    return render(request, 'home.html', {'cars': cars})