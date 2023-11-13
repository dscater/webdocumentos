-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 13-11-2023 a las 19:18:33
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `webdocumentos_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adjuntar_documentos`
--

CREATE TABLE `adjuntar_documentos` (
  `id` bigint UNSIGNED NOT NULL,
  `documento_id` bigint UNSIGNED NOT NULL,
  `archivo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracions`
--

CREATE TABLE `configuracions` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre_sistema` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razon_social` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ciudad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `web` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actividad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuracions`
--

INSERT INTO `configuracions` (`id`, `nombre_sistema`, `alias`, `razon_social`, `ciudad`, `dir`, `fono`, `web`, `actividad`, `correo`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'WEBDOCUMENTOS', 'WEBDOCUMENTOS', 'WEBDOCUMENTOS', 'LA PAZ', 'LOS OLIVOS', '222222', NULL, 'ACTIVIDAD', 'webdocumentos@gmail.com', 'logo.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dependencias`
--

CREATE TABLE `dependencias` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `dependencias`
--

INSERT INTO `dependencias` (`id`, `nombre`, `descripcion`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'DEPENDENCIA #1', 'DESC. DEPENDENCIA 1', '2023-11-13', '2023-11-13 19:09:33', '2023-11-13 19:09:33'),
(2, 'DEPENDENCIA #2', '', '2023-11-13', '2023-11-13 19:10:25', '2023-11-13 19:10:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devolucion_documentos`
--

CREATE TABLE `devolucion_documentos` (
  `id` bigint UNSIGNED NOT NULL,
  `documento_id` bigint UNSIGNED NOT NULL,
  `funcionario_id` bigint UNSIGNED NOT NULL,
  `cantidad_documentos` int NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dependencia_id` bigint UNSIGNED NOT NULL,
  `funcionario_id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estante_id` bigint UNSIGNED NOT NULL,
  `nivel` int NOT NULL,
  `division` int NOT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estantes`
--

CREATE TABLE `estantes` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nivel` int NOT NULL,
  `division` int NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gestion_ingreso` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_ingreso` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_baja` date NOT NULL,
  `fecha_item` date NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `funcionarios`
--

INSERT INTO `funcionarios` (`id`, `user_id`, `codigo`, `gestion_ingreso`, `tipo_ingreso`, `fecha_baja`, `fecha_item`, `descripcion`, `observaciones`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 3, 'F001', '2023', 'NORMAL', '2024-06-01', '2023-01-01', 'DESCRIPCION FUNCIONARIO', 'OBSERVACIONES FUNCIONARIO', '2023-11-13', '2023-11-13 19:16:54', '2023-11-13 19:16:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_accions`
--

CREATE TABLE `historial_accions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `accion` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `datos_original` text COLLATE utf8mb4_unicode_ci,
  `datos_nuevo` text COLLATE utf8mb4_unicode_ci,
  `modulo` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial_accions`
--

INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(1, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1234<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>correo: <br/>fono: 77777<br/>tipo: ADMINISTRADOR<br/>foto: 1699455836_JPERES.jpg<br/>password: $2y$10$Y3d5nYIEvQPOHFGubIiTqusMG.jnalhHtURER4udFPVJs.Wehpili<br/>acceso: 1<br/>fecha_registro: 2023-11-08<br/>created_at: 2023-11-08 11:03:56<br/>updated_at: 2023-11-08 11:03:56<br/>', NULL, 'USUARIOS', '2023-11-08', '11:03:56', '2023-11-08 15:03:56', '2023-11-08 15:03:56'),
(2, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1234<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>correo: <br/>fono: 77777<br/>tipo: ADMINISTRADOR<br/>foto: 1699455836_JPERES.jpg<br/>password: $2y$10$Y3d5nYIEvQPOHFGubIiTqusMG.jnalhHtURER4udFPVJs.Wehpili<br/>acceso: 1<br/>fecha_registro: 2023-11-08<br/>created_at: 2023-11-08 11:03:56<br/>updated_at: 2023-11-08 11:03:56<br/>', 'id: 2<br/>usuario: JPERES<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1234<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>correo: <br/>fono: 77777<br/>tipo: OPERADOR<br/>foto: 1699455836_JPERES.jpg<br/>password: $2y$10$Y3d5nYIEvQPOHFGubIiTqusMG.jnalhHtURER4udFPVJs.Wehpili<br/>acceso: 1<br/>fecha_registro: 2023-11-08<br/>created_at: 2023-11-08 11:03:56<br/>updated_at: 2023-11-08 11:04:02<br/>', 'USUARIOS', '2023-11-08', '11:04:02', '2023-11-08 15:04:02', '2023-11-08 15:04:02'),
(3, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'acceso: 1<br/>ci: 1234<br/>ci_exp: LP<br/>correo: <br/>created_at: 2023-11-08 11:03:56<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-11-08<br/>fono: 77777<br/>foto: 1699455836_JPERES.jpg<br/>id: 2<br/>materno: MAMANI<br/>nombre: JUAN<br/>password: $2y$10$Y3d5nYIEvQPOHFGubIiTqusMG.jnalhHtURER4udFPVJs.Wehpili<br/>paterno: PERES<br/>tipo: OPERADOR<br/>updated_at: 2023-11-08 11:04:02<br/>usuario: JPERES<br/>', 'acceso: 0<br/>ci: 1234<br/>ci_exp: LP<br/>correo: <br/>created_at: 2023-11-08 11:03:56<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-11-08<br/>fono: 77777<br/>foto: 1699455836_JPERES.jpg<br/>id: 2<br/>materno: MAMANI<br/>nombre: JUAN<br/>password: $2y$10$Y3d5nYIEvQPOHFGubIiTqusMG.jnalhHtURER4udFPVJs.Wehpili<br/>paterno: PERES<br/>tipo: OPERADOR<br/>updated_at: 2023-11-13 12:29:29<br/>usuario: JPERES<br/>', 'USUARIOS', '2023-11-13', '12:29:29', '2023-11-13 16:29:29', '2023-11-13 16:29:29'),
(4, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN FUNCIONARIO', 'codigo: F001<br/>created_at: 2023-11-13 13:54:51<br/>descripcion: DESCRIPCION FUNCIONARIO<br/>fecha_baja: 2024-01-01<br/>fecha_item: 2023-01-01<br/>fecha_registro: 2023-11-13<br/>gestion_ingreso: 2023<br/>id: 1<br/>observaciones: OBSERVACIONES FUNCIONARIO<br/>tipo_ingreso: NORMAL<br/>updated_at: 2023-11-13 13:54:51<br/>user_id: 3<br/>', NULL, 'FUNCIONARIOS', '2023-11-13', '13:54:51', '2023-11-13 17:54:51', '2023-11-13 17:54:51'),
(5, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN FUNCIONARIO', 'codigo: F001<br/>created_at: 2023-11-13 13:54:51<br/>descripcion: DESCRIPCION FUNCIONARIO<br/>fecha_baja: 2024-01-01<br/>fecha_item: 2023-01-01<br/>fecha_registro: 2023-11-13<br/>gestion_ingreso: 2023<br/>id: 1<br/>observaciones: OBSERVACIONES FUNCIONARIO<br/>tipo_ingreso: NORMAL<br/>updated_at: 2023-11-13 13:54:51<br/>user_id: 3<br/>', 'codigo: F001<br/>created_at: 2023-11-13 13:54:51<br/>descripcion: DESCRIPCION FUNCIONARIO<br/>fecha_baja: 2024-01-01<br/>fecha_item: 2023-01-01<br/>fecha_registro: 2023-11-13<br/>gestion_ingreso: 2023<br/>id: 1<br/>observaciones: OBSERVACIONES FUNCIONARIO<br/>tipo_ingreso: NORMAL<br/>updated_at: 2023-11-13 13:54:51<br/>user_id: 3<br/>', 'FUNCIONARIOS', '2023-11-13', '13:56:40', '2023-11-13 17:56:40', '2023-11-13 17:56:40'),
(6, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN FUNCIONARIO', 'codigo: F001<br/>created_at: 2023-11-13 13:54:51<br/>descripcion: DESCRIPCION FUNCIONARIO<br/>fecha_baja: 2024-01-01<br/>fecha_item: 2023-01-01<br/>fecha_registro: 2023-11-13<br/>gestion_ingreso: 2023<br/>id: 1<br/>observaciones: OBSERVACIONES FUNCIONARIO<br/>tipo_ingreso: NORMAL<br/>updated_at: 2023-11-13 13:54:51<br/>user_id: 3<br/>', 'codigo: F001<br/>created_at: 2023-11-13 13:54:51<br/>descripcion: DESCRIPCION FUNCIONARIO<br/>fecha_baja: 2024-01-01<br/>fecha_item: 2023-01-01<br/>fecha_registro: 2023-11-13<br/>gestion_ingreso: 2023<br/>id: 1<br/>observaciones: OBSERVACIONES FUNCIONARIO<br/>tipo_ingreso: NORMAL<br/>updated_at: 2023-11-13 13:54:51<br/>user_id: 3<br/>', 'FUNCIONARIOS', '2023-11-13', '13:57:01', '2023-11-13 17:57:01', '2023-11-13 17:57:01'),
(7, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UN FUNCIONARIO', 'codigo: F001<br/>created_at: 2023-11-13 13:54:51<br/>descripcion: DESCRIPCION FUNCIONARIO<br/>fecha_baja: 2024-01-01<br/>fecha_item: 2023-01-01<br/>fecha_registro: 2023-11-13<br/>gestion_ingreso: 2023<br/>id: 1<br/>observaciones: OBSERVACIONES FUNCIONARIO<br/>tipo_ingreso: NORMAL<br/>updated_at: 2023-11-13 13:54:51<br/>user_id: 3<br/>', NULL, 'FUNCIONARIOS', '2023-11-13', '13:57:32', '2023-11-13 17:57:32', '2023-11-13 17:57:32'),
(8, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN FUNCIONARIO', 'codigo: F001<br/>created_at: 2023-11-13 13:58:29<br/>descripcion: <br/>fecha_baja: 2024-01-01<br/>fecha_item: 2023-01-01<br/>fecha_registro: 2023-11-13<br/>gestion_ingreso: 2023<br/>id: 2<br/>observaciones: <br/>tipo_ingreso: NORMAL<br/>updated_at: 2023-11-13 13:58:29<br/>user_id: 4<br/>', NULL, 'FUNCIONARIOS', '2023-11-13', '13:58:29', '2023-11-13 17:58:29', '2023-11-13 17:58:29'),
(9, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UN FUNCIONARIO', 'codigo: F001<br/>created_at: 2023-11-13 13:58:29<br/>descripcion: <br/>fecha_baja: 2024-01-01<br/>fecha_item: 2023-01-01<br/>fecha_registro: 2023-11-13<br/>gestion_ingreso: 2023<br/>id: 2<br/>observaciones: <br/>tipo_ingreso: NORMAL<br/>updated_at: 2023-11-13 13:58:29<br/>user_id: 4<br/>', NULL, 'FUNCIONARIOS', '2023-11-13', '13:58:33', '2023-11-13 17:58:33', '2023-11-13 17:58:33'),
(10, 1, 'CREACIÓN', 'EL DEPENDENCIA  REGISTRO UN DEPENDENCIA', 'created_at: 2023-11-13 15:05:40<br/>descripcion: DESC. DEPENDENCIA 1<br/>fecha_registro: 2023-11-13<br/>id: 1<br/>nombre: DEPENDENCIA #1<br/>updated_at: 2023-11-13 15:05:40<br/>', NULL, 'USUARIOS', '2023-11-13', '15:05:40', '2023-11-13 19:05:40', '2023-11-13 19:05:40'),
(11, 1, 'MODIFICACIÓN', 'EL DEPENDENCIA  MODIFICÓ UN DEPENDENCIA', 'created_at: 2023-11-13 15:05:40<br/>descripcion: DESC. DEPENDENCIA 1<br/>fecha_registro: 2023-11-13<br/>id: 1<br/>nombre: DEPENDENCIA #1<br/>updated_at: 2023-11-13 15:05:40<br/>', 'created_at: 2023-11-13 15:05:40<br/>descripcion: DESC. DEPENDENCIA 1 MOD<br/>fecha_registro: 2023-11-13<br/>id: 1<br/>nombre: DEPENDENCIA #1 MOD<br/>updated_at: 2023-11-13 15:08:22<br/>', 'USUARIOS', '2023-11-13', '15:08:22', '2023-11-13 19:08:22', '2023-11-13 19:08:22'),
(12, 1, 'MODIFICACIÓN', 'EL DEPENDENCIA  MODIFICÓ UN DEPENDENCIA', 'created_at: 2023-11-13 15:05:40<br/>descripcion: DESC. DEPENDENCIA 1 MOD<br/>fecha_registro: 2023-11-13<br/>id: 1<br/>nombre: DEPENDENCIA #1 MOD<br/>updated_at: 2023-11-13 15:08:22<br/>', 'created_at: 2023-11-13 15:05:40<br/>descripcion: DESC. DEPENDENCIA 1<br/>fecha_registro: 2023-11-13<br/>id: 1<br/>nombre: DEPENDENCIA #1<br/>updated_at: 2023-11-13 15:08:29<br/>', 'USUARIOS', '2023-11-13', '15:08:29', '2023-11-13 19:08:29', '2023-11-13 19:08:29'),
(13, 1, 'ELIMINACIÓN', 'EL DEPENDENCIA  ELIMINÓ UN DEPENDENCIA', 'created_at: 2023-11-13 15:05:40<br/>descripcion: DESC. DEPENDENCIA 1<br/>fecha_registro: 2023-11-13<br/>id: 1<br/>nombre: DEPENDENCIA #1<br/>updated_at: 2023-11-13 15:08:29<br/>', NULL, 'USUARIOS', '2023-11-13', '15:09:06', '2023-11-13 19:09:06', '2023-11-13 19:09:06'),
(14, 1, 'CREACIÓN', 'EL DEPENDENCIA  REGISTRO UN DEPENDENCIA', 'created_at: 2023-11-13 15:09:33<br/>descripcion: DESC. DEPENDENCIA 1<br/>fecha_registro: 2023-11-13<br/>id: 1<br/>nombre: DEPENDENCIA #1<br/>updated_at: 2023-11-13 15:09:33<br/>', NULL, 'USUARIOS', '2023-11-13', '15:09:33', '2023-11-13 19:09:33', '2023-11-13 19:09:33'),
(15, 1, 'CREACIÓN', 'EL DEPENDENCIA  REGISTRO UN DEPENDENCIA', 'created_at: 2023-11-13 15:10:25<br/>descripcion: <br/>fecha_registro: 2023-11-13<br/>id: 2<br/>nombre: DEPENDENCIA #2<br/>updated_at: 2023-11-13 15:10:25<br/>', NULL, 'USUARIOS', '2023-11-13', '15:10:25', '2023-11-13 19:10:25', '2023-11-13 19:10:25'),
(16, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'acceso: 0<br/>ci: 1234<br/>ci_exp: LP<br/>correo: <br/>created_at: 2023-11-08 11:03:56<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-11-08<br/>fono: 77777<br/>foto: 1699455836_JPERES.jpg<br/>id: 2<br/>materno: MAMANI<br/>nombre: JUAN<br/>password: $2y$10$Y3d5nYIEvQPOHFGubIiTqusMG.jnalhHtURER4udFPVJs.Wehpili<br/>paterno: PERES<br/>tipo: OPERADOR<br/>updated_at: 2023-11-13 12:29:29<br/>usuario: JPERES<br/>', 'acceso: 1<br/>ci: 1234<br/>ci_exp: LP<br/>correo: <br/>created_at: 2023-11-08 11:03:56<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-11-08<br/>fono: 77777<br/>foto: 1699455836_JPERES.jpg<br/>id: 2<br/>materno: MAMANI<br/>nombre: JUAN<br/>password: $2y$10$Y3d5nYIEvQPOHFGubIiTqusMG.jnalhHtURER4udFPVJs.Wehpili<br/>paterno: PERES<br/>tipo: OPERADOR<br/>updated_at: 2023-11-13 15:14:36<br/>usuario: JPERES<br/>', 'USUARIOS', '2023-11-13', '15:14:36', '2023-11-13 19:14:36', '2023-11-13 19:14:36'),
(17, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN FUNCIONARIO', 'codigo: F001<br/>created_at: 2023-11-13 15:16:54<br/>descripcion: DESCRIPCION FUNCIONARIO<br/>fecha_baja: 2024-06-01<br/>fecha_item: 2023-01-01<br/>fecha_registro: 2023-11-13<br/>gestion_ingreso: 2023<br/>id: 1<br/>observaciones: OBSERVACIONES FUNCIONARIO<br/>tipo_ingreso: NORMAL<br/>updated_at: 2023-11-13 15:16:54<br/>user_id: 3<br/>', NULL, 'FUNCIONARIOS', '2023-11-13', '15:16:54', '2023-11-13 19:16:54', '2023-11-13 19:16:54'),
(18, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN FUNCIONARIO', 'codigo: F001<br/>created_at: 2023-11-13 15:16:54<br/>descripcion: DESCRIPCION FUNCIONARIO<br/>fecha_baja: 2024-06-01<br/>fecha_item: 2023-01-01<br/>fecha_registro: 2023-11-13<br/>gestion_ingreso: 2023<br/>id: 1<br/>observaciones: OBSERVACIONES FUNCIONARIO<br/>tipo_ingreso: NORMAL<br/>updated_at: 2023-11-13 15:16:54<br/>user_id: 3<br/>', 'codigo: F001<br/>created_at: 2023-11-13 15:16:54<br/>descripcion: DESCRIPCION FUNCIONARIO<br/>fecha_baja: 2024-06-01<br/>fecha_item: 2023-01-01<br/>fecha_registro: 2023-11-13<br/>gestion_ingreso: 2023<br/>id: 1<br/>observaciones: OBSERVACIONES FUNCIONARIO<br/>tipo_ingreso: NORMAL<br/>updated_at: 2023-11-13 15:16:54<br/>user_id: 3<br/>', 'FUNCIONARIOS', '2023-11-13', '15:16:57', '2023-11-13 19:16:57', '2023-11-13 19:16:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000002_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2022_10_13_132625_create_configuracions_table', 1),
(4, '2023_08_26_190801_create_historial_accions_table', 1),
(5, '2023_11_13_123333_create_funcionarios_table', 2),
(6, '2023_11_13_123459_create_dependencias_table', 2),
(7, '2023_11_13_123523_create_oficinas_table', 2),
(8, '2023_11_13_123535_create_estantes_table', 2),
(9, '2023_11_13_125115_create_documentos_table', 2),
(10, '2023_11_13_125628_create_reserva_documentos_table', 2),
(11, '2023_11_13_125647_create_prestamo_documentos_table', 2),
(12, '2023_11_13_125705_create_devolucion_documentos_table', 2),
(13, '2023_11_13_130530_create_adjuntar_documentos_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficinas`
--

CREATE TABLE `oficinas` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo_documentos`
--

CREATE TABLE `prestamo_documentos` (
  `id` bigint UNSIGNED NOT NULL,
  `documento_id` bigint UNSIGNED NOT NULL,
  `funcionario_id` bigint UNSIGNED NOT NULL,
  `tipo_documento` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad_documentos` int NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `dependencia_id` bigint UNSIGNED NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva_documentos`
--

CREATE TABLE `reserva_documentos` (
  `id` bigint UNSIGNED NOT NULL,
  `documento_id` bigint UNSIGNED NOT NULL,
  `funcionario_id` bigint UNSIGNED NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paterno` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `materno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ci` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci_exp` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` enum('ADMINISTRADOR','OPERADOR','FUNCIONARIO') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acceso` int NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `usuario`, `nombre`, `paterno`, `materno`, `ci`, `ci_exp`, `dir`, `correo`, `fono`, `tipo`, `foto`, `password`, `acceso`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin', NULL, '0', '', '', NULL, '', 'ADMINISTRADOR', NULL, '$2y$10$RrCZZySOwPej2gMFWsrjMe6dLzfaL5Q88h4J75I1FesEBRNPwq1x.', 1, '2023-11-01', NULL, NULL),
(2, 'JPERES', 'JUAN', 'PERES', 'MAMANI', '1234', 'LP', 'LOS OLIVOS', NULL, '77777', 'OPERADOR', '1699455836_JPERES.jpg', '$2y$10$p00ZfD7Bizp27fJRiAJiPOpCsJUjfJV7593Z518Zc3axCSaJvpsWG', 1, '2023-11-08', '2023-11-08 15:03:56', '2023-11-13 19:14:50'),
(3, 'FGONZALES', 'FERNANDO', 'GONZALES', 'MARTINES', '1111', 'LP', NULL, NULL, '777777', 'FUNCIONARIO', NULL, '$2y$10$cSrzU1ME21B10bI3wFPuQuWwX59KiP/0v5mzgIvAWgS0dO8vp08HO', 1, '2023-11-13', '2023-11-13 19:16:54', '2023-11-13 19:17:59');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adjuntar_documentos`
--
ALTER TABLE `adjuntar_documentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjuntar_documentos_documento_id_foreign` (`documento_id`);

--
-- Indices de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dependencias`
--
ALTER TABLE `dependencias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `devolucion_documentos`
--
ALTER TABLE `devolucion_documentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devolucion_documentos_documento_id_foreign` (`documento_id`),
  ADD KEY `devolucion_documentos_funcionario_id_foreign` (`funcionario_id`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `documentos_codigo_unique` (`codigo`);

--
-- Indices de la tabla `estantes`
--
ALTER TABLE `estantes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `funcionarios_codigo_unique` (`codigo`),
  ADD KEY `funcionarios_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oficinas`
--
ALTER TABLE `oficinas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `prestamo_documentos`
--
ALTER TABLE `prestamo_documentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prestamo_documentos_documento_id_foreign` (`documento_id`),
  ADD KEY `prestamo_documentos_funcionario_id_foreign` (`funcionario_id`),
  ADD KEY `prestamo_documentos_dependencia_id_foreign` (`dependencia_id`);

--
-- Indices de la tabla `reserva_documentos`
--
ALTER TABLE `reserva_documentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reserva_documentos_documento_id_foreign` (`documento_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_usuario_unique` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `adjuntar_documentos`
--
ALTER TABLE `adjuntar_documentos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `dependencias`
--
ALTER TABLE `dependencias`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `devolucion_documentos`
--
ALTER TABLE `devolucion_documentos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estantes`
--
ALTER TABLE `estantes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `oficinas`
--
ALTER TABLE `oficinas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prestamo_documentos`
--
ALTER TABLE `prestamo_documentos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reserva_documentos`
--
ALTER TABLE `reserva_documentos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adjuntar_documentos`
--
ALTER TABLE `adjuntar_documentos`
  ADD CONSTRAINT `adjuntar_documentos_documento_id_foreign` FOREIGN KEY (`documento_id`) REFERENCES `documentos` (`id`);

--
-- Filtros para la tabla `devolucion_documentos`
--
ALTER TABLE `devolucion_documentos`
  ADD CONSTRAINT `devolucion_documentos_documento_id_foreign` FOREIGN KEY (`documento_id`) REFERENCES `documentos` (`id`),
  ADD CONSTRAINT `devolucion_documentos_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`);

--
-- Filtros para la tabla `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `funcionarios_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `prestamo_documentos`
--
ALTER TABLE `prestamo_documentos`
  ADD CONSTRAINT `prestamo_documentos_dependencia_id_foreign` FOREIGN KEY (`dependencia_id`) REFERENCES `dependencias` (`id`),
  ADD CONSTRAINT `prestamo_documentos_documento_id_foreign` FOREIGN KEY (`documento_id`) REFERENCES `documentos` (`id`),
  ADD CONSTRAINT `prestamo_documentos_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`);

--
-- Filtros para la tabla `reserva_documentos`
--
ALTER TABLE `reserva_documentos`
  ADD CONSTRAINT `reserva_documentos_documento_id_foreign` FOREIGN KEY (`documento_id`) REFERENCES `documentos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
