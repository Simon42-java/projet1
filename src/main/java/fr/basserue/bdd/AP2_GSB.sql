-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: 172.27.27.2    Database: AP2_GSB
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `AP2_GSB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `AP2_GSB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `AP2_GSB`;

--
-- Table structure for table `AGENTS`
--

DROP TABLE IF EXISTS `AGENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AGENTS` (
  `ag_matricule` int NOT NULL AUTO_INCREMENT,
  `ag_nom` varchar(45) NOT NULL,
  `ag_password` varchar(45) NOT NULL,
  `fk_se` int NOT NULL,
  `fk_ta` int NOT NULL,
  `fk_ve` char(7) DEFAULT NULL,
  PRIMARY KEY (`ag_matricule`),
  KEY `fk_AGENTS_1_idx` (`fk_se`),
  KEY `fk_AGENTS_2_idx` (`fk_ta`),
  KEY `fk_AGENTS_3_idx` (`fk_ve`),
  CONSTRAINT `fk_AGENTS_1` FOREIGN KEY (`fk_se`) REFERENCES `SECTEURS` (`se_id`),
  CONSTRAINT `fk_AGENTS_2` FOREIGN KEY (`fk_ta`) REFERENCES `TYPE_AGENT` (`ta_id`),
  CONSTRAINT `fk_AGENTS_3` FOREIGN KEY (`fk_ve`) REFERENCES `VEHICULES` (`ve_immat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AGENTS`
--

LOCK TABLES `AGENTS` WRITE;
/*!40000 ALTER TABLE `AGENTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AGENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FDRM`
--

DROP TABLE IF EXISTS `FDRM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FDRM` (
  `fk_ag` int NOT NULL,
  `fdrm_mois` tinyint NOT NULL,
  `fdrm_reception` date DEFAULT NULL,
  `fdrm_validation` date DEFAULT NULL,
  `fdrm_paiement` date DEFAULT NULL,
  `fdrm_remboursement` date DEFAULT NULL,
  `nbrj_conges` tinyint DEFAULT NULL,
  `fk_ag_comptable` int DEFAULT NULL,
  PRIMARY KEY (`fk_ag`,`fdrm_mois`),
  KEY `fk_FDRM_1_idx` (`fk_ag`),
  KEY `fk_FDRM_2_idx` (`fk_ag_comptable`),
  CONSTRAINT `fk_FDRM_1` FOREIGN KEY (`fk_ag`) REFERENCES `AGENTS` (`ag_matricule`),
  CONSTRAINT `fk_FDRM_2` FOREIGN KEY (`fk_ag_comptable`) REFERENCES `AGENTS` (`ag_matricule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FDRM`
--

LOCK TABLES `FDRM` WRITE;
/*!40000 ALTER TABLE `FDRM` DISABLE KEYS */;
/*!40000 ALTER TABLE `FDRM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FRAIS`
--

DROP TABLE IF EXISTS `FRAIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FRAIS` (
  `fr_id` int NOT NULL AUTO_INCREMENT,
  `fr_libelle_libre` varchar(45) DEFAULT NULL,
  `fr_date` date NOT NULL,
  `fr_quantite` int NOT NULL,
  `fr_montant` decimal(6,2) NOT NULL,
  `fr_taxe` decimal(6,2) NOT NULL,
  `fr_status` tinyint NOT NULL,
  `fk_tre` int DEFAULT NULL,
  `fk_mfr` int DEFAULT NULL,
  `fk_frdm_ag` int NOT NULL,
  `fk_frdm_mois` tinyint NOT NULL,
  PRIMARY KEY (`fr_id`),
  KEY `fk_FRAIS_1_idx` (`fk_tre`),
  KEY `fk_FRAIS_2_idx` (`fk_mfr`),
  KEY `fk_FRAIS_3_idx` (`fk_frdm_ag`,`fk_frdm_mois`),
  CONSTRAINT `fk_FRAIS_1` FOREIGN KEY (`fk_tre`) REFERENCES `TYPE_REFUS` (`tre_id`),
  CONSTRAINT `fk_FRAIS_2` FOREIGN KEY (`fk_mfr`) REFERENCES `MODELE_FRAIS` (`mfr_id`),
  CONSTRAINT `fk_FRAIS_3` FOREIGN KEY (`fk_frdm_ag`, `fk_frdm_mois`) REFERENCES `FDRM` (`fk_ag`, `fdrm_mois`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FRAIS`
--

LOCK TABLES `FRAIS` WRITE;
/*!40000 ALTER TABLE `FRAIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `FRAIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FRAIS_KM`
--

DROP TABLE IF EXISTS `FRAIS_KM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FRAIS_KM` (
  `fkm_id` int NOT NULL AUTO_INCREMENT,
  `fkm_cv` int NOT NULL,
  `fkm_carburant` varchar(45) NOT NULL,
  `fkm_remb` decimal(4,2) NOT NULL,
  PRIMARY KEY (`fkm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FRAIS_KM`
--

LOCK TABLES `FRAIS_KM` WRITE;
/*!40000 ALTER TABLE `FRAIS_KM` DISABLE KEYS */;
/*!40000 ALTER TABLE `FRAIS_KM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MODELE_FRAIS`
--

DROP TABLE IF EXISTS `MODELE_FRAIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MODELE_FRAIS` (
  `mfr_id` int NOT NULL COMMENT '	',
  `mfr_libelle` varchar(45) NOT NULL,
  `mfr_montant_unitaire` decimal(6,2) NOT NULL,
  PRIMARY KEY (`mfr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MODELE_FRAIS`
--

LOCK TABLES `MODELE_FRAIS` WRITE;
/*!40000 ALTER TABLE `MODELE_FRAIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `MODELE_FRAIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARAMETRES`
--

DROP TABLE IF EXISTS `PARAMETRES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PARAMETRES` (
  `pa_id` int NOT NULL AUTO_INCREMENT,
  `validite_depense` int NOT NULL,
  `clorure_envoi_fdrm` int NOT NULL,
  `nbjr_atravaille` int NOT NULL,
  PRIMARY KEY (`pa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARAMETRES`
--

LOCK TABLES `PARAMETRES` WRITE;
/*!40000 ALTER TABLE `PARAMETRES` DISABLE KEYS */;
/*!40000 ALTER TABLE `PARAMETRES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SECTEURS`
--

DROP TABLE IF EXISTS `SECTEURS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SECTEURS` (
  `se_id` int NOT NULL AUTO_INCREMENT,
  `se_libelle` varchar(45) NOT NULL,
  PRIMARY KEY (`se_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SECTEURS`
--

LOCK TABLES `SECTEURS` WRITE;
/*!40000 ALTER TABLE `SECTEURS` DISABLE KEYS */;
/*!40000 ALTER TABLE `SECTEURS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TYPE_AGENT`
--

DROP TABLE IF EXISTS `TYPE_AGENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TYPE_AGENT` (
  `ta_id` int NOT NULL AUTO_INCREMENT,
  `ta_libelle` varchar(45) NOT NULL,
  PRIMARY KEY (`ta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TYPE_AGENT`
--

LOCK TABLES `TYPE_AGENT` WRITE;
/*!40000 ALTER TABLE `TYPE_AGENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `TYPE_AGENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TYPE_REFUS`
--

DROP TABLE IF EXISTS `TYPE_REFUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TYPE_REFUS` (
  `tre_id` int NOT NULL AUTO_INCREMENT,
  `tre_libelle` varchar(45) NOT NULL,
  PRIMARY KEY (`tre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TYPE_REFUS`
--

LOCK TABLES `TYPE_REFUS` WRITE;
/*!40000 ALTER TABLE `TYPE_REFUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TYPE_REFUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VEHICULES`
--

DROP TABLE IF EXISTS `VEHICULES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VEHICULES` (
  `ve_immat` char(7) NOT NULL,
  `ve_marque` varchar(45) NOT NULL,
  `ve_model` varchar(45) NOT NULL,
  `fk_fkm` int NOT NULL,
  PRIMARY KEY (`ve_immat`),
  KEY `fk_VEHICULES_1_idx` (`fk_fkm`),
  CONSTRAINT `fk_VEHICULES_1` FOREIGN KEY (`fk_fkm`) REFERENCES `FRAIS_KM` (`fkm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VEHICULES`
--

LOCK TABLES `VEHICULES` WRITE;
/*!40000 ALTER TABLE `VEHICULES` DISABLE KEYS */;
/*!40000 ALTER TABLE `VEHICULES` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-01 14:28:13
