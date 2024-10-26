-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-10-2024 a las 00:21:18
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id` int(11) NOT NULL,
  `usuario` varchar(10) NOT NULL,
  `passwd` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id`, `usuario`, `passwd`) VALUES
(1, 'root', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `id_calificacion` int(11) NOT NULL,
  `id_proyecto` int(11) DEFAULT NULL,
  `id_estudiante` int(11) DEFAULT NULL,
  `id_director` int(11) DEFAULT NULL,
  `rol_usuario` varchar(50) DEFAULT NULL,
  `calificacion` decimal(4,2) NOT NULL,
  `comentario` text DEFAULT NULL,
  `fecha_calificacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formatos_grado`
--

CREATE TABLE `formatos_grado` (
  `id_formato` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `url_formato` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `id` int(11) NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `descripcion` text NOT NULL,
  `estado_evaluador` varchar(15) NOT NULL,
  `estado_director` varchar(15) NOT NULL,
  `url` varchar(50) NOT NULL,
  `id_estudiante` int(20) NOT NULL,
  `id_evaluador` int(20) NOT NULL,
  `id_director` int(20) NOT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `tipo_de_documento` varchar(10) NOT NULL,
  `nombres` varchar(25) NOT NULL,
  `apellidos` varchar(25) NOT NULL,
  `genero` varchar(25) NOT NULL,
  `telefono` int(11) NOT NULL,
  `rol_1` varchar(15) NOT NULL,
  `rol_2` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `passwd` varchar(50) NOT NULL,
  `estado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `tipo_de_documento`, `nombres`, `apellidos`, `genero`, `telefono`, `rol_1`, `rol_2`, `email`, `passwd`, `estado`) VALUES
(911, 'CC', 'boogey', 'prada', 'Masculino', 77, 'Estudiante', 'Ninguno', 'theboogeyman02bsd@gmail.com', '123', 'Activo'),
(10052314, 'cc', 'yeison', 'prada', 'masculino', 3181444, 'estudiante', 'null', 'estudiante@gmail.com', '123', 'Inactivo'),
(91172290, 'CC', 'eliecer', 'prada', 'Masculino', 318524, 'Coordinador', 'Ninguno', 'theboogeyman02bsd@gmail.com', '123', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `versiones`
--

CREATE TABLE `versiones` (
  `id_version` int(11) NOT NULL,
  `id_proyecto` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `version_numero` int(11) NOT NULL,
  `url_version` varchar(255) NOT NULL,
  `fecha_subida` date NOT NULL,
  `estado_version` enum('Pendiente','Aprobada','Rechazada') DEFAULT 'Pendiente',
  `comentario` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id_calificacion`),
  ADD KEY `id_proyecto` (`id_proyecto`,`id_estudiante`,`id_director`),
  ADD KEY `id_estudiante` (`id_estudiante`),
  ADD KEY `id_director` (`id_director`);

--
-- Indices de la tabla `formatos_grado`
--
ALTER TABLE `formatos_grado`
  ADD PRIMARY KEY (`id_formato`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_estudiante` (`id_estudiante`),
  ADD KEY `id_evaluador` (`id_evaluador`),
  ADD KEY `id_director` (`id_director`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `versiones`
--
ALTER TABLE `versiones`
  ADD PRIMARY KEY (`id_version`),
  ADD KEY `id_proyecto` (`id_proyecto`,`id_usuario`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id_calificacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formatos_grado`
--
ALTER TABLE `formatos_grado`
  MODIFY `id_formato` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `versiones`
--
ALTER TABLE `versiones`
  MODIFY `id_version` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `calificaciones_ibfk_2` FOREIGN KEY (`id_director`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `calificaciones_ibfk_3` FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto` (`id`);

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `proyecto_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `proyecto_ibfk_2` FOREIGN KEY (`id_evaluador`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `proyecto_ibfk_3` FOREIGN KEY (`id_director`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `proyecto_ibfk_4` FOREIGN KEY (`id`) REFERENCES `versiones` (`id_proyecto`);

--
-- Filtros para la tabla `versiones`
--
ALTER TABLE `versiones`
  ADD CONSTRAINT `versiones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
