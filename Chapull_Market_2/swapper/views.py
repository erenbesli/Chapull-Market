from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.contrib.auth.models import User
from  django.contrib.auth.decorators import login_required
from django.shortcuts import render_to_response
from django.template import RequestContext
from swapper.forms import RegistrationForm, LoginForm,Form_additem,SwapSelectForm
from swapper.models import Swapper,Item,swap
from django.contrib.auth import authenticate, login, logout
from django.db.models import Q
from django.core.context_processors import csrf
from django.views.generic.edit import UpdateView
# Create your views here.


def SwapperRegistration(request):
    if request.user.is_authenticated():
        return HttpResponseRedirect('/profile')
    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        if form.is_valid():
            user = User.objects.create_user(username=form.cleaned_data['username'], email=form.cleaned_data['email'],password=form.cleaned_data['password'])
            user.save()
            #swapper = user.get_profile()
            #swapper.name = form.cleaned_data['name']
            #swapper.address = form.cleaned_data['address']
            #swapper.save()
            swapper= Swapper(user=user,name=form.cleaned_data['name'],address=form.cleaned_data['address'],slug=form.cleaned_data['slug'])
            swapper.save()
            return HttpResponseRedirect('/profile/')
        else:
            return render_to_response('register.html', {'form': form}, context_instance=RequestContext(request))
    else:
        '''user is not submitting the form show them a blank registration form'''
        form=RegistrationForm()
        context={'form':form}
        return render_to_response('register.html', context, context_instance=RequestContext(request))

     #swap_view2(request,userslug,itemslug,item_swapperslug):
def swap_view2(request,user_id,item_swapper_id):
    if request.method=='POST':
        form = SwapSelectForm(request.POST)
        swapp=swap(swap_status="in progress",item_owner=form.data['item_swapper'],swapper_owner=form.data['swapper'],swapper_items=form.data['swapper_item'],user_items=form.data['user_item'] )
        swapp.save()
    else:
        form=SwapSelectForm()
        your_items = Item.objects.filter(item_swapper = user_id)
        swapper_items = Item.objects.filter(item_swapper = item_swapper_id)
        context={'your_items':your_items,'swapper_items':swapper_items,'form':form}
        return render_to_response('swap2.html',context,context_instance=RequestContext(request))

@login_required
def Profile(request):
    if not request.user.is_authenticated():
        return HttpResponseRedirect('/login/')
    swapper= request.user.get_profile
    context={'swapper':swapper}
    return render_to_response('profile.html',context,context_instance=RequestContext(request))




def LoginRequest(request):
    if request.user.is_authenticated():
        return HttpResponseRedirect('/profile/')
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']
            swapper = authenticate(username=username, password=password)
            if swapper is not None:
                login(request, swapper)
                return HttpResponseRedirect('/profile/')
            else:
                return render_to_response('login.html', {'form': form}, context_instance=RequestContext(request))

        else:
            return render_to_response('login.html', {'form': form}, context_instance=RequestContext(request))

    else:
        ''' User is not submitting the form redirect to login form  '''
        form = LoginForm()
        context = {'form': form}
        return render_to_response('login.html', context, context_instance=RequestContext(request))


def LogoutRequest(request):
    logout(request)
    return HttpResponseRedirect('/')

def index(request):
    return render_to_response('base.html')

@login_required
def user_items(request,userslug):
    items = Item.objects.filter(item_swapper=userslug)
    context = {'items': items}
    return render_to_response('all_items.html', context, context_instance=RequestContext(request))

def delete_item(request, itemslug):
    Item.objects.filter(slug=itemslug).delete()
    return HttpResponseRedirect('/')


@login_required
def other_users_items(request,userslug):
    items = Item.objects.filter (~Q(item_swapper=userslug))
    context = {'items': items}
    return render_to_response('other_users_items.html', context, context_instance=RequestContext(request))

@login_required
def item_details(request, itemslug):
    item = Item.objects.get(slug=itemslug)
    context = {'item': item}
    return render_to_response('single_item.html', context, context_instance=RequestContext(request))

@login_required
def all_swappers(request):
    swappers=Swapper.objects.all().order_by('name')
    context={'swappers':swappers}
    return render_to_response('all_swappers.html',context,context_instance=RequestContext(request))

