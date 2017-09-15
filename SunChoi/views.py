# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import render,redirect,render_to_response,get_object_or_404
from django.http import HttpResponse,HttpResponseRedirect
from django.views.generic import TemplateView,FormView,ListView,UpdateView
from .forms import *
from django.contrib.auth import login as auth_login,logout as auth_logout,authenticate
from django.contrib.auth.models import User
from .models import *
from django.utils import timezone
import datetime
from datetime import timedelta, date
from django.db.models import Count,Sum,Max

datoscompany={'dir':"Guayaquil",'suc':'ceibos','ruc':'09876535435'}
dias_vencimiento_proforma=7
facturaNusuario=False

#vistas generales
def login(request):
    if request.method == 'POST':
        tipologin=request.POST['tipologin']
        user = authenticate(username=request.POST['username'], password=request.POST['password'])
        if user is not None:
            if(user.is_superuser and user.is_staff and tipologin=="admin"):
                auth_login(request, user)
                return render(request,'SunChoi/menuAdmin.html')
            elif((not user.is_superuser or  not user.is_staff) and tipologin=="empleado" ):
                auth_login(request, user)
                return render(request,'SunChoi/menuEmployee.html')
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

def MenuAdmin(request):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        return render(request,'SunChoi/menuAdmin.html')
    else:
        return render_to_response('SunChoi/nopermitido.html')

def MenuEmployee(request):
    if (request.user.is_authenticated and (not request.user.is_superuser or  not request.user.is_staff)):
        return render(request,'SunChoi/menuEmployee.html')
    else:
        return render_to_response('SunChoi/nopermitido.html')

#CRUD usuario
def RegistrarUsuario(request):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        if request.method == 'POST': 
            form = UsuarioForm(request.POST) 
            if form.is_valid() and request.POST['dni'].isdigit() and len(request.POST['dni'])>9 and len(request.POST['contrasena'])>8:
                tipouser=request.POST['tipouser']
                if tipouser=="admin":
                    is_superuser=1 #con atributo is_superuser=1 para acceder a admin web 
                else:
                    is_superuser=0 #con atributo is_superuser=1 para acceder a admin web
                user=User.objects.create_user(username=request.POST['username'], is_active=1,is_superuser=is_superuser,email=request.POST['correo'], password=request.POST['contrasena'],is_staff=is_superuser)
                Usuario.insertusuario(request.POST['dni'],user.id,request.POST['nombre'],request.POST['apellido'],request.POST['direccion'],request.POST['telefono'],request.POST['correo'])
                idroles=Roles.objects.filter(rol__contains=tipouser)[0].id_rol
                Usuariorol.insertusuariorol(request.POST['dni'],idroles)
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

def Usuarios(request):
    if request.user.is_authenticated:
        usuarios = Usuario.objects.all()
        return render(request,'SunChoi/usuarios.html',{'object_list': usuarios,'tipo_objeto':"usuario"})
    else:
        return render(request,'SunChoi/nopermitido.html')

def Usuario_editar(request, item):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        usuario = get_object_or_404(Usuario, pk=item)
        form = UsuariosListForm(request.POST or None, instance=usuario)
        if form.is_valid():
            form.save()
            return redirect('SunChoi:usuarios')
        return render(request, 'SunChoi/actualizar_form.html', {'form':form, 'tipo_objeto':"usuarios"})
    else:
        return render(request,'SunChoi/nopermitido.html')

def Usuario_eliminar(request, item):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        usuario = get_object_or_404(Usuario, pk=item)    
        usuarios = Usuario.objects.all()
        if request.method=='POST':
            usuario.delete()
            return redirect('SunChoi:usuarios')
        return render(request,'SunChoi/usuarios.html',{'object_list': usuarios,'object':usuario, 'eliminar': 'True','tipo_objeto':"usuarios"})
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
                    Producto.insertproducto(np.nombre,np.descripcion,np.precio_unitario,np.medida,np.stock,np.proveedor.id_proveedor,np.precio_ventas)
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

def Productos(request):
    if request.user.is_authenticated:
        productos = Producto.objects.all()
        return render(request,'SunChoi/productos.html',{'object_list': productos,'tipo_objeto':"productos"})
    else:
        return render(request,'SunChoi/nopermitido.html')

