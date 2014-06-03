from django import forms
from django.contrib.auth.models import User
from django.forms import ModelForm
from swapper.models import Swapper,swap,Item

class RegistrationForm(forms.Form):
    username = forms.CharField(label=(u'User Name'))
    email = forms.EmailField(label=(u'Email Address'))
    password = forms.CharField(label=(u'Password'),widget=forms.PasswordInput(render_value=False))
    password1 = forms.CharField(label=(u'Password'),widget=forms.PasswordInput(render_value=False))
    address=forms.CharField(label=(u'Address'))
    name=forms.CharField(label=(u'Name'))
    slug=forms.CharField(label=(u'slug'))


class Meta:
    model=Swapper
    exclude = ('user',)


    def clean_username(self):
        username = self.cleaned_data['username']
        try:
            User.objects.get(username=username)
        except User.DoesNotExist:
            return username
        raise forms.ValidationError("That username is already taken")


    def clean(self):
        if self.cleaned_data['password'] != self.cleaned_data['password1']:
            raise forms.ValidationError("Passwords did not match.")
        return self.cleaned_data


class LoginForm(forms.Form):
    username = forms.CharField(label=(u'User Name'))
    password = forms.CharField(label=(u'Password'),widget=forms.PasswordInput(render_value=False))

class SwapSelectForm(forms.Form):

    OPTIONS = (
            ("a", "A"),
            ("b", "B"),
            )

    swapper = forms.CharField(label=(u'User Name'))
    item_swapper = forms.CharField(label=(u'Item Swapper'))
    user_item = forms.MultipleChoiceField(widget=forms.CheckboxSelectMultiple,choices=OPTIONS)
    swapper_item = forms.MultipleChoiceField(widget=forms.CheckboxSelectMultiple,choices=OPTIONS)



class Form_additem(forms.ModelForm):

    class Meta:
        model=Item
        fields=('item_model','item_status','slug','image1','item_swapper')





    # item_model = forms.CharField()
    # item_status = forms.CharField()
    # slug = forms.SlugField()
    # image1 = forms.ImageField()
    # item_swapper= forms.CharField()


