-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `id_album` int NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `anio_publicacion` date NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `id_artista` int NOT NULL,
  `id_discografica` int NOT NULL,
  PRIMARY KEY (`id_album`),
  KEY `fk_album_artista1_idx` (`id_artista`),
  KEY `fk_album_discografica1_idx` (`id_discografica`),
  CONSTRAINT `fk_album_artista1` FOREIGN KEY (`id_artista`) REFERENCES `artista` (`id_artista`),
  CONSTRAINT `fk_album_discografica1` FOREIGN KEY (`id_discografica`) REFERENCES `discografica` (`id_discografica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista` (
  `id_artista` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `imagen` varchar(200) NOT NULL,
  PRIMARY KEY (`id_artista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cancion`
--

DROP TABLE IF EXISTS `cancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancion` (
  `id_cancion` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `duracion` int NOT NULL,
  `numero_reproduccion` int NOT NULL,
  `likes` int NOT NULL,
  `id_album` int NOT NULL,
  PRIMARY KEY (`id_cancion`),
  KEY `fk_cancion_album1_idx` (`id_album`),
  CONSTRAINT `fk_cancion_album1` FOREIGN KEY (`id_album`) REFERENCES `album` (`id_album`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cancion_x_genero`
--

DROP TABLE IF EXISTS `cancion_x_genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancion_x_genero` (
  `id_cancion` int NOT NULL,
  `id_genero` int NOT NULL,
  PRIMARY KEY (`id_cancion`,`id_genero`),
  KEY `fk_cancion_has_genero_genero1_idx` (`id_genero`),
  KEY `fk_cancion_has_genero_cancion1_idx` (`id_cancion`),
  CONSTRAINT `fk_cancion_has_genero_cancion1` FOREIGN KEY (`id_cancion`) REFERENCES `cancion` (`id_cancion`),
  CONSTRAINT `fk_cancion_has_genero_genero1` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cancion_x_playlist`
--

DROP TABLE IF EXISTS `cancion_x_playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancion_x_playlist` (
  `id_cancion` int NOT NULL,
  `id_playlist` int NOT NULL,
  PRIMARY KEY (`id_cancion`,`id_playlist`),
  KEY `fk_cancion_has_playlist_playlist1_idx` (`id_playlist`),
  KEY `fk_cancion_has_playlist_cancion1_idx` (`id_cancion`),
  CONSTRAINT `fk_cancion_has_playlist_cancion1` FOREIGN KEY (`id_cancion`) REFERENCES `cancion` (`id_cancion`),
  CONSTRAINT `fk_cancion_has_playlist_playlist1` FOREIGN KEY (`id_playlist`) REFERENCES `playlist` (`id_playlist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discografica`
--

DROP TABLE IF EXISTS `discografica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discografica` (
  `id_discografica` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `pais` varchar(45) NOT NULL,
  PRIMARY KEY (`id_discografica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forma_de_pago`
--

DROP TABLE IF EXISTS `forma_de_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_de_pago` (
  `id_forma_pago` int NOT NULL AUTO_INCREMENT,
  `marca_tarjeta` varchar(45) DEFAULT NULL,
  `digitos_tarjeta` smallint DEFAULT NULL,
  `fecha_venc_tarjeta` date DEFAULT NULL,
  `CBU_tranferencia` int DEFAULT NULL,
  `alias_transferencia` varchar(45) DEFAULT NULL,
  `id_suscripcion` int NOT NULL,
  PRIMARY KEY (`id_forma_pago`),
  KEY `fk_forma_de_pago_suscripcion1_idx` (`id_suscripcion`),
  CONSTRAINT `fk_forma_de_pago_suscripcion1` FOREIGN KEY (`id_suscripcion`) REFERENCES `suscripcion` (`id_suscripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id_genero` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `password`
--

DROP TABLE IF EXISTS `password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password` (
  `id_password` int NOT NULL AUTO_INCREMENT,
  `fecha_modificacion` date NOT NULL,
  `id_usuario` int NOT NULL,
  `contrasenia` varchar(15) NOT NULL,
  PRIMARY KEY (`id_password`),
  KEY `fk_password_usuario1_idx` (`id_usuario`),
  CONSTRAINT `fk_password_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `id_playlist` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `numero_canciones` int NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `eliminada` tinyint NOT NULL,
  `fecha_eliminada` date DEFAULT NULL,
  PRIMARY KEY (`id_playlist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `suscripcion`
--

DROP TABLE IF EXISTS `suscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suscripcion` (
  `id_suscripcion` int NOT NULL AUTO_INCREMENT,
  `tipo_modelo` varchar(30) NOT NULL,
  `tipo_servicio` varchar(30) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_renovacion` date NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_suscripcion`),
  KEY `fk_suscripcion_usuario1_idx` (`id_usuario`),
  CONSTRAINT `fk_suscripcion_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `sexo` varchar(40) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `cod_postal` varchar(15) NOT NULL,
  `pais` varchar(45) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-08 18:20:13
