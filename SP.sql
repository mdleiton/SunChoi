DELIMITER $$
DROP PROCEDURE IF EXISTS bajostock;

CREATE PROCEDURE bajostock(minimo int  )   
BEGIN  
    SELECT *
    FROM SunChoi_producto  
    WHERE stock<=minimo ;
END $$
DELIMITER ;