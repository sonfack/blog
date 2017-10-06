-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.5.47-0+deb7u1

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id_categories` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` text,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_categories`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Education civique',' ',1),(2,'Volontarial',' ',1),(3,'Insertion social',' ',1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id_comments` int(11) NOT NULL AUTO_INCREMENT,
  `users` int(11) DEFAULT NULL,
  `comments` longtext,
  `comments_date` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `posts_id_posts` int(11) NOT NULL,
  PRIMARY KEY (`id_comments`,`posts_id_posts`),
  KEY `fk_comments_posts1` (`posts_id_posts`),
  CONSTRAINT `fk_comments_posts1` FOREIGN KEY (`posts_id_posts`) REFERENCES `posts` (`id_posts`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,NULL,NULL,0,NULL,1),(2,NULL,'test 6',0,NULL,1),(3,NULL,'merci pour l information',0,NULL,1),(4,NULL,'test ici moi aussi ',0,NULL,14),(5,NULL,'new comment',0,NULL,18),(8,NULL,'new timestamp',0,NULL,18),(11,NULL,'try again time',1488262102,NULL,18),(14,NULL,'comment time insertion ',1488262331,NULL,21),(17,NULL,NULL,1488262825,NULL,21),(20,NULL,NULL,1488262882,NULL,21),(23,NULL,NULL,1488263119,NULL,21),(26,NULL,NULL,1488263128,NULL,21),(29,NULL,NULL,1488263287,NULL,21),(32,NULL,NULL,1488263316,NULL,21),(35,NULL,NULL,1488263515,NULL,21),(36,NULL,'ok je confirme',1488566604,NULL,1),(37,NULL,'',1489396028,NULL,1),(40,2,'am sapiente nemo saepe quibusdam sit excepturi nam quia corporis eligendi eos magni recusandae laborum minus inventore?',1489399191,NULL,23),(43,2,'setesfsdfsdfsporis eligendi eos magni recusandae laborum minus inventore?',1489400298,NULL,44),(44,2,'merci merci ',1490088637,NULL,44),(45,2,'toi this is the comment fo this issue',1490209431,NULL,49),(48,2,'toi this is the comment fo this issue',1490209568,NULL,49),(51,2,'toi this is the comment fo this issue',1490209584,NULL,49),(54,2,'',1490209635,NULL,45),(57,2,'',1490209638,NULL,45),(60,2,'',1490209641,NULL,45),(63,2,'',1490209643,NULL,45),(66,2,'',1490209644,NULL,45),(69,2,'',1490209645,NULL,45),(72,2,'',1490209649,NULL,45),(75,2,'qsdfmjfsdf qsmdfjsmdlfjsd fds',1490209665,NULL,45),(78,2,'',1490209686,NULL,45),(81,NULL,'',1490209736,NULL,45),(82,2,'test de commentaires ',1491327037,NULL,45),(83,2,'je suis avec Ali',1492954102,NULL,45),(84,2,'je sais',1494097788,NULL,50);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id_files` int(11) NOT NULL AUTO_INCREMENT,
  `files` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `comments_id_comments` int(11) NOT NULL,
  PRIMARY KEY (`id_files`,`comments_id_comments`),
  KEY `fk_files_comments1` (`comments_id_comments`),
  CONSTRAINT `fk_files_comments1` FOREIGN KEY (`comments_id_comments`) REFERENCES `comments` (`id_comments`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'admin','Administrator'),(2,'members','General User');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempts`
--

