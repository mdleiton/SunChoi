# coding=utf-8
from django import forms
from django.contrib.auth.forms import User
from django.db import models
from SunChoi.models import *


class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = [
            'username',
            'password'
        ]
        labels = {
            'username' : 'Nombre de Usuario',
            'password' : 'Contraseña'
        }

class FacturaForm(forms.ModelForm):
    class Meta:
        model = Factura
        fields = "__all__" 
    
class FacturalineaForm(forms.ModelForm):
    class Meta:
        model =  Facturalineas
        fields = "__all__" 
        #exclude = ['id_factura', ]

class UsuarioForm(forms.ModelForm):
    contrasena=forms.CharField(max_length=200)
    class Meta:
        model = Usuario
        fields = "__all__" 

class ClienteForm(forms.ModelForm):
    class Meta:
        model = Cliente
        fields = "__all__"
        labels = {
            'dni' : 'CI/RUC',
            'nombre' : 'Nombre'
        } 

class ProductoForm(forms.ModelForm):
    class Meta:
        model = Producto
        fields = "__all__" 