def Producto_editar(request, item):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        producto = get_object_or_404(Producto, pk=item)
        form = ProductoForm(request.POST or None, instance=producto)
        if form.is_valid():
            form.save()
            return redirect('SunChoi:productos')
        return render(request, 'SunChoi/actualizar_form.html', {'form':form, 'tipo_objeto':"productos"})
    else:
        return render(request,'SunChoi/nopermitido.html')

def Producto_eliminar(request, item):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        producto = get_object_or_404(Producto, pk=item)    
        productos = Producto.objects.all()
        if request.method=='POST':
            producto.delete()
            return redirect('SunChoi:productos')
        return render(request,'SunChoi/productos.html',{'object_list': productos,'object':producto, 'eliminar': 'True','tipo_objeto':"productos"})
    else:
        return render(request,'SunChoi/nopermitido.html')

# CRUD clientes
def RegistrarCliente(request):
    if (request.user.is_authenticated):
        if request.method == 'POST': 
            form = ClienteForm(request.POST) 
            if form.is_valid() :
                #aun no lo guarda entonces se puede validar
                nc=form.save(commit=False)
                if nc.dni.isdigit() and len(nc.dni)>9: 
                    try:
                        Cliente.insertcliente(nc.dni,nc.nombre,nc.apellidos,nc.direccion,nc.telefono)
                        form=ClienteForm()
                        return render(request, 'SunChoi/registrocliente.html', {'form': form, 'mjs': "puede ingresar mas clientes"})
                    except ValueError:
                        form=ClienteForm()  
                else:
                    form= ClienteForm()
                    return render(request,'SunChoi/registrocliente.html',{'form': form,'error': "contenido del formulario incorrecto"})   
            else:
                form= ClienteForm()
                return render(request,'SunChoi/registrocliente.html',{'form': form,'error': "contenido del formulario incorrecto"})   
        else:
            form = ClienteForm()
        return render(request, 'SunChoi/registrocliente.html', {'form': form})
    else:
        return render_to_response('SunChoi/nopermitido.html')

def Clientes(request):
    if request.user.is_authenticated:
        cliente = Cliente.objects.all()
        return render(request,'SunChoi/clientes.html',{'object_list': cliente,'tipo_objeto':"clientes"})
    else:
        return render(request,'SunChoi/nopermitido.html')

def Cliente_editar(request, item):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        cliente = get_object_or_404(Cliente, pk=item)
        form = ClienteForm(request.POST or None, instance=cliente)
        if form.is_valid():
            form.save()
            return redirect('SunChoi:clientes')
        return render(request, 'SunChoi/actualizar_form.html', {'form':form, 'tipo_objeto':"clientes"})
    else:
        return render(request,'SunChoi/nopermitido.html')

def Cliente_eliminar(request, item):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        cliente = get_object_or_404(Cliente, pk=item)    
        clientes = Cliente.objects.all()
        if request.method=='POST':
            cliente.delete()
            return redirect('SunChoi:clientes')
        return render(request,'SunChoi/clientes.html',{'object_list': clientes,'object':cliente, 'eliminar': 'True','tipo_objeto':"clientes"})
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
                    idduplicado=Proveedores.getidproveedor(np.razon_social)
                    if not idduplicado and not idduplicado==None:
                        Proveedores.insertproveedores(np.razon_social,np.direccion,np.telefono,np.email)
                        form=ProveedorForm()
                        return render(request, 'SunChoi/registrarProveedores.html', {'form': form, 'mjsexitoso': "puede ingresar mas proveedores"})
                    else:
                        form=ProveedorForm()
                        return render(request, 'SunChoi/registrarProveedores.html', {'form': form, 'mjsexitoso': "nombre de proveedores ya registrado"})
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



def Proveedor_eliminar(request, item):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        proveedor = get_object_or_404(Proveedores, pk=item)    
        proveedores = Proveedores.objects.all()
        if request.method=='POST':
            proveedor.delete()
            return redirect('SunChoi:proveedores')
        return render(request,'SunChoi/proveedores.html',{'object_list': proveedores,'object':proveedor, 'eliminar': 'True','tipo_objeto':"proveedores"})
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

