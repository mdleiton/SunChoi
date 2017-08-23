from __future__ import unicode_literals
from django.contrib.auth.models import User
from django.db import models,connection
from django.utils import timezone

class Proveedores(models.Model):
	id_proveedor = models.AutoField(primary_key=True)
	razon_social = models.CharField(max_length=200)
	direccion = models.CharField(max_length=200)
	telefono = models.CharField(max_length=100)
	email = models.EmailField(max_length=200, null=True)

	def __str__(self):
		return self.razon_social
	#llamada a procedimiento almacenado
	@staticmethod  
	def insertproveedores(razon_social,direccion,telefono,email):  
		cur = connection.cursor()  
		cur.callproc('insertproveedores', [razon_social,direccion,telefono,email])  
		cur.close()
	
	@staticmethod  
	def getidproveedor(razon_social):  
		cur = connection.cursor()  
		cur.callproc('getidproveedor', [razon_social])  
		results = cur.fetchall() 
		cur.close()
		print(results)
		return results 
	
	def setId_proveedor(self,id_proveedor):
		self.id_proveedor=id_proveedor
	def setRazon_social(self,razon_social):
		self.razon_social=razon_social
	def setDireccion(self,direccion):
		self.direccion=direccion
	def setTelefono(self,telefono):
		self.telefono=telefono
	def setEmail(self,nombre):
		self.email=email
	def getId_proveedor(self):
		return self.id_proveedor
	def getRazon_social(self):
		return self.razon_social
	def getDireccion(self):
		return self.direccion
	def getTelefono(self):
		return self.telefono
	def getEmail(self):
		return self.email

class Producto(models.Model):
	id_producto = models.AutoField(primary_key=True)
	nombre = models.CharField(max_length=200)
	descripcion = models.CharField(max_length=200)
	precio_unitario = models.FloatField()
	medida = models.CharField(max_length=200)
	stock = models.IntegerField()
	proveedor=models.ForeignKey('Proveedores')
	
	def __str__(self):
		return self.nombre

	#llamada a procedimiento almacenado
	@staticmethod  
	def bajostock(minimo):  
		cur = connection.cursor()  
		cur.callproc('bajostock', [minimo,])  
		results = cur.fetchall() 
		cur.close()
		return [Producto (*row) for row in results]  
	#llamada a procedimiento almacenado
	@staticmethod  
	def insertproducto(nombre,descripcion,precio_unitario,medida,stock,proveedor):  
		cur = connection.cursor()  
		cur.callproc('insertproducto', [nombre,descripcion,precio_unitario,medida,stock,proveedor])  
		cur.close()

	def setId_producto(self,idProducto):
		self.id_producto=idProducto

	def setNombre(self,nombre):
		self.nombre=nombre

	def setDescripcion(self,descripcion):
		self.descripcion=descripcion

	def setPrecio_unitario(self,precioUnitario):
		self.precio_unitario=precioUnitario

	def setUnidad(self,unidad):
		self.medida=medida

	def setStock(self,stock):
		self.stock=stock

	def getId_producto(self):
		return self.id_producto

	def getNombre(self):
		return self.nombre

	def getDescripcion(self):
		return self.descripcion
	
	def getPrecio_Unitario(self):
		return self.precio_unitario

	def getUnidad(self):
		return self.unidad

	def getStock(self):
		return self.stock

class Cliente(models.Model):
	dni = models.CharField(primary_key=True,max_length=13)
	nombre = models.CharField(max_length=100)
	apellidos = models.CharField(max_length=100)
	direccion = models.CharField(max_length=200)
	telefono = models.CharField(max_length=100)

	#llamada a procedimiento almacenado
	@staticmethod  
	def insertcliente(dni,nombre,apellidos,direccion,telefono):  
		cur = connection.cursor()  
		cur.callproc('insertcliente', [dni,nombre,apellidos,direccion,telefono])  
		cur.close()

	def __str__(self):
		return self.nombre

	def getNombre(self):
		return self.nombre
	def setNombre(self,nombre):
		self.nombre=nombre
	def getDni(self):
		return self.dni
	def setDni(self,dni):
		self.dni=dni
	def getApellidos(self):
		return self.apellidos
	def setApellidos(self,apellidos):
		self.apellidos=apellidos
	def getDireccion(self):
		return self.direccion
	def setDireccion(self,direccion):
		self.direccion=direccion
	def getTelefono(self):
		return self.telefono
	def setTelefono(self,telefono):
		self.telefono=telefono
	
