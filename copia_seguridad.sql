-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: SunChoi
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.17.04.1

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
  KEY `SunChoi_comprobantep_id_factura_id_3f2e0e86_fk_SunChoi_f` (`id_factura_id`),
  CONSTRAINT `SunChoi_comprobantep_id_factura_id_3f2e0e86_fk_SunChoi_f` FOREIGN KEY (`id_factura_id`) REFERENCES `SunChoi_factura` (`id_factura`)
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
  KEY `SunChoi_factura_id_usuario_id_91f085cc_fk_SunChoi_usuario_dni` (`id_usuario_id`),
  CONSTRAINT `SunChoi_factura_id_cliente_id_f33b646c_fk_SunChoi_cliente_dni` FOREIGN KEY (`id_cliente_id`) REFERENCES `SunChoi_cliente` (`dni`),
  CONSTRAINT `SunChoi_factura_id_usuario_id_91f085cc_fk_SunChoi_usuario_dni` FOREIGN KEY (`id_usuario_id`) REFERENCES `SunChoi_usuario` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SunChoi_factura`
--

LOCK TABLES `SunChoi_factura` WRITE;
/*!40000 ALTER TABLE `SunChoi_factura` DISABLE KEYS */;
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
  KEY `SunChoi_facturalinea_id_factura_id_e746f4a7_fk_SunChoi_f` (`id_factura_id`),
  KEY `SunChoi_facturalinea_id_producto_id_166e5667_fk_SunChoi_p` (`id_producto_id`),
  CONSTRAINT `SunChoi_facturalinea_id_factura_id_e746f4a7_fk_SunChoi_f` FOREIGN KEY (`id_factura_id`) REFERENCES `SunChoi_factura` (`id_factura`),
  CONSTRAINT `SunChoi_facturalinea_id_producto_id_166e5667_fk_SunChoi_p` FOREIGN KEY (`id_producto_id`) REFERENCES `SunChoi_producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SunChoi_facturalineas`
--

LOCK TABLES `SunChoi_facturalineas` WRITE;
/*!40000 ALTER TABLE `SunChoi_facturalineas` DISABLE KEYS */;
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
  KEY `SunChoi_ordencompra_id_proveedor_id_ba48abc2_fk_SunChoi_p` (`id_proveedor_id`),
  KEY `SunChoi_ordencompra_id_usuario_id_360c4085_fk_SunChoi_u` (`id_usuario_id`),
  CONSTRAINT `SunChoi_ordencompra_id_proveedor_id_ba48abc2_fk_SunChoi_p` FOREIGN KEY (`id_proveedor_id`) REFERENCES `SunChoi_proveedores` (`id_proveedor`),
  CONSTRAINT `SunChoi_ordencompra_id_usuario_id_360c4085_fk_SunChoi_u` FOREIGN KEY (`id_usuario_id`) REFERENCES `SunChoi_usuario` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SunChoi_ordencompra`
--

LOCK TABLES `SunChoi_ordencompra` WRITE;
/*!40000 ALTER TABLE `SunChoi_ordencompra` DISABLE KEYS */;
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
  KEY `SunChoi_ordencompral_id_orden_compra_id_471444ea_fk_SunChoi_o` (`id_orden_compra_id`),
  KEY `SunChoi_ordencompral_id_producto_id_f0a0aef1_fk_SunChoi_p` (`id_producto_id`),
  CONSTRAINT `SunChoi_ordencompral_id_orden_compra_id_471444ea_fk_SunChoi_o` FOREIGN KEY (`id_orden_compra_id`) REFERENCES `SunChoi_ordencompra` (`id_orden_compra`),
  CONSTRAINT `SunChoi_ordencompral_id_producto_id_f0a0aef1_fk_SunChoi_p` FOREIGN KEY (`id_producto_id`) REFERENCES `SunChoi_producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SunChoi_ordencompralineas`
--

