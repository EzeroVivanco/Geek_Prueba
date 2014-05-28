-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 28-05-2014 a las 19:25:23
-- Versión del servidor: 6.0.10-alpha-community
-- Versión de PHP: 5.4.12

SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `mydb`
--
CREATE DATABASE IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE mydb;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_ciudades`
--

CREATE TABLE "cat_ciudades" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "nombre" varchar(45) NOT NULL,
  "estado" varchar(45) DEFAULT NULL,
  PRIMARY KEY ("id")
) AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_tipos_usuarios`
--

CREATE TABLE "cat_tipos_usuarios" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "nombre" varchar(45) NOT NULL,
  PRIMARY KEY ("id")
) AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE "eventos" (
  "id" int(11) NOT NULL,
  "fecha" date DEFAULT NULL,
  "hora" time DEFAULT NULL,
  "locacion" varchar(45) DEFAULT NULL,
  "numero_invitados" int(11) DEFAULT NULL,
  "cat_ciudades_id" int(11) NOT NULL,
  PRIMARY KEY ("id"),
  KEY "fk_eventos_cat_ciudades1" ("cat_ciudades_id")
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE "usuarios" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "username" varchar(45) NOT NULL,
  "password" varchar(100) NOT NULL,
  "nombre" varchar(45) DEFAULT NULL,
  "email" varchar(45) NOT NULL,
  "status" int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY ("id")
) AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `xref_eventos_usuarios`
--

CREATE TABLE "xref_eventos_usuarios" (
  "id" int(11) NOT NULL,
  "usuarios_id" int(11) NOT NULL,
  "eventos_id" int(11) NOT NULL,
  "cat_tipos_usuarios_id" int(11) NOT NULL,
  PRIMARY KEY ("id"),
  KEY "fk_xref_eventos_usuarios_usuarios" ("usuarios_id"),
  KEY "fk_xref_eventos_usuarios_eventos1" ("eventos_id"),
  KEY "fk_xref_eventos_usuarios_cat_tipos_usuarios1" ("cat_tipos_usuarios_id")
);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT "fk_eventos_cat_ciudades1" FOREIGN KEY ("cat_ciudades_id") REFERENCES "cat_ciudades" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `xref_eventos_usuarios`
--
ALTER TABLE `xref_eventos_usuarios`
  ADD CONSTRAINT "fk_xref_eventos_usuarios_usuarios" FOREIGN KEY ("usuarios_id") REFERENCES "usuarios" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_xref_eventos_usuarios_eventos1" FOREIGN KEY ("eventos_id") REFERENCES "eventos" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "fk_xref_eventos_usuarios_cat_tipos_usuarios1" FOREIGN KEY ("cat_tipos_usuarios_id") REFERENCES "cat_tipos_usuarios" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