class OrdenCompra(models.Model):
	id_orden_compra = models.AutoField(primary_key=True)
	numero = models.IntegerField()
	fecha = models.DateTimeField(default=timezone.now)
	id_usuario = models.ForeignKey('Usuario')
	id_proveedor = models.ForeignKey('Proveedores')
	#estado = models.CharField(max_length=200)
	total= models.FloatField()

	def __str__(self): 
		return 'Orden Compra: {}:{}:{}'.format(self.id_orden_compra, self.id_usuario.nombre,self.id_proveedor.razon_social)
	
	@staticmethod  
	def insertordencompra(numero,fecha,id_usuario,id_proveedor,total):  
		cur = connection.cursor()  
		cur.callproc('insertordencompra', [numero,fecha,id_usuario,id_proveedor,total])  
		results = cur.fetchall() 
		cur.close()
		return results

	def getId_orden_compra(self):
		return self.id_orden_compra
	def setId_orden_compra(self,id_orden_compra):
		self.id_orden_compra=id_orden_compra
	def getNumero(self):
		return self.numero
	def setNumero(self,numero):
		self.numero=numero
	def getFecha(self):
		return self.fecha
	def setFecha(self,fecha):
		self.fecha=fecha
	def getId_usuario(self):
		return self.id_usuario
	def setId_usuario(self,id_usuario):
		self.id_usuario=id_usuario
	def getId_proveedor(self):
		return self.id_proveedor
	def setId_proveedor(self,id_proveedor):
		self.id_proveedor=id_proveedor

class Ordencompralineas(models.Model):
	id_orden_compra_linea = models.AutoField(primary_key=True)
	id_orden_compra = models.ForeignKey('Ordencompra')
	id_producto = models.ForeignKey('Producto')
	cantidad = models.IntegerField()
	total_orden_compra_linea = models.FloatField()
	iva=models.FloatField()
	descuento=models.FloatField()
	#llamada a procedimiento almacenado
	@staticmethod  
	def insertordenlineasUpdateStock(id_orden_compra,id_producto,cantidad,iva,descuento,total_orden_compra_linea):  
		cur = connection.cursor()  
		cur.callproc('insertordenlineasUpdateStock', [id_orden_compra,id_producto,cantidad,iva,descuento,total_orden_compra_linea])  
		cur.close()

	def __str__(self): 
		return 'Orden Compra linea: {}:{}:{}'.format(self.id_producto.nombre,self.cantidad, self.total_orden_compra_linea)
	
	def setId_orden_compra_linea(self,idOrdenCompraLinea):
		self.id_orden_compra_linea=idOrdenCompraLinea

	def setId_orden_compra(self,idOrdenCompra):
		self.id_orden_compra=idOrdenCompra

	def setId_producto(self,idProducto):
		self.id_producto=idProducto

	def setCantidad(self,cantidad):
		self.cantidad=cantidad

	def setTotal_orden_compra_linea(self,totalOrdenCompraLinea):
		self.total_orden_compra_linea=totalOrdenCompraLinea

	def getId_orden_compra_linea(self):
		return self.id_orden_compra_linea

	def getId_orden_compra(self):
		return self.id_orden_compra

	def getId_producto(self):
		return self.id_producto 
	
	def getCantidad(self):
		return self.cantidad

	def getTotal_orden_compra_linea(self):
		return self.total_orden_compra_linea

