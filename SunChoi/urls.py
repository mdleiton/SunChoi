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
    url(r'^menuglobal/$', views.MenuGlobal, name="inicioadmin"),
    url(r'^menuempleado/$', views.MenuEmpleado, name="inicioempleado"),

    # CRUD clientes
    url(r'^registrarcliente/$', views.RegistrarCliente, name="clienteadd"),
    url(r'^listacliente/$', views.Cliente_lista, name='cliente_lista'),
    url(r'^editarcliente/(?P<item>\d+)$', views.Cliente_editar, name='cliente_editar'),
    url(r'^eliminarcliente/(?P<item>\d+)$', views.Cliente_eliminar, name='cliente_eliminar'),

    #CRUD usuarios
    url(r'^registrarusuario/$', views.RegistrarUsuario,name='useradd'),  #falta probar
    url(r'^listausuario/$', views.Usuario_lista, name='usuario_lista'),
    url(r'^editarusuario/(?P<item>\d+)$', views.Usuario_editar, name='usuario_editar'),
    url(r'^eliminarusuario/(?P<item>\d+)$', views.Usuario_eliminar, name='usuario_eliminar'),

    # CRUD productos
    url(r'^registrarproducto/$', views.RegistrarProducto,name='productadd'),  # falta probar
    url(r'^listaproducto/$', views.Producto_lista, name='producto_lista'),
    url(r'^editarproducto/(?P<item>\d+)$', views.Producto_editar, name='producto_editar'),
    url(r'^eliminarproducto/(?P<item>\d+)$', views.Producto_eliminar, name='producto_eliminar'),

    #proveedores
    url(r'^registrarproveedor/$',views.RegistrarProveedor,name="provadd"), #falta probar sp
    url(r'^listaproveedores/$', views.Proveedor_lista, name='proveedor_lista'),
    url(r'^editarproveedor/(?P<item>\d+)$', views.Proveedor_editar, name='proveedor_editar'),
    url(r'^eliminarproveedor/(?P<item>\d+)$', views.Proveedor_eliminar, name='proveedor_eliminar'),
    
    #reportes
    url(r'^inventario/$', views.Inventario,name="inventario"),

    #operaciones
    url(r'^bajostock/$', views.ConsultaRapida, name='consulta_rapida'),
    
    url(r'^registrarventa/$', views.RegistrarVenta,name="padd"),
    url(r'^cotizaciones/$', views.Cotizaciones,name="cot"),
    url(r'^compras/$', views.Compras,name="compras"),
    
    

]
