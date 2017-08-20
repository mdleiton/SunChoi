# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import render,redirect,render_to_response,get_object_or_404
from django.http import HttpResponse,HttpResponseRedirect
from django.views.generic import TemplateView,FormView,ListView,UpdateView
from .forms import *
from django.contrib.auth import login as auth_login,logout as auth_logout,authenticate
from django.contrib.auth.models import User
from .models import *

#vistas generales
def login(request):
    if request.method == 'POST':
        tipologin=request.POST['tipologin']
        user = authenticate(username=request.POST['username'], password=request.POST['password'])
        if user is not None:
            if(user.is_superuser and user.is_staff and tipologin=="admin"):
                auth_login(request, user)
                return render(request,'SunChoi/menuGlobal.html')
            elif((not user.is_superuser or  not user.is_staff) and tipologin=="empleado" ):
                auth_login(request, user)
                return render(request,'SunChoi/menuempleado.html')
            else:
                return render(request,'SunChoi/index.html',{'error':"incorrecto : nombre de usuario , contraseña o tipo de usuario"})
        else:
            return render(request,'SunChoi/index.html',{'error':"formulario de inicio de sesión incorrecto"})
    else:
        return render(request,'SunChoi/index.html')

def logout(request):
    auth_logout(request)
    return render(request,'SunChoi/logout.html')

def nopermitido(request):
    return render_to_response('SunChoi/nopermitido.html')

def MenuGlobal(request):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        return render(request,'SunChoi/menuGlobal.html')
    else:
        return render_to_response('SunChoi/nopermitido.html')

def MenuEmpleado(request):
    if (request.user.is_authenticated and (not request.user.is_superuser or  not request.user.is_staff)):
        return render(request,'SunChoi/menuempleado.html')
    else:
        return render_to_response('SunChoi/nopermitido.html')

#CRUD usuario
def RegistrarUsuario(request):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        if request.method == 'POST': 
            form = UsuarioForm(request.POST) 
            if form.is_valid():
                tipouser=request.POST['tipouser']
                if tipouser=="admin":
                    is_superuser=1 #con atributo is_superuser=1 para acceder a admin web 
                else:
                    is_superuser=0 #con atributo is_superuser=1 para acceder a admin web
                user=User.objects.create_user(username=request.POST['username'], is_active=1,is_superuser=is_superuser,email=request.POST['correo'], password=request.POST['contrasena'],is_staff=is_superuser)
                Usuario.insertusuario(request.POST['dni'],user.id,request.POST['nombre'],request.POST['apellido'],request.POST['direccion'],request.POST['telefono'],request.POST['correo'])
                idroles=Roles.objects.filter(rol__contains=tipouser)[0].id
                Usuariorol.insertusuariorol(request.POST['dni'],id_roles)
                form=UsuarioForm()
                return render(request,'SunChoi/registrarUsuario.html',{'form': form, 'mjsexitoso':"Se registró correctamente el usuario . Puede ingresar otro usuario"})
            else:
                form=UsuarioForm()
                return render(request,'SunChoi/registrarUsuario.html',{'form': form, 'error':"no lleno correctamente la información"})
        else:
            form = UsuarioForm()    
            return render(request,'SunChoi/registrarUsuario.html',{'form': form})
    else:
        return render(request,'SunChoi/nopermitido.html')

def Usuario_lista(request):
    if request.user.is_authenticated:
        usuarios = Usuario.objects.all()
        return render(request,'SunChoi/usuario_lista.html',{'object_list': usuarios,'tipo_objeto':"usuario"})
    else:
        return render(request,'SunChoi/nopermitido.html')

def Usuario_editar(request, item):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        usuario = get_object_or_404(Usuario, pk=item)
        form = UsuariosListForm(request.POST or None, instance=usuario)
        if form.is_valid():
            form.save()
            return redirect('SunChoi:usuario_lista')
        return render(request, 'SunChoi/actualizar_form.html', {'form':form, 'tipo_objeto':"usuario"})
    else:
        return render(request,'SunChoi/nopermitido.html')

def Usuario_eliminar(request, item):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        usuario = get_object_or_404(Usuario, pk=item)    
        usuarios = Usuario.objects.all()
        if request.method=='POST':
            usuario.delete()
            return redirect('SunChoi:usuario_lista')
        return render(request,'SunChoi/usuario_lista.html',{'object_list': usuarios,'object':usuario, 'eliminar': 'True','tipo_objeto':"usuario"})
    else:
        return render(request,'SunChoi/nopermitido.html')

