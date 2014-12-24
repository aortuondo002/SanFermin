CREATE DATABASE  IF NOT EXISTS `sanfermin` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sanfermin`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sanfermin
-- ------------------------------------------------------
-- Server version	5.6.21-log

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
-- Table structure for table `animalia`
--

DROP TABLE IF EXISTS `animalia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `animalia` (
  `idAnimalia` int(11) NOT NULL,
  `jaiotzeData` datetime NOT NULL,
  `pisua` varchar(45) NOT NULL,
  `altuera` varchar(45) NOT NULL,
  `attribute` varchar(45) DEFAULT NULL,
  `gKodea` int(11) NOT NULL,
  PRIMARY KEY (`idAnimalia`),
  KEY `gKodea_idx` (`gKodea`),
  CONSTRAINT `gKodea` FOREIGN KEY (`gKodea`) REFERENCES `ganadutegia` (`idganadutegia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `botika`
--

DROP TABLE IF EXISTS `botika`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `botika` (
  `idBotika` int(11) NOT NULL,
  `izena` varchar(45) NOT NULL,
  PRIMARY KEY (`idBotika`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bozketa`
--

DROP TABLE IF EXISTS `bozketa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bozketa` (
  `idbozketa` int(11) NOT NULL,
  `nork` int(11) NOT NULL,
  `nori` int(11) NOT NULL,
  `noiz` datetime NOT NULL,
  PRIMARY KEY (`nork`),
  KEY `nori_idx` (`nori`),
  CONSTRAINT `nori` FOREIGN KEY (`nori`) REFERENCES `ganadutegia` (`idganadutegia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `nork` FOREIGN KEY (`nork`) REFERENCES `ganadutegia` (`idganadutegia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datuak`
--

DROP TABLE IF EXISTS `datuak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datuak` (
  `fk_id_zezena` int(11) NOT NULL,
  `fk_id_entzierroa` int(11) NOT NULL,
  `parteHartu` binary(1) NOT NULL,
  `denbora` time(6) NOT NULL,
  PRIMARY KEY (`fk_id_entzierroa`,`fk_id_zezena`),
  KEY `entzierroa_idx` (`fk_id_entzierroa`),
  KEY `zezena_idx` (`fk_id_zezena`),
  CONSTRAINT `eKodea` FOREIGN KEY (`fk_id_entzierroa`) REFERENCES `entzierroa` (`identzierroa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `zeKodea` FOREIGN KEY (`fk_id_zezena`) REFERENCES `zezena` (`zKodea`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dosia`
--

DROP TABLE IF EXISTS `dosia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dosia` (
  `idDosia` int(11) NOT NULL,
  `zenbat` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDosia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entzierroa`
--

DROP TABLE IF EXISTS `entzierroa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entzierroa` (
  `identzierroa` int(11) NOT NULL,
  `data` date NOT NULL,
  `batezBestekoAbiadura` int(11) NOT NULL,
  `fk_id_ganadutegia` int(11) NOT NULL,
  PRIMARY KEY (`identzierroa`),
  KEY `ganadutegia_idx` (`fk_id_ganadutegia`),
  CONSTRAINT `ganadutegia` FOREIGN KEY (`fk_id_ganadutegia`) REFERENCES `ganadutegia` (`idganadutegia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `erabiltzailea`
--

DROP TABLE IF EXISTS `erabiltzailea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erabiltzailea` (
  `idErabiltzailea` int(11) NOT NULL AUTO_INCREMENT,
  `Erabiltzailea` varchar(15) NOT NULL,
  `pasahitza` varchar(15) NOT NULL,
  PRIMARY KEY (`idErabiltzailea`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ganadutegia`
--

DROP TABLE IF EXISTS `ganadutegia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ganadutegia` (
  `idganadutegia` int(11) NOT NULL,
  `helbidea` varchar(45) NOT NULL,
  PRIMARY KEY (`idganadutegia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hilabetea`
--

DROP TABLE IF EXISTS `hilabetea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hilabetea` (
  `idhilabetea` int(11) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`idhilabetea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jaiotza`
--

DROP TABLE IF EXISTS `jaiotza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jaiotza` (
  `jKodea` int(11) NOT NULL,
  `hKodea` int(11) NOT NULL,
  PRIMARY KEY (`jKodea`,`hKodea`),
  KEY `jKodea_idx` (`jKodea`),
  KEY `hKodea_idx` (`hKodea`),
  CONSTRAINT `hiKodea` FOREIGN KEY (`hKodea`) REFERENCES `hilabetea` (`idhilabetea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `joKodea` FOREIGN KEY (`jKodea`) REFERENCES `joalduna` (`jKodea`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `joalduna`
--

DROP TABLE IF EXISTS `joalduna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `joalduna` (
  `idjoalduna` int(11) NOT NULL,
  `kolorea` varchar(15) NOT NULL,
  `jKodea` int(11) DEFAULT NULL,
  PRIMARY KEY (`idjoalduna`),
  KEY `jKodea_idx` (`jKodea`),
  CONSTRAINT `jKodea` FOREIGN KEY (`jKodea`) REFERENCES `animalia` (`idAnimalia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `noiz`
--

DROP TABLE IF EXISTS `noiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noiz` (
  `fk_id_joalduna` int(11) NOT NULL,
  `fk_id_entzierroa` int(11) NOT NULL,
  PRIMARY KEY (`fk_id_joalduna`,`fk_id_entzierroa`),
  KEY `entzierroa_idx` (`fk_id_entzierroa`),
  CONSTRAINT `entzierroa` FOREIGN KEY (`fk_id_entzierroa`) REFERENCES `entzierroa` (`identzierroa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `joalduna` FOREIGN KEY (`fk_id_joalduna`) REFERENCES `joalduna` (`jKodea`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tratamendua`
--

DROP TABLE IF EXISTS `tratamendua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tratamendua` (
  `idTratamendua` int(11) DEFAULT NULL,
  `fk_id_zezena` int(11) NOT NULL,
  `fk_id_botika` int(11) NOT NULL,
  `fk_id_dosia` int(11) NOT NULL,
  `noiz` datetime DEFAULT NULL,
  PRIMARY KEY (`fk_id_dosia`,`fk_id_botika`,`fk_id_zezena`),
  KEY `idZEzena_idx` (`fk_id_zezena`),
  KEY `idBotika_idx` (`fk_id_botika`),
  CONSTRAINT `idBotika` FOREIGN KEY (`fk_id_botika`) REFERENCES `botika` (`idBotika`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idDosia` FOREIGN KEY (`fk_id_dosia`) REFERENCES `dosia` (`idDosia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idZEzena` FOREIGN KEY (`fk_id_zezena`) REFERENCES `zezena` (`idzezena`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zezena`
--

DROP TABLE IF EXISTS `zezena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zezena` (
  `idzezena` int(11) NOT NULL,
  `adarLuzera` int(11) NOT NULL,
  `zKodea` int(11) NOT NULL,
  PRIMARY KEY (`idzezena`),
  KEY `zKodea_idx` (`zKodea`),
  CONSTRAINT `zKodea` FOREIGN KEY (`zKodea`) REFERENCES `animalia` (`idAnimalia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-23 23:57:18
