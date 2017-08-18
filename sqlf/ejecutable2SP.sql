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

DROP TRIGGER IF EXISTS clienteDniUnica;
delimiter #
create trigger clienteDniUnica BEFORE INSERT on SunChoi_cliente
FOR EACH ROW
main:begin 
    if (NEW.dni =ANY (select distinct dni from SunChoi_cliente)) THEN
 		SIGNAL sqlstate '23000' SET MESSAGE_TEXT = 'Ya existe un cliente con ese nombre';
   	end if;
end main #
delimiter ;


DROP PROCEDURE IF EXISTS insertcliente;
delimiter #
CREATE PROCEDURE insertcliente(dni int,nombre nvarchar(100),apellidos nvarchar(100),direccion nvarchar(200),telefono nvarchar(100))   
proc_main: BEGIN  
    INSERT INTO SunChoi_cliente VALUES(dni,nombre,apellidos,direccion,telefono);
END proc_main #
delimiter ;