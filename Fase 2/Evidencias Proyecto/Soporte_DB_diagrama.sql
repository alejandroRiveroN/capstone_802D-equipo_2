CREATE TABLE `agente` (
  `id_agente` int PRIMARY KEY AUTO_INCREMENT,
  `id_usuario` int UNIQUE NOT NULL,
  `puesto` varchar(50),
  `fecha_contratacion` date
);

CREATE TABLE `archivo_adjunto` (
  `id_adjunto` int PRIMARY KEY AUTO_INCREMENT,
  `id_ticket` int NOT NULL,
  `id_comentario` int COMMENT 'Puede ser null si es adjunto directo al ticket',
  `nombre_original` varchar(255),
  `nombre_guardado` varchar(255),
  `ruta_archivo` varchar(255),
  `tipo_mime` varchar(100),
  `fecha_subida` timestamp
);

CREATE TABLE `cliente` (
  `id_cliente` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(100),
  `email` varchar(255),
  `telefono` varchar(20),
  `empresa` varchar(100),
  `pais` varchar(100),
  `ciudad` varchar(100),
  `activo` tinyint DEFAULT 1,
  `fecha_registro` timestamp
);

CREATE TABLE `comentario` (
  `id_comentario` int PRIMARY KEY AUTO_INCREMENT,
  `id_ticket` int NOT NULL,
  `id_autor` int NOT NULL,
  `tipo_autor` enum(Agente,Cliente),
  `comentario` text,
  `fecha_creacion` timestamp,
  `es_privado` tinyint DEFAULT 0
);

CREATE TABLE `cotizacion` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `id_cliente` int NOT NULL COMMENT 'OJO: Referencia a la tabla USUARIO en tu SQL actual',
  `tipo_caso` varchar(100),
  `prioridad` enum(Baja,Media,Alta,Urgente),
  `descripcion` text,
  `estado` enum(Nueva,Respondida,Cerrada) DEFAULT 'Nueva',
  `fecha_creacion` timestamp,
  `precio_estimado` decimal(12,2),
  `respuesta` text,
  `id_responsable_respuesta` int,
  `fecha_respuesta` timestamp
);

CREATE TABLE `formulario_contacto` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(255),
  `email` varchar(255),
  `mensaje` text,
  `estado` enum(Nuevo,Respondido) DEFAULT 'Nuevo',
  `fecha_creacion` timestamp,
  `respuesta` text,
  `id_admin_respuesta` int,
  `fecha_respuesta` timestamp
);

CREATE TABLE `password_reset` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `email` varchar(100),
  `token` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `rol` (
  `id_rol` int PRIMARY KEY AUTO_INCREMENT,
  `nombre_rol` varchar(50),
  `descripcion` text
);

CREATE TABLE `ticket` (
  `id_ticket` int PRIMARY KEY AUTO_INCREMENT,
  `id_cliente` int NOT NULL COMMENT 'Referencia a tabla CLIENTE',
  `id_agente_asignado` int,
  `id_tipo_caso` int,
  `asunto` varchar(255),
  `descripcion` text,
  `estado` enum(Abierto,En Progreso,En Espera,Resuelto,Cerrado,Anulado),
  `prioridad` enum(Baja,Media,Alta,Urgente),
  `fecha_vencimiento` datetime,
  `costo` decimal(10,2),
  `moneda` varchar(4),
  `estado_facturacion` enum(Pendiente,Facturado,Pagado),
  `fecha_creacion` timestamp,
  `ultima_actualizacion` timestamp,
  `medio_pago` varchar(50)
);

CREATE TABLE `ticket_evaluacion` (
  `id_evaluacion` int PRIMARY KEY AUTO_INCREMENT,
  `id_ticket` int UNIQUE NOT NULL,
  `calificacion` tinyint COMMENT '1 a 5',
  `comentario` text,
  `fecha_creacion` timestamp
);

CREATE TABLE `tipodecaso` (
  `id_tipo_caso` int PRIMARY KEY AUTO_INCREMENT,
  `nombre_tipo` varchar(100),
  `descripcion` text,
  `activo` tinyint DEFAULT 1
);

CREATE TABLE `usuario` (
  `id_usuario` int PRIMARY KEY AUTO_INCREMENT,
  `id_rol` int NOT NULL,
  `nombre_completo` varchar(100),
  `email` varchar(100),
  `telefono` varchar(20),
  `ruta_foto` varchar(255),
  `password_hash` varchar(255),
  `activo` tinyint DEFAULT 1,
  `fecha_creacion` timestamp
);

ALTER TABLE `usuario` ADD FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);

ALTER TABLE `usuario` ADD FOREIGN KEY (`id_usuario`) REFERENCES `agente` (`id_usuario`) ON DELETE CASCADE;

ALTER TABLE `ticket` ADD FOREIGN KEY (`id_agente_asignado`) REFERENCES `agente` (`id_agente`) ON DELETE SET NULL;

ALTER TABLE `ticket` ADD FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE;

ALTER TABLE `ticket` ADD FOREIGN KEY (`id_tipo_caso`) REFERENCES `tipodecaso` (`id_tipo_caso`) ON DELETE SET NULL;

ALTER TABLE `comentario` ADD FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`) ON DELETE CASCADE;

ALTER TABLE `archivo_adjunto` ADD FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`) ON DELETE CASCADE;

ALTER TABLE `archivo_adjunto` ADD FOREIGN KEY (`id_comentario`) REFERENCES `comentario` (`id_comentario`) ON DELETE CASCADE;

ALTER TABLE `ticket` ADD FOREIGN KEY (`id_ticket`) REFERENCES `ticket_evaluacion` (`id_ticket`) ON DELETE CASCADE;

ALTER TABLE `cotizacion` ADD FOREIGN KEY (`id_cliente`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

ALTER TABLE `cotizacion` ADD FOREIGN KEY (`id_responsable_respuesta`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL;

ALTER TABLE `formulario_contacto` ADD FOREIGN KEY (`id_admin_respuesta`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL;
