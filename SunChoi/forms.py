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

class UsuarioForm(forms.ModelForm):
    username=forms.CharField(max_length=200)
    contrasena=forms.CharField(max_length=200)
    class Meta:
        model = Usuario
        fields = [
            'nombre',
            'apellido',
            'direccion',
            'telefono',
            'correo',
        ]

class ClienteForm(forms.ModelForm):
    class Meta:
        model = Cliente
        fields = "__all__" 

class ProductoForm(forms.ModelForm):
    class Meta:
        model = Producto
        fields = "__all__" 
