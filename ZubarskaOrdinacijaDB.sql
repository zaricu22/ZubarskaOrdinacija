CREATE DATABASE  IF NOT EXISTS `zubarskaordinacija` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `zubarskaordinacija`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: zubarskaordinacija
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `korisnik`
--

DROP TABLE IF EXISTS `korisnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `korisnik` (
  `identifikacioni_broj` varchar(15) NOT NULL,
  `ime` varchar(15) NOT NULL,
  `prezime` varchar(15) NOT NULL,
  `tip_korisnika` varchar(15) NOT NULL,
  PRIMARY KEY (`identifikacioni_broj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korisnik`
--

LOCK TABLES `korisnik` WRITE;
/*!40000 ALTER TABLE `korisnik` DISABLE KEYS */;
INSERT INTO `korisnik` VALUES ('','Paja','Pajic','pacijent'),('0213456789','Janko','Jankovic','pacijent'),('02144556677','Paja','Pajic','pacijent'),('432543','Filip','Filipovic','zubar');
/*!40000 ALTER TABLE `korisnik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametri`
--

DROP TABLE IF EXISTS `parametri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parametri` (
  `parametar_naziv` varchar(45) NOT NULL,
  `parametar_vrednost` int DEFAULT NULL,
  PRIMARY KEY (`parametar_naziv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametri`
--

LOCK TABLES `parametri` WRITE;
/*!40000 ALTER TABLE `parametri` DISABLE KEYS */;
INSERT INTO `parametri` VALUES ('rokOtkazivanja',2);
/*!40000 ALTER TABLE `parametri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `termin`
--

DROP TABLE IF EXISTS `termin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `termin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `termin` datetime NOT NULL,
  `tip_pregleda` text NOT NULL,
  `korisnik_id` varchar(15) NOT NULL,
  `status` varchar(15) NOT NULL,
  `trajanje` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `termin_UNIQUE` (`termin`),
  KEY `idKorisnik_idx` (`korisnik_id`),
  CONSTRAINT `korisnikId` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnik` (`identifikacioni_broj`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `termin`
--

LOCK TABLES `termin` WRITE;
/*!40000 ALTER TABLE `termin` DISABLE KEYS */;
INSERT INTO `termin` VALUES (1,'2022-09-10 09:00:00','pregled','0213456789','zakazano',30),(2,'2022-09-10 11:30:00','plombiranje','0213456789','zakazano',30),(5,'2022-09-11 22:07:00','pregled','0213456789','zakazano',60),(6,'2022-09-10 14:30:00','pregled','0213456789','zakazano',60),(7,'2022-09-14 14:30:00','pregled','0213456789','zakazano',60),(9,'2022-09-10 16:00:00','pregled','0213456789','zakazano',60),(10,'2022-09-15 14:30:00','pregled','0213456789','zakazano',60),(28,'2022-09-16 16:00:00','vadjenje','02144556677','zakazano',30),(29,'2022-09-16 15:00:00','vadjenje','02144556677','otkazano',30),(30,'2022-09-16 15:30:00','kontrola','02144556677','otkazano',30),(31,'2022-09-16 11:30:00','operacija','0213456789','zakazano',30),(32,'2022-09-16 16:30:00','ggg','0213456789','zakazano',30);
/*!40000 ALTER TABLE `termin` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-16 13:15:54
