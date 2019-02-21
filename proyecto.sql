-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: proyecto
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add orientacion',7,'add_orientacion'),(20,'Can change orientacion',7,'change_orientacion'),(21,'Can delete orientacion',7,'delete_orientacion'),(22,'Can add alumno',8,'add_alumno'),(23,'Can change alumno',8,'change_alumno'),(24,'Can delete alumno',8,'delete_alumno'),(25,'Can add director',9,'add_director'),(26,'Can change director',9,'change_director'),(27,'Can delete director',9,'delete_director'),(28,'Can add proyecto',10,'add_proyecto'),(29,'Can change proyecto',10,'change_proyecto'),(30,'Can delete proyecto',10,'delete_proyecto'),(31,'Can add plan',11,'add_plan'),(32,'Can change plan',11,'change_plan'),(33,'Can delete plan',11,'delete_plan');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$xBLtfFVXr7Z3$nnwISfpjpKDxFWDYNJzP/lDCdd2F1OS2q5R3bjSfxvw=','2019-01-04 16:42:44',1,'sistemas','','','gtrivisonno@lacapital.com.ar',1,1,'2018-03-24 22:39:59'),(2,'pbkdf2_sha256$20000$RLkEWad0zCPv$8/dDsGJn1Zjk4O898Jwm9CJtQRlYRs0Oi8rsiZBXPng=','2019-01-02 15:24:59',1,'agentile','Aldo','Gentile','agentile@lacapital.com.ar',1,1,'2018-03-24 23:59:46'),(3,'pbkdf2_sha256$20000$9SmzD5vduAX1$tFjhZgdkqHaz6LXKPycr7IlgwEncYfDkFJkviynd2xg=','2018-05-16 00:24:42',1,'anovello','','','',1,1,'2018-03-27 23:34:51'),(4,'pbkdf2_sha256$20000$kDfax9Jf05yV$98Z0B7vWq9u417JDG3nS1yASI69iMmqe/nGIJcGtnII=',NULL,0,'proyectos-eie','','','',0,1,'2018-05-13 16:53:19'),(5,'pbkdf2_sha256$36000$Gcs0q36z8wRQ$owjG1zBsjJS4jL+TkQOhRrNslI8sm5HY3xu4HRYZk2M=','2019-01-13 23:47:19',1,'cgallo','','','cgallo@lacapital.com.ar',1,1,'2019-01-13 00:58:23');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (3,3,1);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-03-24 22:41:38','1','Plan 99',1,'',7,1),(2,'2018-03-24 22:41:56','2','Comunicaciones',1,'',7,1),(3,'2018-03-24 22:42:05','3','Control',1,'',7,1),(4,'2018-03-24 22:42:11','4','Digital',1,'',7,1),(5,'2018-03-24 22:42:58','6','Diseño electrónico',1,'',7,1),(6,'2018-03-24 22:43:28','1','Gentile Aldo',1,'',9,1),(7,'2018-03-24 22:44:08','1','Almiron Nehuen',1,'',8,1),(8,'2018-03-24 22:49:15','1','Prueba - Gentile Aldo',1,'',10,1),(9,'2018-03-24 23:08:56','2','Falco Eduardo',1,'',9,1),(10,'2018-03-24 23:14:42','7','Plan 96',1,'',7,1),(11,'2018-03-24 23:59:46','2','agentile',1,'',4,1),(12,'2018-03-25 00:00:04','2','agentile',2,'Modifica first_name, last_name, email, is_staff y is_superuser.',4,1),(13,'2018-03-25 00:00:58','2','Falco Eduardo',3,'',9,1),(14,'2018-03-25 00:02:12','4','Barria Cardenas Alex',2,'Modifica orientacion.',8,1),(15,'2018-03-25 00:02:22','5','Bureu Clara',2,'Modifica orientacion.',8,1),(16,'2018-03-25 00:02:33','6','Carnevale Ignacio',2,'Modifica orientacion.',8,1),(17,'2018-03-25 00:02:43','7','Casá José',2,'Modifica orientacion.',8,1),(18,'2018-03-25 00:03:21','8','Cavalieri Jun Ignacio',2,'Modifica orientacion.',8,1),(19,'2018-03-25 00:03:31','9','Chavarini Augusto',2,'Modifica orientacion.',8,1),(20,'2018-03-25 00:03:41','10','Chaya Ian',2,'Modifica orientacion.',8,1),(21,'2018-03-25 00:03:53','11','Depetris Augusto',2,'Modifica orientacion.',8,1),(22,'2018-03-25 00:04:05','12','Díaz Paula',2,'Modifica orientacion.',8,1),(23,'2018-03-25 00:04:17','13','Dominguez Mauro',2,'Modifica orientacion.',8,1),(24,'2018-03-25 00:04:33','15','Entesano Francisco',2,'Modifica orientacion.',8,1),(25,'2018-03-27 23:34:51','3','anovello',1,'',4,2),(26,'2018-03-27 23:35:32','3','Novello Armando',1,'',9,2),(27,'2018-03-27 23:35:53','4','Geninatti Sergio',1,'',9,2),(28,'2018-03-27 23:36:39','6','Romero Monica',1,'',9,2),(29,'2018-03-27 23:36:55','6','Romero Monica',2,'No ha modificado ningún campo.',9,2),(30,'2018-03-27 23:37:12','7','Vazquez Andres',1,'',9,2),(31,'2018-03-27 23:37:29','8','Gomez Juan Carlos',1,'',9,2),(32,'2018-03-27 23:37:46','9','Miyara Federico',1,'',9,2),(33,'2018-03-27 23:38:05','10','Mare Renzo',1,'',9,2),(34,'2018-03-27 23:38:19','11','Iglesias Natalia',1,'',9,2),(35,'2018-03-27 23:38:34','12','Arraigada Fernando',1,'',9,2),(36,'2018-03-27 23:38:50','13','Simon Jose Luis',1,'',9,2),(37,'2018-03-27 23:41:37','14','Pastelleto Sergio',1,'',9,2),(38,'2018-03-27 23:41:48','15','Molina Hector',1,'',9,2),(39,'2018-03-27 23:42:01','16','Miro Veronica',1,'',9,2),(40,'2018-03-27 23:42:22','17','Rubio Scola Eduardo',1,'',9,2),(41,'2018-03-27 23:44:41','18','Alba Daniel',1,'',9,2),(42,'2018-03-27 23:44:54','19','Cavello Javier',1,'',9,2),(43,'2018-03-27 23:45:40','20','Corti Rosa',1,'',9,2),(44,'2018-03-27 23:45:51','21','Junco Sergio',1,'',9,2),(45,'2018-03-29 18:10:24','16','Miro Verónica',2,'Modifica nombre.',9,1),(46,'2018-03-29 18:10:37','6','Romero Mónica',2,'Modifica nombre.',9,1),(47,'2018-04-03 23:57:14','2','Comunicación VX2: estudio e implementación del protocolo IEEE802.11p utilizando tecnologia de Radio Definida por Software  (SDR) - Iglesias Natalia',1,'',10,2),(48,'2018-04-03 23:59:39','3','Desarrollo de Instrumentos Digitalesde posición aeronáutica - Gentile Aldo',1,'',10,2),(49,'2018-04-04 00:01:45','40','Racca Ignacio',1,'',8,2),(50,'2018-04-04 00:02:12','3','Desarrollo de Instrumentos Digitalesde posición aeronáutica - Gentile Aldo',2,'Modifica alumnos.',10,2),(51,'2018-05-12 18:09:41','41','Manavella Matías Nicolas',1,'',8,2),(52,'2018-05-12 18:09:51','41','Manavella Matías Nicolas',2,'No ha modificado ningún campo.',8,2),(53,'2018-05-12 18:10:50','42','Acerbo Agustín',1,'',8,2),(54,'2018-05-12 18:12:13','43','Rozas Martín ',1,'',8,2),(55,'2018-05-12 18:14:09','4','Sistema electrónico de control de procesos - Pastelleto Sergio',1,'',10,2),(56,'2018-05-12 18:15:16','44','Soria Leandro',1,'',8,2),(57,'2018-05-12 18:16:53','22','Pizzi Analia',1,'',9,2),(58,'2018-05-12 18:17:20','5','Sistema de enlace inlámbrio de bajo consumo - Molina Hector',1,'',10,2),(59,'2018-05-13 16:52:30','3','anovello',2,'Modifica user_permissions.',4,2),(60,'2018-05-13 16:53:19','4','proyectos-eie',1,'',4,2),(61,'2018-05-16 00:22:57','3','anovello',2,'Modifica password.',4,2),(62,'2018-05-16 00:24:16','3','anovello',2,'Modifica is_staff.',4,2),(63,'2018-05-16 00:26:00','3','anovello',2,'Modifica is_superuser.',4,2),(64,'2018-05-16 00:27:31','45','Soraiz Ana Paula',1,'',8,2),(65,'2018-05-16 00:28:10','23','Feroldi Diego',1,'',9,2),(66,'2018-05-16 00:32:39','6','Sistema de Gestión Energia para Microredes Inteligentes - Romero Mónica',1,'',10,2),(67,'2018-05-21 22:31:23','24','Migoni Gustavo',1,'',9,2),(68,'2018-05-21 22:32:12','25','Nacusse Matías',1,'',9,2),(69,'2018-05-21 22:32:52','7','control de trayectoria para navegación autónoma de robot móvil con plataform omniwhell - Nacusse Matías',1,'',10,2),(70,'2018-05-21 22:43:55','8','Medición de respuesta al impulso y su aplicación a un plugin de reververación - Miyara Federico',1,'',10,2),(71,'2018-05-21 23:01:10','46','Mujica martín',1,'',8,2),(72,'2018-05-21 23:02:16','26','Kofman Ernesto',1,'',9,2),(73,'2018-05-21 23:03:25','9','Desarrollo e implementacón de un sistema de sensado y posicionamiento en prototipo de robot desmalezador - Kofman Ernesto',1,'',10,2),(74,'2018-05-21 23:05:31','47','Carlachiani Giuliano',1,'',8,2),(75,'2018-05-21 23:07:20','10','Dispositivo para la calibración de herramientas de control para interruptores diferenciales - Geninatti Sergio',1,'',10,2),(76,'2018-05-29 22:36:06','27','Venturini Eduardo',1,'',9,2),(77,'2018-05-29 22:38:41','11','Generador de pulsos para estimulación del corazón - Venturini Eduardo',1,'',10,2),(78,'2018-05-29 22:41:03','48','Escudero Luciano Alejo',1,'',8,2),(79,'2018-05-29 22:42:34','11','Generador de pulsos para estimulación del corazón - Venturini Eduardo',2,'Modifica alumnos.',10,2),(80,'2018-05-29 22:48:33','49','Cordi Luciano',1,'',8,2),(81,'2018-05-29 22:49:31','50','Rolón Fabricio',1,'',8,2),(82,'2018-05-29 22:52:59','12','Formalización y especificación para el desarrollo de un UAV - Geninatti Sergio',1,'',10,2),(83,'2018-05-29 22:55:34','13','Emulador digital de amplificadores y efectos para guitarra - Miyara Federico',1,'',10,2),(84,'2018-05-29 22:56:47','13','Emulador digital de amplificadores y efectos para guitarra - Miyara Federico',2,'Modifica orientacion.',10,2),(85,'2018-05-29 22:59:07','28','Coronel José',1,'',9,2),(86,'2018-05-29 23:00:11','14','Implemetnación de una red LORaWAN - Coronel José',1,'',10,2),(87,'2018-05-29 23:04:01','51','Pellegrino Adrián',1,'',8,2),(88,'2018-05-29 23:05:15','3','Desarrollo de Instrumentos Digitales de posición aeronáutica - Gentile Aldo',2,'Modifica titulo y orientacion.',10,2),(89,'2018-05-29 23:08:05','11','Generador de pulsos para estimulación del corazón - Venturini Eduardo',2,'Modifica asesor.',10,2),(90,'2018-06-05 00:23:02','52','Di Rosa Franco',1,'',8,2),(91,'2018-06-05 00:24:17','53','Collazuol Luis',1,'',8,2),(92,'2018-06-05 00:28:03','29','Amoedo Pablo',1,'',9,2),(93,'2018-06-05 00:29:40','15','Sistema basado en un tubo de impedancia para cacterización acústica de un material - Miyara Federico',1,'',10,2),(94,'2018-06-06 18:59:14','1','nuevo-2014',1,'',11,2),(95,'2018-06-06 18:59:36','12','Formalización y especificación para el desarrollo de un UAV - Geninatti Sergio',2,'Modifica plan.',10,2),(96,'2018-06-06 19:00:23','11','Generador de pulsos para estimulación del corazón - Venturini Eduardo',2,'Modifica plan.',10,2),(97,'2018-06-06 19:01:20','7','control de trayectoria para navegación autónoma de robot móvil con plataform omniwhell - Nacusse Matías',2,'Modifica plan.',10,2),(98,'2018-06-06 19:02:13','3','Desarrollo de Instrumentos Digitales de posición aeronáutica - Gentile Aldo',2,'Modifica plan.',10,2),(99,'2018-06-06 19:02:34','2','Comunicación VX2: estudio e implementación del protocolo IEEE802.11p utilizando tecnologia de Radio Definida por Software  (SDR) - Iglesias Natalia',2,'Modifica plan.',10,2),(100,'2018-06-06 19:02:59','8','Medición de respuesta al impulso y su aplicación a un plugin de reververación - Miyara Federico',2,'Modifica plan.',10,2),(101,'2018-06-06 19:03:15','14','Implemetnación de una red LORaWAN - Coronel José',2,'Modifica plan.',10,2),(102,'2018-06-06 19:03:29','13','Emulador digital de amplificadores y efectos para guitarra - Miyara Federico',2,'Modifica plan.',10,2),(103,'2018-06-06 19:17:07','30','test test',1,'',9,2),(104,'2018-06-06 19:17:48','54','test1 test1',1,'',8,2),(105,'2018-06-06 19:18:27','1','Prueba - test test',2,'Modifica director.',10,2),(106,'2018-06-06 19:18:46','1','Prueba - test test',2,'No ha modificado ningún campo.',10,2),(107,'2018-07-31 22:00:36','55','Luque María Florencia',1,'',8,2),(108,'2018-07-31 22:01:21','31','Luque adrian',1,'',9,2),(109,'2018-07-31 22:14:20','2','plan viejo',1,'',11,2),(110,'2018-07-31 22:14:41','3','plan viejo',1,'',11,2),(111,'2018-07-31 22:16:34','16','Implementación de un sistema de comunicación utilizando - Mare Renzo',1,'',10,2),(112,'2018-07-31 22:26:14','56','mugna emanuel',1,'',8,2),(113,'2018-07-31 22:27:36','32','Miyara Federico',1,'',9,2),(114,'2018-07-31 22:28:47','17','Desarrollo e implementación de efecto de guitarra en tiempo real - Miyara Federico',1,'',10,2),(115,'2018-07-31 22:29:07','33','Sad Gonzalo',1,'',9,2),(116,'2018-07-31 22:29:25','17','Desarrollo e implementación de efecto de guitarra en tiempo real - Sad Gonzalo',2,'Modifica director.',10,2),(117,'2018-07-31 22:49:05','57','Grippo Lucas',1,'',8,2),(118,'2018-07-31 22:51:56','58','Moya Ignacio',1,'',8,2),(119,'2018-07-31 22:54:18','18','demoludador/decodificador HRD para recepción de imágenes satelitales - Arraigada Fernando',1,'',10,2),(120,'2018-07-31 22:55:44','18','demoludador/decodificador HRD para recepción de imágenes satelitales - Arraigada Fernando',2,'No ha modificado ningún campo.',10,2),(121,'2018-08-14 21:59:14','17','Desarrollo e implementación de efecto de guitarra en tiempo real - Sad Gonzalo',2,'Modifica alumnos.',10,2),(122,'2018-08-14 22:08:58','34',' Ezpeleta Joaquin',1,'',9,2),(123,'2018-08-14 22:10:24','19','Implementación de una capa de comunicación CAN para una micro-red electrica intelligente -  Ezpeleta Joaquin',1,'',10,2),(124,'2018-08-14 22:11:10','19','Implementación de una capa de comunicación CAN para una micro-red electrica intelligente -  Ezpeleta Joaquin',2,'Modifica orientacion.',10,2),(125,'2018-08-14 22:19:42','18','demoludador/decodificador HRD para recepción de imágenes satelitales - Arraigada Fernando',2,'Modifica alumnos y asesor.',10,2),(126,'2018-08-14 23:42:02','18','demoludador/decodificador HRD para recepción de imágenes satelitales - Arraigada Fernando',2,'Modifica alumnos y asesor.',10,2),(127,'2018-08-14 23:43:30','16','Implementación de un sistema de comunicación utilizando VLC - Mare Renzo',2,'Modifica titulo y alumnos.',10,2),(128,'2018-08-28 23:09:37','3','Desarrollo de Instrumentos Digitales de posición aeronáutica - Gentile Aldo',2,'Modifica fecha_anteproyecto.',10,2),(129,'2018-08-28 23:11:26','2','Comunicación VX2: estudio e implementación del protocolo IEEE802.11p utilizando tecnologia de Radio Definida por Software  (SDR) - Iglesias Natalia',2,'Modifica fecha_anteproyecto.',10,2),(130,'2018-10-09 22:42:18','19','Implementación de una capa de comunicación CAN para una micro-red electrica intelligente -  Ezpeleta Joaquin',2,'Modifica fecha_anteproyecto.',10,2),(131,'2018-10-09 23:03:26','20','Rectificador - Romero Mónica',1,'',10,2),(132,'2018-10-09 23:24:54','12','Formalización y especificación para el desarrollo de un UAV - Geninatti Sergio',2,'Modifica fecha_anteproyecto.',10,2),(133,'2018-10-09 23:33:20','7','control de trayectoria para navegación autónoma de robot móvil con plataform omniwheel - Nacusse Matías',2,'Modifica titulo.',10,2),(134,'2018-10-22 23:31:34','9','Desarrollo e implementacón de un sistema de sensado y posicionamiento en prototipo de robot desmalezador - Kofman Ernesto',2,'Modifica fecha_anteproyecto.',10,2),(135,'2018-10-22 23:39:45','21','Diseño e implementación de firmware para un rectificador trifáscio controlado PWM con fines didácticos - Romero Mónica',1,'',10,2),(136,'2018-10-22 23:40:58','7','control de trayectoria para navegación autónoma de robot móvil con plataform omniwheel - Nacusse Matías',2,'Modifica fecha_anteproyecto.',10,2),(137,'2018-10-29 23:25:57','8','Medición de respuesta al impulso y su aplicación a un plugin de reverberación - Miyara Federico',2,'Modifica titulo y fecha_anteproyecto.',10,2),(138,'2018-10-29 23:32:28','20','Rectificador - Romero Mónica',2,'Modifica fecha_anteproyecto.',10,2),(139,'2018-10-29 23:34:32','20','Rectificador - Romero Mónica',3,'',10,2),(140,'2018-10-29 23:37:01','19','Implementación de una capa de comunicación CAN para una micro-red electrica intelligente -  Ezpeleta Joaquin',2,'Modifica plan.',10,2),(141,'2018-11-07 15:35:27','14','Implemetnación de una red LORaWAN - Coronel José',2,'Modifica fecha_anteproyecto.',10,2),(142,'2018-11-07 15:38:37','4','plan 2014-v2019',1,'',11,2),(143,'2018-11-07 15:39:05','1','plan2014-v2018',2,'Modifica nombre.',11,2),(144,'2018-11-27 22:50:09','35','Luppi Patricio',1,'',9,2),(145,'2018-11-27 22:50:56','22','sistema automatizado para la identificación, selección y clasficación de piezas discriminadas según el color - Luppi Patricio',1,'',10,2),(146,'2018-12-19 21:30:21','2','Comunicación VX2: estudio e implementación del protocolo IEEE802.11p utilizando tecnologia de Radio Definida por Software  (SDR) - Iglesias Natalia',2,'Modifica fecha_final.',10,2),(147,'2018-12-19 21:31:19','22','sistema automatizado para la identificación, selección y clasficación de piezas discriminadas según el color - Luppi Patricio',2,'Modifica fecha_anteproyecto.',10,2),(148,'2018-12-19 21:43:46','23','Prototipo de robot delta para la manupulación automática de objetos mediante visón por computadora - Gomez Juan Carlos',1,'',10,2),(149,'2018-12-19 21:44:13','36','Terissi Lucas',1,'',9,2),(150,'2018-12-19 21:44:35','23','Prototipo de robot delta para la manupulación automática de objetos mediante visón por computadora - Terissi Lucas',2,'Modifica director.',10,2),(151,'2018-12-19 21:49:42','24','Desarrollo e implementación de funciones de navegación autónoma para un prototipo de robto desmalezador - Kofman Ernesto',1,'',10,2),(152,'2018-12-19 21:53:52','23','Prototipo de robot delta para la manupulación automática de objetos mediante visón por computadora - Terissi Lucas',2,'Modifica fecha_inscripcion.',10,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'proyecto','alumno'),(9,'proyecto','director'),(7,'proyecto','orientacion'),(11,'proyecto','plan'),(10,'proyecto','proyecto'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-03-24 22:39:20'),(2,'auth','0001_initial','2018-03-24 22:39:22'),(3,'admin','0001_initial','2018-03-24 22:39:23'),(4,'contenttypes','0002_remove_content_type_name','2018-03-24 22:39:23'),(5,'auth','0002_alter_permission_name_max_length','2018-03-24 22:39:23'),(6,'auth','0003_alter_user_email_max_length','2018-03-24 22:39:24'),(7,'auth','0004_alter_user_username_opts','2018-03-24 22:39:24'),(8,'auth','0005_alter_user_last_login_null','2018-03-24 22:39:24'),(9,'auth','0006_require_contenttypes_0002','2018-03-24 22:39:24'),(10,'proyecto','0001_initial','2018-03-24 22:39:27'),(11,'sessions','0001_initial','2018-03-24 22:39:27'),(12,'admin','0002_logentry_remove_auto_add','2019-01-13 00:58:01'),(13,'auth','0007_alter_validators_add_error_messages','2019-01-13 00:58:01'),(14,'auth','0008_alter_user_username_max_length','2019-01-13 00:58:01');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('24vbns1tggbu5iqwzjgq3h2pepmhqu40','MjZmZTA3ODA4NDgyOTk4YmY1OTM2MDcwZTg5ZjE3NmU5MGQwMGNjZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImZiOWZiYzMzNzY0MTkyODBiOTI4ODhjZDU4NmNmZGVkZTU1ZGU3MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-09-11 23:08:57'),('7j49mdnj6xvp1gewnadfdcvmcb25xtyn','MjZmZTA3ODA4NDgyOTk4YmY1OTM2MDcwZTg5ZjE3NmU5MGQwMGNjZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImZiOWZiYzMzNzY0MTkyODBiOTI4ODhjZDU4NmNmZGVkZTU1ZGU3MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-01-02 12:36:32'),('8defic67s2j4o6vw065qyvrv400tfqbt','ZTlkYTQ3Y2E0OTBhOGI3OTNlMWM3YWJlNDczOGNhMjdhYjQ5YmM3Njp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg2YTM5OWQxZTU4NjcyZmE1ZjVkYTE5OTlmYzY1Mzc4OTIxMmY5MjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-01-18 16:42:44'),('9tfy4eygf0puktw7or7wktnfkbnpiqz9','MjZmZTA3ODA4NDgyOTk4YmY1OTM2MDcwZTg5ZjE3NmU5MGQwMGNjZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImZiOWZiYzMzNzY0MTkyODBiOTI4ODhjZDU4NmNmZGVkZTU1ZGU3MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-09-09 15:02:44'),('atml21km8wgsxnl2qa19wvldol9mph3n','MjZmZTA3ODA4NDgyOTk4YmY1OTM2MDcwZTg5ZjE3NmU5MGQwMGNjZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImZiOWZiYzMzNzY0MTkyODBiOTI4ODhjZDU4NmNmZGVkZTU1ZGU3MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2019-01-16 15:24:59'),('div8jlqgnc67m3fb9zehd3babml3bwoe','YzgzNTE4M2M4ZGUzYTFkYzgxOTg2YTVlOTdmYTc4N2ZjYTM3MWM0Mjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzYTY0NjcxZjVkOTBjM2NjMThkYzJhN2FjZmEwY2RkZTViODYwOTFkIn0=','2019-01-27 00:58:28'),('dyitnn2prt7633o4hhczbnzm94x7pe5m','MjZmZTA3ODA4NDgyOTk4YmY1OTM2MDcwZTg5ZjE3NmU5MGQwMGNjZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImZiOWZiYzMzNzY0MTkyODBiOTI4ODhjZDU4NmNmZGVkZTU1ZGU3MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-06-22 18:22:28'),('ikw0hyt2pfht7hfsgfezwb5gj9c4qov5','ZTlkYTQ3Y2E0OTBhOGI3OTNlMWM3YWJlNDczOGNhMjdhYjQ5YmM3Njp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg2YTM5OWQxZTU4NjcyZmE1ZjVkYTE5OTlmYzY1Mzc4OTIxMmY5MjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-04-07 23:06:34'),('m1e5x2r3nqpqavdfppnjfezwfszvhxhb','YzgzNTE4M2M4ZGUzYTFkYzgxOTg2YTVlOTdmYTc4N2ZjYTM3MWM0Mjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzYTY0NjcxZjVkOTBjM2NjMThkYzJhN2FjZmEwY2RkZTViODYwOTFkIn0=','2019-01-27 23:47:19'),('o19pybh8zjres7wo13acwxy3dmx02ah1','MjZmZTA3ODA4NDgyOTk4YmY1OTM2MDcwZTg5ZjE3NmU5MGQwMGNjZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImZiOWZiYzMzNzY0MTkyODBiOTI4ODhjZDU4NmNmZGVkZTU1ZGU3MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-08-28 21:56:00'),('ogubupur4bylam6cymoa3fdxt1hxfall','MjZmZTA3ODA4NDgyOTk4YmY1OTM2MDcwZTg5ZjE3NmU5MGQwMGNjZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImZiOWZiYzMzNzY0MTkyODBiOTI4ODhjZDU4NmNmZGVkZTU1ZGU3MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-12-25 22:54:40'),('pbjpwhu1bs5yz0bwgl1ulh1nw97auhef','MjZmZTA3ODA4NDgyOTk4YmY1OTM2MDcwZTg5ZjE3NmU5MGQwMGNjZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImZiOWZiYzMzNzY0MTkyODBiOTI4ODhjZDU4NmNmZGVkZTU1ZGU3MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-11-21 15:34:56'),('q390pi1csg1zebc64s6soil7c64n7jyw','MjZmZTA3ODA4NDgyOTk4YmY1OTM2MDcwZTg5ZjE3NmU5MGQwMGNjZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImZiOWZiYzMzNzY0MTkyODBiOTI4ODhjZDU4NmNmZGVkZTU1ZGU3MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-08-21 17:47:16'),('sinwhc6gjv7jkekcd8mqq7u8ouds83js','MjZmZTA3ODA4NDgyOTk4YmY1OTM2MDcwZTg5ZjE3NmU5MGQwMGNjZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImZiOWZiYzMzNzY0MTkyODBiOTI4ODhjZDU4NmNmZGVkZTU1ZGU3MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-04-08 21:16:45'),('thmnbskeiccbvmuxcqlceld5qnlzbu9o','MjZmZTA3ODA4NDgyOTk4YmY1OTM2MDcwZTg5ZjE3NmU5MGQwMGNjZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImZiOWZiYzMzNzY0MTkyODBiOTI4ODhjZDU4NmNmZGVkZTU1ZGU3MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-12-17 01:38:33'),('u05vcolpvz1mi13pjcpiqev8e128lpn2','MjZmZTA3ODA4NDgyOTk4YmY1OTM2MDcwZTg5ZjE3NmU5MGQwMGNjZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImZiOWZiYzMzNzY0MTkyODBiOTI4ODhjZDU4NmNmZGVkZTU1ZGU3MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-05-23 15:29:41'),('urauljo5q5xtzyivsa0fftkwtqj8pwp2','MjZmZTA3ODA4NDgyOTk4YmY1OTM2MDcwZTg5ZjE3NmU5MGQwMGNjZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImZiOWZiYzMzNzY0MTkyODBiOTI4ODhjZDU4NmNmZGVkZTU1ZGU3MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-06-12 22:35:22'),('v5i04hnfd48y9aj5p6mt66qbqew0luwf','MjZmZTA3ODA4NDgyOTk4YmY1OTM2MDcwZTg5ZjE3NmU5MGQwMGNjZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImZiOWZiYzMzNzY0MTkyODBiOTI4ODhjZDU4NmNmZGVkZTU1ZGU3MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-10-10 16:18:14'),('w9wer9pi2355y1uvzev337j2skdjt6sr','MjZmZTA3ODA4NDgyOTk4YmY1OTM2MDcwZTg5ZjE3NmU5MGQwMGNjZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImZiOWZiYzMzNzY0MTkyODBiOTI4ODhjZDU4NmNmZGVkZTU1ZGU3MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-11-16 23:39:33'),('wkp5lykfqacbqcclz5x2rfm1e2zfs2ka','MjZmZTA3ODA4NDgyOTk4YmY1OTM2MDcwZTg5ZjE3NmU5MGQwMGNjZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImZiOWZiYzMzNzY0MTkyODBiOTI4ODhjZDU4NmNmZGVkZTU1ZGU3MDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-10-11 22:16:01');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto_alumno`
--

DROP TABLE IF EXISTS `proyecto_alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto_alumno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `legajo` varchar(25) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `orientacion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proyecto_alumno_cdda5d3e` (`orientacion_id`),
  CONSTRAINT `proye_orientacion_id_5577d3e2a63ccc81_fk_proyecto_orientacion_id` FOREIGN KEY (`orientacion_id`) REFERENCES `proyecto_orientacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto_alumno`
