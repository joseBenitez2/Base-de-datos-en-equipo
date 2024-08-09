-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-08-2024 a las 23:05:03
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejercito`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compañia`
--

CREATE TABLE `compañia` (
  `Num_compañia` int(5) NOT NULL,
  `Acto_compañia` varchar(15) DEFAULT NULL,
  `Cod_soldadoM` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuarteles`
--

CREATE TABLE `cuarteles` (
  `Cod_cuarteles` int(5) NOT NULL,
  `Nombre_cuartel` varchar(15) DEFAULT NULL,
  `Ubicacion` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuarteles_compañias`
--

CREATE TABLE `cuarteles_compañias` (
  `Cod_cuarteles1` int(5) DEFAULT NULL,
  `Num_compañia1` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuerpos_del_ejercito`
--

CREATE TABLE `cuerpos_del_ejercito` (
  `Cod_cuerpo` int(5) NOT NULL,
  `Denominacion` varchar(15) DEFAULT NULL,
  `Cod_soldadoC` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `Cod_servicio` int(5) NOT NULL,
  `Acto_servicio` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soldados`
--

CREATE TABLE `soldados` (
  `Cod_soldado` int(5) NOT NULL,
  `Nombre_soldado` varchar(15) DEFAULT NULL,
  `Apellido_soldado` varchar(15) DEFAULT NULL,
  `Grado` varchar(15) DEFAULT NULL,
  `Cod_cuartelesS` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soldados_servicios`
--

CREATE TABLE `soldados_servicios` (
  `Cod_soldado1` int(5) DEFAULT NULL,
  `Cod_servicio1` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compañia`
--
ALTER TABLE `compañia`
  ADD PRIMARY KEY (`Num_compañia`),
  ADD KEY `fk_id4` (`Cod_soldadoM`);

--
-- Indices de la tabla `cuarteles`
--
ALTER TABLE `cuarteles`
  ADD PRIMARY KEY (`Cod_cuarteles`);

--
-- Indices de la tabla `cuarteles_compañias`
--
ALTER TABLE `cuarteles_compañias`
  ADD KEY `fk_id5` (`Cod_cuarteles1`),
  ADD KEY `fk_id6` (`Num_compañia1`);

--
-- Indices de la tabla `cuerpos_del_ejercito`
--
ALTER TABLE `cuerpos_del_ejercito`
  ADD PRIMARY KEY (`Cod_cuerpo`),
  ADD KEY `fk_id1` (`Cod_soldadoC`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`Cod_servicio`);

--
-- Indices de la tabla `soldados`
--
ALTER TABLE `soldados`
  ADD PRIMARY KEY (`Cod_soldado`),
  ADD KEY `fk_id7` (`Cod_cuartelesS`);

--
-- Indices de la tabla `soldados_servicios`
--
ALTER TABLE `soldados_servicios`
  ADD KEY `fk_id2` (`Cod_soldado1`),
  ADD KEY `fk_id3` (`Cod_servicio1`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compañia`
--
ALTER TABLE `compañia`
  MODIFY `Num_compañia` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuarteles`
--
ALTER TABLE `cuarteles`
  MODIFY `Cod_cuarteles` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuerpos_del_ejercito`
--
ALTER TABLE `cuerpos_del_ejercito`
  MODIFY `Cod_cuerpo` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `Cod_servicio` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `soldados`
--
ALTER TABLE `soldados`
  MODIFY `Cod_soldado` int(5) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compañia`
--
ALTER TABLE `compañia`
  ADD CONSTRAINT `fk_id4` FOREIGN KEY (`Cod_soldadoM`) REFERENCES `soldados` (`Cod_soldado`);

--
-- Filtros para la tabla `cuarteles_compañias`
--
ALTER TABLE `cuarteles_compañias`
  ADD CONSTRAINT `fk_id5` FOREIGN KEY (`Cod_cuarteles1`) REFERENCES `cuarteles` (`Cod_cuarteles`),
  ADD CONSTRAINT `fk_id6` FOREIGN KEY (`Num_compañia1`) REFERENCES `compañia` (`Num_compañia`);

--
-- Filtros para la tabla `cuerpos_del_ejercito`
--
ALTER TABLE `cuerpos_del_ejercito`
  ADD CONSTRAINT `fk_id1` FOREIGN KEY (`Cod_soldadoC`) REFERENCES `soldados` (`Cod_soldado`);

--
-- Filtros para la tabla `soldados`
--
ALTER TABLE `soldados`
  ADD CONSTRAINT `fk_id7` FOREIGN KEY (`Cod_cuartelesS`) REFERENCES `cuarteles` (`Cod_cuarteles`);

--
-- Filtros para la tabla `soldados_servicios`
--
ALTER TABLE `soldados_servicios`
  ADD CONSTRAINT `fk_id2` FOREIGN KEY (`Cod_soldado1`) REFERENCES `soldados` (`Cod_soldado`),
  ADD CONSTRAINT `fk_id3` FOREIGN KEY (`Cod_servicio1`) REFERENCES `servicios` (`Cod_servicio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