#CRUD productos
def RegistrarProducto(request):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        if request.method == 'POST': 
            form = ProductoForm(request.POST) 
            if form.is_valid():
                np=form.save(commit=False)
                try:
                    Producto.insertproducto(np.nombre,np.descripcion,np.precio_unitario,np.medida,np.stock,np.proveedor.id_proveedor)
                    form=ProductoForm()
                    return render(request, 'SunChoi/producto_registrar.html', {'form': form, 'mjs': "puede ingresar mas productos"})
                except ValueError:
                    form= ProductoForm()
                    return render(request,'SunChoi/producto_registrar.html',{'form': form,'error': "ocurrio un problema al intentar registrar"})   
            else:
                form= ProductoForm()
                return render(request,'SunChoi/producto_registrar.html',{'form': form,'error': "contenido del formulario incorrecto"})   
        else:
            form = ProductoForm()
            return render(request,'SunChoi/producto_registrar.html', {'form': form})
    else:
        return render(request,'SunChoi/nopermitido.html')

def Producto_lista(request):
    if request.user.is_authenticated:
        productos = Producto.objects.all()
        return render(request,'SunChoi/producto_lista.html',{'object_list': productos,'tipo_objeto':"producto"})
    else:
        return render(request,'SunChoi/nopermitido.html')

def Producto_editar(request, item):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        producto = get_object_or_404(Producto, pk=item)
        form = ProductoForm(request.POST or None, instance=producto)
        if form.is_valid():
            form.save()
            return redirect('SunChoi:producto_lista')
        return render(request, 'SunChoi/actualizar_form.html', {'form':form, 'tipo_objeto':"producto"})
    else:
        return render(request,'SunChoi/nopermitido.html')

def Producto_eliminar(request, item):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        producto = get_object_or_404(Producto, pk=item)    
        productos = Producto.objects.all()
        if request.method=='POST':
            producto.delete()
            return redirect('SunChoi:producto_lista')
        return render(request,'SunChoi/producto_lista.html',{'object_list': productos,'object':producto, 'eliminar': 'True','tipo_objeto':"producto"})
    else:
        return render(request,'SunChoi/nopermitido.html')

# CRUD clientes
def RegistrarCliente(request):
    if (request.user.is_authenticated):
        if request.method == 'POST': 
            form = ClienteForm(request.POST) 
            if form.is_valid():
                #aun no lo guarda entonces se puede validar
                nc=form.save(commit=False)
                try:
                    Cliente.insertcliente(nc.dni,nc.nombre,nc.apellidos,nc.direccion,nc.telefono)
                    form=ClienteForm()
                    return render(request, 'SunChoi/registrocliente.html', {'form': form, 'mjs': "puede ingresar mas clientes"})
                except ValueError:
                    form=ClienteForm()
                    return render(request, 'SunChoi/registrocliente.html', {'form': form, 'error': "xcdv"})
            else:
                form= ClienteForm()
                return render(request,'SunChoi/registrocliente.html',{'form': form,'error': "contenido del formulario incorrecto"})   
        else:
            form = ClienteForm()
        return render(request, 'SunChoi/registrocliente.html', {'form': form})
    else:
        return render_to_response('SunChoi/nopermitido.html')

def Cliente_lista(request):
    if request.user.is_authenticated :
        clientes = Cliente.objects.all()
        return render(request,'SunChoi/cliente_lista.html',{'object_list': clientes,'tipo_objeto':"cliente"})
    else:
        return render(request,'SunChoi/nopermitido.html')

def Cliente_editar(request, item):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        cliente = get_object_or_404(Cliente, pk=item)
        form = ClienteForm(request.POST or None, instance=cliente)
        if form.is_valid():
            form.save()
            return redirect('SunChoi:cliente_lista')
        return render(request, 'SunChoi/actualizar_form.html', {'form':form, 'tipo_objeto':"cliente"})
    else:
        return render(request,'SunChoi/nopermitido.html')

def Cliente_eliminar(request, item):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        cliente = get_object_or_404(Cliente, pk=item)    
        clientes = Cliente.objects.all()
        if request.method=='POST':
            cliente.delete()
            return redirect('SunChoi:cliente_lista')
        return render(request,'SunChoi/cliente_lista.html',{'object_list': clientes,'object':cliente, 'eliminar': 'True','tipo_objeto':"cliente"})
    else:
        return render(request,'SunChoi/nopermitido.html')