class ProformaLineas(models.Model):
	id_proforma_linea = models.AutoField(primary_key=True)	
	id_proforma = models.ForeignKey('Proforma')
	id_producto = models.ForeignKey('Producto')
	cantidad = models.FloatField()
	unidad = models.CharField(max_length=200)
	total_proforma_linea = models.FloatField()

	@staticmethod  
	def insertProformaLineas(id_proforma,id_producto,cantidad,unidad,total_proforma_linea):  
		cur = connection.cursor()  
		cur.callproc('insertProformaLineas', [id_proforma,id_producto,cantidad,unidad,total_proforma_linea])  
		cur.close()

	def __str__(self):
		return 'Proforma linea: {}:{}:{}'.format(self.id_producto.descripcion, self.cantidad, self.total_proforma_linea)

	def getId_proforma_linea(self):
		return self.id_proforma_linea
	def setId_proforma_linea(self,id_proforma_linea):
		self.id_proforma_linea=id_proforma_linea
	def getId_proforma(self):
		return self.id_proforma
	def setId_proforma(self,id_proforma):
		self.id_proforma_linea=id_proforma
	def getId_producto(self):
		return self.id_producto
	def setId_producto(self,id_producto):
		self.id_producto = id_producto
	def getCantidad(self):
		return self.cantidad
	def setCantidad(self,cantidad):
		self.cantidad = cantidad
	def getUnidad(self):
		return self.unidad
	def setUnidad(self,unidad):
		self.unidad = unidad
	def getTotal_proforma_linea(self):
		return self.total_proforma_linea
	def setTotal_proforma_linea(self,total_proforma_linea):
		self.total_proforma_linea=total_proforma_linea
	
class Proforma(models.Model):
	id_proforma = models.AutoField(primary_key=True)
	id_cliente = models.ForeignKey('Cliente')
	id_usuario = models.ForeignKey('Usuario')
	fecha_emision = models.DateTimeField(default=timezone.now)
	fecha_caducidad = models.DateTimeField()
	total_proforma = models.FloatField()
	
	def __str__(self):
		return 'Proforma: {}:{}:{}'.format(self.id_proforma, self.id_cliente.nombre, self.id_usuario.nombre)

	@staticmethod  
	def insertproforma(fecha_emision,fecha_caducidad,id_cliente,id_usuario,total_proforma):  
		cur = connection.cursor()  
		cur.callproc('insertproforma', [fecha_emision,fecha_caducidad,id_cliente,id_usuario,total_proforma])  
		results = cur.fetchall() 
		cur.close()
		return results


	def getId_proforma(self):
		return self.id_proforma
	def setId_proforma(self,id_proforma):
		self.id_proforma=id_proforma
	def getId_cliente(self):
		return self.id_cliente
	def setId_cliente(self,id_cliente):
		self.id_cliente=id_cliente
	def getId_usuario(self):
		return self.id_usuario
	def setId_usuario(self,id_usuario):
		self.id_usuario=id_usuario
	def getFecha_emision(self):
		return self.fecha_emision
	def setFecha_emision(self,fecha_emision):
		self.fecha_emision=fecha_emision
	def getFecha_caducidad(self):
		return self.fecha_caducidad
	def setFecha_caducidad(self,fecha_caducidad):
		self.fecha_caducidad=fecha_caducidad

class Usuariorol(models.Model):
	id_usuario_rol=models.AutoField(primary_key=True)
	id_usuario=models.ForeignKey('Usuario')
	id_rol=models.ForeignKey('Roles')

	def __str__(self):
		return 'UsuarioRol: {}:{}'.format(self.id_rol.rol, self.id_usuario.usuario)

	#llamada a procedimiento almacenado
	@staticmethod  
	def insertusuariorol(id_usuario,id_rol):  
		cur = connection.cursor()  
		cur.callproc('insertusuariorol', [id_usuario,id_rol])  
		cur.close()

	def setId_usuario_rol(self,id_usuario_rol):
		self.id_usuario_rol=id_usuario_rol

	def setId_usuario(self,id_usuario):
		self.id_usuario=id_usuario

	def setId_rol(self,id_rol):
		self.id_rol=id_rol

	def getId_usuario_rol(self):
		return self.id_usuario_rol

	def getId_usuario(self):
		return self.id_usuario

	def getId_rol(self):
		return self.id_rol

