-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: pawconnect
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `adoptions`
--

DROP TABLE IF EXISTS `adoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adoptions` (
  `adoption_id` int NOT NULL AUTO_INCREMENT,
  `pet_name` varchar(100) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `adoption_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`adoption_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adoptions`
--

LOCK TABLES `adoptions` WRITE;
/*!40000 ALTER TABLE `adoptions` DISABLE KEYS */;
INSERT INTO `adoptions` VALUES (1,'Cleo','asha','asha@gmail.com','8010203040','btm','i love pets','2025-12-22 10:43:47'),(2,'Sky','asha','asha@gmail.com','8010203040','btm','i love birds','2025-12-22 10:45:12'),(3,'Nemo','nithya','nithya@gmail.com','8976543210','Agara bangalore','i love fishes','2025-12-22 10:46:44'),(4,'Feather','nikhitha','nikhithaks2004@gmail.com','8904682844','hsr layout','i love being with birds','2025-12-22 10:48:05'),(5,'Angel','Asha','asha@gmail.com','8010203040','btm','i love fishes','2025-12-22 11:00:45'),(6,'Charlie','Asha','asha@gmail.com','8010203040','btm','i love pets','2025-12-22 12:14:43'),(7,'Splash','nikhitha','nikhithaks2004@gmail.com','8904682844','#138 24th main 3rd cross near karagadamma temple agara hsr layout bangalore','i love fishes','2025-12-22 13:29:59'),(8,'Max','roshini','roshini@gmail.com','7060504030','jp nagar','i love pets','2025-12-23 08:28:06'),(9,'Smokey','Asha','asha@gmail.com','8010203040','btm','i love cats??','2025-12-29 10:49:02'),(10,'Rio','Asha','asha@gmail.com','8010203040','#138 24th main 3rd cross near karagadamma temple agara hsr layout bangalore','We love birds','2025-12-29 11:38:06'),(11,'Max','Nishchitha','nishchithaks2002@gmail.com','9080706050','agara','i love pets','2025-12-29 14:26:00'),(12,'Whiskers','Roshu','roshini997291@gmail.com','9050403020','jp nagar','i love cats','2025-12-30 07:40:17'),(13,'Chloe','Roshu','roshini998601@gmail.com','9050403020','jp nagar','i love cats','2025-12-30 07:53:09'),(14,'Mittens','Roshu','roshini998601@gmail.com','9050403020','jp nagar','i love cats','2025-12-30 07:54:01'),(15,'Max','Sandesh HM','sandeshhm1994@gmail.com','08970890145','Bilekahalli,Bannerghatta Road','Simply','2026-03-12 11:40:05'),(16,'Charlie','Preetha','preethamadkuru02@gmail.com','864526541','Udupi','I love pets','2026-03-12 11:44:01'),(17,'Daisy','somesh','someshkhavasi72@gmail.com','8105252884','Btm 2nd Stage 7th cross','i love pets','2026-03-13 06:01:23'),(18,'Bella','sagar','someshkhavasi72@gmail.com','8105252884','btm 2nd stage','i love pet','2026-03-13 06:03:08'),(19,'Daisy','sagar','someshkhavasi72@gmail.com','8105252884','Btm 2nd Stage 7th cross','Simply','2026-03-13 06:04:12'),(20,'Max','Neeta','neetatp2004@gmail.com','7656787624','Bangalore','Its Cute','2026-04-24 11:51:18'),(21,'Daisy','Farhan','farhanbellary6@gmail.com','8737837822','Bangalore','It looks good','2026-04-25 08:58:52'),(22,'Charlie','Urmila','urmilaediga3225@gmail.com','8737837822','Bangalore','My parents one more dog','2026-04-28 06:17:00'),(23,'Daisy','Urmila','urmilaediga3225@gmail.com','8737837822','Bangalore','Simply','2026-04-28 06:27:18'),(24,'Max','Khushi','khushiamin9595@gmail.cpm','8737837822','Bangalore','Simply','2026-05-02 07:04:32'),(25,'Max','Khushi','khushiamin9595@gmail.com','8737837822','Bangalore','Simply','2026-05-02 07:05:24');
/*!40000 ALTER TABLE `adoptions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-02 12:47:56
