-- ORDENES DE COMPRA
-- INSERT INTO SunChoi_ordencompra(numero,id_usuario_id,id_proveedor_id,total) VALUES('201708001','13567',1,37.52);
-- detalles
--	INSERT INTO SunChoi_ordencompralineas(id_orden_compra,id_producto,cantidad,total_orden_compra_linea,iva,descuento)VALUES(1,2,20,6.7,0.72,0);
--	INSERT INTO SunChoi_ordencompralineas(id_orden_compra,id_producto,cantidad,total_orden_compra_linea,iva,descuento)VALUES(1,4,20,6.7,0.72,0);
--	INSERT INTO SunChoi_ordencompralineas(id_orden_compra,id_producto,cantidad,total_orden_compra_linea,iva,descuento)VALUES(1,8,40,15.7,1.68,0);
--	INSERT INTO SunChoi_ordencompralineas(id_orden_compra,id_producto,cantidad,total_orden_compra_linea,iva,descuento)VALUES(1,16,10,8.4,0.9,0);

-- No me funco por la fecha, pero creo que es algo en mi maquina, probe de todo, no funco

#Muestra las ventas entre las fechas ini y fin
DROP PROCEDURE IF EXISTS log;
delimiter #
CREATE PROCEDURE log()
proc_main: BEGIN

END proc_main #
delimiter ;