#ventas
def RegistrarVenta(request):
    if request.user.is_authenticated:
        clientes=Cliente.objects.all()
        productos = Producto.objects.all()   
        fecha=str( datetime.datetime.now())   
        maxNfactura=Factura.objects.all().aggregate(Max('id_factura'))['id_factura__max']
        if request.GET.get('nombrecliente'): 
            idusuario=Usuario.objects.filter(usuario=request.user)[0].dni
            idfactura=Factura.insertfactura(request.GET.get('facturaN') ,request.GET.get('fechaF')  ,request.GET.get('dnicliente'),idusuario,request.GET.get('valorTotal'))[0][0] 
            cantfl=request.GET.get('nLineas').split(':')
            for i in cantfl:
                idproducto=Producto.objects.filter(descripcion=request.GET.get('descripcion'+i))[0].id_producto
                Facturalineas.insertfacturalineasUpdateStock(idfactura,idproducto,request.GET.get('cantidad'+i),request.GET.get('iva'+i),request.GET.get('desc'+i),request.GET.get('pretot'+i))  
            clientes=Cliente.objects.all()
            productos = Producto.objects.all()  
            maxNfactura=Factura.objects.all().aggregate(Max('id_factura'))['id_factura__max']
            return render(request,'SunChoi/registrarVenta.html',{'mjsexitoso':"Se registro con exito la venta. Puede ingresar otra venta",'clientes':clientes,'productos':productos,'company':datoscompany,'Nfactura':int(maxNfactura+1),'fecha':fecha})
        else:
            global facturaNusuario
            if facturaNusuario:
                return render(request,'SunChoi/registrarVenta.html', {'clientes':clientes,'productos':productos,'company':datoscompany,'fecha':fecha})
            return render(request,'SunChoi/registrarVenta.html', {'clientes':clientes,'productos':productos,'company':datoscompany,'Nfactura':int(maxNfactura+1),'fecha':fecha})
    else:
        return render_to_response('SunChoi/nopermitido.html')

def Facturas(request):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        facturas = Factura.objects.all()
        return render(request,'SunChoi/facturas.html',{'object_list': facturas,'tipo_objeto':"facturas"})
    else:
        return render_to_response('SunChoi/nopermitido.html')

def Factura_ver(request, item):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        factura = get_object_or_404(Factura, pk=item)
        form = FacturaForm(request.POST or None, instance=factura)
        if form.is_valid():
            form.save()
            return redirect('SunChoi:facturas')
        fp=form.save(commit=False)
        facturalineas=Facturalineas.objects.filter(id_factura=fp.id_factura)
        return render(request, 'SunChoi/ver_form_compuesto.html', {'factura':factura,'fllista':facturalineas, 'tipo_objeto':"facturas",'company':datoscompany})
    else:
        return render(request,'SunChoi/nopermitido.html')

def Factura_eliminar(request, item):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        factura = get_object_or_404(Factura, pk=item)    
        facturas = Factura.objects.all()
        if request.method=='POST':
            lineasfactura=Facturalineas.objects.filter(id_factura=item).count()
            for i in range(lineasfactura):
                Facturalineas.deleteFacturalineaUpdateStock(item)
            Factura.deleteFactura(item)          
            return redirect('SunChoi:facturas')
        return render(request,'SunChoi/facturas.html',{'object_list': facturas,'object':factura, 'eliminar': 'True','tipo_objeto':"facturas"})
    else:
        return render(request,'SunChoi/nopermitido.html')

