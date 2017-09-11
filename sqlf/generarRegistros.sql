-- Usuario
INSERT INTO SunChoi_usuario(dni,usuario_id,nombre,apellido,direccion,telefono,correo) values('13567',1,'mau','leiton','data de villamil' , '234567','mau_leiton@espol.edu.ec');
-- INSERT INTO SunChoi_usuario(dni,usuario_id,nombre,apellido,direccion,telefono,correo) values('12345',2,'sun','Aguirre','data de guayaquil' , '223424','lu_la@espol.edu.ec');
-- INSERT INTO SunChoi_usuario(dni,usuario_id,nombre,apellido,direccion,telefono,correo) values('13537',3,'byr','povea','data de villamil' , '234567','bpovea@espol.edu.ec');
-- Roles
INSERT INTO SunChoi_roles(rol,descripcion) values('administrador','Maneja la app en su totalidad, tiene acceso a todas las funcionalidades implementadas en la app.');
INSERT INTO SunChoi_roles(rol,descripcion) values('empleado','Acceso limitado, ventas, cotizaciones y poco mas.');
-- UsuarioRol
INSERT INTO SunChoi_usuariorol(id_usuario_id,id_rol_id) values('13567',1);
-- INSERT INTO SunChoi_usuariorol(id_usuario_id,id_rol_id) values('12345',2);
-- INSERT INTO SunChoi_usuariorol(id_usuario_id,id_rol_id) values('13537',1);
-- PROVEEDORES
INSERT INTO SunChoi_proveedores(razon_social,direccion,telefono,email) VALUES('COMSUCRE S.A.','JUAN PIO MONTUFAR 109 Y AGUIRRE','2516315','ventas@comsucre.com');
INSERT INTO SunChoi_proveedores(razon_social,direccion,telefono,email) VALUES('Dilipa CIA LTDA','Av. 10 de Agosto N52-15 y Cap. Ramon Borja','2418640','información@dilipa.com.ec');
-- cliente
INSERT INTO SunChoi_cliente(dni,nombre,apellidos,direccion,telefono) VALUES('0912564437','Jose','Gomez Rosales','Samanes 6 Mz 199 Vll 12','2398123');
INSERT INTO SunChoi_cliente(dni,nombre,apellidos,direccion,telefono) VALUES('0917628304','Rosa','Barrios Cardozo','Samanes 6 Mz 198 Vll 14','2948573');
INSERT INTO SunChoi_cliente(dni,nombre,apellidos,direccion,telefono) VALUES('0921234567','Julio','Vargas Mendoza','Samanes 6 Mz 200 Vlla 6','2691060');
INSERT INTO SunChoi_cliente(dni,nombre,apellidos,direccion,telefono) VALUES('0922387657','Carlos','Moran Alvarado','Samanes 6 Mz 200 Vlla 10','2432167');
-- productos
-- <-- nuevos -->
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('ESCARCHA GOMA','ESCARCHA GOMA ROJA',1.5,'UND',16,2,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('ESCARCHA GOMA','ESCARCHA GOMA AZUL',1.5,'UND',16,2,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('ESCARCHA GOMA','ESCARCHA GOMA NEGRO',1.5,'UND',8,2,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('TEMPERA','TEMPERA BAKAN 12 COLORES',3.4,'C12',7,2,3.45);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('AUDIFONOS','AUDIFONOS BLUETOOTH',17,'UND',5,2,18);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('AGENDA','AGENDA REX',10,'UND',5,2,11);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('AGENDA','AGENDA GAMA',7,'UND',10,2,7.5);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('ACUARELA','ACUARELA PELIKAN 12 COLORES',2,'UND',7,1,2.1);
-- <-- viejos -->
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('ACUARELA','ACUARELA LANCER 12 COLORES',2.5,'UND',5,1,2.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('BOLIGRAFO','BOLIGRAFO BIC CRISTAL NEGRO',0.3,'UND',90,1,1.5);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('BOLIGRAFO','BOLIGRAFO BIC CRISTAL AZUL',0.3,'UND',27,1,1.5);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('BOLIGRAFO','BOLIGRAFO BIC CRISTAL ROJO',0.3,'UND',59,1,1.5);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('BOLIGRAFO','BOLIGRAFO BIC FINO NEGRO',0.4,'UND',17,1,1.5);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('BOLIGRAFO','BOLIGRAFO BIC FINO AZUL',0.4,'UND',19,1,1.5);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('BOLIGRAFO','BOLIGRAFO BIC FINO ROJO',0.4,'UND',8,1,1.5);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('LAPIZ','LAPIZ BIC HB EVOLUTION',0.35,'UND',35,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('LAPIZ','LAPIZ BIC 12 COLORES CORTO',1.75,'C12',17,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('GOMA EN BARRA','GOMA EN BARRA BIC 8 GRAMOS',1,'UND',11,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('LAPICES DE COLORES','LAPIZ 12 COLORES EVOLUTION ',2.75,'C12',16,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('BOLIGRAFO','BOLIGRAFO PELIKAN AZUL',0.4,'UND',10,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('BOLIGRAFO','BOLIGRAFO PELIKAN ROJO',0.4,'UND',15,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('BOLIGRAFO','BOLIGRAFO PELIKAN NEGRO',0.4,'UND',18,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('BORRADOR','BORRADOR PELIKAN PZ20',0.2,'UND',53,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('CARPETA','CARPETA OFICIO TRANSP. AMARILLA',0.75,'UND',9,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('CARPETA','CARPETA OFICIO TRANSP. NARANJA',0.75,'UND',8,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('CARPETA','CARPETA OFICIO TRANSP. ROSADA',0.75,'UND',9,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('CARPETA','CARPETA OFICIO TRANSP. NEGRA',0.75,'UND',10,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('COMPAS','COMPAS LANCER PRECIS. 13 CMS',1.25,'UND',5,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('GOMA LIQUIDA','GOMA BIOPLAST OFFICE 260 GR',1.25,'UND',12,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('GOMA LIQUIDA','GOMA BIOPLAST SCHOOL 140 GR',0.75,'UND',2,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('GOMA LIQUIDA','GOMA BIOPLAST SCHOOL 50 GR',0.4,'UND',2,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('GOMA','GOMA PELIKAN BARRA PELIFIX 20 GR',1,'UND',12,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('LAPICES DE COLORES','LAPIZ NORMA 12 COLOR',4.25,'C12',12,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('LAPIZ','LAPIZ PELIKAN ESCRITURA 2HB AMARILLO',0.35,'C12',8,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('LAPICES DE COLORES','LAPIZ PELIKAN 12 COLORES',2.5,'C12',12,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('LAPICES DE COLORES','LAPIZ CARIOCA 12 COLORES GRANDE',2,'C12',9,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('LAPICES DE COLORES','LAPIZ CAROCA 12 COLORES PEQUENO',1.25,'C12',12,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('FOAMY ESCARCHADO','FOAMY ESCARCH. 65X90CM X 2MM CARNE',0.5,'PLG',9,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('FOAMY ESCARCHADO','FOAMY ESCARCH. 65X90CM X 2MM AMARILLO',0.5,'PLG',3,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('FOAMY ESCARCHADO','FOAMY ESCARCH. 65X90CM X 2MM AZUL',0.5,'PLG',5,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('FOAMY ESCARCHADO','FOAMY ESCARCH. 65X90CM X 2MM AZUL CLARO',0.5,'PLG',7,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('FOAMY ESCARCHADO','FOAMY ESCARCH. 65X90CM X 2MM TURQUESA',0.5,'PLG',8,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('FOAMY ESCARCHADO','FOAMY ESCARCH. 65X90CM X 2MM ROJO',0.5,'PLG',9,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('FOAMY ESCARCHADO','FOAMY ESCARCH. 65X90CM X 2MM VERDE',0.5,'PLG',7,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('FOAMY ESCARCHADO','FOAMY ESCARCH. 65X90CM X 2MM GRIS',0.5,'PLG',8,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('FOAMY ESCARCHADO','FOAMY ESCARCH. 65X90CM X 2MM NARANJA',0.5,'PLG',11,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('FOAMY ESCARCHADO','FOAMY ESCARCH. 65X90CM X 2MM NEGRO',0.5,'PLG',10,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('SILICON','LIQUIDO SILICON LANCER 100 ML',1.5,'UND',10,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('SILICON','LIQUIDO SILICON LANCER 250 ML',1,'UND',13,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('SILICON','LIQUIDO SILICON LANCER 30 ML',0.8,'UND',2,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('SILICON','LIQUIDO SILICON LANCER 60 ML',0.5,'UND',9,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('MARCADOR PERM','MARCAD. PELIKAN PERM AZUL',0.75,'UND',10,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('MARCADOR PERM','MARCAD. PELIKAN PERM ROJO',0.75,'UND',13,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('MARCADOR PERM','MARCAD. PELIKAN PERM NEGRO',0.75,'UND',0,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('MARCADOR PERM','MARCAD. PELIKAN PERM VERDE',0.75,'UND',2,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('MARCADOR SECO','MARCAD. PELIKAN SECO AZUL',0.75,'UND',14,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('MARCADOR SECO','MARCAD. PELIKAN SECO ROJO',0.75,'UND',22,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('MARCADOR SECO','MARCAD. PELIKAN SECO NEGRO',0.75,'UND',13,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('MARCADOR SECO','MARCAD. PELIKAN SECO VERDE',0.75,'UND',1,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('MARCADORES','MARCAD. COL CARIOCA',1.4,'C6',4,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('FOAMY','FOAMY 65X90CM X 2MM NEGRO',0.25,'PLG',18,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('FOAMY','FOAMY 65X90CM X 2MM VERDE',0.25,'PLG',18,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('FOAMY','FOAMY 65X90CM X 2MM AZUL',0.25,'PLG',28,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('FOAMY','FOAMY 65X90CM X 2MM MORADO',0.25,'PLG',13,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('FOAMY','FOAMY 65X90CM X 2MM GRIS',0.25,'PLG',13,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('FOAMY','FOAMY 65X90CM X 2MM ROJO',0.25,'PLG',14,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('FOAMY','FOAMY 65X90CM X 2MM BLANCO',0.25,'PLG',7,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('FOAMY','FOAMY 65X90CM X 2MM ANARANJADO',0.25,'PLG',10,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('FOAMY','FOAMY 65X90CM X 2MM VARIOS',0.25,'PLG',12,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('CUADERNO','CUADERNO UNIVERSITARIO 100 HOJAS CUADROS',1.5,'UND',18,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('CUADERNO','CUADERNO UNIVERSITARIO 100 HOJAS 2 LINEAS',1.5,'UND',13,1,1.55);
INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id,precio_ventas) VALUES('CUADERNO','CUADERNO UNIVERSITARIO 100 HOJAS 1 LINEA',1.5,'UND',1,1,1.55);


