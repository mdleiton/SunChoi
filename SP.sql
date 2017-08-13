DELIMITER $$

CREATE PROCEDURE bajostock(minimo int  )   
BEGIN  
    SELECT nombre,descripcion,stock   
    FROM SunChoi_producto  
    WHERE stock<=minimo ;
END $$
DELIMITER ;