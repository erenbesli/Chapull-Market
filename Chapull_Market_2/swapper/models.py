from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from time import time


class Swapper(models.Model):
    user = models.OneToOneField(User)
    name = models.CharField(max_length=100)
    address = models.CharField(max_length=150)
    slug=models.SlugField(unique=True)
    #photo = models.ImageField(upload_to="images/swapper_photos/")

    def __unicode__(self):
        return self.name



class Item(models.Model):
    item_model = models.CharField(max_length=30)
    item_status = models.CharField(max_length=30)
    slug = models.SlugField(unique=True)
    image1 = models.FileField(upload_to= "static/")
    item_swapper= models.ForeignKey(Swapper)

    def __unicode__(self):
        return self.item_model


class swap(models.Model):
    swap_status= models.CharField(max_length=100)
    swapper=models.ForeignKey(Swapper)
    other_swapper=models.ForeignKey(Swapper, related_name='other_swapper')
    swapper_item=models.ForeignKey(Item)
    other_swapper_item=models.ForeignKey(Item, related_name='other_swapper_item')
    swapper_dec=models.CharField(max_length=100)
    other_swapper_dec=models.CharField(max_length=100)


# class swap(models.Model):
#     swap_status= models.CharField(max_length=100)
#     item_owner=models.ForeignKey(Swapper)
#     swap_owner = models.ForeignKey(Swapper, related_name='swap_owner')
#     swapper_items=models.ForeignKey(Item,related_name='swapper_items')
#     user_items=models.ForeignKey(Item)



    def __unicode__(self):
            wants="wants"
            froms="from"
            return '%s %s %s %s %s' % (self.swap_owner.name, wants, self.item.item_model,froms,self.item_owner.name)





#create our user object to attach to our drinker object

#def create_swapper_user_callback(sender, instance, **kwargs):
#   swapper, new = Swapper.objects.get_or_create(user=instance)
#post_save.connect(create_swapper_user_callback, User)