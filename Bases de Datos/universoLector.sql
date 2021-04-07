-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: universolector
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `id_autor` int NOT NULL AUTO_INCREMENT,
  `apellido` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Manentti','Antonella');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editorial`
--

DROP TABLE IF EXISTS `editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editorial` (
  `id_editorial` int NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  PRIMARY KEY (`id_editorial`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorial`
--

LOCK TABLES `editorial` WRITE;
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;
INSERT INTO `editorial` VALUES (1,'Anto Sociedad Anonima','+54-11-74658903');
/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `id_libro` int NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(13) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `anio_escritura` date NOT NULL,
  `anio_edicion` date NOT NULL,
  `id_editorial` int NOT NULL,
  `id_autor` int NOT NULL,
  PRIMARY KEY (`id_libro`),
  KEY `fk_libro_editorial1_idx` (`id_editorial`),
  KEY `fk_libro_autor1_idx` (`id_autor`),
  CONSTRAINT `fk_libro_autor1` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id_autor`),
  CONSTRAINT `fk_libro_editorial1` FOREIGN KEY (`id_editorial`) REFERENCES `editorial` (`id_editorial`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES (1,'435467897654s','Nuevolibro','2017-01-25','2016-03-24',1,1);
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamo` (
  `id_prestamo` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `fecha_devolucion` date NOT NULL,
  `fecha_tope` date NOT NULL,
  `id_socio` int NOT NULL,
  PRIMARY KEY (`id_prestamo`),
  KEY `fk_prestamo_socio1_idx` (`id_socio`),
  CONSTRAINT `fk_prestamo_socio1` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id_socio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo`
--

LOCK TABLES `prestamo` WRITE;
/*!40000 ALTER TABLE `prestamo` DISABLE KEYS */;
INSERT INTO `prestamo` VALUES (1,'2018-03-12 12:34:09','2019-03-05','2019-04-05',2);
/*!40000 ALTER TABLE `prestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamo_x_volumen`
--

DROP TABLE IF EXISTS `prestamo_x_volumen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamo_x_volumen` (
  `prestamo_id_prestamo` int NOT NULL,
  `volumen_id_volumen` int NOT NULL,
  PRIMARY KEY (`prestamo_id_prestamo`,`volumen_id_volumen`),
  KEY `fk_prestamo_has_volumen_volumen1_idx` (`volumen_id_volumen`),
  KEY `fk_prestamo_has_volumen_prestamo1_idx` (`prestamo_id_prestamo`),
  CONSTRAINT `fk_prestamo_has_volumen_prestamo1` FOREIGN KEY (`prestamo_id_prestamo`) REFERENCES `prestamo` (`id_prestamo`),
  CONSTRAINT `fk_prestamo_has_volumen_volumen1` FOREIGN KEY (`volumen_id_volumen`) REFERENCES `volumen` (`id_volumen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo_x_volumen`
--

LOCK TABLES `prestamo_x_volumen` WRITE;
/*!40000 ALTER TABLE `prestamo_x_volumen` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamo_x_volumen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socio`
--

DROP TABLE IF EXISTS `socio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socio` (
  `id_socio` int NOT NULL AUTO_INCREMENT,
  `DNI` int NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  `Localidad` varchar(100) NOT NULL,
  PRIMARY KEY (`id_socio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socio`
--

LOCK TABLES `socio` WRITE;
/*!40000 ALTER TABLE `socio` DISABLE KEYS */;
INSERT INTO `socio` VALUES (2,2988800,'Linda','Williams','23 Work Haven Lane','Alberta'),(3,2500000,'Barbara','Jones','Monroe 860','QLD'),(4,32980002,'Lois','Butler','1688 Okara Way','NothWest Border Prov'),(5,2313909,'Robin','Hayes','262 A Corua','Dhaka');
/*!40000 ALTER TABLE `socio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono_x_socio`
--

DROP TABLE IF EXISTS `telefono_x_socio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono_x_socio` (
  `id_telefono_x_socio` int NOT NULL AUTO_INCREMENT,
  `nrotelefono` varchar(100) NOT NULL,
  `id_socio` int NOT NULL,
  PRIMARY KEY (`id_telefono_x_socio`),
  KEY `fk_telefonoxsocio_socio1_idx` (`id_socio`),
  CONSTRAINT `fk_telefonoxsocio_socio1` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id_socio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono_x_socio`
--

LOCK TABLES `telefono_x_socio` WRITE;
/*!40000 ALTER TABLE `telefono_x_socio` DISABLE KEYS */;
INSERT INTO `telefono_x_socio` VALUES (1,'+54-11-23789435',2);
/*!40000 ALTER TABLE `telefono_x_socio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumen`
--

DROP TABLE IF EXISTS `volumen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumen` (
  `id_volumen` int NOT NULL AUTO_INCREMENT,
  `deterioriado` tinyint NOT NULL,
  `id_libro` int NOT NULL,
  PRIMARY KEY (`id_volumen`),
  KEY `fk_volumen_libro1_idx` (`id_libro`),
  CONSTRAINT `fk_volumen_libro1` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id_libro`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumen`
--

LOCK TABLES `volumen` WRITE;
/*!40000 ALTER TABLE `volumen` DISABLE KEYS */;
INSERT INTO `volumen` VALUES (1,0,1);
/*!40000 ALTER TABLE `volumen` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-06 19:15:42
