# Proyecto PostgreSQL Avanzado

**Autor:** Julio David Flores Conde

## NOMBRE DEL PROYECTO: BASE DE DATOS DE ALERTAMIENTOS AÉREOS

### Archivo de BACKUP de la base de datos.

[Descargar archivo de restauración](https://github.com/Juliodfconde/Curso_postgress/blob/main/backup/db_alertamientos26062024.sql)

### Descripción de la Base de Datos

Esta base de datos está diseñada para registrar y gestionar todos los alertamientos detectados por el sistema de radares de la República Mexicana. Facilita el seguimiento y apoyo en la intercepción de tráficos aéreos ilegales mediante un sistema organizado de tablas y relaciones. A continuación, se describen las principales tablas y sus propósitos:

1. **Tabla `bitacora`**: Registra los detalles de cada alertamiento, incluyendo fecha y hora de detección, tipo de tráfico, estado, rumbo, coordenadas y observaciones. Se relaciona con otras tablas para obtener información adicional sobre el país de detección, resultado, responsable del turno y más.
2. **Tabla `cat_grados`**: Almacena los diferentes grados de los elementos responsables.
3. **Tabla `cat_pais`**: Contiene los nombres de los países para referenciar el país de detección y PCR.
4. **Tabla `cat_resultado`**: Almacena los posibles resultados de las intercepciones.
5. **Tabla `cat_rumbo`**: Contiene los rumbos posibles de los tráficos detectados.
6. **Tabla `cat_tipo_trafico`**: Define los tipos de tráfico que pueden ser detectados.
7. **Tabla `cat_trafico_status`**: Almacena los estados posibles del tráfico detectado.
8. **Tabla `cat_turno`**: Contiene los diferentes turnos de los responsables del monitoreo.
9. **Tabla `tbl_elementos`**: Registra información sobre los elementos responsables de la detección y seguimiento, incluyendo nombres, apellidos, expediente, grado y estado.
10. **Tabla `tbl_status_responsable`**: Define los estados posibles de los responsables.
11. **Tabla `user_access`**: Administra los accesos de usuarios al sistema, almacenando nombres de usuario, contraseñas y correos electrónicos.

### Relaciones

Las tablas están interconectadas mediante claves foráneas para mantener la integridad de los datos y facilitar la referencia cruzada entre diferentes tipos de información. Por ejemplo:

- La tabla `bitacora` referencia a `tbl_elementos` para identificar al elemento que capturó el alertamiento.
- `bitacora` también referencia a `cat_pais` para obtener el país de detección y PCR.
- Otras relaciones similares se establecen para resultados, rumbos, tipos de tráfico, estados de tráfico y turnos.

### Mejoras en la Gestión de Datos

El uso de estas tablas y relaciones permite un manejo más eficiente y organizado de la información, facilitando el seguimiento y la toma de decisiones en la intercepción de tráficos aéreos ilegales.


### Optimizacion de consultas


Se crea un índice para los países y se realiza la misma consulta antes y después de la creación del índice para comparar la mejora en el tiempo de respuesta.

`creacion de indice`

CREATE INDEX idx_pais_deteccion ON alertas.bitacora(id_pais_deteccion);

`Consulta a sin indice y su resultado`

EXPLAIN ANALYZE SELECT * FROM alertas.bitacora WHERE id_pais_deteccion=1;

![img](imagenes/sin_indice.PNG)

`Consulta a con indice y su resultado` 

EXPLAIN ANALYZE SELECT * FROM alertas.bitacora WHERE id_pais_deteccion=1;

![img](imagenes/con_indice.PNG)

### Diagrama Entidad-Relación

![img](imagenes/er_db_alertamiento.png)

### Código SQL para Generar la Base de Datos

```sql
-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://github.com/pgadmin-org/pgadmin4/issues/new/choose if you find any bugs, including reproduction steps.
BEGIN;

CREATE TABLE IF NOT EXISTS alertas.bitacora
(
    id_registro serial NOT NULL,
    fecha date NOT NULL,
    hora_deteccion time without time zone NOT NULL,
    id_turno integer,
    id_tipo_trafico integer,
    numero integer,
    id_status integer,
    id_rumbo integer,
    latitud numeric(9, 6),
    longitud numeric(9, 6),
    referencia_deteccion text COLLATE pg_catalog."default",
    estado_deteccion character varying(50) COLLATE pg_catalog."default",
    id_pais_deteccion integer,
    fecha_pcr date,
    hora_pcr time without time zone,
    latitud_pcr numeric(9, 6),
    longitud_pcr numeric(9, 6),
    referencia_pcr text COLLATE pg_catalog."default",
    estado_pcr character varying(50) COLLATE pg_catalog."default",
    id_pais_pcr integer,
    id_resultado integer,
    observaciones text COLLATE pg_catalog."default",
    id_responsable_turno integer,
    elemento_capturo integer,
    CONSTRAINT bitacora_pkey PRIMARY KEY (id_registro)
);

CREATE TABLE IF NOT EXISTS alertas.cat_grados
(
    id_grado serial NOT NULL,
    grados character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT cat_grados_pkey PRIMARY KEY (id_grado)
);

CREATE TABLE IF NOT EXISTS alertas.cat_pais
(
    id_pais serial NOT NULL,
    pais character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT cat_pais_pkey PRIMARY KEY (id_pais)
);

CREATE TABLE IF NOT EXISTS alertas.cat_resultado
(
    id_resultado serial NOT NULL,
    resultado character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT cat_resultado_pkey PRIMARY KEY (id_resultado)
);

CREATE TABLE IF NOT EXISTS alertas.cat_rumbo
(
    id_rumbo serial NOT NULL,
    rumbo character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT cat_rumbo_pkey PRIMARY KEY (id_rumbo)
);

CREATE TABLE IF NOT EXISTS alertas.cat_tipo_trafico
(
    id_tipo serial NOT NULL,
    tipo character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT cat_tipo_trafico_pkey PRIMARY KEY (id_tipo)
);

CREATE TABLE IF NOT EXISTS alertas.cat_trafico_status
(
    id_status serial NOT NULL,
    status character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT cat_trafico_status_pkey PRIMARY KEY (id_status)
);

CREATE TABLE IF NOT EXISTS alertas.cat_turno
(
    id_turno serial NOT NULL,
    turno character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT cat_turno_pkey PRIMARY KEY (id_turno)
);

CREATE TABLE IF NOT EXISTS alertas.tbl_elementos
(
    id_elemento serial NOT NULL,
    nombre character varying(100) COLLATE pg_catalog."default" NOT NULL,
    apellido character varying(100) COLLATE pg_catalog."default" NOT NULL,
    apellido2 character varying(100) COLLATE pg_catalog."default" NOT NULL,
    expediente character varying(100) COLLATE pg_catalog."default" NOT NULL,
    id_grado integer,
    id_status_responsable integer,
    CONSTRAINT tbl_elementos_pkey PRIMARY KEY (id_elemento)
);

CREATE TABLE IF NOT EXISTS alertas.tbl_status_responsable
(
    id_status_responsable serial NOT NULL,
    status character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT tbl_status_responsable_pkey PRIMARY KEY (id_status_responsable)
);

CREATE TABLE IF NOT EXISTS alertas.user_access
(
    user_id serial NOT NULL,
    id_elemento integer NOT NULL,
    username character varying(50) COLLATE pg_catalog."default" NOT NULL,
    password_hash character varying(255) COLLATE pg_catalog."default" NOT NULL,
    email character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT user_access_pkey PRIMARY KEY (user_id),
    CONSTRAINT user_access_email_key UNIQUE (email),
    CONSTRAINT user_access_username_key UNIQUE (username)
);

ALTER TABLE IF EXISTS alertas.bitacora
    ADD CONSTRAINT bitacora_elemento_capturo_fkey FOREIGN KEY (elemento_capturo)
    REFERENCES alertas.tbl_elementos (id_elemento) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS alertas.bitacora
    ADD CONSTRAINT bitacora_id_pais_deteccion_fkey FOREIGN KEY (id_pais_deteccion)
    REFERENCES alertas.cat_pais (id_pais) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS alertas.bitacora
    ADD CONSTRAINT bitacora_id_pais_pcr_fkey FOREIGN KEY (id_pais_pcr)
    REFERENCES alertas.cat_pais (id_pais) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS alertas.bitacora
    ADD CONSTRAINT bitacora_id_responsable_turno_fkey FOREIGN KEY (id_responsable_turno)
    REFERENCES alertas.tbl_elementos (id_elemento) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS alertas.bitacora
    ADD CONSTRAINT bitacora_id_resultado_fkey FOREIGN KEY (id_resultado)
    REFERENCES alertas.cat_resultado (id_resultado) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS alertas.bitacora
    ADD CONSTRAINT bitacora_id_rumbo_fkey FOREIGN KEY (id_rumbo)
    REFERENCES alertas.cat_rumbo (id_rumbo) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS alertas.bitacora
    ADD CONSTRAINT bitacora_id_status_fkey FOREIGN KEY (id_status)
    REFERENCES alertas.cat_trafico_status (id_status) MATCH SIMPLE
    ON UPDATE NO ACTION;

ALTER TABLE IF EXISTS alertas.bitacora
    ADD CONSTRAINT bitacora_id_tipo_trafico_fkey FOREIGN KEY (id_tipo_trafico)
    REFERENCES alertas.cat_tipo_trafico (id_tipo) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS alertas.bitacora
    ADD CONSTRAINT bitacora_id_turno_fkey FOREIGN KEY (id_turno)
    REFERENCES alertas.cat_turno (id_turno) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS alertas.tbl_elementos
    ADD CONSTRAINT tbl_elementos_id_grado_fkey FOREIGN KEY (id_grado)
    REFERENCES alertas.cat_grados (id_grado) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS alertas.tbl_elementos
    ADD CONSTRAINT tbl_elementos_id_status_responsable_fkey FOREIGN KEY (id_status_responsable)
    REFERENCES alertas.tbl_status_responsable (id_status_responsable) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS alertas.user_access
    ADD CONSTRAINT fk_elemento FOREIGN KEY (id_elemento)
    REFERENCES alertas.tbl_elementos (id_elemento) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;