@login_required
def swapper_profile(request, swapperslug):
    swapper= Swapper.objects.get(slug=swapperslug)
    context= {'swapper':swapper}
    return render_to_response('single_swapper.html',context,context_instance=RequestContext(request))

@login_required
def swapper_items(request, swapperslug):
    swapper_items = Item.objects.filter(item_swapper__slug__startswith=swapperslug)
    context= {'swapper_items': swapper_items }
    return render_to_response('swapper_items.html',context,context_instance=RequestContext(request))

def swap_view(request,userslug,itemslug,item_swapperslug):
    user_name=Swapper.objects.get(slug=userslug)
    item_slug=Item.objects.get(slug=itemslug)
    item_swapper=Swapper.objects.get(slug=item_swapperslug)
    swapper_item=Item.objects.get(slug="empty")
    #swapper_item=Item(item_model="empty",item_status="empty",slug="empty",image1="empty",item_swapper=user_name)
    context={'user_name':user_name,'item_slug':item_slug,'item_swapper_name':item_swapper,'swapper_item':swapper_item}
    swap_swap=swap(swap_status="in progress",swapper=user_name,other_swapper=item_swapper,swapper_item=swapper_item ,other_swapper_item=item_slug,swapper_dec="empty",other_swapper_dec="empty")
    swap_swap.save()
    return render_to_response('swap.html',context,context_instance=RequestContext(request))


def offer_details(request,swapper,offer_id):

    if request.method=="POST":
        swapper_item=request.POST['swapper_items']
        swapper=Swapper.objects.get(id=swapper)
        item=Item.objects.get(item_model=swapper_item)
        swap.objects.filter(id=offer_id).update(swapper_item=item.id,other_swapper_dec="accept")
        return HttpResponseRedirect('/profile/')
    else:
        swapper_items=Item.objects.filter(item_swapper_id=swapper)
        #other_swapper=Swapper.objects.get(slug=other_swapper_slug)
        offer=swap.objects.get(id=offer_id)
        context={'swapper_items':swapper_items,'offer':offer}
        return render_to_response('offer_details.html',context, context_instance=RequestContext(request) )

def offers(request,userslug):
    swapper_offers=swap.objects.filter(other_swapper=userslug)
    context={'swapper_offers':swapper_offers}
    return render_to_response('offers.html', context, context_instance=RequestContext(request))

def sending_offers(request,userslug):
    send_offers=swap.objects.filter(swapper=userslug)
    context={'send_offers':send_offers}
    return render_to_response('sending_offers.html', context, context_instance=RequestContext(request))

def sending_swap_result(request,swap_id,result):
    if (result=="accept"):
        swap.objects.filter(id=swap_id).update(swap_status="completed",swapper_dec="accept")
        swapp=swap.objects.filter(id=swap_id)
        swapper=swapp.get().swapper.id
        other_swapper=swapp.get().other_swapper_id
        other_swapper_item=swapp.get().other_swapper_item_id
        swapper_item=swapp.get().swapper_item_id
        Item.objects.filter(id=swapper_item).update(item_swapper=other_swapper)
        Item.objects.filter(id=other_swapper_item).update(item_swapper=swapper)
        return HttpResponseRedirect('/profile/')

    if (result=="cancel"):
        swap.objects.filter(id=swap_id).update(swap_status="closed",swapper_dec="cancel")
        return HttpResponseRedirect('/profile/')

    if (result=="giveup"):
        swap.objects.filter(id=swap_id).update(swap_status="closed")
        return HttpResponseRedirect('/profile/')

def coming_swap_result(request,swap_id,result):

    if (result=="cancel"):
        swap.objects.filter(id=swap_id).update(swap_status="closed", other_swapper_dec="cancel")
        return HttpResponseRedirect('/profile/')

    if (result=="giveup"):
        swap.objects.filter(id=swap_id).update(swapper_item=4)
        return HttpResponseRedirect('/profile/')

def completed_offers(request):
    offers=swap.objects.filter(swap_status="completed")
    context={'offers':offers}
    return render_to_response('completed_offers.html',context,context_instance=RequestContext(request))


@login_required
def add_item(request):
    if request.POST:
        item=Form_additem(request.POST,request.FILES)
        if item.is_valid():

            item.save()

            return HttpResponseRedirect('/profile/')
    else:
        item = Form_additem()

    args={}
    args.update(csrf(request))
    args['item']=item
    #context={'item':item}
    return render_to_response('add_item.html', args)