LOCK TABLES `SunChoi_ordencompralineas` WRITE;
/*!40000 ALTER TABLE `SunChoi_ordencompralineas` DISABLE KEYS */;
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
  KEY `SunChoi_producto_proveedor_id_180ec173_fk_SunChoi_p` (`proveedor_id`),
  CONSTRAINT `SunChoi_producto_proveedor_id_180ec173_fk_SunChoi_p` FOREIGN KEY (`proveedor_id`) REFERENCES `SunChoi_proveedores` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SunChoi_producto`
--

LOCK TABLES `SunChoi_producto` WRITE;
/*!40000 ALTER TABLE `SunChoi_producto` DISABLE KEYS */;
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
  KEY `SunChoi_proforma_id_usuario_id_e044529b_fk_SunChoi_usuario_dni` (`id_usuario_id`),
  CONSTRAINT `SunChoi_proforma_id_cliente_id_2babebaf_fk_SunChoi_cliente_dni` FOREIGN KEY (`id_cliente_id`) REFERENCES `SunChoi_cliente` (`dni`),
  CONSTRAINT `SunChoi_proforma_id_usuario_id_e044529b_fk_SunChoi_usuario_dni` FOREIGN KEY (`id_usuario_id`) REFERENCES `SunChoi_usuario` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SunChoi_proforma`
--

