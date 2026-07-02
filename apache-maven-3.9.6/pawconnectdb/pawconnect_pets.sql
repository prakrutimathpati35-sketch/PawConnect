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
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pets` (
  `pet_id` int NOT NULL AUTO_INCREMENT,
  `petname` varchar(45) NOT NULL,
  `species` varchar(45) NOT NULL,
  `breed` varchar(100) NOT NULL,
  `age` int NOT NULL,
  `gender` varchar(45) NOT NULL,
  `location` varchar(100) NOT NULL,
  `imageUrl` varchar(300) NOT NULL,
  PRIMARY KEY (`pet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` VALUES (1,'Max','Dog','Golden Retriever',2,'Male','Bangalore','https://tse3.mm.bing.net/th/id/OIP.9jp3vrVA5qHN5WLPI6ebQAHaLH?rs=1&pid=ImgDetMain&o=7&rm=3'),(3,'Charlie','Dog','German Shepherd',4,'Male','Delhi','https://thumbs.dreamstime.com/b/senior-german-shepherd-dog-headshot-against-blurry-green-background-portrait-beautiful-old-white-muzzle-188817290.jpg'),(4,'Daisy','Dog','Beagle',9,'Female','Chennai','https://tse4.mm.bing.net/th/id/OIP.strwfJDk3H1S6F2D3CSDUgHaHw?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3'),(5,'Rocky','Dog','Rottweiler',3,'Male','Hyderabad','https://tse4.mm.bing.net/th/id/OIP.6O-G-5WptNkv8335ymWBNwHaNL?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3'),(6,'Luna','Cat','Siamese',1,'Female','Pune','https://tse1.explicit.bing.net/th/id/OIP.dEMXTcBMUZDRUIE8E7nweAHaHi?rs=1'),(7,'Mittens','Cat','Domestic Shorthair',2,'Female','Kolkata','https://i.redd.it/81e8p94q1lv91.jpg'),(8,'Simba','Cat','Persian',6,'Male','Ahmedabad','https://st3.depositphotos.com/1594920/17246/i/450/depositphotos_172463450-stock-photo-persian-kitten-3-months-old.jpg'),(9,'Whiskers','Cat','Maine Coon',10,'Male','Jaipur','https://1.bp.blogspot.com/-ZQ9mwrVbSKg/YZppU_MWe8I/AAAAAAAAyuo/VWxm3244fM8vVtBLgnB9jQUVXXnou66dgCLcBGAsYHQ/s798/Maine%2BCoon.jpg'),(10,'Cleo','Cat','Bengal',4,'Female','Lucknow','https://dinoanimals.com/wp-content/uploads/2020/12/Bengal-cat-19.jpg'),(11,'Rio','Bird','Parrot',2,'Male','Bangalore','https://tse2.mm.bing.net/th/id/OIP.8UBYOlR_WLy5MjM8TSFx-wHaJN?rs=1'),(13,'Bubbles','Fish','Goldfish',1,'Unknown','Delhi','https://tse4.mm.bing.net/th/id/OIP.ceyEnmpB0BBGkHV_fknJ5QHaEh'),(14,'Nemo','Fish','Clownfish',2,'Male','Chennai','https://tse1.explicit.bing.net/th/id/OIP.LXy40lt24C-6jikAliYIyAHaFj'),(15,'Splash','Fish','Betta',3,'Male','Hyderabad','https://tse4.mm.bing.net/th/id/OIP.XNCqdBvIlz8dKGeHv9ZKnQHaHa'),(17,'Bella','Dog','Siberian Husky',4,'Female','Kolkata','https://th.bing.com/th/id/OIP.7YQmeo6ZRVP7tiVZ-LxNhgHaH1?o=7'),(18,'Cooper','Dog','Boxer',7,'Male','Ahmedabad','https://animalcorner.org/wp-content/uploads/2022/04/adorable-boxer-dog-posing-outdoor.jpg'),(19,'Oscar','Cat','British Shorthair',1,'Male','Surat','https://tse3.mm.bing.net/th/id/OIP.Eqh7QTgp1sXOgxr2pcJu0QHaE8?rs=1'),(21,'Smokey','Cat','Russian Blue',8,'Male','Indore','https://i.ytimg.com/vi/sxOHuHgJJVY/maxresdefault.jpg'),(22,'Kiwi','Bird','Lovebird',4,'Female','Goa','https://tse4.mm.bing.net/th/id/OIP.VsBhN5WWYcNWLVBXkdiABAAAAA?rs=1'),(23,'Sky','Bird','Cockatiel',3,'Male','Kochi','https://tse4.mm.bing.net/th/id/OIP.JjO-C-cypqzb1eoUGJPArQHaLH?rs=1'),(25,'Goldie','Fish','Golden Carp',2,'Unknown','Pune','https://thumbs.dreamstime.com/b/golden-carp-lake-72591890.jpg'),(26,'Angel','Fish','Angelfish',4,'Female','Kolkata','https://i0.wp.com/aquariumtidings.com/wp-content/uploads/2017/12/Depositphotos_67399819_original.jpg'),(29,'Tony','Dog','Pomeranian',8,'Male','Bangalore','https://static.vecteezy.com/system/resources/thumbnails/008/951/892/small/cute-puppy-pomeranian-mixed-breed-pekingese-dog-run-on-the-grass-with-happiness-photo.jpg');
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
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
