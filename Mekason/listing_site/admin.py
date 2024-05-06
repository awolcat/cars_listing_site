from django.contrib import admin
from .models import Car, Image, Contact, Message
from django import forms
from django.db import models
from .forms import ImageForm
from django.utils.safestring import mark_safe
from django.forms.models import BaseInlineFormSet


class ImageInline(admin.TabularInline):
    model = Image
    extra = 1  # Number of extra form instances to display
    max_num = 10  # Max number of forms
    readonly_fields = ('image_preview',)

    def image_preview(self, obj):
        # ex. the name of column is "image"
        if obj.image:
            return mark_safe('<img src="{0}" width="100" height="100" style="object-fit:contain" />'.format(obj.image.url))
        else:
            return '(No image)'

    image_preview.short_description = 'Preview'



class CarAdmin(admin.ModelAdmin):
    inlines = [ImageInline]

# Register your models here.
admin.site.register(Car, CarAdmin)



