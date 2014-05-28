/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50613
Source Host           : localhost:3306
Source Database       : mydb

Target Server Type    : MYSQL
Target Server Version : 50613
File Encoding         : 65001

Date: 2014-05-28 13:54:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cat_ciudades
-- ----------------------------
DROP TABLE IF EXISTS `cat_ciudades`;
CREATE TABLE `cat_ciudades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cat_ciudades
-- ----------------------------

-- ----------------------------
-- Table structure for cat_tipos_usuarios
-- ----------------------------
DROP TABLE IF EXISTS `cat_tipos_usuarios`;
CREATE TABLE `cat_tipos_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cat_tipos_usuarios
-- ----------------------------

-- ----------------------------
-- Table structure for eventos
-- ----------------------------
DROP TABLE IF EXISTS `eventos`;
CREATE TABLE `eventos` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `locacion` varchar(45) DEFAULT NULL,
  `numero_invitados` int(11) DEFAULT NULL,
  `cat_ciudades_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_eventos_cat_ciudades1` (`cat_ciudades_id`),
  CONSTRAINT `fk_eventos_cat_ciudades1` FOREIGN KEY (`cat_ciudades_id`) REFERENCES `cat_ciudades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of eventos
-- ----------------------------

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuarios
-- ----------------------------

-- ----------------------------
-- Table structure for xref_eventos_usuarios
-- ----------------------------
DROP TABLE IF EXISTS `xref_eventos_usuarios`;
CREATE TABLE `xref_eventos_usuarios` (
  `id` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL,
  `eventos_id` int(11) NOT NULL,
  `cat_tipos_usuarios_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_xref_eventos_usuarios_usuarios` (`usuarios_id`),
  KEY `fk_xref_eventos_usuarios_eventos1` (`eventos_id`),
  KEY `fk_xref_eventos_usuarios_cat_tipos_usuarios1` (`cat_tipos_usuarios_id`),
  CONSTRAINT `fk_xref_eventos_usuarios_usuarios` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_xref_eventos_usuarios_eventos1` FOREIGN KEY (`eventos_id`) REFERENCES `eventos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_xref_eventos_usuarios_cat_tipos_usuarios1` FOREIGN KEY (`cat_tipos_usuarios_id`) REFERENCES `cat_tipos_usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of xref_eventos_usuarios
-- ----------------------------
