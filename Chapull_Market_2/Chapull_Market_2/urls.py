from django.conf.urls import patterns, include, url
from django.contrib import admin
admin.autodiscover()
from swapper.views import index

admin.autodiscover()

urlpatterns = patterns('',

                        (r'^(?P<userslug>.*)/items/$', 'swapper.views.user_items'),
                        (r'^(?P<userslug>.*)/other_users_items/$', 'swapper.views.other_users_items'),
                        (r'^admin/', include(admin.site.urls)),
                        (r'^$',index),
                        (r'^items/(?P<itemslug>.*)/$', 'swapper.views.item_details'),
                        (r'^delete/(?P<itemslug>.*)/$', 'swapper.views.delete_item'),
                        (r'^login/$','swapper.views.LoginRequest'),
                        (r'^register/$', 'swapper.views.SwapperRegistration'),
                        (r'^logout/$', 'swapper.views.LogoutRequest'),
                            (r'^profile/$','swapper.views.Profile'),
                            (r'^swappers/(?P<swapperslug>.*)/$', 'swapper.views.swapper_profile'),
                            (r'^swappers/$','swapper.views.all_swappers'),
                            (r'^(?P<swapper>.*)/(?P<offer_id>.*)/offer_details/$','swapper.views.offer_details'),
                            (r'^swapperss/(?P<swapperslug>.*)/itemss/$','swapper.views.swapper_items'),
                            (r'^swap/(?P<userslug>.*)/want/(?P<itemslug>.*)/from/(?P<item_swapperslug>.*)/$','swapper.views.swap_view'),
                            (r'^swap/(?P<user_id>.*)/(?P<item_swapper_id>.*)/$','swapper.views.swap_view2'),
                            (r'^(?P<userslug>.*)/offers/$','swapper.views.offers'),
                            (r'^(?P<userslug>.*)/sending_offers/$','swapper.views.sending_offers'),
                            (r'^sending/(?P<swap_id>.*)/(?P<result>.*)/$','swapper.views.sending_swap_result'),
                            (r'^coming/(?P<swap_id>.*)/(?P<result>.*)/$','swapper.views.coming_swap_result'),
                            (r'^additem/$','swapper.views.add_item'),
                            (r'^completed_offers/$','swapper.views.completed_offers'),
                            #(r'^(?P<swapper>.*)/(?P<offer_id>.*)/offer_details/$','swapper.views.offer_details'),

                            )
