from django.conf.urls import include, url
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.contrib import admin
from SunChoi import views

urlpatterns = [
    #vistas generales
    url(r'^$', views.login, name="login"),url(r'^login/$', views.login),
    url(r'^logout/$', views.logout, name="logout"),
    url(r'^nopermitido/$', views.nopermitido, name="nopermitido"),
    url(r'^menuglobal/$', views.MenuAdmin, name="inicioadmin"),
    url(r'^menuempleado/$', views.MenuEmployee, name="inicioempleado"),
    #url(r'^menuempleado/$', views.MenuEmpleado, name="inicioempleado"),
    #url(r'^menuadmin/$', views.MenuAdmin, name="menuadmin"),

    # CRUD clientes
    url(r'^registrarcliente/$', views.RegistrarCliente, name="clienteadd"),
    url(r'^listacliente/$', views.Cliente_lista, name='cliente_lista'),
    url(r'^editarcliente/(?P<item>\d+)$', views.Cliente_editar, name='cliente_editar'),
    url(r'^eliminarcliente/(?P<item>\d+)$', views.Cliente_eliminar, name='cliente_eliminar'),
    url(r'^clientes/$',views.Clientes,name='clientes'),

    #CRUD usuarios
    url(r'^registrarusuario/$', views.RegistrarUsuario,name='useradd'),  
    url(r'^listausuario/$', views.Usuario_lista, name='usuario_lista'),
    url(r'^editarusuario/(?P<item>\d+)$', views.Usuario_editar,name='usuario_editar'),
    url(r'^eliminarusuario/(?P<item>\d+)$', views.Usuario_eliminar, name='usuario_eliminar'),
    url(r'^usuarios/$',views.Usuarios,name='usuarios'),

    # CRUD productos
    url(r'^registrarproducto/$', views.RegistrarProducto,name='productadd'),  
    url(r'^listaproducto/$', views.Producto_lista, name='producto_lista'),
    url(r'^editarproducto/(?P<item>\d+)$', views.Producto_editar, name='producto_editar'),
    url(r'^eliminarproducto/(?P<item>\d+)$', views.Producto_eliminar, name='producto_eliminar'),
    # operaciones Productos
    url(r'^productos/$',views.Productos,name='productos'),
    url(r'^ventasXmes/$',views.VentasXmes,name='ventasXmes'),

    #proveedores
    url(r'^registrarproveedor/$',views.RegistrarProveedor,name="provadd"), 
    url(r'^listaproveedores/$', views.Proveedor_lista, name='proveedor_lista'),
    url(r'^editarproveedor/(?P<item>\d+)$', views.Proveedor_editar, name='proveedor_editar'),
    url(r'^eliminarproveedor/(?P<item>\d+)$', views.Proveedor_eliminar, name='proveedor_eliminar'),
    url(r'^proveedores/$',views.Proveedor,name='proveedores'),
    
    #reportes
    url(r'^inventario/$', views.Inventario,name="inventario"),
    url(r'^bajostock/$', views.ConsultaRapida, name='consulta_rapida'),
    
    #ventas
    url(r'^registrarventa/$', views.RegistrarVenta,name="ventaadd"),
    url(r'^listafactura/$', views.Factura_lista,name="factura_lista"),
    url(r'^verfactura/(?P<item>\d+)$', views.Factura_ver, name='factura_ver'),
    url(r'^facturas/$', views.Facturas,name="facturas"),

    #ordendecompras
    url(r'^registrarordencompras/$', views.RegistrarOrdenCompra,name="ordenadd"),
    url(r'^listaordencompra/$', views.OrdenCompra_lista,name="listaordencompra_lista"),
    url(r'^verordencompra/(?P<item>\d+)$', views.Ordencompra_ver, name='ordencompra_ver'),
    url(r'^compras/$', views.Compras,name="compras"),

    #cotizaciones
    url(r'^registrarcotizacion/$', views.RegistrarCotizacion,name="cotizacionadd"),
    url(r'^listaproforma/$', views.Proforma_lista,name="proforma_lista"),
    url(r'^verproforma/(?P<item>\d+)$', views.Proforma_ver, name='proforma_ver'),
    url(r'^proformas/$', views.Proformas, name='proformas'),

]