LOCK TABLES `login_attempts` WRITE;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id_posts` int(11) NOT NULL AUTO_INCREMENT,
  `users` int(11) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `body` longtext,
  `pub_date` int(11) DEFAULT NULL,
  `update_date` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `categories_id_categories` int(11) NOT NULL,
  PRIMARY KEY (`id_posts`,`categories_id_categories`),
  KEY `fk_posts_categories` (`categories_id_categories`),
  CONSTRAINT `fk_posts_categories` FOREIGN KEY (`categories_id_categories`) REFERENCES `categories` (`id_categories`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,2,'Test post','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore, perspiciatis adipisci accusamus laudantium odit aliquam repellat tempore quos aspernatur vero.',0,0,1,1),(2,2,NULL,NULL,NULL,NULL,NULL,1),(5,NULL,NULL,'ici test post',NULL,NULL,NULL,1),(8,NULL,NULL,NULL,NULL,NULL,1,1),(11,NULL,NULL,NULL,0,NULL,1,1),(14,NULL,'edu ','this is edu',0,NULL,1,1),(17,NULL,'Volonta','ici volontariat des jeunes',0,NULL,1,2),(18,NULL,'social ','social au cameroon',0,NULL,1,3),(21,NULL,'time insertion','new time insertion',1488262306,NULL,1,3),(22,NULL,'sdfgsqd','sdfsdfsdf',1488272774,NULL,1,1),(23,NULL,'Education ','Education des jeunes',1489398010,NULL,1,1),(26,NULL,'Education ','Education des jeunes',1489398098,NULL,1,1),(29,NULL,'volong','is vooflon qmsdjfdf',1489398815,NULL,1,2),(32,2,'ssss','sdfsfqdfsdf\r\nqsfsdfsdf\r\nsdfsdf',1489399044,NULL,1,1),(35,2,NULL,NULL,1489399069,NULL,1,1),(38,2,'kkkkkkkki','sdfsdfqsfsdfsdf',1489399272,NULL,1,1),(41,2,'kkkkkkkki','sdfsdfqsfsdfsdf',1489399330,NULL,1,1),(44,2,'therry','sfqsdfsdfsdfsd',1489400279,NULL,1,1),(45,2,'ali','je suis chez ali',1490088662,NULL,1,3),(46,5,'oui me','how is me ? ',1490207668,NULL,1,1),(49,5,'volontaire','who are the volontaires ? ',1490207737,NULL,1,2),(50,4,'new ','vllnqsdfjsdfsdf',1490268632,NULL,1,2),(51,2,'Mon Ali','Nouveau sujet avec Ali',1492954138,NULL,1,1);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'127.0.0.1','administrator','015dffee82c15582c88b4d6a2692deaa1fa9d0c2','53AVEUa6k3bTMeMtoiVKmO','admin@admin.com','',NULL,NULL,NULL,1268889823,1505557030,1,'Admin','istrator','ADMIN','0'),(2,'192.168.1.254',NULL,'ff4b133c1269ee9299e82676b1cc9d15204958af','7zkRukXwytxs8n2EFstjJe','sss_sonfack@ckomsa.com',NULL,NULL,NULL,NULL,1488677771,1505556903,1,'Serge','SONFACK SOUNCHIO','MINJEC/CELINFO','655446389'),(3,'192.168.1.254',NULL,'5134f6eefa0a46e2653a6e473f7cb1b200dcbab2','bfN23e5CNxn9ncSEiwCp/e','aurelie@info.net',NULL,NULL,NULL,NULL,1490099409,NULL,0,'Aurelie','Nguemo','MINJEC/CND','655667788'),(4,'192.168.1.254',NULL,'f7b7795ac821cb9933fd6d2fc10453531e6c1f0f','w9ikrwwt8Mq4JSEq73fJQe','thierryotis@yahoo.fr',NULL,NULL,NULL,NULL,1490099502,1490268605,1,'thierry ','otis','minjec','333333111111'),(5,'192.168.1.254',NULL,'d26630924eb252606f5520358cb75c9367b1e626','c9WW4QcWGxoVIIKrKLHgSe','techa@info.net',NULL,NULL,NULL,NULL,1490207593,1490207646,1,'thierry','techa','MINJEC/DAJ','55667788');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`),
  CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES (1,1,1),(2,1,2),(3,2,2),(4,3,2),(5,4,2),(6,5,2);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-06 15:32:26
