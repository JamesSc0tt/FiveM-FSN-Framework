-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: server_1
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Table structure for table `fsn_properties`
--

DROP TABLE IF EXISTS `fsn_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsn_properties` (
  `property_id` int(11) NOT NULL AUTO_INCREMENT,
  `property_name` text NOT NULL,
  `property_owner` int(11) NOT NULL,
  `property_coowners` text NOT NULL,
  `property_inventory` text NOT NULL,
  `property_weapons` text NOT NULL,
  `property_money` int(11) NOT NULL,
  `property_expiry` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsn_properties`
--

LOCK TABLES `fsn_properties` WRITE;
/*!40000 ALTER TABLE `fsn_properties` DISABLE KEYS */;
INSERT INTO `fsn_properties` VALUES (1,'Darnell Bros Factory',2183,'[\"31\",\"2785\",\"2697\",\"2349\",\"2153\",\"3281\"]','{\"2g_weed\":{\"item_name\":\"2G Weed\",\"amount\":278},\"lockpick\":{\"item_name\":\"Lockpick\",\"amount\":38},\"coffee\":{\"item_name\":\"Coffee\",\"amount\":1},\"water\":{\"item_name\":\"Water\",\"amount\":25},\"packaged_cocaine\":{\"item_name\":\"Packaged Cocaine\",\"amount\":12},\"microwave_burrito\":{\"item_name\":\"Microwave Burrito\",\"amount\":2},\"joint\":{\"item_name\":\"Joint\",\"amount\":208},\"dirty_money\":{\"item_name\":\"Dirty money\",\"amount\":9124},\"cupcake\":{\"item_name\":\"Cupcake\",\"amount\":1}}','{\"WEAPON_VINTAGEPISTOL\":{\"hashKey\":137902532,\"amount\":1}}',183170,1567209975),(2,'Micheals Mansion',183,'[\"4\",\"65\",\"45\",\"28\",\"553\",\"\",\"64\",\"621\",\"1665\",\"38\",\"1610\",\"73\",\"622\",\"2354\",\"175\"]','{\"handcuffs\":{\"item_name\":\"Handcuffs\",\"amount\":4},\"dirty_money\":{\"item_name\":\"Dirty money\",\"amount\":758},\"repair_kit\":{\"item_name\":\"Repair Kit\",\"amount\":3},\"lockpick\":{\"item_name\":\"Lockpick\",\"amount\":6}}','{\"WEAPON_PISTOL50\":{\"amount\":1,\"hashKey\":-1716589765}}',0,1567225516),(3,'Trevors Trailer',2734,'[\"30\"]','{\"coffee\":{\"amount\":4,\"item_name\":\"Coffee\"},\"cupcake\":{\"amount\":5,\"item_name\":\"Cupcake\"}}','{\"WEAPON_SAWNOFFSHOTGUN\":{\"amount\":4,\"hashKey\":2017895192},\"WEAPON_COMPACTRIFLE\":{\"amount\":1,\"hashKey\":1649403952},\"WEAPON_COMBATPISTOL\":{\"amount\":20,\"hashKey\":1593441988},\"WEAPON_PISTOL50\":{\"amount\":6,\"hashKey\":-1716589765}}',0,1567640550),(4,'Yellowjack',1177,'[\"469\",\"171\",\"2044\"]','{\"dirty_money\":{\"amount\":44444,\"item_name\":\"Dirty money\"},\"meth_rocks\":{\"amount\":213,\"item_name\":\"Meth Rocks\"},\"repair_kit\":{\"amount\":2,\"item_name\":\"Repair Kit\"},\"joint\":{\"amount\":12,\"item_name\":\"Joint\"},\"phosphorus\":{\"amount\":42,\"item_name\":\"Phosphorus\"},\"acetone\":{\"amount\":16,\"item_name\":\"Acetone\"},\"lockpick\":{\"amount\":8,\"item_name\":\"Lockpick\"},\"packaged_cocaine\":{\"amount\":1,\"item_name\":\"Packaged Cocaine\"}}','{}',0,1567129571),(5,'Shitbag\'s Flat',2349,'[\"\",\"1377\",\"171\",\"1177\",\"2151\",\"469\"]','{\"phosphorus\":{\"amount\":81,\"item_name\":\"Phosphorus\"}}','{}',0,1567476431),(6,'Franklin\'s aunt house',171,'[\"#6\",\"1177\",\"2044\",\"469\",\"766\"]','{\"acetone\":{\"item_name\":\"Acetone\",\"amount\":425},\"phosphorus\":{\"item_name\":\"Phosphorus\",\"amount\":18}}','{}',0,1567199909),(7,'Stripclub',622,'[\"2354\",\"29\",\"3003\"]','{\"joint\":{\"item_name\":\"Joint\",\"amount\":384}}','{}',0,1567737544),(8,'Devins Garage',27,'[\"259\"]','{}','{}',0,1567467434),(9,'Lifeinvader Office',3305,'[]','{\"water\":{\"item_name\":\"Water\",\"amount\":3},\"dirty_money\":{\"item_name\":\"Dirty money\",\"amount\":12000},\"lockpick\":{\"item_name\":\"Lockpick\",\"amount\":3}}','{}',0,1567598741);
/*!40000 ALTER TABLE `fsn_properties` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-28 18:36:31
