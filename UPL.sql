-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: UPL
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `arbitr`
--

DROP TABLE IF EXISTS `arbitr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arbitr` (
  `id_arbitra` int(11) NOT NULL,
  `imya` varchar(255) NOT NULL,
  `prizvyshche` varchar(255) NOT NULL,
  `natsionalnist` varchar(255) NOT NULL,
  PRIMARY KEY (`id_arbitra`),
  KEY `idx_arbitr_natsionalnist` (`natsionalnist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbitr`
--

LOCK TABLES `arbitr` WRITE;
/*!40000 ALTER TABLE `arbitr` DISABLE KEYS */;
/*!40000 ALTER TABLE `arbitr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gol`
--

DROP TABLE IF EXISTS `gol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gol` (
  `id_gola` int(11) NOT NULL,
  `id_gravtsya` int(11) NOT NULL,
  `id_matchu` int(11) NOT NULL,
  `khvylyna` int(11) NOT NULL CHECK (`khvylyna` >= 0),
  PRIMARY KEY (`id_gola`),
  KEY `id_gravtsya` (`id_gravtsya`),
  KEY `id_matchu` (`id_matchu`),
  KEY `idx_gol_khvylyna` (`khvylyna`),
  CONSTRAINT `gol_ibfk_1` FOREIGN KEY (`id_gravtsya`) REFERENCES `gravets` (`id_gravtsya`),
  CONSTRAINT `gol_ibfk_2` FOREIGN KEY (`id_matchu`) REFERENCES `matchi` (`id_matchu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gol`
--

LOCK TABLES `gol` WRITE;
/*!40000 ALTER TABLE `gol` DISABLE KEYS */;
/*!40000 ALTER TABLE `gol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gravets`
--

DROP TABLE IF EXISTS `gravets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gravets` (
  `id_gravtsya` int(11) NOT NULL,
  `imya` varchar(255) NOT NULL,
  `prizvyshche` varchar(255) NOT NULL,
  `id_komandy` int(11) NOT NULL,
  `nomer` int(11) NOT NULL CHECK (`nomer` > 0),
  `pozytsiya` varchar(255) NOT NULL,
  PRIMARY KEY (`id_gravtsya`),
  KEY `id_komandy` (`id_komandy`),
  KEY `idx_gravets_nomer` (`nomer`),
  KEY `idx_gravets_pozytsiya` (`pozytsiya`),
  CONSTRAINT `gravets_ibfk_1` FOREIGN KEY (`id_komandy`) REFERENCES `komanda` (`id_komandy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gravets`
--

LOCK TABLES `gravets` WRITE;
/*!40000 ALTER TABLE `gravets` DISABLE KEYS */;
/*!40000 ALTER TABLE `gravets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kartka`
--

DROP TABLE IF EXISTS `kartka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kartka` (
  `id_kartky` int(11) NOT NULL,
  `id_gravtsya` int(11) NOT NULL,
  `id_matchu` int(11) NOT NULL,
  `khvylyna` int(11) NOT NULL CHECK (`khvylyna` >= 0),
  `typ` varchar(255) NOT NULL,
  PRIMARY KEY (`id_kartky`),
  KEY `id_gravtsya` (`id_gravtsya`),
  KEY `id_matchu` (`id_matchu`),
  KEY `idx_kartka_typ` (`typ`),
  KEY `idx_kartka_khvylyna` (`khvylyna`),
  CONSTRAINT `kartka_ibfk_1` FOREIGN KEY (`id_gravtsya`) REFERENCES `gravets` (`id_gravtsya`),
  CONSTRAINT `kartka_ibfk_2` FOREIGN KEY (`id_matchu`) REFERENCES `matchi` (`id_matchu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kartka`
--

LOCK TABLES `kartka` WRITE;
/*!40000 ALTER TABLE `kartka` DISABLE KEYS */;
/*!40000 ALTER TABLE `kartka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komanda`
--

DROP TABLE IF EXISTS `komanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komanda` (
  `id_komandy` int(11) NOT NULL,
  `nazva` varchar(255) NOT NULL,
  `id_trenera` int(11) NOT NULL,
  `natsionalnist` varchar(255) NOT NULL,
  PRIMARY KEY (`id_komandy`),
  UNIQUE KEY `nazva` (`nazva`),
  UNIQUE KEY `id_trenera` (`id_trenera`),
  KEY `idx_komanda_nazva` (`nazva`),
  CONSTRAINT `komanda_ibfk_1` FOREIGN KEY (`id_trenera`) REFERENCES `trener` (`id_trenera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komanda`
--

LOCK TABLES `komanda` WRITE;
/*!40000 ALTER TABLE `komanda` DISABLE KEYS */;
/*!40000 ALTER TABLE `komanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchi`
--

DROP TABLE IF EXISTS `matchi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matchi` (
  `id_matchu` int(11) NOT NULL,
  `id_komandy_1` int(11) NOT NULL,
  `id_komandy_2` int(11) NOT NULL,
  `id_arbitra` int(11) NOT NULL,
  `data` date NOT NULL,
  `mistse` varchar(255) NOT NULL,
  `rezultat` varchar(255) DEFAULT NULL,
  `stadiya` varchar(255) NOT NULL,
  PRIMARY KEY (`id_matchu`),
  KEY `id_komandy_1` (`id_komandy_1`),
  KEY `id_komandy_2` (`id_komandy_2`),
  KEY `id_arbitra` (`id_arbitra`),
  KEY `idx_matchi_data` (`data`),
  KEY `idx_matchi_stadiya` (`stadiya`),
  CONSTRAINT `matchi_ibfk_1` FOREIGN KEY (`id_komandy_1`) REFERENCES `komanda` (`id_komandy`),
  CONSTRAINT `matchi_ibfk_2` FOREIGN KEY (`id_komandy_2`) REFERENCES `komanda` (`id_komandy`),
  CONSTRAINT `matchi_ibfk_3` FOREIGN KEY (`id_arbitra`) REFERENCES `arbitr` (`id_arbitra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchi`
--

LOCK TABLES `matchi` WRITE;
/*!40000 ALTER TABLE `matchi` DISABLE KEYS */;
/*!40000 ALTER TABLE `matchi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trener`
--

DROP TABLE IF EXISTS `trener`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trener` (
  `id_trenera` int(11) NOT NULL,
  `imya` varchar(255) NOT NULL,
  `prizvyshche` varchar(255) NOT NULL,
  `data_narodzhennya` date NOT NULL,
  `natsionalnist` varchar(255) NOT NULL,
  PRIMARY KEY (`id_trenera`),
  KEY `idx_trener_natsionalnist` (`natsionalnist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trener`
--

LOCK TABLES `trener` WRITE;
/*!40000 ALTER TABLE `trener` DISABLE KEYS */;
/*!40000 ALTER TABLE `trener` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turnirna_tablytsya`
--

DROP TABLE IF EXISTS `turnirna_tablytsya`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turnirna_tablytsya` (
  `id_tablytsi` int(11) NOT NULL,
  `id_komandy` int(11) NOT NULL,
  `kilkist_igor` int(11) NOT NULL CHECK (`kilkist_igor` >= 0),
  `kilkist_peremoh` int(11) NOT NULL CHECK (`kilkist_peremoh` >= 0),
  `kilkist_nychiyih` int(11) NOT NULL CHECK (`kilkist_nychiyih` >= 0),
  `kilkist_porazok` int(11) NOT NULL CHECK (`kilkist_porazok` >= 0),
  `kilkist_ochok` int(11) NOT NULL CHECK (`kilkist_ochok` >= 0),
  PRIMARY KEY (`id_tablytsi`),
  UNIQUE KEY `id_komandy` (`id_komandy`),
  KEY `idx_tablytsya_ochky` (`kilkist_ochok`),
  CONSTRAINT `turnirna_tablytsya_ibfk_1` FOREIGN KEY (`id_komandy`) REFERENCES `komanda` (`id_komandy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turnirna_tablytsya`
--

LOCK TABLES `turnirna_tablytsya` WRITE;
/*!40000 ALTER TABLE `turnirna_tablytsya` DISABLE KEYS */;
/*!40000 ALTER TABLE `turnirna_tablytsya` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-29 12:23:27
