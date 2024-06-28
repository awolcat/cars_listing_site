from django import forms
from django.contrib import admin
from .models import Image


class SearchForm(forms.Form):
    YEAR_CHOICES = [('Any', 'Any')] + [(str(year), str(year)) for year in range(1980, 2019)]
    make = forms.CharField(max_length=50, required=False)
    model = make = forms.CharField(max_length=50, required=False)
    year = forms.ChoiceField(choices=YEAR_CHOICES,
                                required=False
                                )

class MultipleFileInput(forms.ClearableFileInput):
    allow_multiple_selected = True

class MultipleFileField(forms.FileField):
    def __init__(self, *args, **kwargs):
        kwargs.setdefault("widget", MultipleFileInput())
        super().__init__(*args, **kwargs)

    def clean(self, data, initial=None):
        single_file_clean = super().clean
        if isinstance(data, (list, tuple)):
            result = [single_file_clean(d, initial) for d in data]
        else:
            result = single_file_clean(data, initial)
        return result


class ImageForm(forms.ModelForm):
    image = MultipleFileField(label='Select files', required=False)

    class Meta:
       model = Image
       fields = ['car', 'image']


