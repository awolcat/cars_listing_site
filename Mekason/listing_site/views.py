from django.shortcuts import render
from django.db.models import Q
from .models import Car
from .forms import SearchForm
from django.core.paginator import Paginator

# Create your views here.

def home(request, make=None):
    query = Car.objects.all()
    makes = Car.objects.values('make').distinct()
    makes = [make['make'] for make in makes]
    if make:
        query = query.filter(Q(make__icontains=make)).all()
    cars =[]
    for car in query:
        car.photos = car.photos()
        car.slug = f'{car.make}-{car.model}-{car.year}'
        cars.append(car)
    
    paginator = Paginator(cars, 12) 
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    form = SearchForm()
    
    return render(request, 'home.html',{'page_obj': page_obj, 
                                        'makes': makes,
                                        'form': form, 
                                        'filter': make})

def car_detail(request, id, mmy):
    s_cars = []
    car = Car.objects.get(id=id)
    photos = car.photos()
    photos_dict = {}
    index = 0
    for photo in photos:
        photos_dict[str(index)] = photo
        index+=1
    car.photos_dict = photos_dict
    similar_cars = Car.objects.filter(body_type=car.body_type, fuel_type=car.fuel_type).exclude(id=car.id).all()
    for s_car in similar_cars:
        s_car.photos = s_car.photos()
        s_car.slug = f'{s_car.make}-{s_car.model}-{s_car.year}'
        s_cars.append(s_car)
    return render(request, 'car_detail.html', {'car': car, 'similar_cars': s_cars})

def search(request, methods=['POST']):
    cars = []
    form = SearchForm(request.POST)
    if form.is_valid():
        data = form.cleaned_data
        query = Car.objects.all()
        
        if data['make']:
            query = query.filter(Q(make__icontains=data['make'])).all()
        if data['model']:
            query = query.filter(Q(model__icontains=data['model'])).all()
        if data['year'] and data['year'] != 'Any':
            query = query.filter(Q(year__icontains=data['year'])).all()
        print(query)
        for car in query:
            car.photos = car.photos()
            car.slug = f'{car.make}-{car.model}-{car.year}'
            cars.append(car)
    return render(request, 'home.html', {'cars': cars, 'form': form})

def services(request):
    return render(request, 'services.html')