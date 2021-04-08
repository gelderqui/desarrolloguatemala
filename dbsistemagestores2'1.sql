-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-05-2019 a las 06:16:48
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbsistemagestores2`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `´ed´` ()  SELECT* FROM pilares$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `´prueba1´` (`id` INT, `anio` INT)  set @indice=0$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `´prueba´` (`id` INT, `anio` INT)  set @indice=0$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `´prueb´` (`id` INT, `anio` INT)  SET @indice=0$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `´prue´` (IN `id` INT, IN `anio` VARCHAR(5))  SELECT @indice =  indices.id FROM indices WHERE indices.iddep=id AND indices.anio= anio$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correos`
--

CREATE TABLE `correos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `correos`
--

INSERT INTO `correos` (`id`, `nombre`, `correo`, `created_at`, `updated_at`) VALUES
(1, 'Sin nombre', 'lopezovalle91@gmail.com', '2018-11-05 21:29:17', '2018-11-05 21:29:17'),
(2, 'Sin nombre', 'jchacon09@hotmail.com', '2018-11-06 21:53:05', '2018-11-06 21:53:05'),
(3, 'Sin nombre', 'jlcarrillop89@gmail.com', '2018-11-06 21:53:38', '2018-11-06 21:53:38'),
(4, 'Sin nombre', 'g', '2019-05-10 00:39:14', '2019-05-10 00:39:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `nombre`, `condicion`) VALUES
(1, 'Guatemala', 1),
(2, 'Escuintla', 1),
(3, 'Izabal', 1),
(4, 'Alta Verapaz', 1),
(5, 'Quiché', 1),
(6, 'Huehuetenango', 1),
(7, 'Totonicapán', 1),
(8, 'San Marcos', 1),
(9, 'Jutiapa', 1),
(10, 'Baja Verapaz', 1),
(11, 'Santa Rosa', 1),
(12, 'Zacapa', 1),
(13, 'Suchitepéquez', 1),
(14, 'Chiquimula', 1),
(15, 'Jalapa', 1),
(16, 'Chimaltemango', 1),
(17, 'Quetzaltenango', 1),
(18, 'El Progreso', 1),
(19, 'Retalhuleu', 1),
(20, 'Sololá', 1),
(21, 'Sacatepéquez', 1),
(22, 'Petén', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indicadores`
--

