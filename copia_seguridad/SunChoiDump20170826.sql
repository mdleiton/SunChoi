-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: SunChoi
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `SunChoi`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `SunChoi` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `SunChoi`;

--
-- Table structure for table `SunChoi_cliente`
--

DROP TABLE IF EXISTS `SunChoi_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SunChoi_cliente` (
  `dni` varchar(13) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SunChoi_cliente`
--

LOCK TABLES `SunChoi_cliente` WRITE;
/*!40000 ALTER TABLE `SunChoi_cliente` DISABLE KEYS */;
INSERT INTO `SunChoi_cliente` VALUES ('0912564437','Jose','Gomez Rosales','Samanes 6 Mz 199 Vll 12','2398123'),('0917628304','Rosa','Barrios Cardozo','Samanes 6 Mz 198 Vll 14','2948573'),('0921234567','Julio','Vargas Mendoza','Samanes 6 Mz 200 Vlla 6','2691060'),('0987654321','Francisco','Torres','La Florida','0913854876'),('1234567800','Guillermo','Torres','La cartonera','3850105'),('12345678290','Diego','Torres','la Floresta Quito','0997160345'),('1726873437','jhon','Sanchez Barzola','guasmo centra','0997167283');
/*!40000 ALTER TABLE `SunChoi_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SunChoi_comprobantepago`
--

DROP TABLE IF EXISTS `SunChoi_comprobantepago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SunChoi_comprobantepago` (
  `id_comprobante_pago` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime(6) NOT NULL,
  `valor_adeudado` double NOT NULL,
  `valor_pagado` double NOT NULL,
  `saldo_pendiente` double NOT NULL,
  `id_factura_id` int(11) NOT NULL,
  PRIMARY KEY (`id_comprobante_pago`),
  KEY `SunChoi_comprobantepago_34737114` (`id_factura_id`),
  CONSTRAINT `SunChoi_com_id_factura_id_3f2e0e86_fk_SunChoi_factura_id_factura` FOREIGN KEY (`id_factura_id`) REFERENCES `SunChoi_factura` (`id_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SunChoi_comprobantepago`
--

LOCK TABLES `SunChoi_comprobantepago` WRITE;
/*!40000 ALTER TABLE `SunChoi_comprobantepago` DISABLE KEYS */;
/*!40000 ALTER TABLE `SunChoi_comprobantepago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SunChoi_factura`
--

DROP TABLE IF EXISTS `SunChoi_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SunChoi_factura` (
  `id_factura` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `total` double NOT NULL,
  `id_cliente_id` varchar(13) NOT NULL,
  `id_usuario_id` varchar(13) NOT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `SunChoi_factura_id_cliente_id_f33b646c_fk_SunChoi_cliente_dni` (`id_cliente_id`),
  KEY `SunChoi_factura_76a74f43` (`id_usuario_id`),
  CONSTRAINT `SunChoi_factura_id_cliente_id_f33b646c_fk_SunChoi_cliente_dni` FOREIGN KEY (`id_cliente_id`) REFERENCES `SunChoi_cliente` (`dni`),
  CONSTRAINT `SunChoi_factura_id_usuario_id_91f085cc_fk_SunChoi_usuario_dni` FOREIGN KEY (`id_usuario_id`) REFERENCES `SunChoi_usuario` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SunChoi_factura`
--

LOCK TABLES `SunChoi_factura` WRITE;
/*!40000 ALTER TABLE `SunChoi_factura` DISABLE KEYS */;
INSERT INTO `SunChoi_factura` VALUES (1,123456789,'2017-08-24 11:18:40.000000',15.119999885559082,'0912564437','13537'),(2,34567890,'2017-08-24 11:27:09.000000',18.200000762939453,'0921234567','13537'),(3,276572,'2017-08-24 13:10:49.000000',4.5920000076293945,'0987654321','13537'),(4,98765434,'2017-08-24 13:12:45.000000',7,'1726873437','13537'),(5,345678,'2017-08-24 13:13:20.000000',2.799999952316284,'0987654321','13537'),(6,567898,'2017-08-24 13:13:45.000000',4.199999809265137,'1234567800','13537'),(7,45234,'2017-08-24 13:14:08.000000',42,'1234567800','13537'),(8,2345678,'2017-08-24 13:27:45.000000',18.760000228881836,'0987654321','1726873431');
/*!40000 ALTER TABLE `SunChoi_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SunChoi_facturalineas`
--

DROP TABLE IF EXISTS `SunChoi_facturalineas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SunChoi_facturalineas` (
  `id_factura_linea` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `total_factura_linea` double NOT NULL,
  `iva` double NOT NULL,
  `descuento` double NOT NULL,
  `id_factura_id` int(11) NOT NULL,
  `id_producto_id` int(11) NOT NULL,
  PRIMARY KEY (`id_factura_linea`),
  KEY `SunChoi_fac_id_factura_id_e746f4a7_fk_SunChoi_factura_id_factura` (`id_factura_id`),
  KEY `SunChoi_facturalineas_ebd2e856` (`id_producto_id`),
  CONSTRAINT `SunChoi__id_producto_id_166e5667_fk_SunChoi_producto_id_producto` FOREIGN KEY (`id_producto_id`) REFERENCES `SunChoi_producto` (`id_producto`),
  CONSTRAINT `SunChoi_fac_id_factura_id_e746f4a7_fk_SunChoi_factura_id_factura` FOREIGN KEY (`id_factura_id`) REFERENCES `SunChoi_factura` (`id_factura`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SunChoi_facturalineas`
--

LOCK TABLES `SunChoi_facturalineas` WRITE;
/*!40000 ALTER TABLE `SunChoi_facturalineas` DISABLE KEYS */;
INSERT INTO `SunChoi_facturalineas` VALUES (1,1,1.6799999475479126,0.18000000715255737,0,1,64),(2,40,13.4399995803833,1.440000057220459,0,1,4),(3,6,1.6799999475479126,0.18000000715255737,0,3,61),(4,4,1.1200000047683716,0.11999999731779099,0,3,57),(5,2,1.7920000553131104,0.19200000166893005,0,3,42),(6,10,2.799999952316284,0.30000001192092896,0,4,56),(7,5,4.199999809265137,0.44999998807907104,0,4,50),(8,10,2.5,0,0,5,54),(9,5,4.199999809265137,0.44999998807907104,0,6,50),(10,56,42,0,0,7,50),(11,67,18.760000228881836,2.009999990463257,0,8,55);
/*!40000 ALTER TABLE `SunChoi_facturalineas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SunChoi_ordencompra`
--

DROP TABLE IF EXISTS `SunChoi_ordencompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SunChoi_ordencompra` (
  `id_orden_compra` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `total` double NOT NULL,
  `id_proveedor_id` int(11) NOT NULL,
  `id_usuario_id` varchar(13) NOT NULL,
  PRIMARY KEY (`id_orden_compra`),
  KEY `SunChoi_ordencompra_ca253e0c` (`id_proveedor_id`),
  KEY `SunChoi_ordencompra_76a74f43` (`id_usuario_id`),
  CONSTRAINT `SunChoi_ordencompr_id_usuario_id_360c4085_fk_SunChoi_usuario_dni` FOREIGN KEY (`id_usuario_id`) REFERENCES `SunChoi_usuario` (`dni`),
  CONSTRAINT `Sun_id_proveedor_id_ba48abc2_fk_SunChoi_proveedores_id_proveedor` FOREIGN KEY (`id_proveedor_id`) REFERENCES `SunChoi_proveedores` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SunChoi_ordencompra`
--

LOCK TABLES `SunChoi_ordencompra` WRITE;
/*!40000 ALTER TABLE `SunChoi_ordencompra` DISABLE KEYS */;
INSERT INTO `SunChoi_ordencompra` VALUES (1,345674567,'2017-08-24 11:30:10.000000',18.479999542236328,1,'13537'),(2,556789909,'2017-08-24 13:02:02.000000',30.799999237060547,15,'13537'),(3,3456788,'2017-08-24 13:02:42.000000',113.4000015258789,16,'13537');
/*!40000 ALTER TABLE `SunChoi_ordencompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SunChoi_ordencompralineas`
--

DROP TABLE IF EXISTS `SunChoi_ordencompralineas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SunChoi_ordencompralineas` (
  `id_orden_compra_linea` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `total_orden_compra_linea` double NOT NULL,
  `iva` double NOT NULL,
  `descuento` double NOT NULL,
  `id_orden_compra_id` int(11) NOT NULL,
  `id_producto_id` int(11) NOT NULL,
  PRIMARY KEY (`id_orden_compra_linea`),
  KEY `D186ec3ade7d7ae9f79b3428239f1a35` (`id_orden_compra_id`),
  KEY `SunChoi_ordencompralineas_ebd2e856` (`id_producto_id`),
  CONSTRAINT `D186ec3ade7d7ae9f79b3428239f1a35` FOREIGN KEY (`id_orden_compra_id`) REFERENCES `SunChoi_ordencompra` (`id_orden_compra`),
  CONSTRAINT `SunChoi__id_producto_id_f0a0aef1_fk_SunChoi_producto_id_producto` FOREIGN KEY (`id_producto_id`) REFERENCES `SunChoi_producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SunChoi_ordencompralineas`
--

LOCK TABLES `SunChoi_ordencompralineas` WRITE;
/*!40000 ALTER TABLE `SunChoi_ordencompralineas` DISABLE KEYS */;
INSERT INTO `SunChoi_ordencompralineas` VALUES (1,20,5.599999904632568,1,0,1,60),(2,46,12.880000114440918,1,0,1,55),(3,50,14,2,0,2,61),(4,20,16.799999237060547,2,0,2,48),(5,45,37.79999923706055,4,0,3,49),(6,90,75.5999984741211,8,0,3,50);
/*!40000 ALTER TABLE `SunChoi_ordencompralineas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SunChoi_producto`
--

DROP TABLE IF EXISTS `SunChoi_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SunChoi_producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `precio_unitario` double NOT NULL,
  `medida` varchar(200) NOT NULL,
  `stock` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `SunChoi_producto_7ac33b97` (`proveedor_id`),
  CONSTRAINT `SunCho_proveedor_id_180ec173_fk_SunChoi_proveedores_id_proveedor` FOREIGN KEY (`proveedor_id`) REFERENCES `SunChoi_proveedores` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SunChoi_producto`
--

LOCK TABLES `SunChoi_producto` WRITE;
/*!40000 ALTER TABLE `SunChoi_producto` DISABLE KEYS */;
INSERT INTO `SunChoi_producto` VALUES (1,'ACUARELA','ACUARELA LANCER 12 COLORES',2.5,'UND',5,1),(2,'BOLIGRAFO','BOLIGRAFO BIC CRISTAL NEGRO',0.3,'UND',90,1),(3,'BOLIGRAFO','BOLIGRAFO BIC CRISTAL AZUL',0.3,'UND',27,1),(4,'BOLIGRAFO','BOLIGRAFO BIC CRISTAL ROJO',0.3,'UND',19,1),(5,'BOLIGRAFO','BOLIGRAFO BIC FINO NEGRO',0.4,'UND',17,1),(6,'BOLIGRAFO','BOLIGRAFO BIC FINO AZUL',0.4,'UND',19,1),(7,'BOLIGRAFO','BOLIGRAFO BIC FINO ROJO',0.4,'UND',8,1),(8,'LAPIZ','LAPIZ BIC HB EVOLUTION',0.35,'UND',35,1),(9,'LAPIZ','LAPIZ BIC 12 COLORES CORTO',1.75,'C12',17,1),(10,'GOMA EN BARRA','GOMA EN BARRA BIC 8 GRAMOS',1,'UND',11,1),(11,'LAPICES DE COLORES','LAPIZ 12 COLORES EVOLUTION ',2.75,'C12',16,1),(12,'BOLIGRAFO','BOLIGRAFO PELIKAN AZUL',0.4,'UND',10,1),(13,'BOLIGRAFO','BOLIGRAFO PELIKAN ROJO',0.4,'UND',15,1),(14,'BOLIGRAFO','BOLIGRAFO PELIKAN NEGRO',0.4,'UND',18,1),(15,'BORRADOR','BORRADOR PELIKAN PZ20',0.2,'UND',53,1),(16,'CARPETA','CARPETA OFICIO TRANSP. AMARILLA',0.75,'UND',9,1),(17,'CARPETA','CARPETA OFICIO TRANSP. NARANJA',0.75,'UND',8,1),(18,'CARPETA','CARPETA OFICIO TRANSP. ROSADA',0.75,'UND',9,1),(19,'CARPETA','CARPETA OFICIO TRANSP. NEGRA',0.75,'UND',10,1),(20,'COMPAS','COMPAS LANCER PRECIS. 13 CMS',1.25,'UND',5,1),(21,'GOMA LIQUIDA','GOMA BIOPLAST OFFICE 260 GR',1.25,'UND',12,1),(22,'GOMA LIQUIDA','GOMA BIOPLAST SCHOOL 140 GR',0.75,'UND',2,1),(23,'GOMA LIQUIDA','GOMA BIOPLAST SCHOOL 50 GR',0.4,'UND',2,1),(24,'GOMA','GOMA PELIKAN BARRA PELIFIX 20 GR',1,'UND',12,1),(25,'LAPICES DE COLORES','LAPIZ NORMA 12 COLOR',4.25,'C12',12,1),(26,'LAPIZ','LAPIZ PELIKAN ESCRITURA 2HB AMARILLO',0.35,'C12',8,1),(27,'LAPICES DE COLORES','LAPIZ PELIKAN 12 COLORES',2.5,'C12',12,1),(28,'LAPICES DE COLORES','LAPIZ CARIOCA 12 COLORES GRANDE',2,'C12',9,1),(29,'LAPICES DE COLORES','LAPIZ CAROCA 12 COLORES PEQUENO',1.25,'C12',12,1),(30,'FOAMY ESCARCHADO','FOAMY ESCARCH. 65X90CM X 2MM CARNE',0.5,'PLG',9,1),(31,'FOAMY ESCARCHADO','FOAMY ESCARCH. 65X90CM X 2MM AMARILLO',0.5,'PLG',3,1),(32,'FOAMY ESCARCHADO','FOAMY ESCARCH. 65X90CM X 2MM AZUL',0.5,'PLG',5,1),(33,'FOAMY ESCARCHADO','FOAMY ESCARCH. 65X90CM X 2MM AZUL CLARO',0.5,'PLG',7,1),(34,'FOAMY ESCARCHADO','FOAMY ESCARCH. 65X90CM X 2MM TURQUESA',0.5,'PLG',8,1),(35,'FOAMY ESCARCHADO','FOAMY ESCARCH. 65X90CM X 2MM ROJO',0.5,'PLG',9,1),(36,'FOAMY ESCARCHADO','FOAMY ESCARCH. 65X90CM X 2MM VERDE',0.5,'PLG',7,1),(37,'FOAMY ESCARCHADO','FOAMY ESCARCH. 65X90CM X 2MM GRIS',0.5,'PLG',8,1),(38,'FOAMY ESCARCHADO','FOAMY ESCARCH. 65X90CM X 2MM NARANJA',0.5,'PLG',11,1),(39,'FOAMY ESCARCHADO','FOAMY ESCARCH. 65X90CM X 2MM NEGRO',0.5,'PLG',10,1),(40,'SILICON','LIQUIDO SILICON LANCER 100 ML',1.5,'UND',10,1),(41,'SILICON','LIQUIDO SILICON LANCER 250 ML',1,'UND',13,1),(42,'SILICON','LIQUIDO SILICON LANCER 30 ML',0.8,'UND',0,1),(43,'SILICON','LIQUIDO SILICON LANCER 60 ML',0.5,'UND',9,1),(44,'MARCADOR PERM','MARCAD. PELIKAN PERM AZUL',0.75,'UND',10,1),(45,'MARCADOR PERM','MARCAD. PELIKAN PERM ROJO',0.75,'UND',13,1),(46,'MARCADOR PERM','MARCAD. PELIKAN PERM NEGRO',0.75,'UND',0,1),(47,'MARCADOR PERM','MARCAD. PELIKAN PERM VERDE',0.75,'UND',2,1),(48,'MARCADOR SECO','MARCAD. PELIKAN SECO AZUL',0.75,'UND',34,1),(49,'MARCADOR SECO','MARCAD. PELIKAN SECO ROJO',0.75,'UND',67,1),(50,'MARCADOR SECO','MARCAD. PELIKAN SECO NEGRO',0.75,'UND',37,1),(51,'MARCADOR SECO','MARCAD. PELIKAN SECO VERDE',0.75,'UND',1,1),(52,'MARCADORES','MARCAD. COL CARIOCA',1.4,'C6',4,1),(53,'FOAMY','FOAMY 65X90CM X 2MM NEGRO',0.25,'PLG',18,1),(54,'FOAMY','FOAMY 65X90CM X 2MM VERDE',0.25,'PLG',8,1),(55,'FOAMY','FOAMY 65X90CM X 2MM AZUL',0.25,'PLG',7,1),(56,'FOAMY','FOAMY 65X90CM X 2MM MORADO',0.25,'PLG',3,1),(57,'FOAMY','FOAMY 65X90CM X 2MM GRIS',0.25,'PLG',9,1),(58,'FOAMY','FOAMY 65X90CM X 2MM ROJO',0.25,'PLG',14,1),(59,'FOAMY','FOAMY 65X90CM X 2MM BLANCO',0.25,'PLG',7,1),(60,'FOAMY','FOAMY 65X90CM X 2MM ANARANJADO',0.25,'PLG',30,1),(61,'FOAMY','FOAMY 65X90CM X 2MM VARIOS',0.25,'PLG',56,1),(62,'CUADERNO','CUADERNO UNIVERSITARIO 100 HOJAS CUADROS',1.5,'UND',18,1),(63,'CUADERNO','CUADERNO UNIVERSITARIO 100 HOJAS 2 LINEAS',1.5,'UND',13,1),(64,'CUADERNO','CUADERNO UNIVERSITARIO 100 HOJAS 1 LINEA',1.5,'UND',0,1);
/*!40000 ALTER TABLE `SunChoi_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SunChoi_proforma`
--

DROP TABLE IF EXISTS `SunChoi_proforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SunChoi_proforma` (
  `id_proforma` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_emision` datetime(6) NOT NULL,
  `fecha_caducidad` datetime(6) NOT NULL,
  `total_proforma` double NOT NULL,
  `id_cliente_id` varchar(13) NOT NULL,
  `id_usuario_id` varchar(13) NOT NULL,
  PRIMARY KEY (`id_proforma`),
  KEY `SunChoi_proforma_id_cliente_id_2babebaf_fk_SunChoi_cliente_dni` (`id_cliente_id`),
  KEY `SunChoi_proforma_76a74f43` (`id_usuario_id`),
  CONSTRAINT `SunChoi_proforma_id_cliente_id_2babebaf_fk_SunChoi_cliente_dni` FOREIGN KEY (`id_cliente_id`) REFERENCES `SunChoi_cliente` (`dni`),
  CONSTRAINT `SunChoi_proforma_id_usuario_id_e044529b_fk_SunChoi_usuario_dni` FOREIGN KEY (`id_usuario_id`) REFERENCES `SunChoi_usuario` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SunChoi_proforma`
--

LOCK TABLES `SunChoi_proforma` WRITE;
/*!40000 ALTER TABLE `SunChoi_proforma` DISABLE KEYS */;
INSERT INTO `SunChoi_proforma` VALUES (1,'2017-08-24 11:32:26.000000','2017-08-31 00:00:00.000000',11575.2001953125,'0917628304','13537');
/*!40000 ALTER TABLE `SunChoi_proforma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SunChoi_proformalineas`
--

DROP TABLE IF EXISTS `SunChoi_proformalineas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SunChoi_proformalineas` (
  `id_proforma_linea` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` double NOT NULL,
  `iva` double NOT NULL,
  `descuento` double NOT NULL,
  `total_proforma_linea` double NOT NULL,
  `id_producto_id` int(11) NOT NULL,
  `id_proforma_id` int(11) NOT NULL,
  PRIMARY KEY (`id_proforma_linea`),
  KEY `SunChoi__id_producto_id_82a62cc5_fk_SunChoi_producto_id_producto` (`id_producto_id`),
  KEY `SunChoi__id_proforma_id_64aee7e1_fk_SunChoi_proforma_id_proforma` (`id_proforma_id`),
  CONSTRAINT `SunChoi__id_producto_id_82a62cc5_fk_SunChoi_producto_id_producto` FOREIGN KEY (`id_producto_id`) REFERENCES `SunChoi_producto` (`id_producto`),
  CONSTRAINT `SunChoi__id_proforma_id_64aee7e1_fk_SunChoi_proforma_id_proforma` FOREIGN KEY (`id_proforma_id`) REFERENCES `SunChoi_proforma` (`id_proforma`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SunChoi_proformalineas`
--

LOCK TABLES `SunChoi_proformalineas` WRITE;
/*!40000 ALTER TABLE `SunChoi_proformalineas` DISABLE KEYS */;
INSERT INTO `SunChoi_proformalineas` VALUES (1,6890,1240.199951171875,0,11575.2001953125,63,1);
/*!40000 ALTER TABLE `SunChoi_proformalineas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SunChoi_proveedores`
--

DROP TABLE IF EXISTS `SunChoi_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SunChoi_proveedores` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(200) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SunChoi_proveedores`
--

LOCK TABLES `SunChoi_proveedores` WRITE;
/*!40000 ALTER TABLE `SunChoi_proveedores` DISABLE KEYS */;
INSERT INTO `SunChoi_proveedores` VALUES (1,'COMSUCRE S.A.','JUAN PIO MONTUFAR 109 Y AGUIRRE','2516315','ventas@comsucre.com'),(12,'Dilipa CIA LTDA','Av. 10 de Agosto N52-15 y Cap. Ramon Borja','2418640','información@dilipa.com.ec'),(15,'Junito S.A.','los Andes #136-85','0997167283','junito@gmail.com'),(16,'TodoSoporte S.A.','Las tejas M2 v 30','4567864','todo@gmail.com');
/*!40000 ALTER TABLE `SunChoi_proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SunChoi_roles`
--

DROP TABLE IF EXISTS `SunChoi_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SunChoi_roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(200) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SunChoi_roles`
--

LOCK TABLES `SunChoi_roles` WRITE;
/*!40000 ALTER TABLE `SunChoi_roles` DISABLE KEYS */;
INSERT INTO `SunChoi_roles` VALUES (1,'administrador','Maneja la app en su totalidad, tiene acceso a todas las funcionalidades implementadas en la app.'),(2,'empleado','Acceso limitado, ventas, cotizaciones y poco mas.'),(3,'administrador','Maneja la app en su totalidad, tiene acceso a todas las funcionalidades implementadas en la app.'),(4,'empleado','Acceso limitado, ventas, cotizaciones y poco mas.'),(5,'administrador','Maneja la app en su totalidad, tiene acceso a todas las funcionalidades implementadas en la app.'),(6,'empleado','Acceso limitado, ventas, cotizaciones y poco mas.'),(7,'administrador','Maneja la app en su totalidad, tiene acceso a todas las funcionalidades implementadas en la app.'),(8,'empleado','Acceso limitado, ventas, cotizaciones y poco mas.'),(9,'administrador','Maneja la app en su totalidad, tiene acceso a todas las funcionalidades implementadas en la app.'),(10,'empleado','Acceso limitado, ventas, cotizaciones y poco mas.'),(11,'administrador','Maneja la app en su totalidad, tiene acceso a todas las funcionalidades implementadas en la app.'),(12,'empleado','Acceso limitado, ventas, cotizaciones y poco mas.'),(13,'administrador','Maneja la app en su totalidad, tiene acceso a todas las funcionalidades implementadas en la app.'),(14,'empleado','Acceso limitado, ventas, cotizaciones y poco mas.');
/*!40000 ALTER TABLE `SunChoi_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SunChoi_solicitudesdiferido`
--

DROP TABLE IF EXISTS `SunChoi_solicitudesdiferido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SunChoi_solicitudesdiferido` (
  `id_solicitud_diferido` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime(6) NOT NULL,
  `estado` varchar(200) NOT NULL,
  `id_factura_id` int(11) NOT NULL,
  `id_usuario_aprobacion_id` varchar(13) NOT NULL,
  `id_usuario_solicitante_id` varchar(13) NOT NULL,
  PRIMARY KEY (`id_solicitud_diferido`),
  KEY `SunChoi_sol_id_factura_id_ef343b2f_fk_SunChoi_factura_id_factura` (`id_factura_id`),
  KEY `SunChoi_solicitudesdiferido_9ee6004b` (`id_usuario_aprobacion_id`),
  KEY `SunChoi_solicitudesdiferido_3a9cb950` (`id_usuario_solicitante_id`),
  CONSTRAINT `SunCho_id_usuario_solicitante_id_9ec46b5a_fk_SunChoi_cliente_dni` FOREIGN KEY (`id_usuario_solicitante_id`) REFERENCES `SunChoi_cliente` (`dni`),
  CONSTRAINT `SunChoi_id_usuario_aprobacion_id_d47815b1_fk_SunChoi_usuario_dni` FOREIGN KEY (`id_usuario_aprobacion_id`) REFERENCES `SunChoi_usuario` (`dni`),
  CONSTRAINT `SunChoi_sol_id_factura_id_ef343b2f_fk_SunChoi_factura_id_factura` FOREIGN KEY (`id_factura_id`) REFERENCES `SunChoi_factura` (`id_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SunChoi_solicitudesdiferido`
--

LOCK TABLES `SunChoi_solicitudesdiferido` WRITE;
/*!40000 ALTER TABLE `SunChoi_solicitudesdiferido` DISABLE KEYS */;
/*!40000 ALTER TABLE `SunChoi_solicitudesdiferido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SunChoi_usuario`
--

DROP TABLE IF EXISTS `SunChoi_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SunChoi_usuario` (
  `dni` varchar(13) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `apellido` varchar(200) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` varchar(200) NOT NULL,
  `correo` varchar(254) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `SunChoi_usuario_usuario_id_5a8ddc0c_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SunChoi_usuario`
--

LOCK TABLES `SunChoi_usuario` WRITE;
/*!40000 ALTER TABLE `SunChoi_usuario` DISABLE KEYS */;
INSERT INTO `SunChoi_usuario` VALUES ('12345','sun','Aguirre','data de guayaquil','223424','lu_la@espol.edu.ec',2),('13537','byr','povea','data de villamil','234567','bpovea@espol.edu.ec',3),('13567','mau','leiton','data de villamil','234567','mau_leiton@espol.edu.ec',1),('1726873431','prueba','prueba apellido','dir prueba','3850108','prueba01@gmail.com',6),('1726873434','xavier','palma','guasmo','3860987','xavier@gmail.com',4),('1726873435','Jennifer','Restrepo','guasmo','3647598','jenni@gmail.com',5);
/*!40000 ALTER TABLE `SunChoi_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SunChoi_usuariorol`
--

DROP TABLE IF EXISTS `SunChoi_usuariorol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SunChoi_usuariorol` (
  `id_usuario_rol` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol_id` int(11) NOT NULL,
  `id_usuario_id` varchar(13) NOT NULL,
  PRIMARY KEY (`id_usuario_rol`),
  KEY `SunChoi_usuariorol_id_rol_id_5b8081ad_fk_SunChoi_roles_id_rol` (`id_rol_id`),
  KEY `SunChoi_usuariorol_id_usuario_id_308f98e1_fk_SunChoi_usuario_dni` (`id_usuario_id`),
  CONSTRAINT `SunChoi_usuariorol_id_rol_id_5b8081ad_fk_SunChoi_roles_id_rol` FOREIGN KEY (`id_rol_id`) REFERENCES `SunChoi_roles` (`id_rol`),
  CONSTRAINT `SunChoi_usuariorol_id_usuario_id_308f98e1_fk_SunChoi_usuario_dni` FOREIGN KEY (`id_usuario_id`) REFERENCES `SunChoi_usuario` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SunChoi_usuariorol`
--

LOCK TABLES `SunChoi_usuariorol` WRITE;
/*!40000 ALTER TABLE `SunChoi_usuariorol` DISABLE KEYS */;
INSERT INTO `SunChoi_usuariorol` VALUES (1,1,'13567'),(2,1,'13567'),(3,2,'12345'),(4,1,'13537'),(5,1,'13567'),(6,2,'12345'),(7,1,'13537'),(8,1,'13567'),(9,2,'12345'),(10,1,'13537'),(11,1,'13567'),(12,2,'12345'),(13,1,'13537'),(14,1,'13567'),(15,2,'12345'),(16,1,'13537'),(17,1,'13567'),(18,2,'12345'),(19,1,'13537'),(20,1,'1726873434'),(21,2,'1726873435'),(22,1,'1726873431');
/*!40000 ALTER TABLE `SunChoi_usuariorol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add proveedores',7,'add_proveedores'),(20,'Can change proveedores',7,'change_proveedores'),(21,'Can delete proveedores',7,'delete_proveedores'),(22,'Can add producto',8,'add_producto'),(23,'Can change producto',8,'change_producto'),(24,'Can delete producto',8,'delete_producto'),(25,'Can add cliente',9,'add_cliente'),(26,'Can change cliente',9,'change_cliente'),(27,'Can delete cliente',9,'delete_cliente'),(28,'Can add orden compra',10,'add_ordencompra'),(29,'Can change orden compra',10,'change_ordencompra'),(30,'Can delete orden compra',10,'delete_ordencompra'),(31,'Can add ordencompralineas',11,'add_ordencompralineas'),(32,'Can change ordencompralineas',11,'change_ordencompralineas'),(33,'Can delete ordencompralineas',11,'delete_ordencompralineas'),(34,'Can add proforma lineas',12,'add_proformalineas'),(35,'Can change proforma lineas',12,'change_proformalineas'),(36,'Can delete proforma lineas',12,'delete_proformalineas'),(37,'Can add proforma',13,'add_proforma'),(38,'Can change proforma',13,'change_proforma'),(39,'Can delete proforma',13,'delete_proforma'),(40,'Can add usuariorol',14,'add_usuariorol'),(41,'Can change usuariorol',14,'change_usuariorol'),(42,'Can delete usuariorol',14,'delete_usuariorol'),(43,'Can add roles',15,'add_roles'),(44,'Can change roles',15,'change_roles'),(45,'Can delete roles',15,'delete_roles'),(46,'Can add solicitudesdiferido',16,'add_solicitudesdiferido'),(47,'Can change solicitudesdiferido',16,'change_solicitudesdiferido'),(48,'Can delete solicitudesdiferido',16,'delete_solicitudesdiferido'),(49,'Can add comprobantepago',17,'add_comprobantepago'),(50,'Can change comprobantepago',17,'change_comprobantepago'),(51,'Can delete comprobantepago',17,'delete_comprobantepago'),(52,'Can add usuario',18,'add_usuario'),(53,'Can change usuario',18,'change_usuario'),(54,'Can delete usuario',18,'delete_usuario'),(55,'Can add factura',19,'add_factura'),(56,'Can change factura',19,'change_factura'),(57,'Can delete factura',19,'delete_factura'),(58,'Can add facturalineas',20,'add_facturalineas'),(59,'Can change facturalineas',20,'change_facturalineas'),(60,'Can delete facturalineas',20,'delete_facturalineas');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$a9SMWiKsVFKE$TjAh6WsF2p9CUz4rX1Dsb8pSpzpDzLVBgASyR4TKqp4=',NULL,1,'mau_leiton','','','mau_leiton@espol.edu.ec',1,1,'2017-08-24 10:28:17.938131'),(2,'pbkdf2_sha256$24000$wkRXzQ9CNAI3$rPXizLiczGuR7wIPxy/Vdf6cOCSjLVGbyN0gfj0qJRs=','2017-08-24 11:48:29.388067',0,'lu_la','','','lu_la@espol.edu.ec',1,1,'2017-08-24 10:28:52.000000'),(3,'pbkdf2_sha256$24000$7fuEqeaS1Jst$/K6V45YHFOCBZv/45pDH6xpkIw9Xb4F1rZ+fo+yqXAo=','2017-08-24 18:44:37.399751',1,'bpovea','','','bpovea@espol.edu.ec',1,1,'2017-08-24 10:29:36.676678'),(4,'pbkdf2_sha256$24000$8s5fERIPRwBn$egZw1OiVPoF7Mmp5RJ1b/RhgSDSA5cXvoFDhJado8y4=','2017-08-24 13:04:20.737377',1,'xavi','','','xavier@gmail.com',1,1,'2017-08-24 12:49:43.640110'),(5,'pbkdf2_sha256$24000$Mque79mJM89e$CGvtXZhFdj5U9PA6/9Gf1oJjrn1WiQLyHWy9UseyKi4=','2017-08-24 13:04:49.354308',0,'jeni','','','jenni@gmail.com',0,1,'2017-08-24 12:54:56.562775'),(6,'pbkdf2_sha256$24000$Twr7Vzipbk8F$pQRSsJT3BhUzRlmZ0RwMvN66pzHDYILSQvYiVgwCL8w=','2017-08-24 13:22:23.273202',1,'prueba','','','prueba01@gmail.com',1,1,'2017-08-24 13:18:28.011697');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-08-24 10:42:57.380368','2','lu_la',2,'Changed is_superuser.',4,3);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(9,'SunChoi','cliente'),(17,'SunChoi','comprobantepago'),(19,'SunChoi','factura'),(20,'SunChoi','facturalineas'),(10,'SunChoi','ordencompra'),(11,'SunChoi','ordencompralineas'),(8,'SunChoi','producto'),(13,'SunChoi','proforma'),(12,'SunChoi','proformalineas'),(7,'SunChoi','proveedores'),(15,'SunChoi','roles'),(16,'SunChoi','solicitudesdiferido'),(18,'SunChoi','usuario'),(14,'SunChoi','usuariorol');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-08-24 10:26:50.210034'),(2,'auth','0001_initial','2017-08-24 10:26:57.709576'),(3,'SunChoi','0001_initial','2017-08-24 10:27:21.825769'),(4,'SunChoi','0002_auto_20170823_0407','2017-08-24 10:27:21.960155'),(5,'SunChoi','0003_auto_20170823_0408','2017-08-24 10:27:22.127950'),(6,'SunChoi','0004_auto_20170823_0409','2017-08-24 10:27:22.273164'),(7,'SunChoi','0005_auto_20170823_0411','2017-08-24 10:27:22.429622'),(8,'SunChoi','0006_log','2017-08-24 10:27:22.853341'),(9,'SunChoi','0007_auto_20170823_1202','2017-08-24 10:27:23.033460'),(10,'SunChoi','0008_delete_log','2017-08-24 10:27:23.200945'),(11,'admin','0001_initial','2017-08-24 10:27:26.083625'),(12,'admin','0002_logentry_remove_auto_add','2017-08-24 10:27:26.228897'),(13,'contenttypes','0002_remove_content_type_name','2017-08-24 10:27:27.312056'),(14,'auth','0002_alter_permission_name_max_length','2017-08-24 10:27:28.092540'),(15,'auth','0003_alter_user_email_max_length','2017-08-24 10:27:28.216960'),(16,'auth','0004_alter_user_username_opts','2017-08-24 10:27:28.275229'),(17,'auth','0005_alter_user_last_login_null','2017-08-24 10:27:28.885407'),(18,'auth','0006_require_contenttypes_0002','2017-08-24 10:27:28.918874'),(19,'auth','0007_alter_validators_add_error_messages','2017-08-24 10:27:28.976149'),(20,'sessions','0001_initial','2017-08-24 10:27:29.487128');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('uvpwerwrn4wvk5khiwale4deuz5l8kak','MmZkMGJjYTBmNWY0ZGZmYmY4MDg5YzMxNGMyNjc1Mjg2YmQzYjIzODp7Il9hdXRoX3VzZXJfaGFzaCI6IjA4ZmJhY2VjZDgwNzU3OGYyOGMzM2Y0YTgyY2E0ZDQwMTMyZjZiZjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-09-07 11:15:03.415511'),('z792e9br86v23qtui7sha49iiflc9cnz','NmM4M2I3OGExZTljZmZjZjM5Yzg1Y2JmNTczNjE0YTA4ODkyYzJjMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzZTZjZDM0YmE1YWY0MWMyNDk1NTY1YTViYzc5ZDM4NDY2ZjEyMzEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=','2017-09-07 13:18:42.470573'),('z8w3pc1g79n6bxp7regtfdzthaicikt8','MmZkMGJjYTBmNWY0ZGZmYmY4MDg5YzMxNGMyNjc1Mjg2YmQzYjIzODp7Il9hdXRoX3VzZXJfaGFzaCI6IjA4ZmJhY2VjZDgwNzU3OGYyOGMzM2Y0YTgyY2E0ZDQwMTMyZjZiZjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-09-07 12:31:14.700147');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'SunChoi'
--
/*!50003 DROP PROCEDURE IF EXISTS `bajostock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bajostock`(minimo int)
proc_main: BEGIN  
    SELECT *
    FROM SunChoi_producto  
    WHERE stock<=minimo;
END proc_main ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getidproveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getidproveedor`(name nvarchar(200))
proc_main: BEGIN  
	select *
	from SunChoi_proveedores
    where razon_social=name;
END proc_main ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertcliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertcliente`(dni nvarchar(13),nombre nvarchar(100),apellidos nvarchar(100),direccion nvarchar(200),telefono nvarchar(100))
proc_main: BEGIN  
    INSERT INTO SunChoi_cliente VALUES(dni,nombre,apellidos,direccion,telefono);
END proc_main ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertfactura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertfactura`(numero int,fecha dateTime, id_cliente nvarchar(13),id_usuario nvarchar(13), total float)
proc_main: BEGIN  
	INSERT INTO SunChoi_factura(numero,fecha,id_cliente_id,id_usuario_id,total) VALUES(numero,fecha,id_cliente,id_usuario,total);
	select max(f.id_factura) from SunChoi_factura f;
END proc_main ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertfacturalineasUpdateStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertfacturalineasUpdateStock`(id_factura int,id_productos int ,cantidad int ,iva float ,descuento float , total_factura_linea float)
proc_main: BEGIN
    declare productostock int;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
	END;
	
	START TRANSACTION;
	    select p.stock into productostock
	    from SunChoi_producto p
	    where p.id_producto=id_productos;

    	set productostock = productostock - cantidad;

		INSERT INTO SunChoi_facturalineas(id_factura_id,id_producto_id,cantidad,iva,descuento,total_factura_linea) VALUES(id_factura,id_productos,cantidad,iva,descuento,total_factura_linea);
		UPDATE SunChoi_producto set stock = productostock where id_producto = id_productos;
	COMMIT;
END proc_main ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertordencompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertordencompra`(numero int, fecha dateTime, id_usuario int, id_proveedor int, total float)
proc_main: BEGIN
	INSERT INTO SunChoi_ordencompra(numero,fecha,id_usuario_id,id_proveedor_id,total)  VALUES(numero,fecha,id_usuario,id_proveedor,total);
	select max(o.id_orden_compra) from SunChoi_ordencompra o;
END proc_main ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertordenlineasUpdateStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertordenlineasUpdateStock`(id_orden int,id_productos int ,cantidad int ,iva int ,descuento int,total_orden_compra_linea float)
proc_main: BEGIN   	
    declare productostock int;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
	END;
	
	START TRANSACTION;
	    select p.stock into productostock
	    from SunChoi_producto p
	    where p.id_producto=id_productos;

    	set productostock = productostock + cantidad;

		INSERT INTO SunChoi_ordencompralineas(id_orden_compra_id,id_producto_id,cantidad,iva,descuento,total_orden_compra_linea) VALUES(id_orden,id_productos,cantidad,iva,descuento,total_orden_compra_linea);
		UPDATE SunChoi_producto set stock = productostock where id_producto = id_productos;
	COMMIT;
END proc_main ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertproducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertproducto`(nombre nvarchar(200),descripcion nvarchar(200),precio_unitario float,medida nvarchar(200),stock integer(10),id_proveedor int)
proc_main: BEGIN  
    INSERT INTO SunChoi_producto(nombre,descripcion,precio_unitario,medida,stock,proveedor_id) VALUES(nombre,descripcion,precio_unitario,medida,stock,id_proveedor);
END proc_main ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertproforma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertproforma`(fecha_emision dateTime, fecha_caducidad dateTime, id_cliente nvarchar(13),id_usuario nvarchar(13), total_proforma float)
proc_main: BEGIN  
	INSERT INTO SunChoi_proforma(fecha_emision,fecha_caducidad,id_cliente_id,id_usuario_id,total_proforma) VALUES(fecha_emision,fecha_caducidad,id_cliente,id_usuario,total_proforma);
	select max(f.id_proforma) from SunChoi_proforma f;
END proc_main ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertProformaLineas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertProformaLineas`(id_proforma int,id_producto int ,cantidad int ,iva float,descuento float,total_proforma_linea float)
proc_main: BEGIN
	INSERT INTO SunChoi_proformalineas(id_proforma_id,id_producto_id,cantidad,iva,descuento,total_proforma_linea) VALUES(id_proforma,id_producto,cantidad,iva,descuento,total_proforma_linea);
END proc_main ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertproveedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertproveedores`(razon_social nvarchar(200),direccion nvarchar(200),telefono nvarchar(200),email nvarchar(200))
proc_main: BEGIN  
    INSERT INTO SunChoi_proveedores(razon_social,direccion,telefono,email) VALUES(razon_social,direccion,telefono,email);
END proc_main ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertusuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertusuario`(dni nvarchar(13),usuario_id int,nombre nvarchar(200),apellido nvarchar(200),direccion nvarchar(200),telefono nvarchar(200),correo nvarchar(200))
proc_main: BEGIN  
	INSERT INTO SunChoi_usuario (dni,usuario_id,nombre,apellido,direccion,telefono,correo) VALUES(dni,usuario_id,nombre,apellido,direccion,telefono,correo);
END proc_main ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertusuariorol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertusuariorol`(id_usuario nvarchar(13) ,id_rol int )
proc_main: BEGIN  
	INSERT INTO SunChoi_usuariorol(id_usuario_id,id_rol_id) VALUES(id_usuario,id_rol);
END proc_main ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-26 20:00:51
