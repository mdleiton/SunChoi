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
    url(r'^editarcliente/(?P<item>\d+)$', views.Cliente_editar, name='cliente_editar'),
    url(r'^eliminarcliente/(?P<item>\d+)$', views.Cliente_eliminar, name='cliente_eliminar'),
    url(r'^clientes/$',views.Clientes,name='clientes'),

    #CRUD usuarios
    url(r'^registrarusuario/$', views.RegistrarUsuario,name='useradd'),  
    url(r'^editarusuario/(?P<item>\d+)$', views.Usuario_editar,name='usuario_editar'),
    url(r'^eliminarusuario/(?P<item>\d+)$', views.Usuario_eliminar, name='usuario_eliminar'),
    url(r'^usuarios/$',views.Usuarios,name='usuarios'),

    # CRUD productos
    url(r'^registrarproducto/$', views.RegistrarProducto,name='productadd'),  
    url(r'^editarproducto/(?P<item>\d+)$', views.Producto_editar, name='producto_editar'),
    url(r'^eliminarproducto/(?P<item>\d+)$', views.Producto_eliminar, name='producto_eliminar'),
    # operaciones Productos
    url(r'^productos/$',views.Productos,name='productos'),
    url(r'^ventasXmes/$',views.VentasXmes,name='ventasXmes'),

    #proveedores
    url(r'^registrarproveedor/$',views.RegistrarProveedor,name="provadd"), 
    url(r'^editarproveedor/(?P<item>\d+)$', views.Proveedor_editar, name='proveedor_editar'),
    url(r'^eliminarproveedor/(?P<item>\d+)$', views.Proveedor_eliminar, name='proveedor_eliminar'),
    url(r'^proveedores/$',views.Proveedor,name='proveedores'),
    
    #reportes
    url(r'^inventario/$', views.Inventario,name="inventario"),
    url(r'^bajostock/$', views.ConsultaRapida, name='consulta_rapida'),
    
    #ventas
    url(r'^registrarventa/$', views.RegistrarVenta,name="ventaadd"),
    url(r'^verfactura/(?P<item>\d+)$', views.Factura_ver, name='factura_ver'),
    url(r'^eliminarfactura/(?P<item>\d+)$', views.Factura_eliminar, name='factura_eliminar'),
    url(r'^facturas/$', views.Facturas,name="facturas"),

    #ordendecompras
    url(r'^registrarordencompras/$', views.RegistrarOrdenCompra,name="ordenadd"),
    url(r'^verordencompra/(?P<item>\d+)$', views.Ordencompra_ver, name='ordencompra_ver'),
    url(r'^compras/$', views.Compras,name="compras"),

    #cotizaciones
    url(r'^registrarcotizacion/$', views.RegistrarCotizacion,name="cotizacionadd"),
    url(r'^verproforma/(?P<item>\d+)$', views.Proforma_ver, name='proforma_ver'),
    url(r'^proformas/$', views.Proformas, name='proformas'),

]
