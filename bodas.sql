-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 13-08-2014 a las 23:07:48
-- Versión del servidor: 5.6.12-log
-- Versión de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bodas`
--
CREATE DATABASE IF NOT EXISTS `bodas` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bodas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_ciudades`
--

CREATE TABLE IF NOT EXISTS `cat_ciudades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_tipos_usuarios`
--

CREATE TABLE IF NOT EXISTS `cat_tipos_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('362f1ae590c9446e2e27e1eb6b1a45be', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 1407344046, ''),
('75ce5e3093d51f8fcc9a1167c107ce07', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 1407947788, ''),
('7cb5bb186cb5cadfb49184c788debb0f', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 1407344046, ''),
('7e067c77673f5c673171129129d8b05d', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 1407971227, ''),
('8f5754de07675c81151fd0c165e25c09', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 1406744080, ''),
('b05299b5300c48419e4e9a61789e26d9', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 1407959690, ''),
('b2572c08755b4f49761c3eb20480fb7a', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 1406748547, ''),
('b38497f71a34704bac3cb72cc35acb7e', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 1406743637, ''),
('cf9ab6526e82e580716475621a5242b1', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 1406759061, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE IF NOT EXISTS `eventos` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `locacion` varchar(45) DEFAULT NULL,
  `numero_invitados` int(11) DEFAULT NULL,
  `cat_ciudades_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_eventos_cat_ciudades1` (`cat_ciudades_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `nombre_pareja` varchar(45) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `nombre`, `email`, `nombre_pareja`, `status`) VALUES
(31, '', 'e10adc3949ba59abbe56e057f20f883e', 'Shary Chuc', 'sharychuc@gmail.com', 'Francisco', 1),
(32, '', '827ccb0eea8a706c4c34a16891f84e7b', 'Shary Chuc', 'shary@gmail.com', 'Francisco', 1),
(33, '', '827ccb0eea8a706c4c34a16891f84e7b', 'Shary Chuc', 'sharychuc@outlook.com', 'Francisco', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `xref_eventos_usuarios`
--

CREATE TABLE IF NOT EXISTS `xref_eventos_usuarios` (
  `id` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL,
  `eventos_id` int(11) NOT NULL,
  `cat_tipos_usuarios_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_xref_eventos_usuarios_usuarios` (`usuarios_id`),
  KEY `fk_xref_eventos_usuarios_eventos1` (`eventos_id`),
  KEY `fk_xref_eventos_usuarios_cat_tipos_usuarios1` (`cat_tipos_usuarios_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `fk_eventos_cat_ciudades1` FOREIGN KEY (`cat_ciudades_id`) REFERENCES `cat_ciudades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `xref_eventos_usuarios`
--
ALTER TABLE `xref_eventos_usuarios`
  ADD CONSTRAINT `fk_xref_eventos_usuarios_cat_tipos_usuarios1` FOREIGN KEY (`cat_tipos_usuarios_id`) REFERENCES `cat_tipos_usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_xref_eventos_usuarios_eventos1` FOREIGN KEY (`eventos_id`) REFERENCES `eventos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_xref_eventos_usuarios_usuarios` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
