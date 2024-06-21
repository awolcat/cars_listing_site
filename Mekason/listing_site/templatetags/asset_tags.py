"""Register a template tag
"""
from django import template
from uuid import uuid4

register = template.Library()

@register.simple_tag
def asset_id():
    return uuid4()
