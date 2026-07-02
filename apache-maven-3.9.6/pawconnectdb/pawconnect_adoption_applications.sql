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
-- Table structure for table `adoption_applications`
--

DROP TABLE IF EXISTS `adoption_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adoption_applications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pet_id` int NOT NULL,
  `full_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` bigint NOT NULL,
  `address` varchar(250) NOT NULL,
  `message` varchar(250) DEFAULT NULL,
  `pet_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pet_id_idx` (`pet_id`),
  CONSTRAINT `pet_id` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`pet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adoption_applications`
--

LOCK TABLES `adoption_applications` WRITE;
/*!40000 ALTER TABLE `adoption_applications` DISABLE KEYS */;
INSERT INTO `adoption_applications` VALUES (1,1,'Nikhitha','nikhithaks2004@gmail.com',8904682844,'#138 24th main 3rd cross near karagadamma temple agara hsr layout bangalore','i love pets','Max'),(4,4,'nithya','nithya@gmail.com',8976543210,'Agara bangalore','i love pets and i will take care','Daisy'),(5,5,'Nikhitha','nikhithaks2004@gmail.com',8904682844,'#138 24th main 3rd cross near karagadamma temple agara hsr layout bangalore','i love pets','Rocky'),(6,17,'roshini','roshini@gmail.com',7060504030,'jp nagar bangalore','i love pets','Bella'),(7,1,'roshini','roshini@gmail.com',7060504030,'jp nagar,bangalore','i love pets','Max'),(8,17,'nithya','nithya@gmail.com',8976543210,'bangalore','i love pets','Bella'),(9,1,'roshini','roshini@gmail.com',7060504030,'jp nagar','i love pets','Max'),(10,10,'roshini','roshini@gmail.com',7060504030,'jp nagar','i love pets','Cleo'),(11,8,'Asha','asha@gmail.com',8010203040,'BTM ','i love pets','Simba'),(12,17,'Asha','asha@gmail.com',8010203040,'btm','love ptes','Bella'),(13,11,'Asha','asha@gmail.com',8010203040,'BTM ','i love birds','Rio'),(14,18,'nithya','nithya@gmail.com',8976543210,'Agara bangalore','i love pets','Cooper'),(15,10,'asha','asha@gmail.com',8010203040,'btm','i love pets','Cleo'),(16,23,'asha','asha@gmail.com',8010203040,'btm','i love birds','Sky'),(17,14,'nithya','nithya@gmail.com',8976543210,'Agara bangalore','i love fishes','Nemo'),(19,26,'Asha','asha@gmail.com',8010203040,'btm','i love fishes','Angel'),(20,3,'Asha','asha@gmail.com',8010203040,'btm','i love pets','Charlie'),(21,15,'nikhitha','nikhithaks2004@gmail.com',8904682844,'#138 24th main 3rd cross near karagadamma temple agara hsr layout bangalore','i love fishes','Splash'),(22,1,'roshini','roshini@gmail.com',7060504030,'jp nagar','i love pets','Max'),(23,21,'Asha','asha@gmail.com',8010203040,'btm','i love cats??','Smokey'),(24,11,'Asha','asha@gmail.com',8010203040,'#138 24th main 3rd cross near karagadamma temple agara hsr layout bangalore','We love birds','Rio'),(25,1,'Nishchitha','nishchithaks2002@gmail.com',9080706050,'agara','i love pets','Max'),(26,9,'Roshu','roshini997291@gmail.com',9050403020,'jp nagar','i love cats','Whiskers'),(28,7,'Roshu','roshini998601@gmail.com',9050403020,'jp nagar','i love cats','Mittens'),(29,1,'Sandesh HM','sandeshhm1994@gmail.com',8970890145,'Bilekahalli,Bannerghatta Road','Simply','Max'),(30,3,'Preetha','preethamadkuru02@gmail.com',864526541,'Udupi','I love pets','Charlie'),(31,4,'somesh','someshkhavasi72@gmail.com',8105252884,'Btm 2nd Stage 7th cross','i love pets','Daisy'),(32,17,'sagar','someshkhavasi72@gmail.com',8105252884,'btm 2nd stage','i love pet','Bella'),(33,4,'sagar','someshkhavasi72@gmail.com',8105252884,'Btm 2nd Stage 7th cross','Simply','Daisy'),(34,1,'Neeta','neetatp2004@gmail.com',7656787624,'Bangalore','Its Cute','Max'),(35,4,'Farhan','farhanbellary6@gmail.com',8737837822,'Bangalore','It looks good','Daisy'),(36,3,'Urmila','urmilaediga3225@gmail.com',8737837822,'Bangalore','My parents one more dog','Charlie'),(37,4,'Urmila','urmilaediga3225@gmail.com',8737837822,'Bangalore','Simply','Daisy'),(38,1,'Khushi','khushiamin9595@gmail.cpm',8737837822,'Bangalore','Simply','Max'),(39,1,'Khushi','khushiamin9595@gmail.com',8737837822,'Bangalore','Simply','Max');
/*!40000 ALTER TABLE `adoption_applications` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-02 12:47:55
