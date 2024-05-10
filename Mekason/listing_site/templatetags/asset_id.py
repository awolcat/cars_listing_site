"""Register a template tag
"""
from django import template
from uuid import uuid4

register = template.Library()

@register.tag(name='asset_id')
def do_asset_id(parser, token):
    return uuid4()