class Roles(models.Model):
	id_rol=models.AutoField(primary_key=True)
	rol=models.CharField(max_length=200)
	descripcion=models.CharField(max_length=200)
	
	def __str__(self):
		return self.rol

	def setId_rol(self, id_rol):
		self.id_rol=id_rol

	def setRol(self, rol):
		self.rol=rol

	def setDescripcion(self, descripcion):
		self.descripcion=descripcion

	def getId_rol(self):
		return self.id_rol

	def getRol(self):
		return self.rol

	def getDescripcion(self):
		return self.descripcion

class Solicitudesdiferido(models.Model):
	id_solicitud_diferido=models.AutoField(primary_key=True)
	id_factura=models.ForeignKey('Factura')
	id_usuario_solicitante=models.ForeignKey('Cliente')
	fecha=models.DateTimeField(default=timezone.now)
	estado=models.CharField(max_length=200)
	id_usuario_aprobacion=models.ForeignKey('Usuario')
	
	def __str__(self):
		return id_solicitud_diferido

	#llamada a procedimiento almacenado
	@staticmethod  
	def insertsolicitudesdiferido(id_factura,id_usuario_solicitante,fecha,estado,id_usuario_aprobacion):  
		cur = connection.cursor()  
		cur.callproc('insertsolicitudesdiferido', [id_factura,id_usuario_solicitante,fecha,estado,id_usuario_aprobacion])  
		cur.close()

	def setId_solicitud_diferido(self,id_solicitud_diferido):
		self.id_solicitud_diferido=id_solicitud_diferido

	def setId_factura(self,id_factura):
		self.id_factura=id_factura

	def setId_usuario_solicitante(self,id_usuario_solicitante):
		self.id_usuario_solicitante=id_usuario_solicitante

	def setFecha(self,fecha):
		self.fecha=id_fecha

	def setEstado(self,estado):
		self.estado=estado

	def setId_usuario_aprobacion(self,id_usuario_aprobacion):
		self.id_usuario_aprobacion=id_usuario_aprobacion

	def getId_solicitud_diferido(self):
		return self.id_solicitud_diferido

	def getId_factura(self):
		return self.id_factura

	def getId_usuario_solicitante(self):
		return self.id_usuario_solicitante

	def getFecha(self):
		return self.fecha

	def getEstado(self):
		return self.estado

	def getId_usuario_aprobacion(self):
		return self.id_usuario_aprobacion

class Comprobantepago(models.Model):
	id_comprobante_pago=models.AutoField(primary_key=True)
	fecha=models.DateTimeField(default=timezone.now)
	id_factura=models.ForeignKey('Factura')
	valor_adeudado=models.FloatField()
	valor_pagado=models.FloatField()
	saldo_pendiente=models.FloatField()

	def __str__(self):
		return self.id_comprobante_pago

	#llamada a procedimiento almacenado
	@staticmethod  
	def insertcomprobantepago(fecha,id_factura,valor_adeudado,valor_pagado,saldo_pendiente):  
		cur = connection.cursor()  
		cur.callproc('insertcomprobantepago', [fecha,id_factura,valor_adeudado,valor_pagado,saldo_pendiente])  
		cur.close()

	def setId_comprobante_pago(self, idComprobantePago):
		self.idComprobantePago=idComprobantePago

	def setFecha(self, fecha):
		self.fecha=fecha

	def setId_factura(self, idFactura):
		self.id_factura=idFactura

	def setValor_adeudado(self,valorAdeudado):
		self.valor_adeudado=valorAdeudado

	def setValor_Pagado(self,valorPagado):
		self.valor_pagado=valorPagado

	def setSaldo_Pendiente(slf,saldoPendiente):
		self.saldo_pendiente=saldoPendiente

	def getId_comprobante_pago(self):
		return self.id_comprobante_pago

	def getFecha(self):
		return self.fecha

	def getId_factura(self):
		return self.id_factura

	def getValor_adeudado(self):
		return self.valor_adeudado

	def getValor_pagado(self):
		return self.setValor_Pagado

	def getSaldo_pendiente(self):
		return self.saldo_pendiente