#ordenes de compra
def RegistrarOrdenCompra(request):
    if request.user.is_authenticated:
        proveedores=Proveedores.objects.all()
        productos = Producto.objects.all() 
        fecha=str( datetime.datetime.now()) 
        if request.GET.get('nombreproveedor'):
            idusuario=Usuario.objects.filter(usuario=request.user)[0].dni
            idproveedor=Proveedores.objects.filter(razon_social=request.GET.get('nombreproveedor'))[0].id_proveedor
            fecha=str( datetime.datetime.now()) # por el momento registro con la fecha/hora del sistema       
            idordencompra=OrdenCompra.insertordencompra(request.GET.get('ordenN'),request.GET.get('fechaC'),idusuario,idproveedor,request.GET.get('valorTotal'))[0][0] 
            cantfl=request.GET.get('nLineas').split(':')
            for i in cantfl:
                idproducto=Producto.objects.filter(descripcion=request.GET.get('descripcion'+i))[0].id_producto
                Ordencompralineas.insertordenlineasUpdateStock(idordencompra,idproducto,request.GET.get('cantidad'+i),request.GET.get('iva'+i),request.GET.get('desc'+i),request.GET.get('pretot'+i))  
            #aqui actualizar total orden
            maxNfactura=OrdenCompra.objects.all().aggregate(Max('id_orden_compra'))['id_orden_compra__max']
            productos = Producto.objects.all()            
            return render(request,'SunChoi/registrarOrdencompra.html',{'mjsexitoso':"Se registro con exito la compra. Puede ingresar otra compra",'proveedores':proveedores,'productos':productos,'company':datoscompany,'fecha':fecha,'Ncompra':int(maxNfactura+1)})
        else:
            maxNfactura=OrdenCompra.objects.all().aggregate(Max('id_orden_compra'))['id_orden_compra__max']
            return render(request,'SunChoi/registrarOrdencompra.html', {'proveedores':proveedores,'productos':productos,'company':datoscompany,'fecha':fecha,'Ncompra':int(maxNfactura+1)})
    else:
        return render_to_response('SunChoi/nopermitido.html')

def Compras(request):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        ordencompras = OrdenCompra.objects.all()
        return render(request,'SunChoi/compras.html',{'object_list': ordencompras,'tipo_objeto':"compras"})
    else:
        return render_to_response('SunChoi/nopermitido.html')

def Ordencompra_ver(request,item):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        ordencompra = get_object_or_404(OrdenCompra,pk=item)
        ordenlineas=Ordencompralineas.objects.filter(id_orden_compra=item)
        return render(request, 'SunChoi/ver_ordencompra.html', {'ordencompra':ordencompra,'ollista':ordenlineas, 'tipo_objeto':"compras",'company':datoscompany})
    else:
        return render(request,'SunChoi/nopermitido.html')

#cotizaciones
def RegistrarCotizacion(request):
    if request.user.is_authenticated:
        clientes=Cliente.objects.all()
        fecha=str( datetime.datetime.now())
        if request.GET.get('nombrecliente'):
            idusuario=Usuario.objects.filter(usuario=request.user)[0].dni
            fecha_caducidad= str( date.today()+timedelta(days=int(dias_vencimiento_proforma)))   
            idProforma=Proforma.insertproforma(request.GET.get('cotF'),fecha_caducidad,request.GET.get('dnicliente'),idusuario,request.GET.get('valorTotal'))[0][0] 
            cantfl=request.GET.get('nLineas').split(':')
            for i in cantfl:
                idproducto=Producto.objects.filter(descripcion=request.GET.get('descripcion'+i))[0].id_producto
                ProformaLineas.insertProformaLineas(idProforma,idproducto,request.GET.get('cantidad'+i),request.GET.get('iva'+i),request.GET.get('desc'+i),request.GET.get('pretot'+i))  
            maxNorden=Proforma.objects.all().aggregate(Max('id_proforma'))['id_proforma__max']
            productos = Producto.objects.all()            
            return render(request,'SunChoi/registrarCotizaciones.html',{'mjsexitoso':"Se registró con exito la cotización. Puede ingresar otra cotización",'clientes':clientes,'productos':productos,'company':datoscompany,'fecha':fecha,'Ncot':int(maxNorden+1)})
        else:
            maxNorden=Proforma.objects.all().aggregate(Max('id_proforma'))['id_proforma__max']
            productos = Producto.objects.all()            
            return render(request,'SunChoi/registrarCotizaciones.html', {'clientes':clientes,'productos':productos,'company':datoscompany,'fecha':fecha,'Ncot':int(maxNorden+1)})
    else:
        return render_to_response('SunChoi/nopermitido.html')


