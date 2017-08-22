-- --------------------------------------P--R--O--V--E--E--D--O--R----------------------------------------
-- Inserta un nuevo proveedor
DROP PROCEDURE IF EXISTS insertproveedores;
delimiter #
CREATE PROCEDURE insertproveedores(razon_social nvarchar(200),direccion nvarchar(200),telefono nvarchar(200),email nvarchar(200))   
proc_main: BEGIN  
    INSERT INTO SunChoi_proveedores(razon_social,direccion,telefono,email) VALUES(razon_social,direccion,telefono,email);
END proc_main #
delimiter ;

-- Por si acaso un procedimiento que te da todo el registro, segun el nombre(razon_social) ingresado
DROP PROCEDURE IF EXISTS getidproveedor;
delimiter #
CREATE PROCEDURE getidproveedor(name nvarchar(200))   
proc_main: BEGIN  
	select *
	from SunChoi_proveedores
    where razon_social=name;
END proc_main #
delimiter ;

-- ---------------------------------------P--R--O--D--U--C--T--O-------------------------------------------
-- Insertar Producto,
DROP PROCEDURE IF EXISTS insertproducto;
delimiter #
CREATE PROCEDURE insertproducto(nombre nvarchar(200),descripcion nvarchar(200),precio_unitario float,medida nvarchar(200),stock integer(10),id_proveedor int)   
proc_main: BEGIN  
    INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id) VALUES(nombre,descripcion,precio_unitario,medida,stock,id_proveedor);
END proc_main #
delimiter ;

-- Muestra los productos cuyo stock es menor o igual a minimo
DROP PROCEDURE IF EXISTS bajostock;
delimiter #
CREATE PROCEDURE bajostock(minimo int)   
proc_main: BEGIN  
    SELECT *
    FROM SunChoi_producto  
    WHERE stock<=minimo;
END proc_main #
delimiter ;

-- -----------------------------------------C--L--I--E--N--T--E-------------------------------------------
-- Inserta un nuevo cliente
DROP PROCEDURE IF EXISTS insertcliente;
delimiter #
CREATE PROCEDURE insertcliente(dni nvarchar(13),nombre nvarchar(100),apellidos nvarchar(100),direccion nvarchar(200),telefono nvarchar(100))   
proc_main: BEGIN  
    INSERT INTO SunChoi_cliente VALUES(dni,nombre,apellidos,direccion,telefono);
END proc_main #
delimiter ;

-- -----------------------------------------U--S--U--A--R--I--O-------------------------------------------
-- Insertar nuevo usuario
DROP PROCEDURE IF EXISTS insertusuario;
delimiter #
CREATE PROCEDURE insertusuario(dni nvarchar(13),usuario_id int,nombre nvarchar(200),apellido nvarchar(200),direccion nvarchar(200),telefono nvarchar(200),correo nvarchar(200))
proc_main: BEGIN  
	INSERT INTO SunChoi_usuario (dni,usuario_id,nombre,apellido,direccion,telefono,correo) VALUES(dni,usuario_id,nombre,apellido,direccion,telefono,correo);
END proc_main #
delimiter ;

-- -----------------------------------------U--S--U--A--R--I--O--/--R--O--L-------------------------------
-- Insertar nuevo usuariorol
DROP PROCEDURE IF EXISTS insertusuariorol;
delimiter #
CREATE PROCEDURE insertusuariorol(id_usuario nvarchar(13) ,id_rol int )  
proc_main: BEGIN  
	INSERT INTO SunChoi_usuariorol(id_usuario_id,id_rol_id) VALUES(id_usuario,id_rol);
END proc_main #
delimiter ;

-- -------------------------------------------C--O--M--P--R--A---------------------------------------------
-- Insertar nueva orden de compra
DROP PROCEDURE IF EXISTS insertordencompra;
delimiter #
CREATE PROCEDURE insertordencompra(numero int,fecha dateTime,id_usuario int,id_proveedor int)
proc_main: BEGIN  
	INSERT INTO SunChoi_ordencompra(numero,fecha,id_usuario_id,id_proveedor_id)  VALUES(numero,fecha,id_usuario,id_proveedor);
	select max(o.id_orden_compra) from SunChoi_ordencompra o;
END proc_main #
delimiter ;

-- -------------------------------------------C--O--M--P--R--A--/--L--I--N--E--A---------------------------

-- -----------------------------------------F--A--C--T--U--R--A---------------------------------------------
-- Insertar nueva factura
DROP PROCEDURE IF EXISTS insertfactura;
delimiter #
CREATE PROCEDURE insertfactura(numero int,fecha dateTime, id_cliente nvarchar(13),id_usuario nvarchar(13))
proc_main: BEGIN  
	INSERT INTO SunChoi_factura(numero,fecha,id_cliente_id,id_usuario_id) VALUES(numero,fecha,id_cliente,id_usuario);
	select max(f.id_factura) from SunChoi_factura f;
END proc_main #
delimiter ;

-- -----------------------------------------F--A--C--T--U--R--A--/--L--I--N--E--A--------------------------
-- Insertar nueva orden de factura detalle y Actualiza el stock
DROP PROCEDURE IF EXISTS insertfacturalineasUpdateStock;
delimiter #
CREATE PROCEDURE insertfacturalineasUpdateStock(id_factura int,id_productos int ,cantidad int ,total_factura_linea float)
proc_main: BEGIN
	declare facturaid int;    	
    declare productostock int;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
	END;
	
	START TRANSACTION;
	    select p.stock into productostock
	    from SunChoi_producto p
	    where p.id_producto=id_productos;

    	set productostock = productostock - cantidad;

		select max(f.id_factura) into facturaid
		from SunChoi_factura f;

		INSERT INTO SunChoi_facturalineas(id_factura_id,id_producto_id,cantidad,total_factura_linea) VALUES(id_factura,id_productos,cantidad,total_factura_linea);
		UPDATE SunChoi_producto set stock = productostock where id_producto = id_productos;
	COMMIT;
END proc_main #
delimiter ;

-- Insertar nueva orden de COMPRA detalle y Actualiza el stock
DROP PROCEDURE IF EXISTS insertordenlineasUpdateStock;
delimiter #
CREATE PROCEDURE insertordenlineasUpdateStock(id_orden int,id_productos int ,cantidad int ,total_orden_compra_linea float)
proc_main: BEGIN
	declare ordenid int;    	
    declare productostock int;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
	END;
	
	START TRANSACTION;
	    select p.stock into productostock
	    from SunChoi_producto p
	    where p.id_producto=id_productos;

    	set productostock = productostock + cantidad;

		select max(o.id_orden_compra) into ordenid
		from SunChoi_ordencompra o;

		INSERT INTO SunChoi_ordencompralineas(id_orden_compra_id,id_producto_id,cantidad,total_orden_compra_linea) VALUES(id_orden,id_productos,cantidad,total_orden_compra_linea);
		UPDATE SunChoi_producto set stock = productostock where id_producto = id_productos;
	COMMIT;
END proc_main #
delimiter ;