CREATE TABLE `indicadores` (
  `id` int(10) UNSIGNED NOT NULL,
  `idpilar` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pregunta` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Sin Pregunta',
  `condicion_organizacion` tinyint(1) NOT NULL DEFAULT '0',
  `organizacion` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `indicadores`
--

INSERT INTO `indicadores` (`id`, `idpilar`, `nombre`, `condicion`, `created_at`, `updated_at`, `pregunta`, `condicion_organizacion`, `organizacion`) VALUES
(1, 1, 'Tramitología', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00', 'En una escala de 1-10, ¿cómo califica la agilidad del servicio de conclusión de tramites?', 0, ''),
(2, 1, 'OMDELS', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00', 'En una escala 1-10, siendo 1 poca actividad y 10 alto impacto ¿Qué nivel de impacto observa en el trabajo que las OMDELS realizan en su departamento?', 0, ''),
(3, 1, 'Promoción del territorio', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00', 'En una escala de 1-10, ¿Cómo califica la difusión de los medios respecto al ámbito de instituciones?', 0, ''),
(4, 1, 'Políticas territoriales', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00', 'En una escala de 1-10, ¿Cómo califica las políticas referentes a terrenos?', 0, ''),
(5, 2, 'Educación', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00', 'En una escala de 1-10 ¿Cómo califica el estado de la educación actual en su región?', 0, ''),
(6, 2, 'Programas de formación', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00', 'En una escala de 1-10 siendo 1 deficientes y 10 muy eficientes ¿Cómo califica los programas propuesto para la educación en su departamento?', 0, ''),
(7, 2, 'Centros universitarios', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00', 'En una escala de 1-10 siendo 1 deficiente y 10 excelente ¿Cómo califica la educación proporcionado por los centros universitarios?', 0, ''),
(8, 2, 'Educación Media', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00', 'En una escala de 1-10 siendo 1 deficiente y 10 excelente ¿Cómo evalúa la preparación de los profesores que imparten la educación básica?', 0, ''),
(9, 3, 'Infraestructura de la red vial', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00', 'En una escala de 1-10 siendo 1 deficientes y 10 excelentes ¿Cómo califica el estado de las carreteras en su departamento?', 0, ''),
(10, 3, 'Energía eléctrica', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00', 'En una escala de 1-10 siendo 1 deficiente y 10 excelente ¿Cómo califica la eficacia en pronta solución de problemas eléctricos?', 0, ''),
(11, 4, 'Capacidad para exportar', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00', 'En una escala de 1-10 siendo 1 complicado y 10 sencillo ¿Cómo califica la facilidad de exportación de productos en su departamento?', 0, ''),
(12, 4, 'Asociatividad empresarial', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00', 'Calificando de 1-10 siendo 1 bajo nivel de asociaciones y 10 un alto nivel ¿Cómo califica el nivel de las relaciones entre empresas en su departamento?', 0, ''),
(13, 4, 'Búsqueda de nuevos mercados', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00', 'En base a la publicidad existente, ¿Cómo califica la posibilidad de exploración de mercados poco reconocidos en su departamento?', 0, ''),
(14, 5, 'Acceso a financiamiento', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00', 'Calificando de 1-10 siendo 1 baja disponibilidad y 10 alta ¿Cómo califica la disposición de los bancos en aprobación de créditos?', 0, ''),
(15, 5, 'SDE (Servicios de Desarrollo Empresarial)', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00', 'En una escala de 1-10, siendo 1 poca presencia y 10 una alta actividad, ¿Cuál es la presencia que tienen las SDE en las empresas en su departamento?', 0, ''),
(16, 5, 'Atracción de inversiones', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00', 'En una escala de 1-10, siendo 1 nula y 10 muy probable ¿Cómo califica la posibilidad que nuevos empresarios generen inversiones en el mercado actual de su departamento?', 0, ''),
(17, 5, 'Cultura empresarial', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00', 'En una escala de 1-10 siento 1 cultura estancada hasta 10 representando adaptación progresiva ¿Cómo califica el crecimiento y evolución de las empresas dentro de su departamento?', 0, ''),
(18, 5, 'Reconversión productiva o Tercerización de la economía', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00', 'En una escala de 1-10 siendo 1 alta necesidad de realizar reconversiones, 10 baja necesidad de realizar reconversiones ¿Considera usted que sean necesarias reconversiones productivas?', 0, ''),
(19, 6, 'Acceso a la tecnología', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00', 'En una escala de 1-10, siendo 1 altos costos y 10 relativamente económico ¿Qué tan fácil le resulta la adquisición de nuevas tecnologías?', 0, ''),
(20, 6, 'Participación de la Universidad en la Innovación empresarial', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00', 'En una escala de 1-10, siendo 1 una nula participación de las universidades y 10 alta participación ¿Existe una promoción de la actividad de innovación empresarial dentro de los objetivos de ', 0, ''),
(21, 6, 'Investigación', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00', 'En una escala de 1-10, siendo 1 la nula participación y 10 alta participación ¿El nivel de presencia en el ámbito de investigación para el desarrollo de nuevas tecnologías?', 0, ''),
(23, 7, 'Oficiales', 1, '2018-10-30 12:52:29', '2018-11-01 05:44:24', 'En una escala de 1-10 siendo 1 poca eficiencia y 10 alta eficiencia ¿Como evalua el desempeño de los oficiales en sus labores?', 1, 'hjgkk'),
(24, 8, 'INDICADOR PRUEBA', 1, '2018-10-31 02:16:59', '2018-10-31 02:16:59', 'PREGUNTA ?', 0, NULL),
(25, 9, 'Educacion 2.1', 1, '2018-11-06 22:54:09', '2018-11-06 22:54:09', 'Le cae bien Joviel Acevedo?', 0, NULL),
(26, 9, 'Alimentacion en el Departamente', 1, '2018-11-06 22:55:22', '2018-11-06 22:55:22', '¿Cuantos productores son apoyados por el MAGA en el departamento?', 1, 'MAGA'),
(27, 11, 'Eficiencia', 1, '2018-11-06 22:55:27', '2018-11-07 19:10:29', 'Pregunta de prueba?', 1, 'IGSS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indices`
--

CREATE TABLE `indices` (
  `id` int(10) UNSIGNED NOT NULL,
  `iddep` int(10) UNSIGNED NOT NULL,
  `poblacion` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `anio` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pib` decimal(11,2) NOT NULL,
  `puntaje` decimal(11,2) DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `indices`
--

INSERT INTO `indices` (`id`, `iddep`, `poblacion`, `anio`, `pib`, `puntaje`, `condicion`, `created_at`, `updated_at`) VALUES
(13, 1, '45', '2018', '455.00', '3.06', 1, '2018-11-01 04:57:11', '2018-11-01 04:57:11'),
(14, 2, '234324', '2018', '234.00', '6.60', 1, '2018-11-01 06:42:47', '2018-11-01 06:42:47'),
(15, 10, '5465', '2018', '5.00', '8.93', 1, '2018-11-01 01:22:18', '2018-11-01 01:22:18'),
(16, 17, '69666', '2018', '654.00', '4.15', 1, '2018-11-01 01:31:16', '2018-11-06 22:40:03'),
(17, 14, '50', '2018', '6.00', '7.32', 1, '2018-11-01 01:49:40', '2018-11-01 01:49:40'),
(18, 17, '901700', '2018', '2500.00', NULL, 1, '2018-11-06 22:40:30', '2018-11-06 22:40:30'),
(19, 5, '250452', '2018', '3000.00', NULL, 1, '2018-11-06 22:41:01', '2018-11-06 22:41:01'),
(20, 22, '20000', '2018', '3456789.00', NULL, 1, '2018-11-06 22:41:20', '2018-11-06 22:41:20'),
(21, 18, '65468', '2018', '46816.00', NULL, 1, '2018-11-06 22:45:30', '2018-11-06 22:45:30'),
(22, 10, '100', '2019', '5.00', '4.30', 1, '2019-05-10 02:10:49', '2019-05-10 02:10:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(15, '2014_10_12_100000_create_password_resets_table', 1),
(16, '2018_02_01_171225_create_categorias_table', 1),
(17, '2018_09_17_233650_create_pilares_table', 1),
(18, '2018_09_18_140421_create_indicadores_table', 1),
(19, '2018_09_25_150941_create_tablapibs_table', 1),
(20, '2018_09_25_152354_create_roles_table', 1),
(21, '2018_09_25_153853_create_preguntas_table', 1),
(22, '2018_10_01_174133_create_departamentos_table', 1),
(23, '2018_10_01_180237_create_indices_table', 1),
(24, '2018_10_01_200000_create_users_table', 1),
(25, '2018_10_01_232833_create_puntajepilares_table', 1),
(26, '2018_10_01_233132_create_repuestas_table', 1),
(27, '2018_10_01_233206_create_puntajepreguntas_table', 1),
(28, '2018_10_01_233343_create_puntajeindicadores_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pilares`
--

CREATE TABLE `pilares` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `etapa1` decimal(6,2) NOT NULL,
  `etapa2` decimal(6,2) NOT NULL,
  `etapa3` decimal(6,2) NOT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pilares`
--

INSERT INTO `pilares` (`id`, `nombre`, `descripcion`, `etapa1`, `etapa2`, `etapa3`, `condicion`, `created_at`, `updated_at`) VALUES
(1, 'Instituciones y Gobierno', '', '25.00', '15.00', '15.00', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00'),
(2, 'Capital humano', '', '20.00', '15.00', '15.00', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00'),
(3, 'Infraestructura productiva', '', '20.00', '20.00', '15.00', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00'),
(4, 'Eficiencia empresarial', '', '15.00', '20.00', '15.00', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00'),
(5, 'Sistema de mercados', '', '15.00', '20.00', '20.00', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00'),
(6, 'Innovación y Tecnología', '', '5.00', '10.00', '20.00', 1, '2018-10-29 06:00:00', '2018-10-29 06:00:00'),
(7, 'Seguridad', 'PILAR DE PRUEBA', '5.00', '15.00', '15.00', 0, '2018-10-30 12:48:21', '2018-11-04 20:40:14'),
(8, 'PRUEBA 2', 'DFASDFA', '45.00', '22.00', '5.00', 0, '2018-10-31 02:16:23', '2018-11-04 20:40:10'),
(9, 'Educacion y Salud 2', 'Pilar ejemplo para capacitacion', '15.00', '30.00', '15.00', 1, '2018-11-06 22:50:06', '2018-11-06 22:50:45'),
(10, 'Innovación', NULL, '2.00', '3.00', '4.00', 1, '2018-11-06 22:50:30', '2018-11-06 22:50:30'),
(11, 'Salud', 'Descripcion de prueba', '50.00', '25.00', '25.00', 1, '2018-11-06 22:51:36', '2018-11-06 22:51:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntajeindicadores`
--

CREATE TABLE `puntajeindicadores` (
  `idmun` int(10) UNSIGNED NOT NULL,
  `ponderacion` decimal(10,2) DEFAULT NULL,
  `calificacion` decimal(10,2) DEFAULT NULL,
  `idindicador` int(10) UNSIGNED NOT NULL,
  `cont` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `idpilar` int(10) UNSIGNED NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `puntajeindicadores`
--

INSERT INTO `puntajeindicadores` (`idmun`, `ponderacion`, `calificacion`, `idindicador`, `cont`, `created_at`, `updated_at`, `idpilar`, `id`) VALUES
(13, '2.40', '2.40', 24, 5, NULL, NULL, 8, 1),
(13, '0.00', '0.00', 23, 2, NULL, NULL, 7, 2),
(13, '1.33', '4.00', 21, 5, NULL, NULL, 6, 3),
(13, '1.00', '3.00', 20, 5, NULL, NULL, 6, 4),
(13, '1.07', '3.20', 19, 5, NULL, NULL, 6, 5),
(13, '0.56', '2.80', 18, 5, NULL, NULL, 5, 6),
(13, '0.72', '3.60', 17, 5, NULL, NULL, 5, 7),
(13, '0.64', '3.20', 16, 5, NULL, NULL, 5, 8),
(13, '0.68', '3.40', 15, 5, NULL, NULL, 5, 9),
(13, '0.60', '3.00', 14, 5, NULL, NULL, 5, 10),
(13, '0.93', '2.80', 13, 5, NULL, NULL, 4, 11),
(13, '1.00', '3.00', 12, 5, NULL, NULL, 4, 12),
(13, '0.93', '2.80', 11, 5, NULL, NULL, 4, 13),
(13, '1.40', '2.80', 10, 5, NULL, NULL, 3, 14),
(13, '1.50', '3.00', 9, 5, NULL, NULL, 3, 15),
(13, '0.70', '2.80', 8, 5, NULL, NULL, 2, 16),
(13, '0.60', '2.40', 7, 5, NULL, NULL, 2, 17),
(13, '0.70', '2.80', 6, 5, NULL, NULL, 2, 18),
(13, '0.80', '3.20', 5, 5, NULL, NULL, 2, 19),
(13, '0.70', '2.80', 4, 5, NULL, NULL, 1, 20),
(13, '0.50', '2.00', 3, 5, NULL, NULL, 1, 21),
(13, '0.50', '2.00', 2, 5, NULL, NULL, 1, 22),
(13, '0.50', '2.00', 1, 5, NULL, NULL, 1, 23),
(14, '6.50', '6.50', 24, 2, NULL, NULL, 8, 24),
(14, '2.33', '7.00', 21, 2, NULL, NULL, 6, 25),
(14, '2.33', '7.00', 20, 2, NULL, NULL, 6, 26),
(14, '2.33', '7.00', 19, 2, NULL, NULL, 6, 27),
(14, '0.00', '0.00', 18, 2, NULL, NULL, 5, 28),
(14, '1.10', '5.50', 17, 2, NULL, NULL, 5, 29),
(14, '1.20', '6.00', 16, 2, NULL, NULL, 5, 30),
(14, '0.80', '4.00', 15, 2, NULL, NULL, 5, 31),
(14, '1.30', '6.50', 14, 2, NULL, NULL, 5, 32),
(14, '2.33', '7.00', 13, 2, NULL, NULL, 4, 33),
(14, '0.67', '2.00', 12, 2, NULL, NULL, 4, 34),
(14, '1.50', '4.50', 11, 2, NULL, NULL, 4, 35),
(14, '3.50', '7.00', 10, 2, NULL, NULL, 3, 36),
(14, '3.00', '6.00', 9, 2, NULL, NULL, 3, 37),
(14, '1.13', '4.50', 8, 2, NULL, NULL, 2, 38),
(14, '1.25', '5.00', 7, 2, NULL, NULL, 2, 39),
(14, '1.50', '6.00', 6, 2, NULL, NULL, 2, 40),
(14, '1.25', '5.00', 5, 2, NULL, NULL, 2, 41),
(14, '1.75', '7.00', 4, 2, NULL, NULL, 1, 42),
(14, '0.63', '2.50', 3, 2, NULL, NULL, 1, 43),
(14, '1.38', '5.50', 2, 2, NULL, NULL, 1, 44),
(14, '1.63', '6.50', 1, 2, NULL, NULL, 1, 45),
(14, '5.00', '5.00', 23, 1, NULL, NULL, 7, 46),
(15, '6.00', '6.00', 24, 1, NULL, NULL, 8, 47),
(15, '2.00', '6.00', 21, 1, NULL, NULL, 6, 48),
(15, '0.67', '2.00', 20, 1, NULL, NULL, 6, 49),
(15, '2.67', '8.00', 19, 1, NULL, NULL, 6, 50),
(15, '0.20', '1.00', 18, 1, NULL, NULL, 5, 51),
(15, '1.20', '6.00', 17, 1, NULL, NULL, 5, 52),
(15, '1.60', '8.00', 16, 1, NULL, NULL, 5, 53),
(15, '2.00', '10.00', 15, 1, NULL, NULL, 5, 54),
(15, '1.00', '5.00', 14, 1, NULL, NULL, 5, 55),
(15, '1.67', '5.00', 13, 1, NULL, NULL, 4, 56),
(15, '2.00', '6.00', 12, 1, NULL, NULL, 4, 57),
(15, '2.00', '6.00', 11, 1, NULL, NULL, 4, 58),
(15, '3.00', '6.00', 10, 1, NULL, NULL, 3, 59),
(15, '3.00', '6.00', 9, 1, NULL, NULL, 3, 60),
(15, '1.50', '6.00', 8, 1, NULL, NULL, 2, 61),
(15, '1.50', '6.00', 7, 1, NULL, NULL, 2, 62),
(15, '1.50', '6.00', 6, 1, NULL, NULL, 2, 63),
(15, '1.50', '6.00', 5, 1, NULL, NULL, 2, 64),
(15, '1.75', '7.00', 4, 1, NULL, NULL, 1, 65),
(15, '2.00', '8.00', 3, 1, NULL, NULL, 1, 66),
(15, '1.50', '6.00', 2, 1, NULL, NULL, 1, 67),
(15, '2.00', '8.00', 1, 1, NULL, NULL, 1, 68),
(16, '3.00', '3.00', 24, 1, NULL, NULL, 8, 69),
(16, '1.33', '4.00', 21, 1, NULL, NULL, 6, 70),
(16, '1.33', '4.00', 20, 1, NULL, NULL, 6, 71),
(16, '1.33', '4.00', 19, 1, NULL, NULL, 6, 72),
(16, '0.80', '4.00', 18, 1, NULL, NULL, 5, 73),
(16, '0.80', '4.00', 17, 1, NULL, NULL, 5, 74),
(16, '0.80', '4.00', 16, 1, NULL, NULL, 5, 75),
(16, '0.80', '4.00', 15, 1, NULL, NULL, 5, 76),
(16, '0.80', '4.00', 14, 1, NULL, NULL, 5, 77),
(16, '1.33', '4.00', 13, 1, NULL, NULL, 4, 78),
(16, '1.33', '4.00', 12, 1, NULL, NULL, 4, 79),
(16, '1.33', '4.00', 11, 1, NULL, NULL, 4, 80),
(16, '2.00', '4.00', 10, 1, NULL, NULL, 3, 81),
(16, '2.00', '4.00', 9, 1, NULL, NULL, 3, 82),
(16, '1.00', '4.00', 8, 1, NULL, NULL, 2, 83),
(16, '1.00', '4.00', 7, 1, NULL, NULL, 2, 84),
(16, '1.00', '4.00', 6, 1, NULL, NULL, 2, 85),
(16, '1.00', '4.00', 5, 1, NULL, NULL, 2, 86),
(16, '1.00', '4.00', 4, 1, NULL, NULL, 1, 87),
(16, '1.00', '4.00', 3, 1, NULL, NULL, 1, 88),
(16, '1.00', '4.00', 2, 1, NULL, NULL, 1, 89),
(16, '1.00', '4.00', 1, 1, NULL, NULL, 1, 90),
(17, '6.00', '6.00', 24, 1, NULL, NULL, 8, 91),
(17, '2.00', '6.00', 21, 1, NULL, NULL, 6, 92),
(17, '2.00', '6.00', 20, 1, NULL, NULL, 6, 93),
(17, '2.00', '6.00', 19, 1, NULL, NULL, 6, 94),
(17, '1.20', '6.00', 18, 1, NULL, NULL, 5, 95),
(17, '1.20', '6.00', 17, 1, NULL, NULL, 5, 96),
(17, '1.20', '6.00', 16, 1, NULL, NULL, 5, 97),
(17, '1.20', '6.00', 15, 1, NULL, NULL, 5, 98),
(17, '1.20', '6.00', 14, 1, NULL, NULL, 5, 99),
(17, '2.00', '6.00', 13, 1, NULL, NULL, 4, 100),
(17, '2.00', '6.00', 12, 1, NULL, NULL, 4, 101),
(17, '2.00', '6.00', 11, 1, NULL, NULL, 4, 102),
(17, '3.00', '6.00', 10, 1, NULL, NULL, 3, 103),
(17, '3.00', '6.00', 9, 1, NULL, NULL, 3, 104),
(17, '1.50', '6.00', 8, 1, NULL, NULL, 2, 105),
(17, '1.50', '6.00', 7, 1, NULL, NULL, 2, 106),
(17, '1.50', '6.00', 6, 1, NULL, NULL, 2, 107),
(17, '1.50', '6.00', 5, 1, NULL, NULL, 2, 108),
(17, '1.50', '6.00', 4, 1, NULL, NULL, 1, 109),
(17, '1.50', '6.00', 3, 1, NULL, NULL, 1, 110),
(17, '1.50', '6.00', 2, 1, NULL, NULL, 1, 111),
(17, '1.50', '6.00', 1, 1, NULL, NULL, 1, 112),
(22, '2.00', '4.00', 25, 1, NULL, NULL, 9, 113),
(22, '4.00', '4.00', 24, 1, NULL, NULL, 8, 114),
(22, '1.33', '4.00', 21, 1, NULL, NULL, 6, 115),
(22, '1.33', '4.00', 20, 1, NULL, NULL, 6, 116),
(22, '1.33', '4.00', 19, 1, NULL, NULL, 6, 117),
(22, '0.80', '4.00', 18, 1, NULL, NULL, 5, 118),
(22, '0.80', '4.00', 17, 1, NULL, NULL, 5, 119),
(22, '0.80', '4.00', 16, 1, NULL, NULL, 5, 120),
(22, '0.80', '4.00', 15, 1, NULL, NULL, 5, 121),
(22, '0.80', '4.00', 14, 1, NULL, NULL, 5, 122),
(22, '1.33', '4.00', 13, 1, NULL, NULL, 4, 123),
(22, '1.33', '4.00', 12, 1, NULL, NULL, 4, 124),
(22, '1.33', '4.00', 11, 1, NULL, NULL, 4, 125),
(22, '2.00', '4.00', 10, 1, NULL, NULL, 3, 126),
(22, '2.00', '4.00', 9, 1, NULL, NULL, 3, 127),
(22, '1.00', '4.00', 8, 1, NULL, NULL, 2, 128),
(22, '1.00', '4.00', 7, 1, NULL, NULL, 2, 129),
(22, '1.00', '4.00', 6, 1, NULL, NULL, 2, 130),
(22, '1.00', '4.00', 5, 1, NULL, NULL, 2, 131),
(22, '1.00', '4.00', 4, 1, NULL, NULL, 1, 132),
(22, '1.00', '4.00', 3, 1, NULL, NULL, 1, 133),
(22, '1.00', '4.00', 2, 1, NULL, NULL, 1, 134),
(22, '1.00', '4.00', 1, 1, NULL, NULL, 1, 135);

--
-- Disparadores `puntajeindicadores`
--
DELIMITER $$
CREATE TRIGGER `despues_de_indicador2` AFTER INSERT ON `puntajeindicadores` FOR EACH ROW BEGIN

   DECLARE sumpon integer;
   DECLARE porcen integer;
   DECLARE ponde integer;
   DECLARE califi integer;
   
   
   Set @sumpon = (SELECT SUM(`ponderacion`) FROM `puntajeindicadores` 
               WHERE idmun= NEW.idmun AND idpilar=NEW.idpilar);
               
   Set @porcen = (SELECT `porcentaje` FROM `puntajepilares`
                 WHERE idmun= NEW.idmun AND idpilar=NEW.idpilar);
   
   SET @ponde = @sumpon*(@porcen/100);
   
   SET @califi=(@ponde*100)/@porcen;
               
                                           
UPDATE puntajepilares
SET ponderacion=@ponde, calificacion=@califi
WHERE idmun=NEW.idmun and idpilar= NEW.idpilar;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `despues_de_indicadores2` AFTER UPDATE ON `puntajeindicadores` FOR EACH ROW BEGIN

   DECLARE sumpon integer;
   DECLARE porcen integer;
   DECLARE ponde integer;
   DECLARE califi integer;
   
   Set @sumpon = (SELECT SUM(`ponderacion`) FROM `puntajeindicadores` 
               WHERE idmun= NEW.idmun AND idpilar=NEW.idpilar);
               
   Set @porcen = (SELECT `porcentaje` FROM `puntajepilares`
                 WHERE idmun= NEW.idmun AND idpilar=NEW.idpilar);
   
   SET @ponde = @sumpon*(@porcen/100);
   
   SET @califi=(@ponde*100)/@porcen;
               
                                           
UPDATE puntajepilares
SET ponderacion=@ponde, calificacion=@califi
WHERE idmun=NEW.idmun and idpilar= NEW.idpilar;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntajepilares`
--

CREATE TABLE `puntajepilares` (
  `idmun` int(10) UNSIGNED NOT NULL,
  `ponderacion` decimal(10,2) DEFAULT NULL,
  `calificacion` decimal(10,2) DEFAULT NULL,
  `porcentaje` decimal(10,2) NOT NULL,
  `idpilar` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `puntajepilares`
--

INSERT INTO `puntajepilares` (`idmun`, `ponderacion`, `calificacion`, `porcentaje`, `idpilar`, `created_at`, `updated_at`, `id`) VALUES
(13, '0.33', '2.20', '15.00', 1, '2018-11-01 04:57:11', '2018-11-01 04:57:11', 1),
(13, '0.42', '2.80', '15.00', 2, '2018-11-01 04:57:11', '2018-11-01 04:57:11', 2),
(13, '0.44', '2.90', '15.00', 3, '2018-11-01 04:57:11', '2018-11-01 04:57:11', 3),
(13, '0.43', '2.86', '15.00', 4, '2018-11-01 04:57:11', '2018-11-01 04:57:11', 4),
(13, '0.64', '3.20', '20.00', 5, '2018-11-01 04:57:11', '2018-11-01 04:57:11', 5),
(13, '0.68', '3.40', '20.00', 6, '2018-11-01 04:57:11', '2018-11-01 04:57:11', 6),
(13, '0.00', '0.00', '15.00', 7, '2018-11-01 04:57:11', '2018-11-01 04:57:11', 7),
(13, '0.12', '2.40', '5.00', 8, '2018-11-01 04:57:11', '2018-11-01 04:57:11', 8),
(14, '0.81', '5.39', '15.00', 1, '2018-11-01 06:42:47', '2018-11-01 06:42:47', 9),
(14, '0.77', '5.13', '15.00', 2, '2018-11-01 06:42:47', '2018-11-01 06:42:47', 10),
(14, '0.98', '6.50', '15.00', 3, '2018-11-01 06:42:47', '2018-11-01 06:42:47', 11),
(14, '0.68', '4.50', '15.00', 4, '2018-11-01 06:42:47', '2018-11-01 06:42:47', 12),
(14, '0.88', '4.40', '20.00', 5, '2018-11-01 06:42:47', '2018-11-01 06:42:47', 13),
(14, '1.40', '6.99', '20.00', 6, '2018-11-01 06:42:47', '2018-11-01 06:42:47', 14),
(14, '0.75', '5.00', '15.00', 7, '2018-11-01 06:42:47', '2018-11-01 06:42:47', 15),
(14, '0.33', '6.50', '5.00', 8, '2018-11-01 06:42:47', '2018-11-01 06:42:47', 16),
(15, '1.81', '7.25', '25.00', 1, '2018-11-01 01:22:18', '2018-11-01 01:22:18', 17),
(15, '1.20', '6.00', '20.00', 2, '2018-11-01 01:22:18', '2018-11-01 01:22:18', 18),
(15, '1.20', '6.00', '20.00', 3, '2018-11-01 01:22:18', '2018-11-01 01:22:18', 19),
(15, '0.85', '5.67', '15.00', 4, '2018-11-01 01:22:18', '2018-11-01 01:22:18', 20),
(15, '0.90', '6.00', '15.00', 5, '2018-11-01 01:22:18', '2018-11-01 01:22:18', 21),
(15, '0.27', '5.34', '5.00', 6, '2018-11-01 01:22:18', '2018-11-01 01:22:18', 22),
(15, NULL, NULL, '5.00', 7, '2018-11-01 01:22:18', '2018-11-01 01:22:18', 23),
(15, '2.70', '6.00', '45.00', 8, '2018-11-01 01:22:18', '2018-11-01 01:22:18', 24),
(16, '0.60', '4.00', '15.00', 1, '2018-11-01 01:31:16', '2018-11-01 01:31:16', 25),
(16, '0.60', '4.00', '15.00', 2, '2018-11-01 01:31:16', '2018-11-01 01:31:16', 26),
(16, '0.60', '4.00', '15.00', 3, '2018-11-01 01:31:16', '2018-11-01 01:31:16', 27),
(16, '0.60', '3.99', '15.00', 4, '2018-11-01 01:31:16', '2018-11-01 01:31:16', 28),
(16, '0.80', '4.00', '20.00', 5, '2018-11-01 01:31:16', '2018-11-01 01:31:16', 29),
(16, '0.80', '3.99', '20.00', 6, '2018-11-01 01:31:16', '2018-11-01 01:31:16', 30),
(16, NULL, NULL, '15.00', 7, '2018-11-01 01:31:16', '2018-11-01 01:31:16', 31),
(16, '0.15', '3.00', '5.00', 8, '2018-11-01 01:31:16', '2018-11-01 01:31:16', 32),
(17, '0.90', '6.00', '15.00', 1, '2018-11-01 01:49:40', '2018-11-01 01:49:40', 33),
(17, '0.90', '6.00', '15.00', 2, '2018-11-01 01:49:41', '2018-11-01 01:49:41', 34),
(17, '1.20', '6.00', '20.00', 3, '2018-11-01 01:49:41', '2018-11-01 01:49:41', 35),
(17, '1.20', '6.00', '20.00', 4, '2018-11-01 01:49:41', '2018-11-01 01:49:41', 36),
(17, '1.20', '6.00', '20.00', 5, '2018-11-01 01:49:41', '2018-11-01 01:49:41', 37),
(17, '0.60', '6.00', '10.00', 6, '2018-11-01 01:49:41', '2018-11-01 01:49:41', 38),
(17, NULL, NULL, '15.00', 7, '2018-11-01 01:49:41', '2018-11-01 01:49:41', 39),
(17, '1.32', '6.00', '22.00', 8, '2018-11-01 01:49:41', '2018-11-01 01:49:41', 40),
(18, NULL, NULL, '15.00', 1, '2018-11-06 22:40:30', '2018-11-06 22:40:30', 41),
(18, NULL, NULL, '15.00', 2, '2018-11-06 22:40:30', '2018-11-06 22:40:30', 42),
(18, NULL, NULL, '15.00', 3, '2018-11-06 22:40:30', '2018-11-06 22:40:30', 43),
(18, NULL, NULL, '15.00', 4, '2018-11-06 22:40:30', '2018-11-06 22:40:30', 44),
(18, NULL, NULL, '20.00', 5, '2018-11-06 22:40:30', '2018-11-06 22:40:30', 45),
(18, NULL, NULL, '20.00', 6, '2018-11-06 22:40:30', '2018-11-06 22:40:30', 46),
(19, NULL, NULL, '15.00', 1, '2018-11-06 22:41:01', '2018-11-06 22:41:01', 47),
(19, NULL, NULL, '15.00', 2, '2018-11-06 22:41:01', '2018-11-06 22:41:01', 48),
(19, NULL, NULL, '15.00', 3, '2018-11-06 22:41:01', '2018-11-06 22:41:01', 49),
(19, NULL, NULL, '15.00', 4, '2018-11-06 22:41:01', '2018-11-06 22:41:01', 50),
(19, NULL, NULL, '20.00', 5, '2018-11-06 22:41:01', '2018-11-06 22:41:01', 51),
(19, NULL, NULL, '20.00', 6, '2018-11-06 22:41:01', '2018-11-06 22:41:01', 52),
(20, NULL, NULL, '15.00', 1, '2018-11-06 22:41:20', '2018-11-06 22:41:20', 53),
(20, NULL, NULL, '15.00', 2, '2018-11-06 22:41:20', '2018-11-06 22:41:20', 54),
(20, NULL, NULL, '15.00', 3, '2018-11-06 22:41:20', '2018-11-06 22:41:20', 55),
(20, NULL, NULL, '15.00', 4, '2018-11-06 22:41:20', '2018-11-06 22:41:20', 56),
(20, NULL, NULL, '20.00', 5, '2018-11-06 22:41:20', '2018-11-06 22:41:20', 57),
(20, NULL, NULL, '20.00', 6, '2018-11-06 22:41:20', '2018-11-06 22:41:20', 58),
(21, NULL, NULL, '15.00', 1, '2018-11-06 22:45:30', '2018-11-06 22:45:30', 59),
(21, NULL, NULL, '15.00', 2, '2018-11-06 22:45:30', '2018-11-06 22:45:30', 60),
(21, NULL, NULL, '15.00', 3, '2018-11-06 22:45:30', '2018-11-06 22:45:30', 61),
(21, NULL, NULL, '15.00', 4, '2018-11-06 22:45:30', '2018-11-06 22:45:30', 62),
(21, NULL, NULL, '20.00', 5, '2018-11-06 22:45:30', '2018-11-06 22:45:30', 63),
(21, NULL, NULL, '20.00', 6, '2018-11-06 22:45:30', '2018-11-06 22:45:30', 64),
(22, '1.00', '4.00', '25.00', 1, '2019-05-10 02:10:49', '2019-05-10 02:10:49', 65),
(22, '0.80', '4.00', '20.00', 2, '2019-05-10 02:10:49', '2019-05-10 02:10:49', 66),
(22, '0.80', '4.00', '20.00', 3, '2019-05-10 02:10:49', '2019-05-10 02:10:49', 67),
(22, '0.60', '3.99', '15.00', 4, '2019-05-10 02:10:49', '2019-05-10 02:10:49', 68),
(22, '0.60', '4.00', '15.00', 5, '2019-05-10 02:10:49', '2019-05-10 02:10:49', 69),
(22, '0.20', '3.99', '5.00', 6, '2019-05-10 02:10:49', '2019-05-10 02:10:49', 70),
(22, '0.30', '2.00', '15.00', 9, '2019-05-10 02:10:49', '2019-05-10 02:10:49', 71),
(22, NULL, NULL, '2.00', 10, '2019-05-10 02:10:49', '2019-05-10 02:10:49', 72),
(22, NULL, NULL, '50.00', 11, '2019-05-10 02:10:49', '2019-05-10 02:10:49', 73);

--
-- Disparadores `puntajepilares`
--
DELIMITER $$
CREATE TRIGGER `despues_de_pilares` AFTER UPDATE ON `puntajepilares` FOR EACH ROW BEGIN

   DECLARE suma integer;
   
   Set @suma = (SELECT SUM(`ponderacion`) FROM `puntajepilares` 
               WHERE idmun= NEW.idmun);
                                                 
UPDATE indices
SET puntaje=@suma
WHERE id=NEW.idmun;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntajepreguntas`
--

CREATE TABLE `puntajepreguntas` (
  `idmun` int(10) UNSIGNED NOT NULL,
  `ponderacion` decimal(10,2) DEFAULT NULL,
  `idindicador` int(10) UNSIGNED NOT NULL,
  `cont` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `puntajepreguntas`
--

INSERT INTO `puntajepreguntas` (`idmun`, `ponderacion`, `idindicador`, `cont`, `created_at`, `updated_at`, `id`) VALUES
(13, '2.40', 24, 5, '2018-10-31 22:58:30', '2018-10-31 22:58:30', 1),
(13, '0.00', 23, 2, '2018-10-31 22:58:30', '2018-10-31 22:58:30', 2),
(13, '4.00', 21, 5, '2018-10-31 22:58:30', '2018-10-31 22:58:30', 3),
(13, '3.00', 20, 5, '2018-10-31 22:58:30', '2018-10-31 22:58:30', 4),
(13, '3.20', 19, 5, '2018-10-31 22:58:30', '2018-10-31 22:58:30', 5),
(13, '2.80', 18, 5, '2018-10-31 22:58:30', '2018-10-31 22:58:30', 6),
(13, '3.60', 17, 5, '2018-10-31 22:58:30', '2018-10-31 22:58:30', 7),
(13, '3.20', 16, 5, '2018-10-31 22:58:30', '2018-10-31 22:58:30', 8),
(13, '3.40', 15, 5, '2018-10-31 22:58:30', '2018-10-31 22:58:30', 9),
(13, '3.00', 14, 5, '2018-10-31 22:58:31', '2018-10-31 22:58:31', 10),
(13, '2.80', 13, 5, '2018-10-31 22:58:31', '2018-10-31 22:58:31', 11),
(13, '3.00', 12, 5, '2018-10-31 22:58:31', '2018-10-31 22:58:31', 12),
(13, '2.80', 11, 5, '2018-10-31 22:58:31', '2018-10-31 22:58:31', 13),
(13, '2.80', 10, 5, '2018-10-31 22:58:31', '2018-10-31 22:58:31', 14),
(13, '3.00', 9, 5, '2018-10-31 22:58:31', '2018-10-31 22:58:31', 15),
(13, '2.80', 8, 5, '2018-10-31 22:58:32', '2018-10-31 22:58:32', 16),
(13, '2.40', 7, 5, '2018-10-31 22:58:32', '2018-10-31 22:58:32', 17),
(13, '2.80', 6, 5, '2018-10-31 22:58:32', '2018-10-31 22:58:32', 18),
(13, '3.20', 5, 5, '2018-10-31 22:58:32', '2018-10-31 22:58:32', 19),
(13, '2.80', 4, 5, '2018-10-31 22:58:32', '2018-10-31 22:58:32', 20),
(13, '2.00', 3, 5, '2018-10-31 22:58:32', '2018-10-31 22:58:32', 21),
(13, '2.00', 2, 5, '2018-10-31 22:58:32', '2018-10-31 22:58:32', 22),
(13, '2.00', 1, 5, '2018-10-31 22:58:32', '2018-10-31 22:58:32', 23),
(14, '6.50', 24, 2, '2018-11-01 00:43:14', '2018-11-01 00:43:14', 24),
(14, '7.00', 21, 2, '2018-11-01 00:43:15', '2018-11-01 00:43:15', 25),
(14, '7.00', 20, 2, '2018-11-01 00:43:15', '2018-11-01 00:43:15', 26),
(14, '7.00', 19, 2, '2018-11-01 00:43:15', '2018-11-01 00:43:15', 27),
(14, '0.00', 18, 2, '2018-11-01 00:43:15', '2018-11-01 00:43:15', 28),
(14, '5.50', 17, 2, '2018-11-01 00:43:15', '2018-11-01 00:43:15', 29),
(14, '6.00', 16, 2, '2018-11-01 00:43:15', '2018-11-01 00:43:15', 30),
(14, '4.00', 15, 2, '2018-11-01 00:43:15', '2018-11-01 00:43:15', 31),
(14, '6.50', 14, 2, '2018-11-01 00:43:15', '2018-11-01 00:43:15', 32),
(14, '7.00', 13, 2, '2018-11-01 00:43:15', '2018-11-01 00:43:15', 33),
(14, '2.00', 12, 2, '2018-11-01 00:43:15', '2018-11-01 00:43:15', 34),
(14, '4.50', 11, 2, '2018-11-01 00:43:15', '2018-11-01 00:43:15', 35),
(14, '7.00', 10, 2, '2018-11-01 00:43:15', '2018-11-01 00:43:15', 36),
(14, '6.00', 9, 2, '2018-11-01 00:43:15', '2018-11-01 00:43:15', 37),
(14, '4.50', 8, 2, '2018-11-01 00:43:15', '2018-11-01 00:43:15', 38),
(14, '5.00', 7, 2, '2018-11-01 00:43:16', '2018-11-01 00:43:16', 39),
(14, '6.00', 6, 2, '2018-11-01 00:43:16', '2018-11-01 00:43:16', 40),
(14, '5.00', 5, 2, '2018-11-01 00:43:16', '2018-11-01 00:43:16', 41),
(14, '7.00', 4, 2, '2018-11-01 00:43:16', '2018-11-01 00:43:16', 42),
(14, '2.50', 3, 2, '2018-11-01 00:43:16', '2018-11-01 00:43:16', 43),
(14, '5.50', 2, 2, '2018-11-01 00:43:16', '2018-11-01 00:43:16', 44),
(14, '6.50', 1, 2, '2018-11-01 00:43:16', '2018-11-01 00:43:16', 45),
(14, '5.00', 23, 1, '2018-11-01 00:44:26', '2018-11-01 00:44:26', 46),
(15, '6.00', 24, 1, '2018-11-01 01:26:40', '2018-11-01 01:26:40', 47),
(15, '6.00', 21, 1, '2018-11-01 01:26:40', '2018-11-01 01:26:40', 48),
(15, '2.00', 20, 1, '2018-11-01 01:26:40', '2018-11-01 01:26:40', 49),
(15, '8.00', 19, 1, '2018-11-01 01:26:40', '2018-11-01 01:26:40', 50),
(15, '1.00', 18, 1, '2018-11-01 01:26:40', '2018-11-01 01:26:40', 51),
(15, '6.00', 17, 1, '2018-11-01 01:26:40', '2018-11-01 01:26:40', 52),
(15, '8.00', 16, 1, '2018-11-01 01:26:40', '2018-11-01 01:26:40', 53),
(15, '10.00', 15, 1, '2018-11-01 01:26:40', '2018-11-01 01:26:40', 54),
(15, '5.00', 14, 1, '2018-11-01 01:26:40', '2018-11-01 01:26:40', 55),
(15, '5.00', 13, 1, '2018-11-01 01:26:40', '2018-11-01 01:26:40', 56),
(15, '6.00', 12, 1, '2018-11-01 01:26:40', '2018-11-01 01:26:40', 57),
(15, '6.00', 11, 1, '2018-11-01 01:26:40', '2018-11-01 01:26:40', 58),
(15, '6.00', 10, 1, '2018-11-01 01:26:41', '2018-11-01 01:26:41', 59),
(15, '6.00', 9, 1, '2018-11-01 01:26:41', '2018-11-01 01:26:41', 60),
(15, '6.00', 8, 1, '2018-11-01 01:26:41', '2018-11-01 01:26:41', 61),
(15, '6.00', 7, 1, '2018-11-01 01:26:41', '2018-11-01 01:26:41', 62),
(15, '6.00', 6, 1, '2018-11-01 01:26:41', '2018-11-01 01:26:41', 63),
(15, '6.00', 5, 1, '2018-11-01 01:26:41', '2018-11-01 01:26:41', 64),
(15, '7.00', 4, 1, '2018-11-01 01:26:41', '2018-11-01 01:26:41', 65),
(15, '8.00', 3, 1, '2018-11-01 01:26:41', '2018-11-01 01:26:41', 66),
(15, '6.00', 2, 1, '2018-11-01 01:26:41', '2018-11-01 01:26:41', 67),
(15, '8.00', 1, 1, '2018-11-01 01:26:41', '2018-11-01 01:26:41', 68),
(16, '3.00', 24, 1, '2018-11-01 01:38:48', '2018-11-01 01:38:48', 69),
(16, '4.00', 21, 1, '2018-11-01 01:38:48', '2018-11-01 01:38:48', 70),
(16, '4.00', 20, 1, '2018-11-01 01:38:48', '2018-11-01 01:38:48', 71),
(16, '4.00', 19, 1, '2018-11-01 01:38:48', '2018-11-01 01:38:48', 72),
(16, '4.00', 18, 1, '2018-11-01 01:38:48', '2018-11-01 01:38:48', 73),
(16, '4.00', 17, 1, '2018-11-01 01:38:48', '2018-11-01 01:38:48', 74),
(16, '4.00', 16, 1, '2018-11-01 01:38:48', '2018-11-01 01:38:48', 75),
(16, '4.00', 15, 1, '2018-11-01 01:38:48', '2018-11-01 01:38:48', 76),
(16, '4.00', 14, 1, '2018-11-01 01:38:48', '2018-11-01 01:38:48', 77),
(16, '4.00', 13, 1, '2018-11-01 01:38:48', '2018-11-01 01:38:48', 78),
(16, '4.00', 12, 1, '2018-11-01 01:38:48', '2018-11-01 01:38:48', 79),
(16, '4.00', 11, 1, '2018-11-01 01:38:49', '2018-11-01 01:38:49', 80),
(16, '4.00', 10, 1, '2018-11-01 01:38:49', '2018-11-01 01:38:49', 81),
(16, '4.00', 9, 1, '2018-11-01 01:38:49', '2018-11-01 01:38:49', 82),
(16, '4.00', 8, 1, '2018-11-01 01:38:49', '2018-11-01 01:38:49', 83),
(16, '4.00', 7, 1, '2018-11-01 01:38:49', '2018-11-01 01:38:49', 84),
(16, '4.00', 6, 1, '2018-11-01 01:38:49', '2018-11-01 01:38:49', 85),
(16, '4.00', 5, 1, '2018-11-01 01:38:49', '2018-11-01 01:38:49', 86),
(16, '4.00', 4, 1, '2018-11-01 01:38:49', '2018-11-01 01:38:49', 87),
(16, '4.00', 3, 1, '2018-11-01 01:38:49', '2018-11-01 01:38:49', 88),
(16, '4.00', 2, 1, '2018-11-01 01:38:49', '2018-11-01 01:38:49', 89),
(16, '4.00', 1, 1, '2018-11-01 01:38:49', '2018-11-01 01:38:49', 90),
(17, '6.00', 24, 1, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 91),
(17, '6.00', 21, 1, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 92),
(17, '6.00', 20, 1, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 93),
(17, '6.00', 19, 1, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 94),
(17, '6.00', 18, 1, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 95),
(17, '6.00', 17, 1, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 96),
(17, '6.00', 16, 1, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 97),
(17, '6.00', 15, 1, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 98),
(17, '6.00', 14, 1, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 99),
(17, '6.00', 13, 1, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 100),
(17, '6.00', 12, 1, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 101),
(17, '6.00', 11, 1, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 102),
(17, '6.00', 10, 1, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 103),
(17, '6.00', 9, 1, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 104),
(17, '6.00', 8, 1, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 105),
(17, '6.00', 7, 1, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 106),
(17, '6.00', 6, 1, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 107),
(17, '6.00', 5, 1, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 108),
(17, '6.00', 4, 1, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 109),
(17, '6.00', 3, 1, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 110),
(17, '6.00', 2, 1, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 111),
(17, '6.00', 1, 1, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 112),
(22, '4.00', 25, 1, '2019-05-09 20:13:53', '2019-05-09 20:13:53', 113),
(22, '4.00', 24, 1, '2019-05-09 20:13:54', '2019-05-09 20:13:54', 114),
(22, '4.00', 21, 1, '2019-05-09 20:13:54', '2019-05-09 20:13:54', 115),
(22, '4.00', 20, 1, '2019-05-09 20:13:54', '2019-05-09 20:13:54', 116),
(22, '4.00', 19, 1, '2019-05-09 20:13:54', '2019-05-09 20:13:54', 117),
(22, '4.00', 18, 1, '2019-05-09 20:13:54', '2019-05-09 20:13:54', 118),
(22, '4.00', 17, 1, '2019-05-09 20:13:54', '2019-05-09 20:13:54', 119),
(22, '4.00', 16, 1, '2019-05-09 20:13:54', '2019-05-09 20:13:54', 120),
(22, '4.00', 15, 1, '2019-05-09 20:13:54', '2019-05-09 20:13:54', 121),
(22, '4.00', 14, 1, '2019-05-09 20:13:54', '2019-05-09 20:13:54', 122),
(22, '4.00', 13, 1, '2019-05-09 20:13:54', '2019-05-09 20:13:54', 123),
(22, '4.00', 12, 1, '2019-05-09 20:13:54', '2019-05-09 20:13:54', 124),
(22, '4.00', 11, 1, '2019-05-09 20:13:54', '2019-05-09 20:13:54', 125),
(22, '4.00', 10, 1, '2019-05-09 20:13:55', '2019-05-09 20:13:55', 126),
(22, '4.00', 9, 1, '2019-05-09 20:13:55', '2019-05-09 20:13:55', 127),
(22, '4.00', 8, 1, '2019-05-09 20:13:55', '2019-05-09 20:13:55', 128),
(22, '4.00', 7, 1, '2019-05-09 20:13:55', '2019-05-09 20:13:55', 129),
(22, '4.00', 6, 1, '2019-05-09 20:13:55', '2019-05-09 20:13:55', 130),
(22, '4.00', 5, 1, '2019-05-09 20:13:55', '2019-05-09 20:13:55', 131),
(22, '4.00', 4, 1, '2019-05-09 20:13:55', '2019-05-09 20:13:55', 132),
(22, '4.00', 3, 1, '2019-05-09 20:13:55', '2019-05-09 20:13:55', 133),
(22, '4.00', 2, 1, '2019-05-09 20:13:55', '2019-05-09 20:13:55', 134),
(22, '4.00', 1, 1, '2019-05-09 20:13:55', '2019-05-09 20:13:55', 135);

--
-- Disparadores `puntajepreguntas`
--
DELIMITER $$
CREATE TRIGGER `despues_de_pregunta` AFTER INSERT ON `puntajepreguntas` FOR EACH ROW BEGIN

   DECLARE idpil integer;
   DECLARE pilcont integer;
   DECLARE ponde integer;
                    
   Set @idpil = (SELECT `idpilar` FROM `indicadores` 
                    WHERE id=NEW.idindicador);
                    
   Set @pilcont = (SELECT COUNT(`idpilar`) FROM `indicadores` 
                    WHERE idpilar=@idpil and condicion=1);
 
   SET @ponde =(NEW.ponderacion*(1/@pilcont));
                                        
   INSERT INTO puntajeindicadores
   ( idmun,
     ponderacion,
     calificacion,
     idindicador,
     cont,
     idpilar
   )
   VALUES
   (
       NEW.idmun,
       @ponde,
       NEW.ponderacion,
       NEW.idindicador,
       1,
       @idpil
   );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `despues_de_pregunta1` AFTER UPDATE ON `puntajepreguntas` FOR EACH ROW BEGIN

   DECLARE idpil integer;
   DECLARE pilcont integer;
   DECLARE ponde integer;
                    
   Set @idpil = (SELECT `idpilar` FROM `indicadores` 
                    WHERE id=NEW.idindicador);
                    
   Set @pilcont = (SELECT COUNT(`idpilar`) FROM `indicadores` 
                    WHERE idpilar=@idpil and condicion=1);
 
   SET @ponde =(NEW.ponderacion*(1/@pilcont));

	UPDATE puntajeindicadores
	SET ponderacion=@ponde, calificacion=NEW.ponderacion, cont = cont+1
	WHERE idmun=NEW.idmun and idindicador=NEW.idindicador;
    
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repuestas`
--

CREATE TABLE `repuestas` (
  `idmun` int(10) UNSIGNED NOT NULL,
  `ponderacion` decimal(10,2) NOT NULL,
  `idindicador` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `repuestas`
--

INSERT INTO `repuestas` (`idmun`, `ponderacion`, `idindicador`, `created_at`, `updated_at`, `id`) VALUES
(13, '0.00', 24, '2018-11-01 04:58:30', '2018-11-01 04:58:30', 1),
(13, '0.00', 23, '2018-11-01 04:58:30', '2018-11-01 04:58:30', 2),
(13, '0.00', 21, '2018-11-01 04:58:30', '2018-11-01 04:58:30', 3),
(13, '0.00', 20, '2018-11-01 04:58:30', '2018-11-01 04:58:30', 4),
(13, '0.00', 19, '2018-11-01 04:58:30', '2018-11-01 04:58:30', 5),
(13, '0.00', 18, '2018-11-01 04:58:30', '2018-11-01 04:58:30', 6),
(13, '0.00', 17, '2018-11-01 04:58:30', '2018-11-01 04:58:30', 7),
(13, '0.00', 16, '2018-11-01 04:58:30', '2018-11-01 04:58:30', 8),
(13, '0.00', 15, '2018-11-01 04:58:30', '2018-11-01 04:58:30', 9),
(13, '0.00', 14, '2018-11-01 04:58:31', '2018-11-01 04:58:31', 10),
(13, '0.00', 13, '2018-11-01 04:58:31', '2018-11-01 04:58:31', 11),
(13, '0.00', 12, '2018-11-01 04:58:31', '2018-11-01 04:58:31', 12),
(13, '0.00', 11, '2018-11-01 04:58:31', '2018-11-01 04:58:31', 13),
(13, '0.00', 10, '2018-11-01 04:58:31', '2018-11-01 04:58:31', 14),
(13, '0.00', 9, '2018-11-01 04:58:31', '2018-11-01 04:58:31', 15),
(13, '0.00', 8, '2018-11-01 04:58:32', '2018-11-01 04:58:32', 16),
(13, '0.00', 7, '2018-11-01 04:58:32', '2018-11-01 04:58:32', 17),
(13, '0.00', 6, '2018-11-01 04:58:32', '2018-11-01 04:58:32', 18),
(13, '0.00', 5, '2018-11-01 04:58:32', '2018-11-01 04:58:32', 19),
(13, '0.00', 4, '2018-11-01 04:58:32', '2018-11-01 04:58:32', 20),
(13, '0.00', 3, '2018-11-01 04:58:32', '2018-11-01 04:58:32', 21),
(13, '0.00', 2, '2018-11-01 04:58:32', '2018-11-01 04:58:32', 22),
(13, '0.00', 1, '2018-11-01 04:58:32', '2018-11-01 04:58:32', 23),
(13, '2.00', 24, '2018-11-01 04:59:38', '2018-11-01 04:59:38', 24),
(13, '0.00', 23, '2018-11-01 04:59:38', '2018-11-01 04:59:38', 25),
(13, '10.00', 21, '2018-11-01 04:59:38', '2018-11-01 04:59:38', 26),
(13, '5.00', 20, '2018-11-01 04:59:38', '2018-11-01 04:59:38', 27),
(13, '6.00', 19, '2018-11-01 04:59:38', '2018-11-01 04:59:38', 28),
(13, '4.00', 18, '2018-11-01 04:59:38', '2018-11-01 04:59:38', 29),
(13, '8.00', 17, '2018-11-01 04:59:38', '2018-11-01 04:59:38', 30),
(13, '6.00', 16, '2018-11-01 04:59:38', '2018-11-01 04:59:38', 31),
(13, '7.00', 15, '2018-11-01 04:59:38', '2018-11-01 04:59:38', 32),
(13, '5.00', 14, '2018-11-01 04:59:38', '2018-11-01 04:59:38', 33),
(13, '4.00', 13, '2018-11-01 04:59:38', '2018-11-01 04:59:38', 34),
(13, '5.00', 12, '2018-11-01 04:59:38', '2018-11-01 04:59:38', 35),
(13, '4.00', 11, '2018-11-01 04:59:38', '2018-11-01 04:59:38', 36),
(13, '4.00', 10, '2018-11-01 04:59:39', '2018-11-01 04:59:39', 37),
(13, '5.00', 9, '2018-11-01 04:59:39', '2018-11-01 04:59:39', 38),
(13, '4.00', 8, '2018-11-01 04:59:39', '2018-11-01 04:59:39', 39),
(13, '2.00', 7, '2018-11-01 04:59:39', '2018-11-01 04:59:39', 40),
(13, '4.00', 6, '2018-11-01 04:59:39', '2018-11-01 04:59:39', 41),
(13, '6.00', 5, '2018-11-01 04:59:39', '2018-11-01 04:59:39', 42),
(13, '4.00', 4, '2018-11-01 04:59:39', '2018-11-01 04:59:39', 43),
(13, '0.00', 3, '2018-11-01 04:59:39', '2018-11-01 04:59:39', 44),
(13, '0.00', 2, '2018-11-01 04:59:39', '2018-11-01 04:59:39', 45),
(13, '0.00', 1, '2018-11-01 04:59:39', '2018-11-01 04:59:39', 46),
(14, '8.00', 24, '2018-11-01 06:43:14', '2018-11-01 06:43:14', 47),
(14, '8.00', 21, '2018-11-01 06:43:15', '2018-11-01 06:43:15', 48),
(14, '8.00', 20, '2018-11-01 06:43:15', '2018-11-01 06:43:15', 49),
(14, '8.00', 19, '2018-11-01 06:43:15', '2018-11-01 06:43:15', 50),
(14, '0.00', 18, '2018-11-01 06:43:15', '2018-11-01 06:43:15', 51),
(14, '7.00', 17, '2018-11-01 06:43:15', '2018-11-01 06:43:15', 52),
(14, '7.00', 16, '2018-11-01 06:43:15', '2018-11-01 06:43:15', 53),
(14, '7.00', 15, '2018-11-01 06:43:15', '2018-11-01 06:43:15', 54),
(14, '8.00', 14, '2018-11-01 06:43:15', '2018-11-01 06:43:15', 55),
(14, '8.00', 13, '2018-11-01 06:43:15', '2018-11-01 06:43:15', 56),
(14, '0.00', 12, '2018-11-01 06:43:15', '2018-11-01 06:43:15', 57),
(14, '7.00', 11, '2018-11-01 06:43:15', '2018-11-01 06:43:15', 58),
(14, '8.00', 10, '2018-11-01 06:43:15', '2018-11-01 06:43:15', 59),
(14, '8.00', 9, '2018-11-01 06:43:15', '2018-11-01 06:43:15', 60),
(14, '8.00', 8, '2018-11-01 06:43:15', '2018-11-01 06:43:15', 61),
(14, '8.00', 7, '2018-11-01 06:43:16', '2018-11-01 06:43:16', 62),
(14, '9.00', 6, '2018-11-01 06:43:16', '2018-11-01 06:43:16', 63),
(14, '9.00', 5, '2018-11-01 06:43:16', '2018-11-01 06:43:16', 64),
(14, '8.00', 4, '2018-11-01 06:43:16', '2018-11-01 06:43:16', 65),
(14, '0.00', 3, '2018-11-01 06:43:16', '2018-11-01 06:43:16', 66),
(14, '7.00', 2, '2018-11-01 06:43:16', '2018-11-01 06:43:16', 67),
(14, '8.00', 1, '2018-11-01 06:43:16', '2018-11-01 06:43:16', 68),
(14, '5.00', 23, '2018-11-01 06:44:26', '2018-11-01 06:44:26', 69),
(14, '5.00', 24, '2018-11-01 01:19:11', '2018-11-01 01:19:11', 70),
(14, '6.00', 21, '2018-11-01 01:19:11', '2018-11-01 01:19:11', 71),
(14, '6.00', 20, '2018-11-01 01:19:11', '2018-11-01 01:19:11', 72),
(14, '6.00', 19, '2018-11-01 01:19:11', '2018-11-01 01:19:11', 73),
(14, '0.00', 18, '2018-11-01 01:19:11', '2018-11-01 01:19:11', 74),
(14, '4.00', 17, '2018-11-01 01:19:11', '2018-11-01 01:19:11', 75),
(14, '5.00', 16, '2018-11-01 01:19:11', '2018-11-01 01:19:11', 76),
(14, '1.00', 15, '2018-11-01 01:19:11', '2018-11-01 01:19:11', 77),
(14, '5.00', 14, '2018-11-01 01:19:11', '2018-11-01 01:19:11', 78),
(14, '6.00', 13, '2018-11-01 01:19:11', '2018-11-01 01:19:11', 79),
(14, '4.00', 12, '2018-11-01 01:19:11', '2018-11-01 01:19:11', 80),
(14, '2.00', 11, '2018-11-01 01:19:11', '2018-11-01 01:19:11', 81),
(14, '6.00', 10, '2018-11-01 01:19:11', '2018-11-01 01:19:11', 82),
(14, '4.00', 9, '2018-11-01 01:19:11', '2018-11-01 01:19:11', 83),
(14, '1.00', 8, '2018-11-01 01:19:11', '2018-11-01 01:19:11', 84),
(14, '2.00', 7, '2018-11-01 01:19:11', '2018-11-01 01:19:11', 85),
(14, '3.00', 6, '2018-11-01 01:19:11', '2018-11-01 01:19:11', 86),
(14, '1.00', 5, '2018-11-01 01:19:11', '2018-11-01 01:19:11', 87),
(14, '6.00', 4, '2018-11-01 01:19:11', '2018-11-01 01:19:11', 88),
(14, '5.00', 3, '2018-11-01 01:19:11', '2018-11-01 01:19:11', 89),
(14, '4.00', 2, '2018-11-01 01:19:11', '2018-11-01 01:19:11', 90),
(14, '5.00', 1, '2018-11-01 01:19:11', '2018-11-01 01:19:11', 91),
(15, '6.00', 24, '2018-11-01 01:26:40', '2018-11-01 01:26:40', 92),
(15, '6.00', 21, '2018-11-01 01:26:40', '2018-11-01 01:26:40', 93),
(15, '2.00', 20, '2018-11-01 01:26:40', '2018-11-01 01:26:40', 94),
(15, '8.00', 19, '2018-11-01 01:26:40', '2018-11-01 01:26:40', 95),
(15, '1.00', 18, '2018-11-01 01:26:40', '2018-11-01 01:26:40', 96),
(15, '6.00', 17, '2018-11-01 01:26:40', '2018-11-01 01:26:40', 97),
(15, '8.00', 16, '2018-11-01 01:26:40', '2018-11-01 01:26:40', 98),
(15, '10.00', 15, '2018-11-01 01:26:40', '2018-11-01 01:26:40', 99),
(15, '5.00', 14, '2018-11-01 01:26:40', '2018-11-01 01:26:40', 100),
(15, '5.00', 13, '2018-11-01 01:26:40', '2018-11-01 01:26:40', 101),
(15, '6.00', 12, '2018-11-01 01:26:40', '2018-11-01 01:26:40', 102),
(15, '6.00', 11, '2018-11-01 01:26:40', '2018-11-01 01:26:40', 103),
(15, '6.00', 10, '2018-11-01 01:26:41', '2018-11-01 01:26:41', 104),
(15, '6.00', 9, '2018-11-01 01:26:41', '2018-11-01 01:26:41', 105),
(15, '6.00', 8, '2018-11-01 01:26:41', '2018-11-01 01:26:41', 106),
(15, '6.00', 7, '2018-11-01 01:26:41', '2018-11-01 01:26:41', 107),
(15, '6.00', 6, '2018-11-01 01:26:41', '2018-11-01 01:26:41', 108),
(15, '6.00', 5, '2018-11-01 01:26:41', '2018-11-01 01:26:41', 109),
(15, '7.00', 4, '2018-11-01 01:26:41', '2018-11-01 01:26:41', 110),
(15, '8.00', 3, '2018-11-01 01:26:41', '2018-11-01 01:26:41', 111),
(15, '6.00', 2, '2018-11-01 01:26:41', '2018-11-01 01:26:41', 112),
(15, '8.00', 1, '2018-11-01 01:26:41', '2018-11-01 01:26:41', 113),
(16, '3.00', 24, '2018-11-01 01:38:48', '2018-11-01 01:38:48', 114),
(16, '4.00', 21, '2018-11-01 01:38:48', '2018-11-01 01:38:48', 115),
(16, '4.00', 20, '2018-11-01 01:38:48', '2018-11-01 01:38:48', 116),
(16, '4.00', 19, '2018-11-01 01:38:48', '2018-11-01 01:38:48', 117),
(16, '4.00', 18, '2018-11-01 01:38:48', '2018-11-01 01:38:48', 118),
(16, '4.00', 17, '2018-11-01 01:38:48', '2018-11-01 01:38:48', 119),
(16, '4.00', 16, '2018-11-01 01:38:48', '2018-11-01 01:38:48', 120),
(16, '4.00', 15, '2018-11-01 01:38:48', '2018-11-01 01:38:48', 121),
(16, '4.00', 14, '2018-11-01 01:38:48', '2018-11-01 01:38:48', 122),
(16, '4.00', 13, '2018-11-01 01:38:48', '2018-11-01 01:38:48', 123),
(16, '4.00', 12, '2018-11-01 01:38:48', '2018-11-01 01:38:48', 124),
(16, '4.00', 11, '2018-11-01 01:38:49', '2018-11-01 01:38:49', 125),
(16, '4.00', 10, '2018-11-01 01:38:49', '2018-11-01 01:38:49', 126),
(16, '4.00', 9, '2018-11-01 01:38:49', '2018-11-01 01:38:49', 127),
(16, '4.00', 8, '2018-11-01 01:38:49', '2018-11-01 01:38:49', 128),
(16, '4.00', 7, '2018-11-01 01:38:49', '2018-11-01 01:38:49', 129),
(16, '4.00', 6, '2018-11-01 01:38:49', '2018-11-01 01:38:49', 130),
(16, '4.00', 5, '2018-11-01 01:38:49', '2018-11-01 01:38:49', 131),
(16, '4.00', 4, '2018-11-01 01:38:49', '2018-11-01 01:38:49', 132),
(16, '4.00', 3, '2018-11-01 01:38:49', '2018-11-01 01:38:49', 133),
(16, '4.00', 2, '2018-11-01 01:38:49', '2018-11-01 01:38:49', 134),
(16, '4.00', 1, '2018-11-01 01:38:49', '2018-11-01 01:38:49', 135),
(17, '6.00', 24, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 136),
(17, '6.00', 21, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 137),
(17, '6.00', 20, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 138),
(17, '6.00', 19, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 139),
(17, '6.00', 18, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 140),
(17, '6.00', 17, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 141),
(17, '6.00', 16, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 142),
(17, '6.00', 15, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 143),
(17, '6.00', 14, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 144),
(17, '6.00', 13, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 145),
(17, '6.00', 12, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 146),
(17, '6.00', 11, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 147),
(17, '6.00', 10, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 148),
(17, '6.00', 9, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 149),
(17, '6.00', 8, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 150),
(17, '6.00', 7, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 151),
(17, '6.00', 6, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 152),
(17, '6.00', 5, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 153),
(17, '6.00', 4, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 154),
(17, '6.00', 3, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 155),
(17, '6.00', 2, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 156),
(17, '6.00', 1, '2018-11-01 01:50:39', '2018-11-01 01:50:39', 157),
(13, '10.00', 24, '2018-11-04 20:37:45', '2018-11-04 20:37:45', 158),
(13, '10.00', 21, '2018-11-04 20:37:45', '2018-11-04 20:37:45', 159),
(13, '10.00', 20, '2018-11-04 20:37:45', '2018-11-04 20:37:45', 160),
(13, '10.00', 19, '2018-11-04 20:37:45', '2018-11-04 20:37:45', 161),
(13, '10.00', 18, '2018-11-04 20:37:45', '2018-11-04 20:37:45', 162),
(13, '10.00', 17, '2018-11-04 20:37:45', '2018-11-04 20:37:45', 163),
(13, '10.00', 16, '2018-11-04 20:37:45', '2018-11-04 20:37:45', 164),
(13, '10.00', 15, '2018-11-04 20:37:45', '2018-11-04 20:37:45', 165),
(13, '10.00', 14, '2018-11-04 20:37:45', '2018-11-04 20:37:45', 166),
(13, '10.00', 13, '2018-11-04 20:37:45', '2018-11-04 20:37:45', 167),
(13, '10.00', 12, '2018-11-04 20:37:45', '2018-11-04 20:37:45', 168),
(13, '10.00', 11, '2018-11-04 20:37:45', '2018-11-04 20:37:45', 169),
(13, '10.00', 10, '2018-11-04 20:37:45', '2018-11-04 20:37:45', 170),
(13, '10.00', 9, '2018-11-04 20:37:45', '2018-11-04 20:37:45', 171),
(13, '10.00', 8, '2018-11-04 20:37:45', '2018-11-04 20:37:45', 172),
(13, '10.00', 7, '2018-11-04 20:37:45', '2018-11-04 20:37:45', 173),
(13, '10.00', 6, '2018-11-04 20:37:45', '2018-11-04 20:37:45', 174),
(13, '10.00', 5, '2018-11-04 20:37:46', '2018-11-04 20:37:46', 175),
(13, '10.00', 4, '2018-11-04 20:37:46', '2018-11-04 20:37:46', 176),
(13, '10.00', 3, '2018-11-04 20:37:46', '2018-11-04 20:37:46', 177),
(13, '10.00', 2, '2018-11-04 20:37:46', '2018-11-04 20:37:46', 178),
(13, '10.00', 1, '2018-11-04 20:37:46', '2018-11-04 20:37:46', 179),
(13, '0.00', 24, '2018-11-05 19:43:37', '2018-11-05 19:43:37', 180),
(13, '0.00', 21, '2018-11-05 19:43:37', '2018-11-05 19:43:37', 181),
(13, '0.00', 20, '2018-11-05 19:43:37', '2018-11-05 19:43:37', 182),
(13, '0.00', 19, '2018-11-05 19:43:37', '2018-11-05 19:43:37', 183),
(13, '0.00', 18, '2018-11-05 19:43:37', '2018-11-05 19:43:37', 184),
(13, '0.00', 17, '2018-11-05 19:43:37', '2018-11-05 19:43:37', 185),
(13, '0.00', 16, '2018-11-05 19:43:37', '2018-11-05 19:43:37', 186),
(13, '0.00', 15, '2018-11-05 19:43:37', '2018-11-05 19:43:37', 187),
(13, '0.00', 14, '2018-11-05 19:43:37', '2018-11-05 19:43:37', 188),
(13, '0.00', 13, '2018-11-05 19:43:37', '2018-11-05 19:43:37', 189),
(13, '0.00', 12, '2018-11-05 19:43:37', '2018-11-05 19:43:37', 190),
(13, '0.00', 11, '2018-11-05 19:43:37', '2018-11-05 19:43:37', 191),
(13, '0.00', 10, '2018-11-05 19:43:37', '2018-11-05 19:43:37', 192),
(13, '0.00', 9, '2018-11-05 19:43:37', '2018-11-05 19:43:37', 193),
(13, '0.00', 8, '2018-11-05 19:43:37', '2018-11-05 19:43:37', 194),
(13, '0.00', 7, '2018-11-05 19:43:37', '2018-11-05 19:43:37', 195),
(13, '0.00', 6, '2018-11-05 19:43:38', '2018-11-05 19:43:38', 196),
(13, '0.00', 5, '2018-11-05 19:43:38', '2018-11-05 19:43:38', 197),
(13, '0.00', 4, '2018-11-05 19:43:38', '2018-11-05 19:43:38', 198),
(13, '0.00', 3, '2018-11-05 19:43:38', '2018-11-05 19:43:38', 199),
(13, '0.00', 2, '2018-11-05 19:43:38', '2018-11-05 19:43:38', 200),
(13, '0.00', 1, '2018-11-05 19:43:38', '2018-11-05 19:43:38', 201),
(13, '0.00', 24, '2018-11-05 19:44:08', '2018-11-05 19:44:08', 202),
(13, '0.00', 21, '2018-11-05 19:44:08', '2018-11-05 19:44:08', 203),
(13, '0.00', 20, '2018-11-05 19:44:08', '2018-11-05 19:44:08', 204),
(13, '0.00', 19, '2018-11-05 19:44:08', '2018-11-05 19:44:08', 205),
(13, '0.00', 18, '2018-11-05 19:44:08', '2018-11-05 19:44:08', 206),
(13, '0.00', 17, '2018-11-05 19:44:08', '2018-11-05 19:44:08', 207),
(13, '0.00', 16, '2018-11-05 19:44:08', '2018-11-05 19:44:08', 208),
(13, '0.00', 15, '2018-11-05 19:44:08', '2018-11-05 19:44:08', 209),
(13, '0.00', 14, '2018-11-05 19:44:08', '2018-11-05 19:44:08', 210),
(13, '0.00', 13, '2018-11-05 19:44:08', '2018-11-05 19:44:08', 211),
(13, '0.00', 12, '2018-11-05 19:44:08', '2018-11-05 19:44:08', 212),
(13, '0.00', 11, '2018-11-05 19:44:08', '2018-11-05 19:44:08', 213),
(13, '0.00', 10, '2018-11-05 19:44:08', '2018-11-05 19:44:08', 214),
(13, '0.00', 9, '2018-11-05 19:44:08', '2018-11-05 19:44:08', 215),
(13, '0.00', 8, '2018-11-05 19:44:08', '2018-11-05 19:44:08', 216),
(13, '0.00', 7, '2018-11-05 19:44:08', '2018-11-05 19:44:08', 217),
(13, '0.00', 6, '2018-11-05 19:44:08', '2018-11-05 19:44:08', 218),
(13, '0.00', 5, '2018-11-05 19:44:08', '2018-11-05 19:44:08', 219),
(13, '0.00', 4, '2018-11-05 19:44:08', '2018-11-05 19:44:08', 220),
(13, '0.00', 3, '2018-11-05 19:44:08', '2018-11-05 19:44:08', 221),
(13, '0.00', 2, '2018-11-05 19:44:08', '2018-11-05 19:44:08', 222),
(13, '0.00', 1, '2018-11-05 19:44:08', '2018-11-05 19:44:08', 223),
(22, '4.00', 25, '2019-05-10 02:13:53', '2019-05-10 02:13:53', 224),
(22, '4.00', 24, '2019-05-10 02:13:54', '2019-05-10 02:13:54', 225),
(22, '4.00', 21, '2019-05-10 02:13:54', '2019-05-10 02:13:54', 226),
(22, '4.00', 20, '2019-05-10 02:13:54', '2019-05-10 02:13:54', 227),
(22, '4.00', 19, '2019-05-10 02:13:54', '2019-05-10 02:13:54', 228),
(22, '4.00', 18, '2019-05-10 02:13:54', '2019-05-10 02:13:54', 229),
(22, '4.00', 17, '2019-05-10 02:13:54', '2019-05-10 02:13:54', 230),
(22, '4.00', 16, '2019-05-10 02:13:54', '2019-05-10 02:13:54', 231),
(22, '4.00', 15, '2019-05-10 02:13:54', '2019-05-10 02:13:54', 232),
(22, '4.00', 14, '2019-05-10 02:13:54', '2019-05-10 02:13:54', 233),
(22, '4.00', 13, '2019-05-10 02:13:54', '2019-05-10 02:13:54', 234),
(22, '4.00', 12, '2019-05-10 02:13:54', '2019-05-10 02:13:54', 235),
(22, '4.00', 11, '2019-05-10 02:13:54', '2019-05-10 02:13:54', 236),
(22, '4.00', 10, '2019-05-10 02:13:55', '2019-05-10 02:13:55', 237),
(22, '4.00', 9, '2019-05-10 02:13:55', '2019-05-10 02:13:55', 238),
(22, '4.00', 8, '2019-05-10 02:13:55', '2019-05-10 02:13:55', 239),
(22, '4.00', 7, '2019-05-10 02:13:55', '2019-05-10 02:13:55', 240),
(22, '4.00', 6, '2019-05-10 02:13:55', '2019-05-10 02:13:55', 241),
(22, '4.00', 5, '2019-05-10 02:13:55', '2019-05-10 02:13:55', 242),
(22, '4.00', 4, '2019-05-10 02:13:55', '2019-05-10 02:13:55', 243),
(22, '4.00', 3, '2019-05-10 02:13:55', '2019-05-10 02:13:55', 244),
(22, '4.00', 2, '2019-05-10 02:13:55', '2019-05-10 02:13:55', 245),
(22, '4.00', 1, '2019-05-10 02:13:55', '2019-05-10 02:13:55', 246);

--
-- Disparadores `repuestas`
--
DELIMITER $$
CREATE TRIGGER `despues_de_respuesta` AFTER INSERT ON `repuestas` FOR EACH ROW BEGIN

   DECLARE ponde integer;
   DECLARE contar integer;
   DECLARE contar2 integer;
      
   SET @ponde = (SELECT SUM(`ponderacion`) FROM `repuestas` 
     WHERE idmun=NEW.idmun and idindicador=NEW.idindicador); 
                    
   Set @contar = (SELECT COUNT(*) FROM `puntajepreguntas` 
     WHERE idmun=NEW.idmun and idindicador=NEW.idindicador);
   
   Set @contar2 = (SELECT COUNT(*) FROM `repuestas` 
     WHERE idmun=NEW.idmun and idindicador=NEW.idindicador);
                  

IF @contar=0 THEN
   INSERT INTO puntajepreguntas
   ( idmun,
     ponderacion,
     idindicador,
     cont
   )
   VALUES
   (
       NEW.idmun,
       NEW.ponderacion,
       NEW.idindicador,
       1
   );

ELSEIF @contar > 0 THEN
UPDATE puntajepreguntas
SET cont = cont+1, ponderacion=(@ponde/@contar2)
WHERE idmun=NEW.idmun and idindicador=NEW.idindicador;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `descripcion`, `condicion`) VALUES
(1, 'Administrador', 'Administradores de área', 1),
(2, 'Digitador', 'Encargado de digitar las encuestas por departamento ', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tablapibs`
--

CREATE TABLE `tablapibs` (
  `id` int(10) UNSIGNED NOT NULL,
  `etapa` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pib_menor` decimal(11,2) NOT NULL,
  `pib_mayor` decimal(11,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tablapibs`
--

INSERT INTO `tablapibs` (`id`, `etapa`, `pib_menor`, `pib_mayor`, `created_at`, `updated_at`) VALUES
(1, 'Etapa1', '0.00', '5.00', NULL, '2019-05-10 02:05:39'),
(2, 'Etapa2', '6.00', '10.00', NULL, NULL),
(3, 'Etapa3', '11.00', '97.00', NULL, '2019-05-10 02:05:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entidad` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1',
  `idrol` int(10) UNSIGNED NOT NULL,
  `iddep` int(10) UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombre`, `email`, `telefono`, `entidad`, `usuario`, `password`, `condicion`, `idrol`, `iddep`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Edgar Omar Lopez', 'lopezovalle91@gmail.com', '5615825', 'Mesoamericana', 'Edgar12', '$2y$10$aC9qj1u2ERlZUw3obXafeOhdVvuh4/gCuJZaV5F/USeTT4uxAUsGK', 1, 1, 13, 'DfPyQIdxVhm6yblSXpap9P7kHpomZ3AOC6gbp8Wdy7Cp5iPBtRahlBZI3sKQ', '2018-10-19 03:30:52', '2018-10-19 03:30:52'),
(2, 'Juaquin', 'Juaquin23@gmail.com', '56158058', 'Mesoamenricana', 'Juaquin23', '$2y$10$dtRqDrQlCwAX7S.U.YcnTufhhatzlDtvXzlRrPhVzY84rOWUr2I.S', 1, 2, 10, 'AzaD5Kluqs0fPQAn8i4pWO40hsO47BHc1a1EzEloreJLQYRn32lyKiND8tYy', '2018-10-20 01:09:21', '2018-10-20 01:09:21'),
(3, 'Jose lopez', 'ejemplo@hotmail.com', '12345678', 'FUNDESA', 'jose23', '$2y$10$v07/u.Nmvcc4NxsuuKZRQ.O2fbU9d.B1S/A0lR6zginC/esbUXeEm', 0, 2, 17, 'LxTggxFK37eGq2RNKwrfOwZn94IsnICPWxNHzfgG8G9bpmGNaQRZ1H6ppCjH', '2018-10-31 00:14:58', '2018-11-06 23:12:36'),
(4, 'Gelder', 'josep19961@hotmail.com', '1234567', 'COSAMI', 'Gelder21', '$2y$10$wse5.cx34tgiJNUdI81fpOhRfKQe.lvDonRYKByQIi3VoPZ9FS8cW', 1, 2, 10, NULL, '2018-11-01 01:42:34', '2019-05-10 02:17:01'),
(5, 'Juan Diego Molina', 'juandiego.molina@gruposgestores.org.gt', '56625364', 'RNGG', 'jdm_92', '$2y$10$Bn1iIcl5zqpXE90un1aqguzzWr72AI.RHwUF7KJ3nb1a5ESxpOy6K', 1, 1, 17, 'eboqyHtDI4JuTQXVg5VoG3TTNiLEXIpLBpUCKMf4TIN3PomEpZryBnGIDFqf', '2018-11-06 23:12:08', '2018-11-06 23:12:08'),
(6, 'Digitador', 'digitador@hotmail.com', '4654654', 'Digitador', 'digitador', '$2y$10$S/xef.30/O3KI7R4TKrjYOrT7XKsg.ZxK5ltK72089Uzwvm9hl4i2', 1, 2, 4, 'j3w4zmCS0E05sO1H0hdAldHtJ79qgRADrvpP1NjsxsIvPhxex2wRbuPAdrYV', '2018-11-06 23:20:52', '2018-11-06 23:20:52'),
(7, 'Angélica Tax', 'angelica.tax@gruposgestores.org.gt', '43621040', 'RNGG', 'angelica.tax', '$2y$10$Tj7QcDYUVjtQ.0lrbIkAUOxwVtXhx.XD4zZWqM1Nr5JHBLY9mc53G', 1, 2, 7, NULL, '2018-11-06 23:22:30', '2018-11-06 23:22:30'),
(8, 'Gel', 'geldequi@gmail.com', '41414141', 'Meso', 'gelder', '$2y$12$/6j/WHxoSIP6DeQbRw4UvO22zwmaeWJvzd58PV7TdPnQRiOTSaUGC', 1, 1, 1, NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `correos`
--
ALTER TABLE `correos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departamentos_nombre_unique` (`nombre`);

--
-- Indices de la tabla `indicadores`
--
ALTER TABLE `indicadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indicadores_idpilar_foreign` (`idpilar`);

--
-- Indices de la tabla `indices`
--
ALTER TABLE `indices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indices_iddep_foreign` (`iddep`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `pilares`
--
ALTER TABLE `pilares`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `puntajeindicadores`
--
ALTER TABLE `puntajeindicadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `puntajeindicadores_idindicador_foreign` (`idindicador`),
  ADD KEY `puntajeindicadores_idpilar_foreign` (`idpilar`),
  ADD KEY `idmun` (`idmun`);

--
-- Indices de la tabla `puntajepilares`
--
ALTER TABLE `puntajepilares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `puntajepilares_idpilar_foreign` (`idpilar`),
  ADD KEY `puntajepilares_idmun_foreign` (`idmun`) USING BTREE;

--
-- Indices de la tabla `puntajepreguntas`
--
ALTER TABLE `puntajepreguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `puntajepreguntas_idmun_foreign` (`idmun`) USING BTREE,
  ADD KEY `puntajepreguntas_idindicador_foreign` (`idindicador`) USING BTREE;

--
-- Indices de la tabla `repuestas`
--
ALTER TABLE `repuestas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `repuestas_idmun_foreign` (`idmun`) USING BTREE,
  ADD KEY `repuestas_idindicador_foreign` (`idindicador`) USING BTREE;

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_nombre_unique` (`nombre`);

--
-- Indices de la tabla `tablapibs`
--
ALTER TABLE `tablapibs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tablapibs_etapa_unique` (`etapa`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_usuario_unique` (`usuario`),
  ADD KEY `users_idrol_foreign` (`idrol`),
  ADD KEY `users_iddep_foreign` (`iddep`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `correos`
--
ALTER TABLE `correos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `indicadores`
--
ALTER TABLE `indicadores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `indices`
--
ALTER TABLE `indices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `pilares`
--
ALTER TABLE `pilares`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `puntajeindicadores`
--
ALTER TABLE `puntajeindicadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT de la tabla `puntajepilares`
--
ALTER TABLE `puntajepilares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT de la tabla `puntajepreguntas`
--
ALTER TABLE `puntajepreguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT de la tabla `repuestas`
--
ALTER TABLE `repuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tablapibs`
--
ALTER TABLE `tablapibs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `indicadores`
--
ALTER TABLE `indicadores`
  ADD CONSTRAINT `indicadores_idpilar_foreign` FOREIGN KEY (`idpilar`) REFERENCES `pilares` (`id`);

--
-- Filtros para la tabla `indices`
--
ALTER TABLE `indices`
  ADD CONSTRAINT `indices_iddep_foreign` FOREIGN KEY (`iddep`) REFERENCES `departamentos` (`id`);

--
-- Filtros para la tabla `puntajeindicadores`
--
ALTER TABLE `puntajeindicadores`
  ADD CONSTRAINT `puntajeindicadores_idindicador_foreign` FOREIGN KEY (`idindicador`) REFERENCES `indicadores` (`id`),
  ADD CONSTRAINT `puntajeindicadores_idmun_foreign` FOREIGN KEY (`idmun`) REFERENCES `indices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `puntajeindicadores_idpilar_foreign` FOREIGN KEY (`idpilar`) REFERENCES `pilares` (`id`);

--
-- Filtros para la tabla `puntajepilares`
--
ALTER TABLE `puntajepilares`
  ADD CONSTRAINT `puntajepilares_id_foreign` FOREIGN KEY (`idmun`) REFERENCES `indices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `puntajepilares_idpilar_foreign` FOREIGN KEY (`idpilar`) REFERENCES `pilares` (`id`);

--
-- Filtros para la tabla `puntajepreguntas`
--
ALTER TABLE `puntajepreguntas`
  ADD CONSTRAINT `puntajepreguntas_idindicador_foreign` FOREIGN KEY (`idindicador`) REFERENCES `indicadores` (`id`),
  ADD CONSTRAINT `puntajepreguntas_idmun_foreign` FOREIGN KEY (`idmun`) REFERENCES `indices` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `repuestas`
--
ALTER TABLE `repuestas`
  ADD CONSTRAINT `repuestas_id_foreign` FOREIGN KEY (`idmun`) REFERENCES `indices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `repuestas_idindicador_foreign` FOREIGN KEY (`idindicador`) REFERENCES `indicadores` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_iddep_foreign` FOREIGN KEY (`iddep`) REFERENCES `departamentos` (`id`),
  ADD CONSTRAINT `users_idrol_foreign` FOREIGN KEY (`idrol`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
