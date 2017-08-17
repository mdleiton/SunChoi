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