def Ordencompra_eliminar(request, item):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        ordencompra = get_object_or_404(OrdenCompra, pk=item) 
        compras = OrdenCompra.objects.all()
        if request.method=='POST':
            lineasordencompra=OrdenCompra.objects.filter(id_orden_compra=item).count()
            for i in range(lineasordencompra):
               Ordencompralineas.deleteOrdenCompralineaUpdateStock(item)
            OrdenCompra.deleteOrdenCompra(item)          
            return redirect('SunChoi:compras')
        return render(request,'SunChoi/compras.html',{'object_list': compras,'object':ordencompra, 'eliminar': 'True','tipo_objeto':"compras"})
    else:
        return render(request,'SunChoi/nopermitido.html')

def Proformas(request):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        if request.method == 'POST': 
            global dias_vencimiento_proforma
            dias_vencimiento_proforma=int(request.POST['dias'])
            print(dias_vencimiento_proforma)
            proformas = Proforma.objects.all()
            return render(request,'SunChoi/proformas.html',{'object_list': proformas,'tipo_objeto':"proformas",'mjsexitoso':"Se actualizó con exito los dias de validez de una proforma."})
        elif request.GET.get('eliminar'):
            fecha_actual=str( datetime.datetime.now())
            p=Proforma.objects.filter(fecha_caducidad__lte=fecha_actual)
            p.delete()
            proformas = Proforma.objects.all()
            return render(request,'SunChoi/proformas.html',{'object_list': proformas,'tipo_objeto':"proformas",'mjsexitoso':"Se actualizó con exito las proformas validas."})
        proformas = Proforma.objects.all()
        return render(request,'SunChoi/proformas.html',{'object_list': proformas,'tipo_objeto':"proformas"})
    else:
        return render_to_response('SunChoi/nopermitido.html')

def Proforma_ver(request,item):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        proforma = get_object_or_404(Proforma,pk=item)
        proformalineas=ProformaLineas.objects.filter(id_proforma=item)
        return render(request, 'SunChoi/ver_proforma.html', {'proforma':proforma,'pllista':proformalineas, 'tipo_objeto':"proformas",'company':datoscompany})
    else:
        return render(request,'SunChoi/nopermitido.html')

#operaciones
def VentasXmes(request):
    if request.user.is_authenticated:
        if request.GET.get('ventasXmesIni') and request.GET.get('ventasXmesFin'):
            try:
                inicio = datetime.datetime.strptime(request.GET['ventasXmesIni'],"%Y-%m-%d")
                fin=datetime.datetime.strptime(request.GET['ventasXmesFin'],"%Y-%m-%d")
                if inicio <= fin:
                    results =Factura.objects.filter(fecha__gte=inicio,fecha__lte=fin)
                    total=Factura.objects.filter(fecha__gte=inicio,fecha__lte=fin).aggregate(Sum('total'))
                    return render(request,'SunChoi/ventasXmes.html',{'lista':results,'lista1':True,'total': total['total__sum']})
                else:
                    return render(request,'SunChoi/ventasXmes.html',{'error': 'error al ingresar el rango de valores'})
            except ValueError:
                return render(request,'SunChoi/ventasXmes.html',{'error': 'Por favor ingrese las fechas en el formato establecido'})
        else:
            return render(request,'SunChoi/ventasXmes.html')
    else:
        return render_to_response('SunChoi/nopermitido.html')

def Proveedor(request):
    if request.user.is_authenticated:
        proveedores = Proveedores.objects.all()
        return render(request,'SunChoi/proveedores.html',{'object_list': proveedores,'tipo_objeto':"proveedores"})
    else:
        return render(request,'SunChoi/nopermitido.html')

def Proveedor_editar(request, item):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        proveedor = get_object_or_404(Proveedores, pk=item)
        form = ProveedorForm(request.POST or None, instance=proveedor)
        if form.is_valid():
            form.save()
            return redirect('SunChoi:proveedores')
        return render(request, 'SunChoi/actualizar_form.html', {'form':form, 'tipo_objeto':"proveedores"})
    else:
        return render(request,'SunChoi/nopermitido.html')
        
#analisis
def Topclientes(request):
    if (request.user.is_authenticated and request.user.is_superuser and request.user.is_staff):
        # Factura.objects.filter()
        return render(request, 'SunChoi/actualizar_form.html', { 'tipo_objeto':"clientes"})
    else:
        return render(request,'SunChoi/nopermitido.html')
        
