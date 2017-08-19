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

    #usuarios
    url(r'^verusuarios/$', views.VerUsuarios,name="usuariolista"),
    url(r'^registrarusuario/$', views.RegistrarUsuario,name='useradd'),

    #productos
    url(r'^registrarproducto/$', views.RegistrarProducto,name='productadd'),
    url(r'^listaproductos/$', views.ProductoListView.as_view(), name='producto-list'),
    
    #proveedores
    url(r'^proveedores/$',views.Proveedores,name="prov"),
    
    #operaciones
    url(r'^cotizaciones/$', views.Cotizaciones,name="cot"),
    url(r'^compras/$', views.Compras,name="compras"),
    url(r'^registrarventa/$', views.RegistrarVenta,name="padd"),
    url(r'^bajostock/$', views.ConsultaRapida, name='consulta_rapida'),

    #reportes
    url(r'^inventarios/$', views.Inventarios,name="inv"),

    #clientes
    url(r'^registrarcliente/$', views.RegistrarCliente, name="clienteadd"),
    url(r'^vistacliente/$', views.VistaCliente, name="clienteview"),

    url(r'^F/$', views.F, name="f"),

    
    
]