# CRUD proveedores
def RegistrarProveedor(request):     
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        if request.method == 'POST': 
            form = ProveedorForm(request.POST) 
            if form.is_valid():
                np=form.save(commit=False)
                try:
                    Proveedores.insertproveedores(np.razon_social,np.direccion,np.telefono,np.email)
                    form=ProveedorForm()
                    return render(request, 'SunChoi/registrarProveedores.html', {'form': form, 'mjsexitoso': "puede ingresar mas proveedores"})
                except ValueError:
                    form= ProveedorForm()
                    return render(request,'SunChoi/registrarProveedores.html',{'form': form,'error': "ocurrio un problema al intentar registrar"})   
            else:
                form= ProveedorForm()
                return render(request,'SunChoi/registrarProveedores.html',{'form': form,'error': "contenido del formulario incorrecto"})   
        else:
            form = ProveedorForm()
            return render(request,'SunChoi/registrarProveedores.html', {'form': form})
    else:
        return render(request,'SunChoi/nopermitido.html')

def Proveedor_lista(request):
    if request.user.is_authenticated:
        proveedores = Proveedores.objects.all()
        return render(request,'SunChoi/proveedor_lista.html',{'object_list': proveedores,'tipo_objeto':"proveedores"})
    else:
        return render_to_response('SunChoi/nopermitido.html')

def Proveedor_editar(request, item):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        proveedor = get_object_or_404(Proveedores, pk=item)
        form = ProveedorForm(request.POST or None, instance=proveedor)
        if form.is_valid():
            form.save()
            return redirect('SunChoi:proveedor_lista')
        return render(request, 'SunChoi/actualizar_form.html', {'form':form, 'tipo_objeto':"proveedores"})
    else:
        return render(request,'SunChoi/nopermitido.html')

def Proveedor_eliminar(request, item):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        proveedor = get_object_or_404(Proveedores, pk=item)    
        proveedores = Proveedores.objects.all()
        if request.method=='POST':
            proveedor.delete()
            return redirect('SunChoi:proveedor_lista')
        return render(request,'SunChoi/proveedor_lista.html',{'object_list': proveedores,'object':proveedor, 'eliminar': 'True','tipo_objeto':"proveedores"})
    else:
        return render(request,'SunChoi/nopermitido.html')

#reportes
def Inventario(request):
    if (request.user.is_authenticated):
        productos = Producto.objects.all()
        return render(request,'SunChoi/inventario.html',{'object_list': productos})
    else:
        return render_to_response('SunChoi/nopermitido.html')

#operaciones
def ConsultaRapida(request):
    if request.user.is_authenticated:
        if request.GET.get('minimo'):
            minimo = request.GET['minimo']
            if minimo.isdigit():
                results = Producto.bajostock(minimo)
                return render(request,'SunChoi/consultaRapida.html',{'lista':results,"minimo": minimo})
            else:
                return render(request,'SunChoi/consultaRapida.html',{"minimo": minimo,"error": "debe ingresar un número válido por favor. Intente de nuevo"})
        else:
            return render(request,'SunChoi/consultaRapida.html')
    else:
        return render_to_response('SunChoi/nopermitido.html')


def RegistrarVenta(request):
    if request.user.is_authenticated:
        if request.GET.get('nombrecliente'):
            dnicliente=request.GET.get('dnicliente')
            nombrecliente=request.GET.get('nombrecliente')  
            idusuario=Usuario.objects.filter(usuario=request.user)[0].dni
            numero=request.GET.get('facturaN')
            estado=""
            print(request.GET.get('cantidad0')) 
            #nose que es estado
            #fecha no deberia ser enviado por defecto fecha actual
            #idfactura=Factura.insertfactura(numero,estado,dnicliente,idusuario)
            #Facturalineas.insertfacturalineas(id_factura,id_producto,cantidad,total_factura_linea)  
            clientes=Cliente.objects.all()
            productos = Producto.objects.all()            
            return render(request,'SunChoi/registrarVenta.html',{'mjsexitoso':"se registro con exito la venta. Puede ingresar otra venta",'clientes':clientes,'productos':productos,'company':{'dir':"Guayaquil",'suc':'ceibos','ruc':'098765'}})
        else:
            #enviarle la informacion de compania
            clientes=Cliente.objects.all()
            productos = Producto.objects.all()            
            return render(request,'SunChoi/registrarVenta.html', {'clientes':clientes,'productos':productos,'company':{'dir':"Guayaquil",'suc':'ceibos','ruc':'098765'}})
    else:
        return render_to_response('SunChoi/nopermitido.html')

def Compras(request):
    if (request.user.is_authenticated):
        return render(request,'SunChoi/compras.html')
    else:
        return render_to_response('SunChoi/nopermitido.html')

def Cotizaciones(request):
    if (request.user.is_authenticated):
        return render(request,'SunChoi/cotizaciones.html')
    else:
        return render_to_response('SunChoi/nopermitido.html')