LOCK TABLES `SunChoi_proforma` WRITE;
/*!40000 ALTER TABLE `SunChoi_proforma` DISABLE KEYS */;
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
  KEY `SunChoi_proformaline_id_producto_id_82a62cc5_fk_SunChoi_p` (`id_producto_id`),
  KEY `SunChoi_proformaline_id_proforma_id_64aee7e1_fk_SunChoi_p` (`id_proforma_id`),
  CONSTRAINT `SunChoi_proformaline_id_producto_id_82a62cc5_fk_SunChoi_p` FOREIGN KEY (`id_producto_id`) REFERENCES `SunChoi_producto` (`id_producto`),
  CONSTRAINT `SunChoi_proformaline_id_proforma_id_64aee7e1_fk_SunChoi_p` FOREIGN KEY (`id_proforma_id`) REFERENCES `SunChoi_proforma` (`id_proforma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SunChoi_proformalineas`
--

LOCK TABLES `SunChoi_proformalineas` WRITE;
/*!40000 ALTER TABLE `SunChoi_proformalineas` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SunChoi_proveedores`
--

LOCK TABLES `SunChoi_proveedores` WRITE;
/*!40000 ALTER TABLE `SunChoi_proveedores` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SunChoi_roles`
--

LOCK TABLES `SunChoi_roles` WRITE;
/*!40000 ALTER TABLE `SunChoi_roles` DISABLE KEYS */;
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
  KEY `SunChoi_solicitudesd_id_factura_id_ef343b2f_fk_SunChoi_f` (`id_factura_id`),
  KEY `SunChoi_solicitudesd_id_usuario_aprobacio_d47815b1_fk_SunChoi_u` (`id_usuario_aprobacion_id`),
  KEY `SunChoi_solicitudesd_id_usuario_solicitan_9ec46b5a_fk_SunChoi_c` (`id_usuario_solicitante_id`),
  CONSTRAINT `SunChoi_solicitudesd_id_factura_id_ef343b2f_fk_SunChoi_f` FOREIGN KEY (`id_factura_id`) REFERENCES `SunChoi_factura` (`id_factura`),
  CONSTRAINT `SunChoi_solicitudesd_id_usuario_aprobacio_d47815b1_fk_SunChoi_u` FOREIGN KEY (`id_usuario_aprobacion_id`) REFERENCES `SunChoi_usuario` (`dni`),
  CONSTRAINT `SunChoi_solicitudesd_id_usuario_solicitan_9ec46b5a_fk_SunChoi_c` FOREIGN KEY (`id_usuario_solicitante_id`) REFERENCES `SunChoi_cliente` (`dni`)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SunChoi_usuariorol`
--

LOCK TABLES `SunChoi_usuariorol` WRITE;
/*!40000 ALTER TABLE `SunChoi_usuariorol` DISABLE KEYS */;
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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
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
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add proveedores',7,'add_proveedores'),(20,'Can change proveedores',7,'change_proveedores'),(21,'Can delete proveedores',7,'delete_proveedores'),(22,'Can add producto',8,'add_producto'),(23,'Can change producto',8,'change_producto'),(24,'Can delete producto',8,'delete_producto'),(25,'Can add cliente',9,'add_cliente'),(26,'Can change cliente',9,'change_cliente'),(27,'Can delete cliente',9,'delete_cliente'),(28,'Can add orden compra',10,'add_ordencompra'),(29,'Can change orden compra',10,'change_ordencompra'),(30,'Can delete orden compra',10,'delete_ordencompra'),(31,'Can add ordencompralineas',11,'add_ordencompralineas'),(32,'Can change ordencompralineas',11,'change_ordencompralineas'),(33,'Can delete ordencompralineas',11,'delete_ordencompralineas'),(34,'Can add proforma lineas',12,'add_proformalineas'),(35,'Can change proforma lineas',12,'change_proformalineas'),(36,'Can delete proforma lineas',12,'delete_proformalineas'),(37,'Can add proforma',13,'add_proforma'),(38,'Can change proforma',13,'change_proforma'),(39,'Can delete proforma',13,'delete_proforma'),(40,'Can add usuariorol',14,'add_usuariorol'),(41,'Can change usuariorol',14,'change_usuariorol'),(42,'Can delete usuariorol',14,'delete_usuariorol'),(43,'Can add roles',15,'add_roles'),(44,'Can change roles',15,'change_roles'),(45,'Can delete roles',15,'delete_roles'),(46,'Can add solicitudesdiferido',16,'add_solicitudesdiferido'),(47,'Can change solicitudesdiferido',16,'change_solicitudesdiferido'),(48,'Can delete solicitudesdiferido',16,'delete_solicitudesdiferido'),(49,'Can add comprobantepago',17,'add_comprobantepago'),(50,'Can change comprobantepago',17,'change_comprobantepago'),(51,'Can delete comprobantepago',17,'delete_comprobantepago'),(52,'Can add usuario',18,'add_usuario'),(53,'Can change usuario',18,'change_usuario'),(54,'Can delete usuario',18,'delete_usuario'),(55,'Can add factura',19,'add_factura'),(56,'Can change factura',19,'change_factura'),(57,'Can delete factura',19,'delete_factura'),(58,'Can add facturalineas',20,'add_facturalineas'),(59,'Can change facturalineas',20,'change_facturalineas'),(60,'Can delete facturalineas',20,'delete_facturalineas');
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
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
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
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
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
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
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
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(9,'SunChoi','cliente'),(17,'SunChoi','comprobantepago'),(19,'SunChoi','factura'),(20,'SunChoi','facturalineas'),(10,'SunChoi','ordencompra'),(11,'SunChoi','ordencompralineas'),(8,'SunChoi','producto'),(13,'SunChoi','proforma'),(12,'SunChoi','proformalineas'),(7,'SunChoi','proveedores'),(15,'SunChoi','roles'),(16,'SunChoi','solicitudesdiferido'),(18,'SunChoi','usuario'),(14,'SunChoi','usuariorol');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-08-24 23:59:38.690820'),(2,'auth','0001_initial','2017-08-24 23:59:46.806815'),(3,'admin','0001_initial','2017-08-24 23:59:48.737245'),(4,'admin','0002_logentry_remove_auto_add','2017-08-24 23:59:48.929302'),(5,'contenttypes','0002_remove_content_type_name','2017-08-24 23:59:50.206893'),(6,'auth','0002_alter_permission_name_max_length','2017-08-24 23:59:50.923723'),(7,'auth','0003_alter_user_email_max_length','2017-08-24 23:59:51.217771'),(8,'auth','0004_alter_user_username_opts','2017-08-24 23:59:51.354410'),(9,'auth','0005_alter_user_last_login_null','2017-08-24 23:59:51.937190'),(10,'auth','0006_require_contenttypes_0002','2017-08-24 23:59:51.978957'),(11,'auth','0007_alter_validators_add_error_messages','2017-08-24 23:59:52.287201'),(12,'auth','0008_alter_user_username_max_length','2017-08-24 23:59:53.087949'),(13,'sessions','0001_initial','2017-08-24 23:59:53.671483'),(14,'SunChoi','0001_initial','2017-08-25 00:01:10.505042');
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
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-25  0:16:34
