-- --------------------------------------P--R--O--V--E--E--D--O--R----------------------------------------
-- Inserta un nuevo proveedor
DROP PROCEDURE IF EXISTS insertproveedores;
delimiter #
CREATE PROCEDURE insertproveedores(razon_social nvarchar(200),direccion nvarchar(200),telefono nvarchar(200),email nvarchar(200))   
proc_main: BEGIN  
    INSERT INTO SunChoi_proveedores(razon_social,direccion,telefono,email) VALUES(razon_social,direccion,telefono,email);
END proc_main #
delimiter ;

-- Por si acaso un procedimiento que te da el id, segun el nombre(razon_social) ingresado
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
CREATE PROCEDURE insertusuario(dni nvarchar(13),usuario nvarchar(200),nombre nvarchar(200),apellido nvarchar(200),direccion nvarchar(200),telefono nvarchar(200),correo nvarchar(254))
proc_main: BEGIN  
	INSERT INTO SunChoi_usuario VALUES(dni,usuario,nombre,apellido,direccion,telefono,correo);
END proc_main #
delimiter ;

-- -----------------------------------------U--S--U--A--R--I--O--/--R--O--L-------------------------------
-- Insertar nuevo usuariorol
DROP PROCEDURE IF EXISTS insertusuariorol;
delimiter #
CREATE PROCEDURE insertusuariorol(id_usuario int ,id_rol int )  
proc_main: BEGIN  
	INSERT INTO SunChoi_usuarioRol VALUES(id_usuario,id_rol);
END proc_main #
delimiter ;

-- -------------------------------------------C--O--M--P--R--A---------------------------------------------
-- Insertar nueva orden de compra
DROP PROCEDURE IF EXISTS insertordencompra;
delimiter #
CREATE PROCEDURE insertordencompra(fecha dateTime,id_usuario int,id_proveedor int,estado varchar(200))
proc_main: BEGIN  
	declare gnumero int;
	select max(oc.numero) into gnumero
	from SunChoi_ordenCompra oc;
	set gnumero = gnumero+1;

	INSERT INTO SunChoi_ordenCompra VALUES(gnumero,fecha,id_usuario,id_proveedor,estado);
END proc_main #
delimiter ;

-- -------------------------------------------C--O--M--P--R--A--/--L--I--N--E--A---------------------------
-- Insertar nueva orden de compra detalle
DROP PROCEDURE IF EXISTS insertordencompralineas;
delimiter #
CREATE PROCEDURE insertordencompralineas(id_producto int ,cantidad int ,total_orden_compra_linea decimal(2,2))
proc_main: BEGIN  
	declare ordenid int;
	select max(oc.id_orden_compra) into ordenid
	from SunChoi_ordenCompra oc;

	INSERT INTO SunChoi_ordenCompralineas VALUES(ordenid,id_producto,cantidad,total_orden_compra_linea);
END proc_main #
delimiter ;

-- -----------------------------------------F--A--C--T--U--R--A---------------------------------------------
-- Insertar nueva factura
DROP PROCEDURE IF EXISTS insertfactura;
delimiter #
CREATE PROCEDURE insertfactura(fecha dateTime,id_cliente int,id_usuario int)
proc_main: BEGIN  
	declare gnumero int;
	select max(f.numero) into gnumero
	from SunChoi_factura f;
	set gnumero = gnumero+1;

	INSERT INTO SunChoi_factura VALUES(gnumero,fecha,id_cliente,id_usuario);
END proc_main #
delimiter ;

-- -----------------------------------------F--A--C--T--U--R--A--/--L--I--N--E--A--------------------------
-- Insertar nueva orden de factura detalle y Actualiza el stock
DROP PROCEDURE IF EXISTS insertfacturalineasUpdateStock;
delimiter #
CREATE PROCEDURE insertfacturalineasUpdateStock(id_producto int ,cantidad int ,total_factura_linea decimal(2,2))
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
	    where p.id_producto=id_producto;

    	set productostock = productostock - cantidad;

		select max(f.id_factura) into facturaid
		from SunChoi_factura f;

		INSERT INTO SunChoi_ordenFacturalineas VALUES(facturaid,id_producto,cantidad,total_factura_linea);
		UPDATE SunChoi_producto set stock = productostock where id_producto = id_producto;
	COMMIT;
END proc_main #
delimiter ;