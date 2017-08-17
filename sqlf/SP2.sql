
DELIMITER $$

#Muestra los productos cuyo stock es menor o igual a minimo
DROP PROCEDURE IF EXIST bajostock;

CREATE PROCEDURE bajostock(minimo int  )   
BEGIN  
    SELECT *
    FROM SunChoi_producto  
    WHERE stock<=minimo ;
END $$;

DELIMITER $$

#Muestra las ventas entre las fechas ini y fin
DROP PROCEDURE IF EXISTS ventasXmes;
CREATE PROCEDURE ventasXmes(ini DateTime, fin DateTime)
BEGIN  
	SELECT f.fecha, p.descripcion, sum(fl.total_factura_linea) AS subtotal
	FROM SunChoi_factura f, SunChoi_facturaLineas fl, SunChoi_producto p
	WHERE f.id_factura = fl.id_factura 
	AND fl.id_producto = p.id_producto
	AND f.fecha BETWEEN ini AND fin
	GROUP BY f.fecha, p.descripcion
	ORDER BY f.fecha;	 
END $$;



DELIMITER $$
#Muestra el cliente que mas compro desde una fecha determinada
DROP PROCEDURE IF EXISTS clientesXmes;
CREATE PROCEDURE clientesXmes(ini DateTime)
BEGIN  
	SELECT c. dni, c.nombre+" "+c.apellidos as fullname, sum(fl.total_factura_linea) AS subtotal
	FROM SunChoi_factura f, SunChoi_facturaLineas fl, SunChoi_cliente c
	WHERE f.id_factura = fl.id_factura 
	AND c.id_cliente = f.id_cliente
	AND f.fecha BETWEEN ini AND NOW()
	GROUP BY c. dni, c.nombre+" "+c.apellidos
	ORDER BY subtotal;	 

END $$;


DELIMITER $$
#Insertar factura y obtener el id de esta
DROP PROCEDURE IF EXISTS insertarFactura;
CREATE PROCEDURE insertarFactura(ini DateTime)
BEGIN
#get latest id_factura number
	select @id_factura := max(f.id_factura) 
	from SunChoi_factura f;

	set @id_factura = @id_factura  + 1;
 
#get latest numero number
	select @numero := max(f.numero) 
	from SunChoi_factura f;
	set @numero = @numero  + 1;


#inserta un factura
	insert into SunChoi_factura(id_factura,
                   numero,
                   estado,
                   fecha,
                   id_cliente,
                   id_usuario)
	values(@id_factura,
	   @numero,
       NEW.estado, 
       NEW.id_cliente,
       NEW.id_usuario);

	select * from SunChoi_factura where id_factura=@id_factura
END $$;




#transaccion????????????????????????????????????????????????????????

#start a new transaction
#start transaction;
 
# insert 2 order line items
# insert into orderdetails(orderNumber,
#                         productCode,
#-- -                      quantityOrdered,
#      --                 -  priceEach,
#        --                 orderLineNumber)
#--values(@orderNumber,'S18_1749', 30, '136', 1),
#--      (@orderNumber,'S18_2248', 50, '55.09', 2); 
#-- commit changes    
#--commit;       
 
#-- get the new inserted order
#--select * from orders a 
#--inner join orderdetails b on a.ordernumber = b.ordernumber
#--where a.ordernumber = @ordernumber;
#--?????????????????????????????????????????????????????????????????

DELIMITER $$;
#--Proteccion contra drop
GO
DROP TRIGGER IF EXISTS try_DropAlterTable;
create trigger try_DropAlterTable
on database
for DROP_TABLE

	RAISERROR('NO ESTA PERMITIDO BORRAR TABLAS',1,1)
	ROLLBACK
GO

GO
DROP TRIGGER [IF EXISTS] proveedorNombreUnico;
create trigger proveedorNombreUnico BEFORE INSERT
on SunChoi_proveedor
AS
	if @@ROWCOUNT = 0
	return

	declare @cName nvarchar(200)
	set @cName = NEW.razon_social
    if @cName ANY (select distinct razon_social
					from SunChoi_proveedor)
    print 'Ya existe un cliente con ese nombre'
    rollback;
GO

GO
DROP TRIGGER IF EXISTS productoDescripcionUnica;
create trigger productoDescripcionUnica BEFORE INSERT
on SunChoi_producto
AS
	if @@ROWCOUNT = 0
	return

	declare @cDescrip nvarchar(200)
	set @cDescrip = NEW.descripcion
    if @cDescrip ANY (select distinct descripcion
					from SunChoi_producto)
    print 'Ya existe un cliente con ese nombre'
    rollback;
GO

GO
DROP TRIGGER IF EXISTS clienteDniUnica;
create trigger clienteDniUnica BEFORE INSERT
on SunChoi_cliente
AS
	if @@ROWCOUNT = 0
	return

	declare @cDni nvarchar(10)
	set @cDni = NEW.dni
    if @cDni ANY (select distinct dni
					from SunChoi_cliente)
    print 'Ya existe un cliente con ese nombre'
    rollback;
GO


DELIMITER;