--

LOCK TABLES `proyecto_alumno` WRITE;
/*!40000 ALTER TABLE `proyecto_alumno` DISABLE KEYS */;
INSERT INTO `proyecto_alumno` VALUES (1,'Nehuen','Almiron','','almironneuhen@gmail.com',1),(2,'Maia','Andali','','andalimaia@gmail.com',2),(3,'Agustin','Baffo','','agusbaffo@gmail.com',2),(4,'Alex','Barria Cardenas','','alexbarria_14@hotmail.com',4),(5,'Clara','Bureu','','clarabureumakianich@gmail.com',3),(6,'Ignacio','Carnevale','','icarnevale@outlook.com.ar',NULL),(7,'José','Casá','','pepe.casa17@gmail.com',4),(8,'Jun Ignacio','Cavalieri','','juanignaciocavalieri@gmail.com',4),(9,'Augusto','Chavarini','','chavarinoaugusto@gmail.com',4),(10,'Ian','Chaya','','ianchaya.pr@gmail.com',6),(11,'Augusto','Depetris','','augustodepetris10@gmail.com',6),(12,'Paula','Díaz','','pau.diaz@hotmail.com.ar',4),(13,'Mauro','Dominguez','','mau_igna_06@hotmail.com',1),(14,'Mariano','Echavarria','','marianoemhe@gmail.com',2),(15,'Francisco','Entesano','','entesano.francisco@gmail.com',6),(16,'nicolas','Farina','','nicolasfarina@outlook.com',2),(17,'Fernando','Folmer',NULL,NULL,NULL),(18,'Gonzalo','Giacomino','','gonzalo.giacomino@hotmail.com',3),(19,'Juan','Imsand','','juan.imsand@hotmail.com',7),(20,'Guillermo','Isaia','','guillermo.isaia@hotmail.com',3),(21,'Emanuel','Magna','','emanuelmagna@gmail.com',4),(22,'Sebastian','Martinez','','vito_seba_17@hotmail.com',3),(23,'Augusto','Masetti','','augmas15@gmail.com',3),(24,'Lucio','Monteros Gavriloff','','luciomanuelmonteros@hotlmail.com',6),(25,'Martin','Moya','','moyamartin10@gmail.com',1),(26,'Pablo','Nadal','','nadalpablo.32@gmail.com',6),(27,'leonel','Neumann','','neumann.leonel@gmail.com',4),(28,'Nicolás','Paredes','','nicolasparedes_095@hotmail.com',2),(29,'damian','pilatti','','damianep.unr@gmail.com',1),(30,'Facundo','Piombo','','piombo_7@hotmail.com',6),(31,'Maximiliano','Pozzo','','mpozzo@outlook.com',2),(32,'federico','quattrin','','fede.quattrin@gmail.com',2),(33,'Francisco','Real','','panchoreal_22@hotmail.com',3),(34,'Lucas','Sandoz','','sandozlucas@outlook.com',2),(35,'Gastón','Sgoifo','','gastonsgoifo@gmail.com',3),(36,'Esteban','Simich','','simichesteban@gmail.com',3),(37,'Martin','Vazquez','','vazquezmartin@outlook.es',6),(38,'Iván','Vicentin','','ivan_gabriel_11@hotmail.com',3),(39,'Facundo','Vignolo',NULL,NULL,NULL),(40,'Ignacio','Racca','R-2590/9','itrwilly@gmail.com',6),(41,'Matías Nicolas','Manavella','M-5891/2','mn.manavella@gmail.com',1),(42,'Agustín','Acerbo','A-3763/1','agustinacerbo@hotmail.com',1),(43,'Martín ','Rozas','R-3791/5','martin.rsdo@gmail.com',1),(44,'Leandro','Soria','S-4971/9','',1),(45,'Ana Paula','Soraiz','S-4965/4','',1),(46,'martín','Mujica','M-6014/3','martinmujica93@gmail.com',NULL),(47,'Giuliano','Carlachiani','C-6069/1','giuliano2505@gmail.com',1),(48,'Luciano Alejo','Escudero','E-1076/6','luciano.escudero@outlook.com',1),(49,'Luciano','Cordi','C-6066/6','lc.cordi@gamil.com',1),(50,'Fabricio','Rolón','R-3793/1','fabriciorolon@gmail.com',1),(51,'Adrián','Pellegrino','P-4464/4','pellegrinoadrianjc@gmail.com',1),(52,'Franco','Di Rosa','D-3670/6','fdr.2013@hotmail.com',1),(53,'Luis','Collazuol','C-5892/1','luiscollazuol@gmail.com',1),(54,'test1','test1','d','test@hotmail.com',7),(55,'María Florencia','Luque','L-2787/1','mflor.luq@gmail.com',1),(56,'emanuel','mugna','M-6195/6','emanuelmugna@gmail.com',4),(57,'Lucas','Grippo','G-4788/1','lucasgrippo@hotmail.com',1),(58,'Ignacio','Moya','M-5717/7','moyaignacios@gmail.com',1),(59,'Julián','Álvarez','A-3990/1','julian_alvarez96@yahoo.com',3),(60,'Jonatan','Arroyo','A-3736/2','arroyojonatan356@gmail.com',3),(61,'Guillermo','Ascolani','A-3948/9','guillermoascolani@gmail.com',3),(62,'Alex','Cerliani','C-5662/6','alexcerliani@hotmail.com',3),(63,'apellido','nombre','legajo','Mail',8),(64,'Andali',' Maia Melisa','A-3810/5','Maia Andali <andalimaia@gmail.com>',3),(65,'Baruzzo',' Ariel Jordán','B-5525/5','arielbaruzzo@gmail.com',3),(66,'Bolzani',' Lucas Alejandro','B-5653/7','lucas_bolzani@hotmail.com',3),(67,'Brauchli',' Guillermo','B-5732/1','Guillermo Brauchli <guillermobrauchli@yahoo.com.ar>',3),(68,'Cruz',' Jeremías Tomás','C-6137/9','jeretomascruz@hotmail.com',3),(69,'Danura',' Sebastián David','D-3803/2','danurasebastian@gmail.com',3),(70,'Lastorta',' Lucas Emanuel','L-2782/1','lucaslastorta@hotmail.com',3),(71,'Lucci',' Leonardo','L-2769/3','leonardolucci3@gmail.com',3),(72,'Lunari',' Ricardo','L-2847/9','ricardolunari94@gmail.com',3),(73,'Mandrile',' Nicolás David','M-5827/1','mandrilenico@gmail.com',3),(74,'Marinsalti',' Martín','M-6249/9','Marinsaltimartin@gmail.com',3),(75,'Martin',' Guillermo Nicolás','M-6047/1','martinguillermo915@gmail.com',3),(76,'Obrador',' Emilio Miguel','O-1603/9','emiliomobrador6@gmail.com',3),(77,'Podoroska',' Iván','P-4367/2','ivanpodoroska@gmail.com',3),(78,'Raimundo',' Joaquín','R-4037/1','cojuaraimundo@gmail.com',3),(79,'Seguezzo',' Franco Nahuel','S-5135/7','seguezzo.f@hotmail.com',3),(80,'Zoccari',' Marcelo Ezequiel','Z-1100/2','marcelo.zoccari@gmail.com',3),(81,'Ayi',' Tomás','A-4024/1','tommy.ayi@hotmail.com',4),(82,'Barria Cardenas',' Alex Damian','B-5656/1','alexbarria_14@hotmail.com',4),(83,'Bazzano',' Nicolás Roberto','B-5741/1','nico-bazzo@hotmail.com',4),(84,'Cesaratto',' Lisandro Ariel','C-6299/5','lisandrocesaratto@hotmail.com',4),(85,'Chaya',' Ián','C-6151/4','ianchaya.pr@gmail.com',4),(86,'Cima',' Emanuel','C-6296/1','emanuel_96_19@hotmail.com',4),(87,'Cinto',' Felipe','C-6436/1','cintofelipe.1@gmail.com',4),(88,'Diaz',' Paula Marcela','D-3765/6','pau.diaz@hotmail.com.ar',4),(89,'Gómez',' Julián','G-5161/6','juliangp@live.com',4),(90,'Kegalj',' Kevin Claudio','K-0551/7','keviinn_k@hotmail.com',4),(91,'Parisi',' Lucas Mariano','P-4564/1','lucasmparisi@outlook.com',4),(92,'Perugini Roldan',' Luciano Nahuel','P-4566/7','peruginiluciano@yahoo.com.ar',4),(93,'Peñas',' Jeremias','P-4565/9','jere.lalepra@gmail.com',4),(94,'Reyes',' Facundo Tomas','R-4028/2','facundotomasreyes@hotmail.com',4),(95,'Rodriguez',' Pablo Joel','R-3782/6','pablo_rodriguez_91@hotmail.com',4),(96,'Sarina',' Diego','S-5062/8','diego_sarina@hotmail.com',4),(97,'Carnevale',' Ignacio','C-3824/5','nchaval@hotmail.com',4),(98,'Depetris',' Augusto','D-3719/2','augustodepetris10@gmail.com',4),(99,'Echavarria',' Mariano','E-1049/1','marianoemhe@gmail.com',4),(100,'Buono',' Luciano Antonio ','B-5649/9 ','luciano.buono@outlook.com',2),(101,'Centurion',' German Agustin ','C-6297/9 ','german10.-@hotmail.com',2),(102,'Echavarria',' Mariano Hernan ','E-1039/1 ','marianoemhe@gmail.com',2),(103,'Medina Pedreira',' José Luis ','M-6254/5 ','pedreiraluis2@hotmail.com',2),(104,'Mussolini',' Diego Gabriel ','M-4253/6 ','ego159@hotmail.com',2),(105,'Pizzarello',' Agustin ','P-4468/7 ','titi.pizzarello@outlook.com',2),(106,'Raveglia',' Martin ','R-3908/1 ','ravegliamartin@gmail.com',2),(107,'Scoccimarra',' Franco Agustín ','S-4977/8 ','franco_spe@hotmail.com',2),(108,'Simich',' Esteban ','S-4940/9 ','Simichesteban@gmail.com',2),(109,'Toribio',' Esteban ','T-2591/7 ','toribio.est@gmail.com',2),(110,'Vasquez',' Martin Sebastian ','V-2698/1 ','msv_911@hotmail.com',2),(111,'Unno',' Santiago','U-0504/5','santi_pitu1@hotmail.com',2);
/*!40000 ALTER TABLE `proyecto_alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto_director`
--

DROP TABLE IF EXISTS `proyecto_director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto_director` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `externo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto_director`
--

LOCK TABLES `proyecto_director` WRITE;
/*!40000 ALTER TABLE `proyecto_director` DISABLE KEYS */;
INSERT INTO `proyecto_director` VALUES (1,'Aldo','Gentile',0),(3,'Armando','Novello',0),(4,'Sergio','Geninatti',0),(6,'Mónica','Romero',0),(7,'Andres','Vazquez',0),(8,'Juan Carlos','Gomez',0),(9,'Federico','Miyara',0),(10,'Renzo','Mare',0),(11,'Natalia','Iglesias',0),(12,'Fernando','Arraigada',0),(13,'Jose Luis','Simon',0),(14,'Sergio','Pastelleto',0),(15,'Hector','Molina',0),(16,'Verónica','Miro',0),(17,'Eduardo','Rubio Scola',0),(18,'Daniel','Alba',0),(19,'Javier','Cavello',0),(20,'Rosa','Corti',0),(21,'Sergio','Junco',0),(22,'Analia','Pizzi',1),(23,'Diego','Feroldi',1),(24,'Gustavo','Migoni',1),(25,'Matías','Nacusse',0),(26,'Ernesto','Kofman',0),(27,'Eduardo','Venturini',1),(28,'José','Coronel',0),(29,'Pablo','Amoedo',1),(30,'test','test',0),(31,'adrian','Luque',0),(32,'Federico','Miyara',0),(33,'Gonzalo','Sad',0),(34,'Joaquin',' Ezpeleta',0),(35,'Patricio','Luppi',0),(36,'Lucas','Terissi',0);
/*!40000 ALTER TABLE `proyecto_director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto_orientacion`
--

DROP TABLE IF EXISTS `proyecto_orientacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto_orientacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto_orientacion`
--

LOCK TABLES `proyecto_orientacion` WRITE;
/*!40000 ALTER TABLE `proyecto_orientacion` DISABLE KEYS */;
INSERT INTO `proyecto_orientacion` VALUES (1,'Plan 99'),(2,'Comunicaciones'),(3,'Control'),(4,'Digital'),(6,'Diseño electrónico'),(7,'Plan 96'),(8,'Orientación');
/*!40000 ALTER TABLE `proyecto_orientacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto_plan`
--

DROP TABLE IF EXISTS `proyecto_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto_plan`
--

LOCK TABLES `proyecto_plan` WRITE;
/*!40000 ALTER TABLE `proyecto_plan` DISABLE KEYS */;
INSERT INTO `proyecto_plan` VALUES (1,'plan2014-v2018'),(2,'plan viejo'),(3,'plan viejo'),(4,'plan 2014-v2019');
/*!40000 ALTER TABLE `proyecto_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto_proyecto`
--

DROP TABLE IF EXISTS `proyecto_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto_proyecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  `fecha_anteproyecto` date DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  `anteproyecto` varchar(100) DEFAULT NULL,
  `creado` datetime NOT NULL,
  `modificado` datetime NOT NULL,
  `asesor_id` int(11) DEFAULT NULL,
  `director_id` int(11) NOT NULL,
  `orientacion_id` int(11) NOT NULL,
  `co_director_id` int(11) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proyecto_pr_director_id_3b4a8560f92c50e6_fk_proyecto_director_id` (`director_id`),
  KEY `proye_orientacion_id_53f3efafc2c8baf6_fk_proyecto_orientacion_id` (`orientacion_id`),
  KEY `proyecto_proy_asesor_id_24ad705018713d6b_fk_proyecto_director_id` (`asesor_id`),
  KEY `proyecto_proyecto_443058b7` (`co_director_id`),
  KEY `proyecto_proyecto_188ba6de` (`plan_id`),
  CONSTRAINT `co_director_id_refs_id_6eda3aed` FOREIGN KEY (`co_director_id`) REFERENCES `proyecto_director` (`id`),
  CONSTRAINT `plan_id_refs_id_2945dff0` FOREIGN KEY (`plan_id`) REFERENCES `proyecto_plan` (`id`),
  CONSTRAINT `proye_orientacion_id_53f3efafc2c8baf6_fk_proyecto_orientacion_id` FOREIGN KEY (`orientacion_id`) REFERENCES `proyecto_orientacion` (`id`),
  CONSTRAINT `proyecto_pr_director_id_3b4a8560f92c50e6_fk_proyecto_director_id` FOREIGN KEY (`director_id`) REFERENCES `proyecto_director` (`id`),
  CONSTRAINT `proyecto_proy_asesor_id_24ad705018713d6b_fk_proyecto_director_id` FOREIGN KEY (`asesor_id`) REFERENCES `proyecto_director` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto_proyecto`
--

LOCK TABLES `proyecto_proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto_proyecto` DISABLE KEYS */;
INSERT INTO `proyecto_proyecto` VALUES (1,'Prueba','2018-03-16',NULL,NULL,'','2018-03-24 22:49:15','2018-06-06 19:18:46',NULL,30,3,NULL,NULL),(2,'Comunicación VX2: estudio e implementación del protocolo IEEE802.11p utilizando tecnologia de Radio Definida por Software  (SDR)','2018-03-12','2018-08-21','2018-12-18','','2018-04-03 23:57:14','2018-12-19 21:30:21',NULL,11,2,NULL,1),(3,'Desarrollo de Instrumentos Digitales de posición aeronáutica','2018-03-01','2018-08-28',NULL,'','2018-04-03 23:59:39','2018-08-28 23:09:37',NULL,1,4,NULL,1),(4,'Sistema electrónico de control de procesos','2018-03-01',NULL,NULL,'','2018-05-12 18:14:09','2018-05-12 18:14:09',NULL,14,1,NULL,NULL),(5,'Sistema de enlace inlámbrio de bajo consumo','2018-04-02',NULL,NULL,'','2018-05-12 18:17:20','2018-05-12 18:17:20',22,15,1,NULL,NULL),(6,'Sistema de Gestión Energia para Microredes Inteligentes','2018-05-15',NULL,NULL,'','2018-05-16 00:32:39','2018-05-16 00:32:39',23,6,1,NULL,NULL),(7,'control de trayectoria para navegación autónoma de robot móvil con plataform omniwheel','2018-05-14','2018-10-16',NULL,'','2018-05-21 22:32:52','2018-10-22 23:40:58',24,25,3,NULL,1),(8,'Medición de respuesta al impulso y su aplicación a un plugin de reverberación','2018-02-04','2018-10-29',NULL,'','2018-05-21 22:43:55','2018-10-29 23:25:57',4,9,4,NULL,1),(9,'Desarrollo e implementacón de un sistema de sensado y posicionamiento en prototipo de robot desmalezador','2018-02-05','2018-10-16',NULL,'','2018-05-21 23:03:25','2018-10-22 23:31:34',NULL,26,1,NULL,NULL),(10,'Dispositivo para la calibración de herramientas de control para interruptores diferenciales','2018-04-03',NULL,NULL,'','2018-05-21 23:07:20','2018-05-21 23:07:20',NULL,4,1,NULL,NULL),(11,'Generador de pulsos para estimulación del corazón','2018-04-20',NULL,NULL,'','2018-05-29 22:38:41','2018-06-06 19:00:23',3,27,4,NULL,1),(12,'Formalización y especificación para el desarrollo de un UAV','2018-05-22','2018-10-02',NULL,'','2018-05-29 22:52:59','2018-10-09 23:24:54',NULL,4,4,NULL,1),(13,'Emulador digital de amplificadores y efectos para guitarra','2018-05-22',NULL,NULL,'','2018-05-29 22:55:34','2018-06-06 19:03:29',4,9,6,NULL,1),(14,'Implemetnación de una red LORaWAN','2018-05-22','2018-11-05',NULL,'','2018-05-29 23:00:11','2018-11-07 15:35:27',NULL,28,2,NULL,1),(15,'Sistema basado en un tubo de impedancia para cacterización acústica de un material','2018-03-01',NULL,NULL,'','2018-06-05 00:29:40','2018-06-05 00:29:40',29,9,1,NULL,NULL),(16,'Implementación de un sistema de comunicación utilizando VLC','2018-03-01',NULL,NULL,'','2018-07-31 22:16:34','2018-08-14 23:43:30',31,10,1,NULL,NULL),(17,'Desarrollo e implementación de efecto de guitarra en tiempo real','2018-06-26',NULL,NULL,'','2018-07-31 22:28:47','2018-08-14 21:59:14',32,33,4,NULL,1),(18,'demoludador/decodificador HRD para recepción de imágenes satelitales','2018-05-07',NULL,NULL,'','2018-07-31 22:54:18','2018-08-14 23:42:02',NULL,12,1,NULL,2),(19,'Implementación de una capa de comunicación CAN para una micro-red electrica intelligente','2018-03-08','2018-10-02',NULL,'','2018-08-14 22:10:24','2018-10-29 23:37:01',NULL,34,2,28,1),(21,'Diseño e implementación de firmware para un rectificador trifáscio controlado PWM con fines didácticos','2018-05-02','2018-10-16',NULL,'','2018-10-22 23:39:45','2018-10-22 23:39:45',29,6,6,NULL,1),(22,'sistema automatizado para la identificación, selección y clasficación de piezas discriminadas según el color','2018-08-06','2018-12-17',NULL,'','2018-11-27 22:50:56','2018-12-19 21:31:19',NULL,35,3,NULL,1),(23,'Prototipo de robot delta para la manupulación automática de objetos mediante visón por computadora','2018-03-26','2018-12-17',NULL,'','2018-12-19 21:43:46','2018-12-19 21:53:52',NULL,36,4,NULL,1),(24,'Desarrollo e implementación de funciones de navegación autónoma para un prototipo de robto desmalezador','2018-06-04','2018-10-16',NULL,'','2018-12-19 21:49:42','2018-12-19 21:49:42',NULL,26,3,NULL,1);
/*!40000 ALTER TABLE `proyecto_proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto_proyecto_alumnos`
--

DROP TABLE IF EXISTS `proyecto_proyecto_alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto_proyecto_alumnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) NOT NULL,
  `alumno_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proyecto_id` (`proyecto_id`,`alumno_id`),
  KEY `proyecto_proyec_alumno_id_1547f865ea22cda2_fk_proyecto_alumno_id` (`alumno_id`),
  CONSTRAINT `proyecto_pr_proyecto_id_1ba067719de7959b_fk_proyecto_proyecto_id` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto_proyecto` (`id`),
  CONSTRAINT `proyecto_proyec_alumno_id_1547f865ea22cda2_fk_proyecto_alumno_id` FOREIGN KEY (`alumno_id`) REFERENCES `proyecto_alumno` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto_proyecto_alumnos`
--

LOCK TABLES `proyecto_proyecto_alumnos` WRITE;
/*!40000 ALTER TABLE `proyecto_proyecto_alumnos` DISABLE KEYS */;
INSERT INTO `proyecto_proyecto_alumnos` VALUES (1,1,1),(69,2,16),(70,2,28),(71,2,31),(45,3,26),(44,3,40),(8,4,41),(9,4,42),(10,5,44),(11,6,45),(59,7,5),(60,7,7),(62,8,4),(61,8,8),(57,9,46),(17,10,47),(32,11,12),(31,11,48),(52,12,33),(54,12,49),(53,12,50),(26,13,10),(27,13,11),(66,14,14),(33,15,52),(34,15,53),(43,16,55),(35,17,21),(41,18,57),(42,18,58),(65,19,3),(64,19,34),(58,21,15),(72,22,35),(73,22,38),(81,23,9),(82,23,27),(78,24,18),(79,24,19),(80,24,22);
/*!40000 ALTER TABLE `proyecto_proyecto_alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos_director`
--

DROP TABLE IF EXISTS `proyectos_director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyectos_director` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `externo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos_director`
--

LOCK TABLES `proyectos_director` WRITE;
/*!40000 ALTER TABLE `proyectos_director` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyectos_director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos_orientacion`
--

DROP TABLE IF EXISTS `proyectos_orientacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyectos_orientacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos_orientacion`
--

LOCK TABLES `proyectos_orientacion` WRITE;
/*!40000 ALTER TABLE `proyectos_orientacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyectos_orientacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos_plan`
--

DROP TABLE IF EXISTS `proyectos_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyectos_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos_plan`
--

LOCK TABLES `proyectos_plan` WRITE;
/*!40000 ALTER TABLE `proyectos_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyectos_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos_proyecto`
--

DROP TABLE IF EXISTS `proyectos_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyectos_proyecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  `fecha_anteproyecto` date DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  `anteproyecto` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `creado` datetime(6) NOT NULL,
  `modificado` datetime(6) NOT NULL,
  `asesor_id` int(11) DEFAULT NULL,
  `co_director_id` int(11) DEFAULT NULL,
  `director_id` int(11) NOT NULL,
  `orientacion_id` int(11) NOT NULL,
  `plan_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proyectos_proyecto_asesor_id_cf1d42a2_fk_proyectos_director_id` (`asesor_id`),
  KEY `proyectos_proyecto_co_director_id_95a80c19_fk_proyectos` (`co_director_id`),
  KEY `proyectos_proyecto_director_id_4ed0799b_fk_proyectos_director_id` (`director_id`),
  KEY `proyectos_proyecto_orientacion_id_5bced4ce_fk_proyectos` (`orientacion_id`),
  KEY `proyectos_proyecto_plan_id_10490a50_fk_proyectos_plan_id` (`plan_id`),
  CONSTRAINT `proyectos_proyecto_asesor_id_cf1d42a2_fk_proyectos_director_id` FOREIGN KEY (`asesor_id`) REFERENCES `proyectos_director` (`id`),
  CONSTRAINT `proyectos_proyecto_co_director_id_95a80c19_fk_proyectos` FOREIGN KEY (`co_director_id`) REFERENCES `proyectos_director` (`id`),
  CONSTRAINT `proyectos_proyecto_director_id_4ed0799b_fk_proyectos_director_id` FOREIGN KEY (`director_id`) REFERENCES `proyectos_director` (`id`),
  CONSTRAINT `proyectos_proyecto_orientacion_id_5bced4ce_fk_proyectos` FOREIGN KEY (`orientacion_id`) REFERENCES `proyectos_orientacion` (`id`),
  CONSTRAINT `proyectos_proyecto_plan_id_10490a50_fk_proyectos_plan_id` FOREIGN KEY (`plan_id`) REFERENCES `proyectos_plan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos_proyecto`
--

LOCK TABLES `proyectos_proyecto` WRITE;
/*!40000 ALTER TABLE `proyectos_proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyectos_proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos_proyecto_alumnos`
--

DROP TABLE IF EXISTS `proyectos_proyecto_alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyectos_proyecto_alumnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) NOT NULL,
  `alumno_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proyectos_proyecto_alumnos_proyecto_id_alumno_id_0b56f740_uniq` (`proyecto_id`,`alumno_id`),
  KEY `proyectos_proyecto_a_alumno_id_8a16c824_fk_proyectos` (`alumno_id`),
  CONSTRAINT `proyectos_proyecto_a_alumno_id_8a16c824_fk_proyectos` FOREIGN KEY (`alumno_id`) REFERENCES `proyectos_alumno` (`id`),
  CONSTRAINT `proyectos_proyecto_a_proyecto_id_990a5a80_fk_proyectos` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos_proyecto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos_proyecto_alumnos`
--

LOCK TABLES `proyectos_proyecto_alumnos` WRITE;
/*!40000 ALTER TABLE `proyectos_proyecto_alumnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyectos_proyecto_alumnos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-21 14:42:41
