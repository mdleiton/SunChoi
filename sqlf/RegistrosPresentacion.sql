-- Usuario
INSERT INTO SunChoi_usuario(dni,usuario_id,nombre,apellido,direccion,telefono,correo) values('09232613982',1,'mau','leiton','data de villamil' , '0989389265','mdleiton@espol.edu.ec');
-- INSERT INTO SunChoi_usuario(dni,usuario_id,nombre,apellido,direccion,telefono,correo) values('12345',2,'sun','Aguirre','data de guayaquil' , '223424','lu_la@espol.edu.ec');
-- INSERT INTO SunChoi_usuario(dni,usuario_id,nombre,apellido,direccion,telefono,correo) values('13537',3,'byr','povea','data de villamil' , '234567','bpovea@espol.edu.ec');
-- Roles
INSERT INTO SunChoi_roles(rol,descripcion) values('administrador','Maneja la app en su totalidad, tiene acceso a todas las funcionalidades implementadas en la app.');
INSERT INTO SunChoi_roles(rol,descripcion) values('empleado','Acceso limitado, ventas, cotizaciones y poco mas.');
-- UsuarioRol
INSERT INTO SunChoi_usuariorol(id_usuario_id,id_rol_id) values('13567',1);
-- INSERT INTO SunChoi_usuariorol(id_usuario_id,id_rol_id) values('12345',2);
-- INSERT INTO SunChoi_usuariorol(id_usuario_id,id_rol_id) values('13537',1);
-- PROVEEDORES
INSERT INTO SunChoi_proveedores(razon_social,direccion,telefono,email) VALUES('COMSUCRE S.A.','JUAN PIO MONTUFAR 109 Y AGUIRRE','2516315','ventas@comsucre.com');
INSERT INTO SunChoi_proveedores(razon_social,direccion,telefono,email) VALUES('Dilipa CIA LTDA','Av. 10 de Agosto N52-15 y Cap. Ramon Borja','2418640','información@dilipa.com.ec');
-- cliente
INSERT INTO SunChoi_cliente(dni,nombre,apellidos,direccion,telefono) VALUES('0912564437','Jose','Gomez Rosales','Samanes 6 Mz 199 Vll 12','2398123');
INSERT INTO SunChoi_cliente(dni,nombre,apellidos,direccion,telefono) VALUES('0917628304','Rosa','Barrios Cardozo','Samanes 6 Mz 198 Vll 14','2948573');
INSERT INTO SunChoi_cliente(dni,nombre,apellidos,direccion,telefono) VALUES('0921234567','Julio','Vargas Mendoza','Samanes 6 Mz 200 Vlla 6','2691060');
INSERT INTO SunChoi_cliente(dni,nombre,apellidos,direccion,telefono) VALUES('0922387657','Carlos','Moran Alvarado','Samanes 6 Mz 200 Vlla 10','2432167');
INSERT INTO SunChoi_cliente(dni,nombre,apellidos,direccion,telefono) VALUES('0917628305','Ana Maria','Iturbe Rodriguez','Samanes 6 Mz 198 Vll 34','2948561');
INSERT INTO SunChoi_cliente(dni,nombre,apellidos,direccion,telefono) VALUES('0921234568','Carlos','Venegas Flores','Samanes 6 Mz 200 Vlla 26','2691005');
INSERT INTO SunChoi_cliente(dni,nombre,apellidos,direccion,telefono) VALUES('0912564438','Dario','Delgado Villavicencio','Samanes 6 Mz 199 Vll 32','2398122');
INSERT INTO SunChoi_cliente(dni,nombre,apellidos,direccion,telefono) VALUES('0917628306','Isabel','Flores Sanchez','Samanes 6 Mz 198 Vll 24','2948577');
INSERT INTO SunChoi_cliente(dni,nombre,apellidos,direccion,telefono) VALUES('0921234569','Pamela','Mendoza Arceles','Samanes 6 Mz 200 Vlla 36','2691066');

-- <-- nuevos -->
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('ESCARCHA GOMA','ESCARCHA GOMA ROJA',1.5,'UND',16,2,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('ESCARCHA GOMA','ESCARCHA GOMA AZUL',1.5,'UND',16,2,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('ESCARCHA GOMA','ESCARCHA GOMA NEGRO',1.5,'UND',8,2,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('TEMPERA','TEMPERA BAKAN 12 COLORES',3.4,'C12',7,2,3.45);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('AUDIFONOS','AUDIFONOS BLUETOOTH',17,'UND',5,2,18);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('AGENDA','AGENDA REX',10,'UND',5,2,11);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('AGENDA','AGENDA GAMA',7,'UND',10,2,7.5);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('ACUARELA','ACUARELA PELIKAN 12 COLORES',2,'UND',7,1,2.1);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('ACUARELA','ACUARELA LANCER 12 COLORES',2.5,'UND',5,1,2.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('BOLIGRAFO','BOLIGRAFO BIC CRISTAL NEGRO',0.3,'UND',90,1,0.35);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('BOLIGRAFO','BOLIGRAFO BIC CRISTAL AZUL',0.3,'UND',27,1,0.35);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('BOLIGRAFO','BOLIGRAFO BIC CRISTAL ROJO',0.3,'UND',59,1,0.35);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('BOLIGRAFO','BOLIGRAFO BIC FINO NEGRO',0.4,'UND',17,1,0.45);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('BOLIGRAFO','BOLIGRAFO BIC FINO AZUL',0.4,'UND',19,1,0.45);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('BOLIGRAFO','BOLIGRAFO BIC FINO ROJO',0.4,'UND',8,1,0.45);

-- factura1
INSERT INTO SunChoi_factura(numero,fecha,id_usuario_id,id_cliente_id,total) VALUES(2097,NOW(),'0923261383','0912564437',6.944);
INSERT INTO SunChoi_facturalineas(id_factura_id,id_producto_id,cantidad,iva,descuento,total_factura_linea) VALUES((select max(id_factura) from SunChoi_factura),2,1,0.1,0.0,1.736);
INSERT INTO SunChoi_facturalineas(id_factura_id,id_producto_id,cantidad,iva,descuento,total_factura_linea) VALUES((select max(id_factura) from SunChoi_factura),7,3,0.558,0.0,5.208);

-- factura2
INSERT INTO SunChoi_factura(numero,fecha,id_usuario_id,id_cliente_id,total) VALUES(2097,SUBDATE('2017-07-12 11:03:00', 1),'0923261383','0921234569',8.68);
INSERT INTO SunChoi_facturalineas(id_factura_id,id_producto_id,cantidad,iva,descuento,total_factura_linea) VALUES((select max(id_factura) from SunChoi_factura),4,3,0.558,0.0,5.208);
INSERT INTO SunChoi_facturalineas(id_factura_id,id_producto_id,cantidad,iva,descuento,total_factura_linea) VALUES((select max(id_factura) from SunChoi_factura),3,2,0.372,0.0,3.472);
