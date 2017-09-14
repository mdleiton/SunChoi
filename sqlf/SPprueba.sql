-- facturas
INSERT INTO SunChoi_factura(numero,fecha,id_usuario_id,id_cliente_id,total) VALUES(2097,NOW(),'0923261383','0912564437',2.1);
-- detalles de facturas 
INSERT INTO SunChoi_facturalineas(id_factura_id,id_producto_id,cantidad,iva,descuento,total_factura_linea) VALUES((select max(id_factura) from SunChoi_factura),2,2,0.12,0.0,2.1);

-- facturas
INSERT INTO SunChoi_factura(numero,fecha,id_usuario_id,id_cliente_id,total) VALUES(2097,SUBDATE('2017-08-12 11:03:00', 1),'0923261383','0912564437',2.1);
-- detalles de facturas 
INSERT INTO SunChoi_facturalineas(id_factura_id,id_producto_id,cantidad,iva,descuento,total_factura_linea) VALUES((select max(id_factura) from SunChoi_factura),2,2,0.12,0.0,2.1);

-- detalles
--	INSERT INTO SunChoi_ordencompralineas(id_orden_compra,id_producto,cantidad,total_orden_compra_linea,iva,descuento)VALUES(1,4,20,6.7,0.72,0);
--	INSERT INTO SunChoi_ordencompralineas(id_orden_compra,id_producto,cantidad,total_orden_compra_linea,iva,descuento)VALUES(1,8,40,15.7,1.68,0);
--	INSERT INTO SunChoi_ordencompralineas(id_orden_compra,id_producto,cantidad,total_orden_compra_linea,iva,descuento)VALUES(1,16,10,8.4,0.9,0);

-- No me funco por la fecha, pero creo que es algo en mi maquina, probe de todo, no funco

DROP PROCEDURE IF EXISTS log;
delimiter #
CREATE PROCEDURE log()
proc_main: BEGIN

END proc_main #
delimiter ;

