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