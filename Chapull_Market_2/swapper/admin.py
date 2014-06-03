
from django.contrib import admin
from swapper.models import Item, Swapper, swap

admin.site.register(Item)
admin.site.register(Swapper)
admin.site.register(swap)
