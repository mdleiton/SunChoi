# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from SunChoi.models import *

# Register your models here.
class ClienteAdmin(admin.ModelAdmin):
	list_display=('dni','nombre','apellidos','direccion','telefono')
	list_filter=("apellidos",)
	#search_fields=("name": "nametable_atributo")

class ProductoAdmin(admin.ModelAdmin):
	list_display=('id_producto','nombre','descripcion','precio_unitario','medida','stock','proveedor')
	list_filter=("proveedor__razon_social","stock",)
	search_fields=("nombre" ,"descripcion",)

admin.site.register(Proveedores)
admin.site.register(Usuariorol)
admin.site.register(Roles)
admin.site.register(Solicitudesdiferido)
admin.site.register(Comprobantepago)
admin.site.register(Usuario)
admin.site.register(Factura)
admin.site.register(Facturalineas)
admin.site.register(Ordencompralineas)
admin.site.register(Producto,ProductoAdmin)
admin.site.register(Cliente,ClienteAdmin)
admin.site.register(Proforma)
admin.site.register(ProformaLineas)
admin.site.register(OrdenCompra)
admin.site.register(log)