class Usuario(models.Model):
	dni=models.CharField(primary_key=True,max_length=13)
	usuario = models.OneToOneField(User)
	nombre=models.CharField(max_length=200)
	apellido=models.CharField(max_length=200)
	direccion=models.CharField(max_length=200)
	telefono=models.CharField(max_length=200)
	correo=models.EmailField()

	#llamada a procedimiento almacenado
	@staticmethod  
	def insertusuario(dni,usuario,nombre,apellido,direccion,telefono,correo):  
		cur = connection.cursor()  
		cur.callproc('insertusuario', [dni,usuario,nombre,apellido,direccion,telefono,correo])  
		cur.close()

	def __str__(self): 
		return self.usuario.username

	def setDni(self, idUsuario):
		self.dni=idUsuario

	def setNombre(self,nombre):
		self.nombre=nombre

	def setApellido(self,apellido):
		self.apellido=apellido

	def setDireccion(self,direccion):
		self.direccion=direccion

	def setTelefono(self,telefono):
		self.telefono=telefono

	def getDni(self):
		return self.dni

	def getNombre(self):
		return self.nombre

	def getApellido(self):
		return self.apellido

	def getDireccion(self):
		return self.direccion
		
	def getTelefono(self):
		return self.telefono

class Factura(models.Model):
	id_factura=models.AutoField(primary_key=True)
	numero=models.IntegerField()
	#estado=models.CharField(max_length=200)
	fecha=models.DateTimeField(default=timezone.now)
	id_cliente=models.ForeignKey('Cliente')
	id_usuario=models.ForeignKey('Usuario')
	total = models.FloatField()

	#llamada a procedimiento almacenado
	@staticmethod  
	def insertfactura(numero, fecha, id_cliente, id_usuario, total):  
		cur = connection.cursor()  
		cur.callproc('insertfactura', [numero, fecha, id_cliente, id_usuario, total])  
		results = cur.fetchall() 
		cur.close()
		return results

	def __str__(self): 
		return 'Factura: {}:{}:{}'.format(self.id_factura, self.id_usuario.usuario,self.id_cliente.nombre,self.total)

	def setId_factura(self,idFactura):
		self.id_factura=idFactura

	def setNumero(self,numero):
		self.numero=numero

	def setFecha(self,fecha):
		self.fecha=fecha

	def setId_cliente(self,idCliente):
		self.id_cliente=idCliente

	def setId_usuario(self,idUsuario):
		self.id_usuario=idUsuario

	def setTotal(self,total):
		self.total=total

	def getId_factura(self):
		return self.id_factura

	def getNumero(self):
		return self.numero

	def getFecha(self):
		return self.fecha

	def getId_cliente(self):
		return self.id_cliente

	def getId_usuario(self):
		return self.id_usuario

	def getTotal(self):
		return self.total

class Facturalineas(models.Model):
	id_factura_linea = models.AutoField(primary_key=True)
	id_factura = models.ForeignKey('Factura')
	id_producto = models.ForeignKey('Producto')
	cantidad = models.IntegerField()
	total_factura_linea = models.FloatField()
	iva=models.FloatField()
	descuento=models.FloatField()
	#llamada a procedimiento almacenado
	@staticmethod  
	def insertfacturalineasUpdateStock(id_factura,id_producto,cantidad ,iva,descuento,total_factura_linea):  
		cur = connection.cursor()  
		cur.callproc('insertfacturalineasUpdateStock', [id_factura,id_producto,cantidad,iva,descuento,total_factura_linea])  
		cur.close()

	def __str__(self): 
		return 'Factura linea: {}:{}:{}'.format(self.id_producto.nombre, self.cantidad,self.total_factura_linea)

	def setId_factura_linea(self,idFacturaLinea):
		self.id_factura_linea=idFacturaLinea

	def setId_factura(self,idFactura):
		self.id_factura=idFactura 

	def setId_producto(self,idProducto):
		self.id_producto=idProducto

	def setCantidad(self,cantidad):
		self.cantidad = cantidad

	def setTotal_factura_linea(self,totalFacturaLinea):
		self.total_factura_linea = totalFacturaLinea

	def getId_factura_linea(self):
		return self.id_factura_linea 

	def getId_factura(self):
		return self.id_factura

	def getId_producto(self):
		return self.id_producto 
	
	def getCantidad(self):
		return self.cantidad

	def getTotal_factura_linea(self):
		return self.total_factura_linea

