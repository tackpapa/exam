CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	5.5.42

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
-- Table structure for table `pokes`
--

DROP TABLE IF EXISTS `pokes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `poked_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pokes_users_idx` (`user_id`),
  KEY `poked_id_idx` (`poked_id`),
  CONSTRAINT `fk_pokes_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `poked_id` FOREIGN KEY (`poked_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokes`
--

LOCK TABLES `pokes` WRITE;
/*!40000 ALTER TABLE `pokes` DISABLE KEYS */;
INSERT INTO `pokes` VALUES (21,1,4),(22,1,4),(23,1,4),(24,2,4),(25,2,4),(26,4,4),(27,2,4),(28,1,4),(29,4,1),(30,2,1),(31,1,1),(32,2,1),(33,4,1),(34,1,1),(35,1,1),(36,1,2),(37,1,2),(38,1,2),(39,2,2),(40,2,2),(41,2,2),(42,4,2),(43,4,2),(44,4,2),(45,1,5),(46,2,5),(47,4,5),(48,2,5),(49,1,5),(50,5,6),(51,5,6),(52,5,6),(53,5,6),(54,5,6),(55,5,6),(56,4,6),(57,4,6),(58,4,6),(59,2,6),(60,1,6),(61,6,7),(62,6,7),(63,6,7),(64,6,7),(65,6,7),(66,6,7),(67,5,7),(68,5,7),(69,4,7),(70,2,7),(71,1,7),(72,7,8),(73,7,8),(74,7,8),(75,7,8),(76,7,8),(77,7,8),(78,7,8),(79,7,8),(80,7,8),(81,6,8),(82,6,8),(83,4,8),(84,2,8),(85,1,8),(86,8,9),(87,8,9),(88,8,9),(89,8,9),(90,8,9),(91,7,9),(92,7,9),(93,6,9),(94,2,9),(95,9,10),(96,9,10),(97,9,10),(98,9,10),(99,9,10),(100,9,10),(101,9,10),(102,9,10),(103,10,11),(104,10,11),(105,10,11),(106,10,11),(107,10,11),(108,10,11),(109,8,11),(110,5,11),(111,2,11),(112,1,11),(113,11,12),(114,11,12),(115,11,12),(116,11,12),(117,11,12),(118,11,12),(119,11,12),(120,11,12),(121,11,12),(122,11,12),(123,11,12),(124,10,12),(125,10,12),(126,8,12),(127,8,12),(128,8,12),(129,8,12),(130,8,12),(131,8,12),(132,12,1),(133,9,1),(134,9,1),(135,9,1),(136,9,1),(137,9,1),(138,9,1),(139,12,1),(140,12,1),(141,12,1),(142,9,1),(143,12,1),(144,9,1),(145,12,1),(146,2,1),(147,5,1),(148,7,1),(149,8,1),(150,10,1),(151,12,1),(152,1,5),(153,2,5),(154,6,5),(155,10,5);
/*!40000 ALTER TABLE `pokes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `pw` varchar(45) DEFAULT NULL,
  `birth` datetime DEFAULT NULL,
  `poked` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'kiyoung','tackpapa','caca@ca.com','jkjk','2016-05-03 00:00:00','17'),(2,'julia roberts','julia','tt@tt.com','jkjk','2016-05-04 00:00:00','17'),(4,'tony stark','tony','kk@kk.com','jkjk','2016-05-01 00:00:00','12'),(5,'ironman','ironman','aa@aa.com','jkjk','2016-05-04 00:00:00','10'),(6,'mark zuckerberb','mark z','bb@bb.com','jkjk','2016-05-05 00:00:00','10'),(7,'shon parker','parker','cc@cc.com','jkjk','2016-05-04 00:00:00','12'),(8,'matbam','matbam','dd@dd.com','jkjk','2016-05-06 00:00:00','13'),(9,'dojoman','dojo','ee@ee.com','jkjk','2016-05-03 00:00:00','16'),(10,'goodjob','lala','ff@ff.com','jkjk','2016-05-10 00:00:00','10'),(11,'melon','melon','gg@gg.com','jkjk','2016-05-03 00:00:00','11'),(12,'grapes','grapes','hh@hh.com','jkjk','2016-05-03 00:00:00','7');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-22 22:14:16
