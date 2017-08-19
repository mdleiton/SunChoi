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

    #clientes
    url(r'^registrarcliente/$', views.RegistrarCliente, name="clienteadd"),
    url(r'^vistacliente/$', views.VistaCliente, name="clienteview"),    # falta probar y presentar

    #usuarios
    url(r'^verusuarios/$', views.VerUsuarios,name="usuariolista"),   #falta presentar y probar
    url(r'^registrarusuario/$', views.RegistrarUsuario,name='useradd'),  #falta probar

    #productos
    url(r'^registrarproducto/$', views.RegistrarProducto,name='productadd'),  # falta probar
    url(r'^listaproductos/$', views.ProductoListView.as_view(), name='producto-list'),  # falta presentar
    
    #proveedores
    url(r'^registrarproveedor/$',views.RegistrarProveedor,name="provadd"),
    
    #operaciones
    url(r'^cotizaciones/$', views.Cotizaciones,name="cot"),
    url(r'^compras/$', views.Compras,name="compras"),
    url(r'^registrarventa/$', views.RegistrarVenta,name="padd"),
    url(r'^bajostock/$', views.ConsultaRapida, name='consulta_rapida'),

    #reportes
    url(r'^inventarios/$', views.Inventarios,name="inv"),

]
