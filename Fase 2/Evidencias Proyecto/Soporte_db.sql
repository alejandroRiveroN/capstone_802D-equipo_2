-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2025 a las 08:54:56
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
-- Base de datos: `soporte_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agente`
--

CREATE TABLE `agente` (
  `id_agente` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `puesto` varchar(50) DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `agente`
--

INSERT INTO `agente` (`id_agente`, `id_usuario`, `puesto`, `fecha_contratacion`) VALUES
(4, 2, 'Administrador', '2025-08-29'),
(11, 12, 'Supervisor en practica', '2025-10-17'),
(12, 1, NULL, '2025-11-04'),
(13, 10, NULL, '2025-11-04'),
(14, 54, 'Soporte Nivel 2', '2025-11-07'),
(15, 55, 'Soporte Nivel 3', '2025-11-07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivo_adjunto`
--

CREATE TABLE `archivo_adjunto` (
  `id_adjunto` int(11) NOT NULL,
  `id_ticket` int(11) NOT NULL,
  `id_comentario` int(11) DEFAULT NULL,
  `nombre_original` varchar(255) NOT NULL,
  `nombre_guardado` varchar(255) NOT NULL,
  `ruta_archivo` varchar(255) NOT NULL,
  `tipo_mime` varchar(100) NOT NULL,
  `fecha_subida` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `empresa` varchar(100) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `email`, `telefono`, `empresa`, `pais`, `ciudad`, `activo`, `fecha_registro`) VALUES
(45, 'Alejandro Rivero', 'alej.rivero@duocuc.cl', NULL, 'MCE', 'Chile', 'San Antonio', 1, '2025-11-04 00:05:59'),
(46, 'Esteban Peña', 'esteban@cliente.com', NULL, NULL, NULL, NULL, 1, '2025-11-04 22:35:24'),
(47, 'Alejandro Nilo', 'alejandro@cliente.com', NULL, NULL, NULL, NULL, 1, '2025-11-06 00:34:43'),
(48, 'Jesus Sandoval', 'jesussgutierrez@gmail.com', NULL, 'Moon', 'Chile', 'San Antonio', 1, '2025-11-07 18:14:46'),
(49, 'Samuel Nilo', 'SamuelN@gmail.com', NULL, 'MCE', 'Chile', 'San Antonio', 1, '2025-11-07 19:14:46'),
(50, 'Alejandro Rivero Nilo', 'alejrivero@gmail.com', '+', 'MCE', NULL, NULL, 1, '2025-11-13 03:30:19'),
(81, 'Samuel Nilo', 'samuelnb@gmail.com', NULL, 'MCE', 'Chile', 'San Antonio', 1, '2025-11-21 15:32:51'),
(82, 'Inversiones Los Andes', 'contacto@invandes.cl', '+56911111111', 'Inversiones Los Andes', 'Chile', 'Santiago', 1, '2025-12-04 07:51:23'),
(83, 'Librería El Quijote', 'ventas@elquijote.cl', '+56922222222', 'Librería El Quijote', 'Chile', 'Valparaíso', 1, '2025-12-04 07:51:23'),
(84, 'Transportes Veloz', 'logistica@tveloz.com', '+56933333333', 'Transportes Veloz', 'Chile', 'Rancagua', 1, '2025-12-04 07:51:23'),
(85, 'Pedro Pascal', 'pedro.p@actor.com', NULL, NULL, 'Chile', 'Santiago', 1, '2025-12-04 07:51:23'),
(86, 'Restaurante La Mesa', 'reservas@lamesa.cl', '+56944444444', 'Gastronomía SpA', 'Chile', 'Viña del Mar', 1, '2025-12-04 07:51:23'),
(87, 'Colegio San Ignacio', 'admin@sanignacio.edu', '+56955555555', 'Fundación Educacional', 'Chile', 'Concepción', 1, '2025-12-04 07:51:23'),
(88, 'Automotora del Pacífico', 'taller@autopacifico.cl', '+56966666666', 'Automotora del Pacífico', 'Chile', 'La Serena', 1, '2025-12-04 07:51:23'),
(89, 'Marta Sanchez', 'marta.sanchez@gmail.com', '+56977777777', NULL, 'Chile', 'Temuco', 1, '2025-12-04 07:51:23'),
(90, 'Farmacias Salubridad', 'local1@salubridad.cl', '+56988888888', 'Farmacias Salubridad', 'Chile', 'Santiago', 1, '2025-12-04 07:51:23'),
(91, 'Constructora Vial', 'proyectos@vial.cl', '+56999999999', 'Constructora Vial SA', 'Chile', 'Puerto Montt', 1, '2025-12-04 07:51:23'),
(92, 'Consultora HR', 'rrhh@consultorahr.com', NULL, 'HR Partners', 'Argentina', 'Buenos Aires', 1, '2025-12-04 07:51:23'),
(93, 'Tech Innovation', 'dev@techinno.com', NULL, 'Tech Innovation SpA', 'Chile', 'Santiago', 1, '2025-12-04 07:51:23'),
(94, 'Hotel Plaza', 'recepcion@hplaza.cl', '+56322123456', 'Inmobiliaria Hotelera', 'Chile', 'Viña del Mar', 1, '2025-12-04 07:51:23'),
(95, 'Juanito Perez', 'jperez@duoc.cl', NULL, NULL, 'Chile', 'Valparaíso', 1, '2025-12-04 07:51:23'),
(96, 'Maria Gonzalez', 'mgonzalez@gmail.com', NULL, NULL, 'Chile', 'Santiago', 1, '2025-12-04 07:51:23'),
(97, 'Clinica Alemana', 'contacto@calemana.cl', '+56222222222', 'Salud Corp', 'Chile', 'Santiago', 1, '2025-10-05 07:54:28'),
(98, 'Minera Escondida', 'proveedores@minera.cl', '+56555555555', 'Minería Global', 'Chile', 'Antofagasta', 1, '2025-10-10 07:54:28'),
(99, 'Libreria Nacional', 'ventas@nacional.cl', '+56233333333', 'Retail Libros', 'Chile', 'Viña del Mar', 1, '2025-10-25 07:54:28'),
(100, 'Pedro Pascal', 'ppascal@hollywood.com', NULL, NULL, 'EEUU', 'Los Angeles', 1, '2025-11-04 07:54:28'),
(101, 'Restaurante El Parrón', 'reserva@elparron.cl', '+56322222222', 'Gastronomía', 'Chile', 'Valparaíso', 1, '2025-11-09 07:54:28'),
(102, 'Banco Estado', 'sistemas@banco.cl', '+56211111111', 'Banca y Finanzas', 'Chile', 'Santiago', 1, '2025-11-14 07:54:28'),
(103, 'Colegio Aconcagua', 'admin@aconcagua.edu', '+56321234567', 'Educación', 'Chile', 'Quilpué', 1, '2025-11-19 07:54:28'),
(104, 'Susana Gimenez', 'susana@tv.com', NULL, NULL, 'Argentina', 'Buenos Aires', 1, '2025-11-24 07:54:28'),
(105, 'Automotora Salazar', 'taller@salazar.cl', '+56987654321', 'Automotriz', 'Chile', 'Concepción', 1, '2025-11-29 07:54:28'),
(106, 'Tech Solutions', 'dev@techsol.com', NULL, 'Tecnología', 'Chile', 'Santiago', 1, '2025-12-04 07:54:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `id_comentario` int(11) NOT NULL,
  `id_ticket` int(11) NOT NULL,
  `id_autor` int(11) NOT NULL,
  `tipo_autor` enum('Agente','Cliente') NOT NULL,
  `comentario` text NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `es_privado` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

CREATE TABLE `cotizacion` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `tipo_caso` varchar(100) NOT NULL,
  `prioridad` enum('Baja','Media','Alta','Urgente') NOT NULL,
  `descripcion` text NOT NULL,
  `estado` enum('Nueva','Respondida','Cerrada') NOT NULL DEFAULT 'Nueva',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `precio_estimado` decimal(12,2) DEFAULT NULL,
  `respuesta` text DEFAULT NULL,
  `id_responsable_respuesta` int(11) DEFAULT NULL,
  `fecha_respuesta` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formulario_contacto`
--

CREATE TABLE `formulario_contacto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mensaje` text NOT NULL,
  `estado` enum('Nuevo','Respondido') NOT NULL DEFAULT 'Nuevo',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `respuesta` text DEFAULT NULL,
  `id_admin_respuesta` int(11) DEFAULT NULL,
  `fecha_respuesta` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `formulario_contacto`
--

INSERT INTO `formulario_contacto` (`id`, `nombre`, `email`, `mensaje`, `estado`, `fecha_creacion`, `respuesta`, `id_admin_respuesta`, `fecha_respuesta`) VALUES
(11, 'Roberto Gómez', 'rgomez@test.com', 'Consulta por precios mayoristas', 'Nuevo', '2025-12-04 07:51:23', NULL, NULL, NULL),
(12, 'Ana Maria', 'ana@test.com', 'Reclamo por servicio anterior', 'Respondido', '2025-12-02 07:51:23', NULL, NULL, NULL),
(13, 'Empresa X', 'contact@x.com', 'Busco partnership', 'Nuevo', '2025-12-04 07:51:23', NULL, NULL, NULL),
(14, 'Carlos Santana', 'csantana@music.com', 'Tengo un problema con mi laptop personal', 'Nuevo', '2025-11-29 07:51:23', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset`
--

CREATE TABLE `password_reset` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre_rol`, `descripcion`) VALUES
(1, 'Administrador', 'Acceso total al sistema, gestión de usuarios y configuraciones.'),
(2, 'Agente de Soporte', 'Puede gestionar tickets asignados y ver los de su equipo.'),
(3, 'Supervisor', 'Puede ver todos los tickets y generar reportes, pero no gestiona usuarios.'),
(4, 'Cliente', 'Usuario registrado que puede crear tickets y ver su dashboard');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket`
--

CREATE TABLE `ticket` (
  `id_ticket` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_agente_asignado` int(11) DEFAULT NULL,
  `id_tipo_caso` int(11) DEFAULT NULL,
  `asunto` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` enum('Abierto','En Progreso','En Espera','Resuelto','Cerrado','Anulado') DEFAULT 'Abierto',
  `prioridad` enum('Baja','Media','Alta','Urgente') DEFAULT 'Media',
  `fecha_vencimiento` datetime DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT 0.00,
  `moneda` varchar(4) DEFAULT 'CLP',
  `estado_facturacion` enum('Pendiente','Facturado','Pagado') NOT NULL DEFAULT 'Pendiente',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `ultima_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `medio_pago` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ticket`
--

INSERT INTO `ticket` (`id_ticket`, `id_cliente`, `id_agente_asignado`, `id_tipo_caso`, `asunto`, `descripcion`, `estado`, `prioridad`, `fecha_vencimiento`, `costo`, `moneda`, `estado_facturacion`, `fecha_creacion`, `ultima_actualizacion`, `medio_pago`) VALUES
(149, 48, 11, 7, 'Ticket Auto Generado #0 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 41544.00, 'CLP', 'Pagado', '2025-10-14 07:51:23', '2025-10-14 12:51:23', NULL),
(150, 82, 15, 1, 'Ticket Auto Generado #1 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Baja', NULL, 0.00, 'CLP', 'Pendiente', '2025-10-10 07:51:23', '2025-10-10 07:51:23', NULL),
(151, 49, 15, 8, 'Ticket Auto Generado #2 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 36287.00, 'CLP', 'Pagado', '2025-11-07 07:51:23', '2025-11-09 19:51:23', NULL),
(152, 89, 12, 8, 'Ticket Auto Generado #3 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 47240.00, 'CLP', 'Pagado', '2025-10-24 07:51:23', '2025-10-25 09:51:23', NULL),
(153, 89, 12, 9, 'Ticket Auto Generado #4 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Alta', NULL, 31306.00, 'CLP', 'Pagado', '2025-10-20 07:51:23', '2025-10-22 14:51:23', NULL),
(154, 50, 4, 8, 'Ticket Auto Generado #5 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 39638.00, 'CLP', 'Pagado', '2025-11-28 07:51:23', '2025-12-01 04:51:23', NULL),
(155, 45, 14, 8, 'Ticket Auto Generado #6 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 98284.00, 'CLP', 'Pagado', '2025-10-06 07:51:23', '2025-10-09 04:51:23', NULL),
(156, 94, 13, 7, 'Ticket Auto Generado #7 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 37147.00, 'CLP', 'Pagado', '2025-10-09 07:51:23', '2025-10-09 12:51:23', NULL),
(157, 93, 14, 9, 'Ticket Auto Generado #8 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 66277.00, 'CLP', 'Pagado', '2025-11-09 07:51:23', '2025-11-10 09:51:23', NULL),
(158, 83, 4, 3, 'Ticket Auto Generado #9 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Alta', NULL, 53896.00, 'CLP', 'Pagado', '2025-11-04 07:51:23', '2025-11-05 03:51:23', NULL),
(159, 50, 14, 9, 'Ticket Auto Generado #10 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 50391.00, 'CLP', 'Pagado', '2025-10-07 07:51:23', '2025-10-08 06:51:23', NULL),
(160, 83, 14, 1, 'Ticket Auto Generado #11 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 88025.00, 'CLP', 'Pagado', '2025-11-23 07:51:23', '2025-11-25 10:51:23', NULL),
(161, 83, 14, 7, 'Ticket Auto Generado #12 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Alta', NULL, 34717.00, 'CLP', 'Pagado', '2025-10-22 07:51:23', '2025-10-23 14:51:23', NULL),
(162, 50, 12, 9, 'Ticket Auto Generado #13 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 86796.00, 'CLP', 'Pagado', '2025-10-12 07:51:23', '2025-10-14 06:51:23', NULL),
(163, 90, 15, 7, 'Ticket Auto Generado #14 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Urgente', NULL, 0.00, 'CLP', 'Pendiente', '2025-10-28 07:51:23', '2025-10-28 07:51:23', NULL),
(164, 91, 11, 8, 'Ticket Auto Generado #15 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Urgente', NULL, 0.00, 'CLP', 'Pendiente', '2025-10-07 07:51:23', '2025-10-07 07:51:23', NULL),
(165, 50, 14, 1, 'Ticket Auto Generado #16 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Alta', NULL, 91160.00, 'CLP', 'Pagado', '2025-11-22 07:51:23', '2025-11-24 09:51:23', NULL),
(166, 92, 12, 3, 'Ticket Auto Generado #17 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 62989.00, 'CLP', 'Pagado', '2025-10-28 07:51:23', '2025-10-29 09:51:23', NULL),
(167, 82, 4, 1, 'Ticket Auto Generado #18 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Media', NULL, 0.00, 'CLP', 'Pendiente', '2025-11-24 07:51:23', '2025-11-24 07:51:23', NULL),
(168, 48, 13, 8, 'Ticket Auto Generado #19 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 61404.00, 'CLP', 'Pagado', '2025-11-06 07:51:23', '2025-11-07 02:51:23', NULL),
(169, 96, 12, 7, 'Ticket Auto Generado #20 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Urgente', NULL, 0.00, 'CLP', 'Pendiente', '2025-10-25 07:51:23', '2025-10-25 07:51:23', NULL),
(170, 49, 4, 9, 'Ticket Auto Generado #21 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Alta', NULL, 0.00, 'CLP', 'Pendiente', '2025-10-23 07:51:23', '2025-10-23 07:51:23', NULL),
(171, 96, 15, 1, 'Ticket Auto Generado #22 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Alta', NULL, 43388.00, 'CLP', 'Pagado', '2025-10-18 07:51:23', '2025-10-20 12:51:23', NULL),
(172, 83, 11, 7, 'Ticket Auto Generado #23 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 34868.00, 'CLP', 'Pagado', '2025-11-20 07:51:23', '2025-11-22 05:51:23', NULL),
(173, 46, 4, 3, 'Ticket Auto Generado #24 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Urgente', NULL, 0.00, 'CLP', 'Pendiente', '2025-11-23 07:51:23', '2025-11-23 07:51:23', NULL),
(174, 81, 4, 7, 'Ticket Auto Generado #25 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 98220.00, 'CLP', 'Pagado', '2025-11-13 07:51:23', '2025-11-15 00:51:23', NULL),
(175, 95, 4, 7, 'Ticket Auto Generado #26 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 48739.00, 'CLP', 'Pagado', '2025-11-26 07:51:23', '2025-11-28 07:51:23', NULL),
(176, 96, 15, 1, 'Ticket Auto Generado #27 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Media', NULL, 0.00, 'CLP', 'Pendiente', '2025-10-24 07:51:23', '2025-10-24 07:51:23', NULL),
(177, 84, 12, 8, 'Ticket Auto Generado #28 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Alta', NULL, 0.00, 'CLP', 'Pendiente', '2025-11-24 07:51:23', '2025-11-24 07:51:23', NULL),
(178, 83, 14, 8, 'Ticket Auto Generado #29 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 30803.00, 'CLP', 'Pagado', '2025-10-24 07:51:23', '2025-10-25 12:51:23', NULL),
(179, 92, 14, 1, 'Ticket Auto Generado #30 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 44411.00, 'CLP', 'Pagado', '2025-11-17 07:51:23', '2025-11-18 18:51:23', NULL),
(180, 49, 4, 1, 'Ticket Auto Generado #31 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 26800.00, 'CLP', 'Pagado', '2025-12-04 07:51:23', '2025-12-05 17:51:23', NULL),
(181, 87, 12, 1, 'Ticket Auto Generado #32 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Urgente', NULL, 0.00, 'CLP', 'Pendiente', '2025-11-10 07:51:23', '2025-11-10 07:51:23', NULL),
(182, 94, 11, 3, 'Ticket Auto Generado #33 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Alta', NULL, 0.00, 'CLP', 'Pendiente', '2025-10-15 07:51:23', '2025-10-15 07:51:23', NULL),
(183, 81, 14, 9, 'Ticket Auto Generado #34 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Media', NULL, 0.00, 'CLP', 'Pendiente', '2025-10-22 07:51:23', '2025-10-22 07:51:23', NULL),
(184, 94, 14, 8, 'Ticket Auto Generado #35 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Media', NULL, 0.00, 'CLP', 'Pendiente', '2025-11-29 07:51:23', '2025-11-29 07:51:23', NULL),
(185, 45, 4, 1, 'Ticket Auto Generado #36 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Baja', NULL, 0.00, 'CLP', 'Pendiente', '2025-11-03 07:51:23', '2025-11-03 07:51:23', NULL),
(186, 92, 11, 3, 'Ticket Auto Generado #37 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Media', NULL, 0.00, 'CLP', 'Pendiente', '2025-11-26 07:51:23', '2025-11-26 07:51:23', NULL),
(187, 83, 15, 1, 'Ticket Auto Generado #38 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 73823.00, 'CLP', 'Pagado', '2025-11-03 07:51:23', '2025-11-04 12:51:23', NULL),
(188, 48, 11, 1, 'Ticket Auto Generado #39 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Alta', NULL, 0.00, 'CLP', 'Pendiente', '2025-12-02 07:51:23', '2025-12-02 07:51:23', NULL),
(189, 87, 15, 9, 'Ticket Auto Generado #40 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 24413.00, 'CLP', 'Pagado', '2025-11-02 07:51:23', '2025-11-04 06:51:23', NULL),
(190, 93, 12, 9, 'Ticket Auto Generado #41 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 43169.00, 'CLP', 'Pagado', '2025-11-05 07:51:23', '2025-11-06 15:51:23', NULL),
(191, 47, 14, 3, 'Ticket Auto Generado #42 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 22411.00, 'CLP', 'Pagado', '2025-11-26 07:51:23', '2025-11-27 17:51:23', NULL),
(192, 83, 14, 1, 'Ticket Auto Generado #43 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 73999.00, 'CLP', 'Pagado', '2025-11-27 07:51:23', '2025-11-29 07:51:23', NULL),
(193, 48, 13, 7, 'Ticket Auto Generado #44 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 60791.00, 'CLP', 'Pagado', '2025-11-10 07:51:23', '2025-11-13 06:51:23', NULL),
(194, 81, 13, 9, 'Ticket Auto Generado #45 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Media', NULL, 0.00, 'CLP', 'Pendiente', '2025-10-26 07:51:23', '2025-10-26 07:51:23', NULL),
(195, 95, 15, 9, 'Ticket Auto Generado #46 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Baja', NULL, 0.00, 'CLP', 'Pendiente', '2025-10-23 07:51:23', '2025-10-23 07:51:23', NULL),
(196, 94, 13, 1, 'Ticket Auto Generado #47 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Baja', NULL, 0.00, 'CLP', 'Pendiente', '2025-11-23 07:51:23', '2025-11-23 07:51:23', NULL),
(197, 83, 12, 7, 'Ticket Auto Generado #48 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Alta', NULL, 37800.00, 'CLP', 'Pagado', '2025-10-13 07:51:23', '2025-10-15 20:51:23', NULL),
(198, 95, 12, 8, 'Ticket Auto Generado #49 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 34559.00, 'CLP', 'Pagado', '2025-10-11 07:51:23', '2025-10-11 17:51:23', NULL),
(199, 81, 13, 3, 'Ticket Auto Generado #50 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 93563.00, 'CLP', 'Pagado', '2025-12-01 07:51:23', '2025-12-02 12:51:23', NULL),
(200, 90, 12, 7, 'Ticket Auto Generado #51 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Urgente', NULL, 0.00, 'CLP', 'Pendiente', '2025-11-19 07:51:23', '2025-11-19 07:51:23', NULL),
(201, 91, 4, 3, 'Ticket Auto Generado #52 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Media', NULL, 0.00, 'CLP', 'Pendiente', '2025-10-14 07:51:23', '2025-10-14 07:51:23', NULL),
(202, 49, 15, 3, 'Ticket Auto Generado #53 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Media', NULL, 0.00, 'CLP', 'Pendiente', '2025-10-19 07:51:23', '2025-10-19 07:51:23', NULL),
(203, 96, 4, 1, 'Ticket Auto Generado #54 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 66519.00, 'CLP', 'Pagado', '2025-10-20 07:51:23', '2025-10-21 06:51:23', NULL),
(204, 47, 15, 3, 'Ticket Auto Generado #55 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 55831.00, 'CLP', 'Pagado', '2025-10-10 07:51:23', '2025-10-12 19:51:23', NULL),
(205, 92, 14, 3, 'Ticket Auto Generado #56 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Baja', NULL, 0.00, 'CLP', 'Pendiente', '2025-12-01 07:51:23', '2025-12-01 07:51:23', NULL),
(206, 87, 12, 8, 'Ticket Auto Generado #57 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 106091.00, 'CLP', 'Pagado', '2025-11-05 07:51:23', '2025-11-06 14:51:23', NULL),
(207, 81, 14, 8, 'Ticket Auto Generado #58 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 37884.00, 'CLP', 'Pagado', '2025-11-11 07:51:23', '2025-11-11 08:51:23', NULL),
(208, 49, 15, 3, 'Ticket Auto Generado #59 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Alta', NULL, 75917.00, 'CLP', 'Pagado', '2025-10-08 07:51:23', '2025-10-08 14:51:23', NULL),
(209, 93, 12, 7, 'Ticket Auto Generado #60 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 46351.00, 'CLP', 'Pagado', '2025-11-15 07:51:23', '2025-11-17 09:51:23', NULL),
(210, 84, 13, 8, 'Ticket Auto Generado #61 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Alta', NULL, 95660.00, 'CLP', 'Pagado', '2025-10-16 07:51:23', '2025-10-18 02:51:23', NULL),
(211, 48, 13, 9, 'Ticket Auto Generado #62 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Alta', NULL, 56555.00, 'CLP', 'Pagado', '2025-11-29 07:51:23', '2025-12-01 05:51:23', NULL),
(212, 47, 4, 8, 'Ticket Auto Generado #63 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Media', NULL, 0.00, 'CLP', 'Pendiente', '2025-11-23 07:51:23', '2025-11-23 07:51:23', NULL),
(213, 83, 11, 3, 'Ticket Auto Generado #64 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 28247.00, 'CLP', 'Pagado', '2025-10-10 07:51:23', '2025-10-12 22:51:23', NULL),
(214, 48, 4, 7, 'Ticket Auto Generado #65 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Baja', NULL, 0.00, 'CLP', 'Pendiente', '2025-12-02 07:51:23', '2025-12-02 07:51:23', NULL),
(215, 88, 12, 7, 'Ticket Auto Generado #66 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Alta', NULL, 0.00, 'CLP', 'Pendiente', '2025-10-19 07:51:23', '2025-10-19 07:51:23', NULL),
(216, 91, 13, 9, 'Ticket Auto Generado #67 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 55516.00, 'CLP', 'Pagado', '2025-11-16 07:51:23', '2025-11-17 03:51:23', NULL),
(217, 50, 4, 8, 'Ticket Auto Generado #68 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Alta', NULL, 51677.00, 'CLP', 'Pagado', '2025-10-21 07:51:23', '2025-10-23 04:51:23', NULL),
(218, 88, 12, 8, 'Ticket Auto Generado #69 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Urgente', NULL, 0.00, 'CLP', 'Pendiente', '2025-11-27 07:51:23', '2025-11-27 07:51:23', NULL),
(219, 95, 15, 8, 'Ticket Auto Generado #70 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Urgente', NULL, 0.00, 'CLP', 'Pendiente', '2025-11-29 07:51:23', '2025-11-29 07:51:23', NULL),
(220, 91, 15, 1, 'Ticket Auto Generado #71 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 49907.00, 'CLP', 'Pagado', '2025-10-14 07:51:23', '2025-10-15 04:51:23', NULL),
(221, 84, 11, 9, 'Ticket Auto Generado #72 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Media', NULL, 0.00, 'CLP', 'Pendiente', '2025-11-28 07:51:23', '2025-11-28 07:51:23', NULL),
(222, 49, 15, 9, 'Ticket Auto Generado #73 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 70636.00, 'CLP', 'Pagado', '2025-11-06 07:51:23', '2025-11-06 10:51:23', NULL),
(223, 88, 15, 3, 'Ticket Auto Generado #74 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 105335.00, 'CLP', 'Pagado', '2025-12-01 07:51:23', '2025-12-02 22:51:23', NULL),
(224, 46, 14, 1, 'Ticket Auto Generado #75 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Urgente', NULL, 0.00, 'CLP', 'Pendiente', '2025-10-23 07:51:23', '2025-10-23 07:51:23', NULL),
(225, 50, 13, 9, 'Ticket Auto Generado #76 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Alta', NULL, 71650.00, 'CLP', 'Pagado', '2025-10-30 07:51:23', '2025-10-30 16:51:23', NULL),
(226, 93, 4, 9, 'Ticket Auto Generado #77 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Baja', NULL, 0.00, 'CLP', 'Pendiente', '2025-11-05 07:51:23', '2025-11-05 07:51:23', NULL),
(227, 94, 11, 3, 'Ticket Auto Generado #78 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 89717.00, 'CLP', 'Pagado', '2025-12-02 07:51:23', '2025-12-04 04:51:23', NULL),
(228, 91, 15, 3, 'Ticket Auto Generado #79 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Baja', NULL, 0.00, 'CLP', 'Pendiente', '2025-10-29 07:51:23', '2025-10-29 07:51:23', NULL),
(229, 86, 11, 7, 'Ticket Auto Generado #80 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Alta', NULL, 49882.00, 'CLP', 'Pagado', '2025-11-14 07:51:23', '2025-11-14 19:51:23', NULL),
(230, 86, 4, 1, 'Ticket Auto Generado #81 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 65003.00, 'CLP', 'Pagado', '2025-10-14 07:51:23', '2025-10-14 09:51:23', NULL),
(231, 87, 12, 3, 'Ticket Auto Generado #82 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 106366.00, 'CLP', 'Pagado', '2025-11-17 07:51:23', '2025-11-18 04:51:23', NULL),
(232, 90, 15, 8, 'Ticket Auto Generado #83 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Alta', NULL, 0.00, 'CLP', 'Pendiente', '2025-12-01 07:51:23', '2025-12-01 07:51:23', NULL),
(233, 87, 15, 1, 'Ticket Auto Generado #84 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 60755.00, 'CLP', 'Pagado', '2025-11-20 07:51:23', '2025-11-23 02:51:23', NULL),
(234, 89, 12, 1, 'Ticket Auto Generado #85 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 57357.00, 'CLP', 'Pagado', '2025-11-16 07:51:23', '2025-11-17 07:51:23', NULL),
(235, 82, 14, 9, 'Ticket Auto Generado #86 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 85412.00, 'CLP', 'Pagado', '2025-10-16 07:51:23', '2025-10-16 11:51:23', NULL),
(236, 87, 13, 7, 'Ticket Auto Generado #87 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 45355.00, 'CLP', 'Pagado', '2025-10-30 07:51:23', '2025-10-30 18:51:23', NULL),
(237, 89, 12, 7, 'Ticket Auto Generado #88 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Urgente', NULL, 0.00, 'CLP', 'Pendiente', '2025-10-20 07:51:23', '2025-10-20 07:51:23', NULL),
(238, 85, 15, 3, 'Ticket Auto Generado #89 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 24603.00, 'CLP', 'Pagado', '2025-11-05 07:51:23', '2025-11-07 17:51:23', NULL),
(239, 86, 15, 1, 'Ticket Auto Generado #90 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 84464.00, 'CLP', 'Pagado', '2025-10-13 07:51:23', '2025-10-15 09:51:23', NULL),
(240, 95, 14, 8, 'Ticket Auto Generado #91 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 31175.00, 'CLP', 'Pagado', '2025-10-16 07:51:23', '2025-10-19 06:51:23', NULL),
(241, 46, 13, 8, 'Ticket Auto Generado #92 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 92177.00, 'CLP', 'Pagado', '2025-10-19 07:51:23', '2025-10-21 04:51:23', NULL),
(242, 88, 14, 9, 'Ticket Auto Generado #93 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Alta', NULL, 0.00, 'CLP', 'Pendiente', '2025-11-22 07:51:23', '2025-11-22 07:51:23', NULL),
(243, 82, 13, 8, 'Ticket Auto Generado #94 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Baja', NULL, 0.00, 'CLP', 'Pendiente', '2025-10-25 07:51:23', '2025-10-25 07:51:23', NULL),
(244, 47, 15, 9, 'Ticket Auto Generado #95 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 39221.00, 'CLP', 'Pagado', '2025-11-30 07:51:23', '2025-12-02 03:51:23', NULL),
(245, 49, 15, 9, 'Ticket Auto Generado #96 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 70770.00, 'CLP', 'Pagado', '2025-10-25 07:51:23', '2025-10-28 06:51:23', NULL),
(246, 86, 15, 9, 'Ticket Auto Generado #97 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 67489.00, 'CLP', 'Pagado', '2025-11-21 07:51:23', '2025-11-23 05:51:23', NULL),
(247, 89, 11, 9, 'Ticket Auto Generado #98 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 35499.00, 'CLP', 'Pagado', '2025-11-13 07:51:23', '2025-11-16 06:51:23', NULL),
(248, 86, 14, 7, 'Ticket Auto Generado #99 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 81268.00, 'CLP', 'Pagado', '2025-12-04 07:51:23', '2025-12-05 19:51:23', NULL),
(249, 45, 15, 9, 'Ticket Auto Generado #100 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 17675.00, 'CLP', 'Pagado', '2025-11-12 07:51:23', '2025-11-13 21:51:23', NULL),
(250, 84, 11, 1, 'Ticket Auto Generado #101 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 13184.00, 'CLP', 'Pagado', '2025-10-17 07:51:23', '2025-10-19 22:51:23', NULL),
(251, 90, 4, 7, 'Ticket Auto Generado #102 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 68879.00, 'CLP', 'Pagado', '2025-11-27 07:51:23', '2025-11-27 13:51:23', NULL),
(252, 91, 12, 9, 'Ticket Auto Generado #103 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 53501.00, 'CLP', 'Pagado', '2025-11-21 07:51:23', '2025-11-23 18:51:23', NULL),
(253, 83, 13, 8, 'Ticket Auto Generado #104 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 30933.00, 'CLP', 'Pagado', '2025-10-29 07:51:23', '2025-10-31 20:51:23', NULL),
(254, 88, 13, 8, 'Ticket Auto Generado #105 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 65453.00, 'CLP', 'Pagado', '2025-10-19 07:51:23', '2025-10-20 17:51:23', NULL),
(255, 47, 15, 1, 'Ticket Auto Generado #106 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Urgente', NULL, 0.00, 'CLP', 'Pendiente', '2025-11-04 07:51:23', '2025-11-04 07:51:23', NULL),
(256, 48, 12, 8, 'Ticket Auto Generado #107 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 17358.00, 'CLP', 'Pagado', '2025-10-20 07:51:23', '2025-10-21 21:51:23', NULL),
(257, 45, 15, 3, 'Ticket Auto Generado #108 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Baja', NULL, 0.00, 'CLP', 'Pendiente', '2025-10-31 07:51:23', '2025-10-31 07:51:23', NULL),
(258, 45, 13, 8, 'Ticket Auto Generado #109 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 43971.00, 'CLP', 'Pagado', '2025-11-26 07:51:23', '2025-11-26 22:51:23', NULL),
(259, 96, 14, 1, 'Ticket Auto Generado #110 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 100413.00, 'CLP', 'Pagado', '2025-10-11 07:51:23', '2025-10-12 05:51:23', NULL),
(260, 49, 14, 9, 'Ticket Auto Generado #111 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 25810.00, 'CLP', 'Pagado', '2025-10-07 07:51:23', '2025-10-09 14:51:23', NULL),
(261, 92, 11, 8, 'Ticket Auto Generado #112 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 103447.00, 'CLP', 'Pagado', '2025-11-06 07:51:23', '2025-11-07 04:51:23', NULL),
(262, 96, 13, 9, 'Ticket Auto Generado #113 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Urgente', NULL, 0.00, 'CLP', 'Pendiente', '2025-11-26 07:51:23', '2025-11-26 07:51:23', NULL),
(263, 49, 4, 8, 'Ticket Auto Generado #114 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 50369.00, 'CLP', 'Pagado', '2025-11-26 07:51:23', '2025-11-28 04:51:23', NULL),
(264, 45, 4, 8, 'Ticket Auto Generado #115 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Baja', NULL, 0.00, 'CLP', 'Pendiente', '2025-11-17 07:51:23', '2025-11-17 07:51:23', NULL),
(265, 93, 12, 1, 'Ticket Auto Generado #116 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Alta', NULL, 0.00, 'CLP', 'Pendiente', '2025-11-16 07:51:23', '2025-11-16 07:51:23', NULL),
(266, 89, 4, 8, 'Ticket Auto Generado #117 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 52267.00, 'CLP', 'Pagado', '2025-11-12 07:51:23', '2025-11-12 14:51:23', NULL),
(267, 86, 15, 1, 'Ticket Auto Generado #118 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 18044.00, 'CLP', 'Pagado', '2025-10-13 07:51:23', '2025-10-15 19:51:23', NULL),
(268, 86, 4, 1, 'Ticket Auto Generado #119 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 91358.00, 'CLP', 'Pagado', '2025-10-21 07:51:23', '2025-10-23 05:51:23', NULL),
(269, 86, 11, 1, 'Ticket Auto Generado #120 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 49033.00, 'CLP', 'Pagado', '2025-12-02 07:51:23', '2025-12-05 07:51:23', NULL),
(270, 49, 11, 8, 'Ticket Auto Generado #121 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Alta', NULL, 90929.00, 'CLP', 'Pagado', '2025-11-08 07:51:23', '2025-11-09 14:51:23', NULL),
(271, 83, 11, 7, 'Ticket Auto Generado #122 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Media', NULL, 0.00, 'CLP', 'Pendiente', '2025-11-10 07:51:23', '2025-11-10 07:51:23', NULL),
(272, 46, 4, 9, 'Ticket Auto Generado #123 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 86971.00, 'CLP', 'Pagado', '2025-10-31 07:51:23', '2025-11-02 03:51:23', NULL),
(273, 47, 13, 1, 'Ticket Auto Generado #124 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 16207.00, 'CLP', 'Pagado', '2025-10-22 07:51:23', '2025-10-24 05:51:23', NULL),
(274, 48, 4, 1, 'Ticket Auto Generado #125 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 58761.00, 'CLP', 'Pagado', '2025-11-07 07:51:23', '2025-11-09 04:51:23', NULL),
(275, 48, 13, 1, 'Ticket Auto Generado #126 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 98600.00, 'CLP', 'Pagado', '2025-11-29 07:51:23', '2025-11-29 18:51:23', NULL),
(276, 89, 4, 3, 'Ticket Auto Generado #127 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Urgente', NULL, 0.00, 'CLP', 'Pendiente', '2025-10-11 07:51:23', '2025-10-11 07:51:23', NULL),
(277, 46, 12, 1, 'Ticket Auto Generado #128 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 108064.00, 'CLP', 'Pagado', '2025-11-16 07:51:23', '2025-11-17 02:51:23', NULL),
(278, 87, 14, 3, 'Ticket Auto Generado #129 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Urgente', NULL, 0.00, 'CLP', 'Pendiente', '2025-10-07 07:51:23', '2025-10-07 07:51:23', NULL),
(279, 48, 11, 7, 'Ticket Auto Generado #130 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 89045.00, 'CLP', 'Pagado', '2025-10-20 07:51:23', '2025-10-21 00:51:23', NULL),
(280, 84, 4, 1, 'Ticket Auto Generado #131 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 83632.00, 'CLP', 'Pagado', '2025-11-18 07:51:23', '2025-11-19 19:51:23', NULL),
(281, 93, 14, 1, 'Ticket Auto Generado #132 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Alta', NULL, 79665.00, 'CLP', 'Pagado', '2025-10-21 07:51:23', '2025-10-22 06:51:23', NULL),
(282, 94, 13, 9, 'Ticket Auto Generado #133 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 28956.00, 'CLP', 'Pagado', '2025-11-16 07:51:23', '2025-11-17 09:51:23', NULL),
(283, 92, 13, 8, 'Ticket Auto Generado #134 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 43775.00, 'CLP', 'Pagado', '2025-10-24 07:51:23', '2025-10-25 12:51:23', NULL),
(284, 92, 14, 7, 'Ticket Auto Generado #135 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 69950.00, 'CLP', 'Pagado', '2025-10-22 07:51:23', '2025-10-22 15:51:23', NULL),
(285, 49, 4, 3, 'Ticket Auto Generado #136 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 61221.00, 'CLP', 'Pagado', '2025-11-13 07:51:23', '2025-11-13 17:51:23', NULL),
(286, 95, 12, 9, 'Ticket Auto Generado #137 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Urgente', NULL, 19225.00, 'CLP', 'Pagado', '2025-11-25 07:51:23', '2025-11-25 22:51:23', NULL),
(287, 47, 13, 8, 'Ticket Auto Generado #138 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 77264.00, 'CLP', 'Pagado', '2025-11-22 07:51:23', '2025-11-23 12:51:23', NULL),
(288, 45, 14, 3, 'Ticket Auto Generado #139 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 16330.00, 'CLP', 'Pagado', '2025-11-30 07:51:23', '2025-12-01 01:51:23', NULL),
(289, 83, 4, 9, 'Ticket Auto Generado #140 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 38273.00, 'CLP', 'Pagado', '2025-11-26 07:51:23', '2025-11-27 15:51:23', NULL),
(290, 90, 4, 7, 'Ticket Auto Generado #141 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Media', NULL, 45885.00, 'CLP', 'Pagado', '2025-11-15 07:51:23', '2025-11-16 04:51:23', NULL),
(291, 83, 15, 9, 'Ticket Auto Generado #142 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Urgente', NULL, 0.00, 'CLP', 'Pendiente', '2025-11-22 07:51:23', '2025-11-22 07:51:23', NULL),
(292, 45, 13, 7, 'Ticket Auto Generado #143 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Baja', NULL, 0.00, 'CLP', 'Pendiente', '2025-11-21 07:51:23', '2025-11-21 07:51:23', NULL),
(293, 89, 12, 1, 'Ticket Auto Generado #144 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Alta', NULL, 77630.00, 'CLP', 'Pagado', '2025-11-04 07:51:23', '2025-11-05 04:51:23', NULL),
(294, 81, 15, 3, 'Ticket Auto Generado #145 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Alta', NULL, 62677.00, 'CLP', 'Pagado', '2025-11-15 07:51:23', '2025-11-15 12:51:23', NULL),
(295, 47, 14, 9, 'Ticket Auto Generado #146 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Abierto', 'Baja', NULL, 0.00, 'CLP', 'Pendiente', '2025-10-27 07:51:23', '2025-10-27 07:51:23', NULL),
(296, 96, 4, 3, 'Ticket Auto Generado #147 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 98903.00, 'CLP', 'Pagado', '2025-12-02 07:51:23', '2025-12-05 06:51:23', NULL),
(297, 85, 14, 8, 'Ticket Auto Generado #148 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 87950.00, 'CLP', 'Pagado', '2025-11-19 07:51:23', '2025-11-19 13:51:23', NULL),
(298, 47, 15, 7, 'Ticket Auto Generado #149 - Error de Sistema', 'Descripción automática generada para pruebas de carga y visualización de datos.', 'Resuelto', 'Baja', NULL, 57862.00, 'CLP', 'Pagado', '2025-10-08 07:51:23', '2025-10-10 21:51:23', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket_evaluacion`
--

CREATE TABLE `ticket_evaluacion` (
  `id_evaluacion` int(11) NOT NULL,
  `id_ticket` int(11) NOT NULL,
  `calificacion` tinyint(1) NOT NULL COMMENT 'Calificación de 1 a 5',
  `comentario` text DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ticket_evaluacion`
--

INSERT INTO `ticket_evaluacion` (`id_evaluacion`, `id_ticket`, `calificacion`, `comentario`, `fecha_creacion`) VALUES
(112, 149, 3, 'Regular, podría mejorar.', '2025-10-14 13:51:23'),
(113, 151, 3, 'Regular, podría mejorar.', '2025-11-09 20:51:23'),
(114, 152, 5, 'Excelente atención, muy rápido!', '2025-10-25 10:51:23'),
(115, 153, 2, 'No quedé conforme.', '2025-10-22 15:51:23'),
(116, 154, 1, 'Pésimo servicio, muy lento.', '2025-12-01 05:51:23'),
(117, 155, 2, 'No quedé conforme.', '2025-10-09 05:51:23'),
(118, 156, 3, 'Regular, podría mejorar.', '2025-10-09 13:51:23'),
(119, 157, 3, 'Regular, podría mejorar.', '2025-11-10 10:51:23'),
(120, 158, 5, 'Excelente atención, muy rápido!', '2025-11-05 04:51:23'),
(121, 159, 5, 'Excelente atención, muy rápido!', '2025-10-08 07:51:23'),
(122, 160, 3, 'Regular, podría mejorar.', '2025-11-25 11:51:23'),
(123, 161, 5, 'Excelente atención, muy rápido!', '2025-10-23 15:51:23'),
(124, 162, 5, 'Excelente atención, muy rápido!', '2025-10-14 07:51:23'),
(125, 165, 2, 'No quedé conforme.', '2025-11-24 10:51:23'),
(126, 166, 5, 'Excelente atención, muy rápido!', '2025-10-29 10:51:23'),
(127, 168, 3, 'Regular, podría mejorar.', '2025-11-07 03:51:23'),
(128, 171, 4, 'Buen trabajo, gracias.', '2025-10-20 13:51:23'),
(129, 172, 1, 'Pésimo servicio, muy lento.', '2025-11-22 06:51:23'),
(130, 174, 4, 'Buen trabajo, gracias.', '2025-11-15 01:51:23'),
(131, 175, 3, 'Regular, podría mejorar.', '2025-11-28 08:51:23'),
(132, 178, 3, 'Regular, podría mejorar.', '2025-10-25 13:51:23'),
(133, 179, 1, 'Pésimo servicio, muy lento.', '2025-11-18 19:51:23'),
(134, 180, 5, 'Excelente atención, muy rápido!', '2025-12-05 18:51:23'),
(135, 187, 4, 'Buen trabajo, gracias.', '2025-11-04 13:51:23'),
(136, 189, 5, 'Excelente atención, muy rápido!', '2025-11-04 07:51:23'),
(137, 190, 2, 'No quedé conforme.', '2025-11-06 16:51:23'),
(138, 191, 1, 'Pésimo servicio, muy lento.', '2025-11-27 18:51:23'),
(139, 192, 2, 'No quedé conforme.', '2025-11-29 08:51:23'),
(140, 193, 5, 'Excelente atención, muy rápido!', '2025-11-13 07:51:23'),
(141, 197, 4, 'Buen trabajo, gracias.', '2025-10-15 21:51:23'),
(142, 198, 3, 'Regular, podría mejorar.', '2025-10-11 18:51:23'),
(143, 199, 2, 'No quedé conforme.', '2025-12-02 13:51:23'),
(144, 203, 5, 'Excelente atención, muy rápido!', '2025-10-21 07:51:23'),
(145, 204, 2, 'No quedé conforme.', '2025-10-12 20:51:23'),
(146, 206, 3, 'Regular, podría mejorar.', '2025-11-06 15:51:23'),
(147, 207, 2, 'No quedé conforme.', '2025-11-11 09:51:23'),
(148, 208, 4, 'Buen trabajo, gracias.', '2025-10-08 15:51:23'),
(149, 209, 4, 'Buen trabajo, gracias.', '2025-11-17 10:51:23'),
(150, 210, 5, 'Excelente atención, muy rápido!', '2025-10-18 03:51:23'),
(151, 211, 1, 'Pésimo servicio, muy lento.', '2025-12-01 06:51:23'),
(152, 213, 4, 'Buen trabajo, gracias.', '2025-10-12 23:51:23'),
(153, 216, 1, 'Pésimo servicio, muy lento.', '2025-11-17 04:51:23'),
(154, 217, 3, 'Regular, podría mejorar.', '2025-10-23 05:51:23'),
(155, 220, 1, 'Pésimo servicio, muy lento.', '2025-10-15 05:51:23'),
(156, 222, 2, 'No quedé conforme.', '2025-11-06 11:51:23'),
(157, 223, 2, 'No quedé conforme.', '2025-12-02 23:51:23'),
(158, 225, 4, 'Buen trabajo, gracias.', '2025-10-30 17:51:23'),
(159, 227, 4, 'Buen trabajo, gracias.', '2025-12-04 05:51:23'),
(160, 229, 1, 'Pésimo servicio, muy lento.', '2025-11-14 20:51:23'),
(161, 230, 2, 'No quedé conforme.', '2025-10-14 10:51:23'),
(162, 231, 4, 'Buen trabajo, gracias.', '2025-11-18 05:51:23'),
(163, 233, 2, 'No quedé conforme.', '2025-11-23 03:51:23'),
(164, 234, 1, 'Pésimo servicio, muy lento.', '2025-11-17 08:51:23'),
(165, 235, 5, 'Excelente atención, muy rápido!', '2025-10-16 12:51:23'),
(166, 236, 3, 'Regular, podría mejorar.', '2025-10-30 19:51:23'),
(167, 238, 4, 'Buen trabajo, gracias.', '2025-11-07 18:51:23'),
(168, 239, 1, 'Pésimo servicio, muy lento.', '2025-10-15 10:51:23'),
(169, 240, 2, 'No quedé conforme.', '2025-10-19 07:51:23'),
(170, 241, 1, 'Pésimo servicio, muy lento.', '2025-10-21 05:51:23'),
(171, 244, 1, 'Pésimo servicio, muy lento.', '2025-12-02 04:51:23'),
(172, 245, 4, 'Buen trabajo, gracias.', '2025-10-28 07:51:23'),
(173, 246, 1, 'Pésimo servicio, muy lento.', '2025-11-23 06:51:23'),
(174, 247, 1, 'Pésimo servicio, muy lento.', '2025-11-16 07:51:23'),
(175, 248, 1, 'Pésimo servicio, muy lento.', '2025-12-05 20:51:23'),
(176, 249, 4, 'Buen trabajo, gracias.', '2025-11-13 22:51:23'),
(177, 250, 5, 'Excelente atención, muy rápido!', '2025-10-19 23:51:23'),
(178, 251, 3, 'Regular, podría mejorar.', '2025-11-27 14:51:23'),
(179, 252, 5, 'Excelente atención, muy rápido!', '2025-11-23 19:51:23'),
(180, 253, 3, 'Regular, podría mejorar.', '2025-10-31 21:51:23'),
(181, 254, 3, 'Regular, podría mejorar.', '2025-10-20 18:51:23'),
(182, 256, 4, 'Buen trabajo, gracias.', '2025-10-21 22:51:23'),
(183, 258, 4, 'Buen trabajo, gracias.', '2025-11-26 23:51:23'),
(184, 259, 3, 'Regular, podría mejorar.', '2025-10-12 06:51:23'),
(185, 260, 1, 'Pésimo servicio, muy lento.', '2025-10-09 15:51:23'),
(186, 261, 2, 'No quedé conforme.', '2025-11-07 05:51:23'),
(187, 263, 1, 'Pésimo servicio, muy lento.', '2025-11-28 05:51:23'),
(188, 266, 1, 'Pésimo servicio, muy lento.', '2025-11-12 15:51:23'),
(189, 267, 1, 'Pésimo servicio, muy lento.', '2025-10-15 20:51:23'),
(190, 268, 5, 'Excelente atención, muy rápido!', '2025-10-23 06:51:23'),
(191, 269, 3, 'Regular, podría mejorar.', '2025-12-05 08:51:23'),
(192, 270, 3, 'Regular, podría mejorar.', '2025-11-09 15:51:23'),
(193, 272, 1, 'Pésimo servicio, muy lento.', '2025-11-02 04:51:23'),
(194, 273, 3, 'Regular, podría mejorar.', '2025-10-24 06:51:23'),
(195, 274, 4, 'Buen trabajo, gracias.', '2025-11-09 05:51:23'),
(196, 275, 3, 'Regular, podría mejorar.', '2025-11-29 19:51:23'),
(197, 277, 2, 'No quedé conforme.', '2025-11-17 03:51:23'),
(198, 279, 5, 'Excelente atención, muy rápido!', '2025-10-21 01:51:23'),
(199, 280, 3, 'Regular, podría mejorar.', '2025-11-19 20:51:23'),
(200, 281, 3, 'Regular, podría mejorar.', '2025-10-22 07:51:23'),
(201, 282, 3, 'Regular, podría mejorar.', '2025-11-17 10:51:23'),
(202, 283, 5, 'Excelente atención, muy rápido!', '2025-10-25 13:51:23'),
(203, 284, 3, 'Regular, podría mejorar.', '2025-10-22 16:51:23'),
(204, 285, 3, 'Regular, podría mejorar.', '2025-11-13 18:51:23'),
(205, 286, 5, 'Excelente atención, muy rápido!', '2025-11-25 23:51:23'),
(206, 287, 2, 'No quedé conforme.', '2025-11-23 13:51:23'),
(207, 288, 1, 'Pésimo servicio, muy lento.', '2025-12-01 02:51:23'),
(208, 289, 3, 'Regular, podría mejorar.', '2025-11-27 16:51:23'),
(209, 290, 2, 'No quedé conforme.', '2025-11-16 05:51:23'),
(210, 293, 2, 'No quedé conforme.', '2025-11-05 05:51:23'),
(211, 294, 3, 'Regular, podría mejorar.', '2025-11-15 13:51:23'),
(212, 296, 1, 'Pésimo servicio, muy lento.', '2025-12-05 07:51:23'),
(213, 297, 1, 'Pésimo servicio, muy lento.', '2025-11-19 14:51:23'),
(214, 298, 3, 'Regular, podría mejorar.', '2025-10-10 22:51:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodecaso`
--

CREATE TABLE `tipodecaso` (
  `id_tipo_caso` int(11) NOT NULL,
  `nombre_tipo` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipodecaso`
--

INSERT INTO `tipodecaso` (`id_tipo_caso`, `nombre_tipo`, `descripcion`, `activo`) VALUES
(1, 'Servidores De Datos', '', 1),
(3, 'Mantención', '', 1),
(7, 'Software', '', 1),
(8, 'Soporte', '', 1),
(9, 'Mantenimiento a telefonos', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `ruta_foto` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `id_rol`, `nombre_completo`, `email`, `telefono`, `ruta_foto`, `password_hash`, `activo`, `fecha_creacion`) VALUES
(1, 3, 'Esteban Peña', 'esteban.jesus.pf@gmail.com', '', NULL, '$2y$10$GkH.xMT6tdmYzfi0pDzuVuRd1qVlwbAwQeIYLad8uyPb3dlueVZPa', 1, '2025-10-16 03:53:52'),
(2, 1, 'Administrador del Negocio', 'admin@correo.com', '', 'uploads/avatars/688ae90605525_usuario1.jpg', '$2y$10$AVfKtFBS05wnc99PLQwSOeakMlCYmTZ5Jk1jkaMsruN2J77fOon8i', 1, '2025-07-27 05:53:49'),
(10, 3, 'esteban soporte', 'esteban.soporte@gmail.com', '', NULL, '$2y$10$FaIvhddzXX0/VzlSWYCJEeNkK3dEZLy7rByjk05A862YKKavGgctG', 1, '2025-10-17 04:56:33'),
(12, 3, 'esteban supervisor', 'esteban.supervisor@gmail.com', '', NULL, '$2y$10$p574rE4yN7wStrP9RG2b3.Ix60kIeCqcgvS7BOBuE3di/jUEav23O', 1, '2025-10-17 18:36:15'),
(40, 1, 'Alejandro Rivero Nilo', 'alejandroantorivero@gmail.com', NULL, NULL, '$2y$10$.DAAUnTmOlVVy0yopBEGR.h2Y1Ccidm6ad2eWQy1yCMY2oKpPtlCW', 1, '2025-10-24 21:55:51'),
(50, 3, 'Alejandro', 'alej.rivero@duocuc.cl', '', NULL, '$2y$10$hLeISLM/pHCl0kLzEHDYXeQLl/kOtIbBAH/ewvkdakvwSX4XeZGMa', 1, '2025-11-04 00:05:59'),
(51, 4, 'Esteban', 'esteban@cliente.com', NULL, NULL, '$2y$10$ZND7qaZxMBgd0zHrKl8upOYNntJc/jfglKvouikg7XQQpvObkrJFK', 1, '2025-11-04 22:35:24'),
(52, 4, 'Fernando Caviedes', 'alejandro@cliente.com', '', NULL, '$2y$10$HDI6FbPbncti98HirJqAiO5kxabGxfHhI4c4dQ8vcoEGatKvQs0xa', 1, '2025-11-06 00:34:44'),
(53, 4, 'Jesus Sandoval', 'jesussgutierrez@gmail.com', NULL, NULL, '$2y$10$orVhYz8VMphnRvHJ3gXhyeoNAOZWlQLhkGH9M8hQbhCxP2nQN67X6', 1, '2025-11-07 18:14:47'),
(54, 2, 'Antonio Nilo', 'Antonio@usuario.com', '', NULL, '$2y$10$wM8IgaOWoigir9Ba75hKYOzJdemOgs9DIB2fL/PCpddrMnnCDNbHW', 1, '2025-11-07 18:17:11'),
(55, 2, 'Moisés Rodríguez', 'MoisesRcx@gmail.com', '', NULL, '$2y$10$cXsnWdUbGcD/Ynh0XwMs0uDv3ZOmMoGd491r0Y1ilb.lUwhdQeYCe', 1, '2025-11-07 18:18:34'),
(56, 4, 'jesus sandoval gutierrez', 'jesussandoval81691415@gmail.com', NULL, NULL, '$2y$10$TSQh75xybhTF4rjB3P8gSey4.AHxYCDoMQz9xB//AwXEMBDxWw1.q', 1, '2025-11-12 03:34:58'),
(57, 4, 'Alejandro Rivero Nilo', 'alejrivero@gmail.com', NULL, NULL, '$2y$10$RD9iNzTi2JyDGLvDhCm91edb2ENhmGg34anbfVrT9TdMnePa4e3ni', 1, '2025-11-13 03:30:19'),
(58, 4, 'Samuel Nilo', 'samuelnb@gmail.com', NULL, NULL, '$2y$10$EL3ljE/0yOpOC6gneJ6iqOjlRyRKcAwMiQKWokI9hq2Q5J1CpmJpC', 1, '2025-11-21 15:32:51');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agente`
--
ALTER TABLE `agente`
  ADD PRIMARY KEY (`id_agente`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `archivo_adjunto`
--
ALTER TABLE `archivo_adjunto`
  ADD PRIMARY KEY (`id_adjunto`),
  ADD KEY `id_ticket` (`id_ticket`),
  ADD KEY `id_comentario` (`id_comentario`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `correo_electronico` (`email`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_ticket` (`id_ticket`);

--
-- Indices de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_responsable_respuesta` (`id_responsable_respuesta`);

--
-- Indices de la tabla `formulario_contacto`
--
ALTER TABLE `formulario_contacto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_admin_respuesta` (`id_admin_respuesta`);

--
-- Indices de la tabla `password_reset`
--
ALTER TABLE `password_reset`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `nombre_rol` (`nombre_rol`);

--
-- Indices de la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id_ticket`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_agente_asignado` (`id_agente_asignado`),
  ADD KEY `id_tipo_caso` (`id_tipo_caso`);

--
-- Indices de la tabla `ticket_evaluacion`
--
ALTER TABLE `ticket_evaluacion`
  ADD PRIMARY KEY (`id_evaluacion`),
  ADD UNIQUE KEY `id_ticket_unique` (`id_ticket`);

--
-- Indices de la tabla `tipodecaso`
--
ALTER TABLE `tipodecaso`
  ADD PRIMARY KEY (`id_tipo_caso`),
  ADD UNIQUE KEY `nombre_tipo` (`nombre_tipo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agente`
--
ALTER TABLE `agente`
  MODIFY `id_agente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `archivo_adjunto`
--
ALTER TABLE `archivo_adjunto`
  MODIFY `id_adjunto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=399;

--
-- AUTO_INCREMENT de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `formulario_contacto`
--
ALTER TABLE `formulario_contacto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `password_reset`
--
ALTER TABLE `password_reset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;

--
-- AUTO_INCREMENT de la tabla `ticket_evaluacion`
--
ALTER TABLE `ticket_evaluacion`
  MODIFY `id_evaluacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT de la tabla `tipodecaso`
--
ALTER TABLE `tipodecaso`
  MODIFY `id_tipo_caso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agente`
--
ALTER TABLE `agente`
  ADD CONSTRAINT `agente_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `archivo_adjunto`
--
ALTER TABLE `archivo_adjunto`
  ADD CONSTRAINT `fk_adjunto_comentario` FOREIGN KEY (`id_comentario`) REFERENCES `comentario` (`id_comentario`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_adjunto_ticket` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`) ON DELETE CASCADE;

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `fk_comentario_ticket` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD CONSTRAINT `cotizaciones_fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `cotizaciones_fk_responsable` FOREIGN KEY (`id_responsable_respuesta`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL;

--
-- Filtros para la tabla `formulario_contacto`
--
ALTER TABLE `formulario_contacto`
  ADD CONSTRAINT `contact_messages_ibfk_1` FOREIGN KEY (`id_admin_respuesta`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL;

--
-- Filtros para la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_ticket_agente` FOREIGN KEY (`id_agente_asignado`) REFERENCES `agente` (`id_agente`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_ticket_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ticket_tipocaso` FOREIGN KEY (`id_tipo_caso`) REFERENCES `tipodecaso` (`id_tipo_caso`) ON DELETE SET NULL;

--
-- Filtros para la tabla `ticket_evaluacion`
--
ALTER TABLE `ticket_evaluacion`
  ADD CONSTRAINT `fk_evaluacion_ticket` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
