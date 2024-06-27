--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-06-27 10:59:15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 16480)
-- Name: alertas; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA alertas;


ALTER SCHEMA alertas OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16481)
-- Name: bitacora; Type: TABLE; Schema: alertas; Owner: postgres
--

CREATE TABLE alertas.bitacora (
    id_registro integer NOT NULL,
    fecha date NOT NULL,
    hora_deteccion time without time zone NOT NULL,
    id_turno integer,
    id_tipo_trafico integer,
    numero integer,
    id_status integer,
    id_rumbo integer,
    latitud numeric(9,6),
    longitud numeric(9,6),
    referencia_deteccion text,
    estado_deteccion character varying(50),
    id_pais_deteccion integer,
    fecha_pcr date,
    hora_pcr time without time zone,
    latitud_pcr numeric(9,6),
    longitud_pcr numeric(9,6),
    referencia_pcr text,
    estado_pcr character varying(50),
    id_pais_pcr integer,
    id_resultado integer,
    observaciones text,
    id_responsable_turno integer,
    elemento_capturo integer
);


ALTER TABLE alertas.bitacora OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16486)
-- Name: bitacora_id_registro_seq; Type: SEQUENCE; Schema: alertas; Owner: postgres
--

CREATE SEQUENCE alertas.bitacora_id_registro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE alertas.bitacora_id_registro_seq OWNER TO postgres;

--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 217
-- Name: bitacora_id_registro_seq; Type: SEQUENCE OWNED BY; Schema: alertas; Owner: postgres
--

ALTER SEQUENCE alertas.bitacora_id_registro_seq OWNED BY alertas.bitacora.id_registro;


--
-- TOC entry 218 (class 1259 OID 16487)
-- Name: cat_grados; Type: TABLE; Schema: alertas; Owner: postgres
--

CREATE TABLE alertas.cat_grados (
    id_grado integer NOT NULL,
    grados character varying(100) NOT NULL
);


ALTER TABLE alertas.cat_grados OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16490)
-- Name: cat_grados_id_grado_seq; Type: SEQUENCE; Schema: alertas; Owner: postgres
--

CREATE SEQUENCE alertas.cat_grados_id_grado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE alertas.cat_grados_id_grado_seq OWNER TO postgres;

--
-- TOC entry 4905 (class 0 OID 0)
-- Dependencies: 219
-- Name: cat_grados_id_grado_seq; Type: SEQUENCE OWNED BY; Schema: alertas; Owner: postgres
--

ALTER SEQUENCE alertas.cat_grados_id_grado_seq OWNED BY alertas.cat_grados.id_grado;


--
-- TOC entry 220 (class 1259 OID 16491)
-- Name: cat_pais; Type: TABLE; Schema: alertas; Owner: postgres
--

CREATE TABLE alertas.cat_pais (
    id_pais integer NOT NULL,
    pais character varying(100) NOT NULL
);


ALTER TABLE alertas.cat_pais OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16494)
-- Name: cat_pais_id_pais_seq; Type: SEQUENCE; Schema: alertas; Owner: postgres
--

CREATE SEQUENCE alertas.cat_pais_id_pais_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE alertas.cat_pais_id_pais_seq OWNER TO postgres;

--
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 221
-- Name: cat_pais_id_pais_seq; Type: SEQUENCE OWNED BY; Schema: alertas; Owner: postgres
--

ALTER SEQUENCE alertas.cat_pais_id_pais_seq OWNED BY alertas.cat_pais.id_pais;


--
-- TOC entry 222 (class 1259 OID 16495)
-- Name: cat_resultado; Type: TABLE; Schema: alertas; Owner: postgres
--

CREATE TABLE alertas.cat_resultado (
    id_resultado integer NOT NULL,
    resultado character varying(100) NOT NULL
);


ALTER TABLE alertas.cat_resultado OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16498)
-- Name: cat_resultado_id_resultado_seq; Type: SEQUENCE; Schema: alertas; Owner: postgres
--

CREATE SEQUENCE alertas.cat_resultado_id_resultado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE alertas.cat_resultado_id_resultado_seq OWNER TO postgres;

--
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 223
-- Name: cat_resultado_id_resultado_seq; Type: SEQUENCE OWNED BY; Schema: alertas; Owner: postgres
--

ALTER SEQUENCE alertas.cat_resultado_id_resultado_seq OWNED BY alertas.cat_resultado.id_resultado;


--
-- TOC entry 224 (class 1259 OID 16499)
-- Name: cat_rumbo; Type: TABLE; Schema: alertas; Owner: postgres
--

CREATE TABLE alertas.cat_rumbo (
    id_rumbo integer NOT NULL,
    rumbo character varying(100) NOT NULL
);


ALTER TABLE alertas.cat_rumbo OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16502)
-- Name: cat_rumbo_id_rumbo_seq; Type: SEQUENCE; Schema: alertas; Owner: postgres
--

CREATE SEQUENCE alertas.cat_rumbo_id_rumbo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE alertas.cat_rumbo_id_rumbo_seq OWNER TO postgres;

--
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 225
-- Name: cat_rumbo_id_rumbo_seq; Type: SEQUENCE OWNED BY; Schema: alertas; Owner: postgres
--

ALTER SEQUENCE alertas.cat_rumbo_id_rumbo_seq OWNED BY alertas.cat_rumbo.id_rumbo;


--
-- TOC entry 226 (class 1259 OID 16503)
-- Name: cat_tipo_trafico; Type: TABLE; Schema: alertas; Owner: postgres
--

CREATE TABLE alertas.cat_tipo_trafico (
    id_tipo integer NOT NULL,
    tipo character varying(100) NOT NULL
);


ALTER TABLE alertas.cat_tipo_trafico OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16506)
-- Name: cat_tipo_trafico_id_tipo_seq; Type: SEQUENCE; Schema: alertas; Owner: postgres
--

CREATE SEQUENCE alertas.cat_tipo_trafico_id_tipo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE alertas.cat_tipo_trafico_id_tipo_seq OWNER TO postgres;

--
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 227
-- Name: cat_tipo_trafico_id_tipo_seq; Type: SEQUENCE OWNED BY; Schema: alertas; Owner: postgres
--

ALTER SEQUENCE alertas.cat_tipo_trafico_id_tipo_seq OWNED BY alertas.cat_tipo_trafico.id_tipo;


--
-- TOC entry 228 (class 1259 OID 16507)
-- Name: cat_trafico_status; Type: TABLE; Schema: alertas; Owner: postgres
--

CREATE TABLE alertas.cat_trafico_status (
    id_status integer NOT NULL,
    status character varying(100) NOT NULL
);


ALTER TABLE alertas.cat_trafico_status OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16510)
-- Name: cat_trafico_status_id_status_seq; Type: SEQUENCE; Schema: alertas; Owner: postgres
--

CREATE SEQUENCE alertas.cat_trafico_status_id_status_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE alertas.cat_trafico_status_id_status_seq OWNER TO postgres;

--
-- TOC entry 4910 (class 0 OID 0)
-- Dependencies: 229
-- Name: cat_trafico_status_id_status_seq; Type: SEQUENCE OWNED BY; Schema: alertas; Owner: postgres
--

ALTER SEQUENCE alertas.cat_trafico_status_id_status_seq OWNED BY alertas.cat_trafico_status.id_status;


--
-- TOC entry 230 (class 1259 OID 16511)
-- Name: cat_turno; Type: TABLE; Schema: alertas; Owner: postgres
--

CREATE TABLE alertas.cat_turno (
    id_turno integer NOT NULL,
    turno character varying(100) NOT NULL
);


ALTER TABLE alertas.cat_turno OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16514)
-- Name: cat_turno_id_turno_seq; Type: SEQUENCE; Schema: alertas; Owner: postgres
--

CREATE SEQUENCE alertas.cat_turno_id_turno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE alertas.cat_turno_id_turno_seq OWNER TO postgres;

--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 231
-- Name: cat_turno_id_turno_seq; Type: SEQUENCE OWNED BY; Schema: alertas; Owner: postgres
--

ALTER SEQUENCE alertas.cat_turno_id_turno_seq OWNED BY alertas.cat_turno.id_turno;


--
-- TOC entry 232 (class 1259 OID 16515)
-- Name: tbl_elementos; Type: TABLE; Schema: alertas; Owner: postgres
--

CREATE TABLE alertas.tbl_elementos (
    id_elemento integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    apellido2 character varying(100) NOT NULL,
    expediente character varying(100) NOT NULL,
    id_grado integer,
    id_status_responsable integer
);


ALTER TABLE alertas.tbl_elementos OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16518)
-- Name: tbl_elementos_id_elemento_seq; Type: SEQUENCE; Schema: alertas; Owner: postgres
--

CREATE SEQUENCE alertas.tbl_elementos_id_elemento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE alertas.tbl_elementos_id_elemento_seq OWNER TO postgres;

--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 233
-- Name: tbl_elementos_id_elemento_seq; Type: SEQUENCE OWNED BY; Schema: alertas; Owner: postgres
--

ALTER SEQUENCE alertas.tbl_elementos_id_elemento_seq OWNED BY alertas.tbl_elementos.id_elemento;


--
-- TOC entry 234 (class 1259 OID 16519)
-- Name: tbl_status_responsable; Type: TABLE; Schema: alertas; Owner: postgres
--

CREATE TABLE alertas.tbl_status_responsable (
    id_status_responsable integer NOT NULL,
    status character varying(100) NOT NULL
);


ALTER TABLE alertas.tbl_status_responsable OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16522)
-- Name: tbl_status_responsable_id_status_responsable_seq; Type: SEQUENCE; Schema: alertas; Owner: postgres
--

CREATE SEQUENCE alertas.tbl_status_responsable_id_status_responsable_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE alertas.tbl_status_responsable_id_status_responsable_seq OWNER TO postgres;

--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 235
-- Name: tbl_status_responsable_id_status_responsable_seq; Type: SEQUENCE OWNED BY; Schema: alertas; Owner: postgres
--

ALTER SEQUENCE alertas.tbl_status_responsable_id_status_responsable_seq OWNED BY alertas.tbl_status_responsable.id_status_responsable;


--
-- TOC entry 236 (class 1259 OID 16523)
-- Name: user_access_user_id_seq; Type: SEQUENCE; Schema: alertas; Owner: postgres
--

CREATE SEQUENCE alertas.user_access_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE alertas.user_access_user_id_seq OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16524)
-- Name: user_access; Type: TABLE; Schema: alertas; Owner: postgres
--

CREATE TABLE alertas.user_access (
    user_id integer DEFAULT nextval('alertas.user_access_user_id_seq'::regclass) NOT NULL,
    id_elemento integer NOT NULL,
    username character varying(50) NOT NULL,
    password_hash character varying(255) NOT NULL,
    email character varying(100) NOT NULL
);


ALTER TABLE alertas.user_access OWNER TO postgres;

--
-- TOC entry 4685 (class 2604 OID 16528)
-- Name: bitacora id_registro; Type: DEFAULT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.bitacora ALTER COLUMN id_registro SET DEFAULT nextval('alertas.bitacora_id_registro_seq'::regclass);


--
-- TOC entry 4686 (class 2604 OID 16529)
-- Name: cat_grados id_grado; Type: DEFAULT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.cat_grados ALTER COLUMN id_grado SET DEFAULT nextval('alertas.cat_grados_id_grado_seq'::regclass);


--
-- TOC entry 4687 (class 2604 OID 16530)
-- Name: cat_pais id_pais; Type: DEFAULT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.cat_pais ALTER COLUMN id_pais SET DEFAULT nextval('alertas.cat_pais_id_pais_seq'::regclass);


--
-- TOC entry 4688 (class 2604 OID 16531)
-- Name: cat_resultado id_resultado; Type: DEFAULT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.cat_resultado ALTER COLUMN id_resultado SET DEFAULT nextval('alertas.cat_resultado_id_resultado_seq'::regclass);


--
-- TOC entry 4689 (class 2604 OID 16532)
-- Name: cat_rumbo id_rumbo; Type: DEFAULT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.cat_rumbo ALTER COLUMN id_rumbo SET DEFAULT nextval('alertas.cat_rumbo_id_rumbo_seq'::regclass);


--
-- TOC entry 4690 (class 2604 OID 16533)
-- Name: cat_tipo_trafico id_tipo; Type: DEFAULT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.cat_tipo_trafico ALTER COLUMN id_tipo SET DEFAULT nextval('alertas.cat_tipo_trafico_id_tipo_seq'::regclass);


--
-- TOC entry 4691 (class 2604 OID 16534)
-- Name: cat_trafico_status id_status; Type: DEFAULT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.cat_trafico_status ALTER COLUMN id_status SET DEFAULT nextval('alertas.cat_trafico_status_id_status_seq'::regclass);


--
-- TOC entry 4692 (class 2604 OID 16535)
-- Name: cat_turno id_turno; Type: DEFAULT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.cat_turno ALTER COLUMN id_turno SET DEFAULT nextval('alertas.cat_turno_id_turno_seq'::regclass);


--
-- TOC entry 4693 (class 2604 OID 16536)
-- Name: tbl_elementos id_elemento; Type: DEFAULT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.tbl_elementos ALTER COLUMN id_elemento SET DEFAULT nextval('alertas.tbl_elementos_id_elemento_seq'::regclass);


--
-- TOC entry 4694 (class 2604 OID 16537)
-- Name: tbl_status_responsable id_status_responsable; Type: DEFAULT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.tbl_status_responsable ALTER COLUMN id_status_responsable SET DEFAULT nextval('alertas.tbl_status_responsable_id_status_responsable_seq'::regclass);


--
-- TOC entry 4877 (class 0 OID 16481)
-- Dependencies: 216
-- Data for Name: bitacora; Type: TABLE DATA; Schema: alertas; Owner: postgres
--

COPY alertas.bitacora (id_registro, fecha, hora_deteccion, id_turno, id_tipo_trafico, numero, id_status, id_rumbo, latitud, longitud, referencia_deteccion, estado_deteccion, id_pais_deteccion, fecha_pcr, hora_pcr, latitud_pcr, longitud_pcr, referencia_pcr, estado_pcr, id_pais_pcr, id_resultado, observaciones, id_responsable_turno, elemento_capturo) FROM stdin;
1	2024-06-19	11:14:00	1	1	1	2	2	26.099733	-107.252013	101 km al noroeste de Culiacan, Sinaloa	Sinaloa	1	2024-06-19	12:00:00	31.188292	-111.064927	17 km al Sureste de Nogales, Sonora	Sonora	1	1	Aseguramiento de aeronave	2	5
3	2024-06-20	18:12:00	2	2	1	1	1	29.181234	-110.322356	15 MN al oeste de Obregon, Sonora	Sonora	1	2024-06-20	18:20:00	29.181234	-110.322356	15 MN al oeste de Obregon, Sonora	Sonora	1	2	No se tuvo contacto con la aeronave	1	3
4	2022-07-20	10:46:00	1	3	3	1	1	29.237886	-110.678345	10 MN al sur de Tijuana , Baja California	Baja California	1	2022-07-20	11:46:00	29.237886	-110.678345	25 MN al noroeste de texas , EUA	Texas	9	1	Aseguramiento de aeronave con carga de aparente droga, por parte de autoridades de EUA	1	4
5	2022-07-19	13:27:00	1	3	2	2	2	30.012436	-113.481245	ubicado a 74 MN al "SE" de San Felipe, Baja California.	Baja California	1	2022-07-19	13:27:00	30.012436	-113.481245	ubicado a 74 MN al "SE" de San Felipe, Baja California.	Baja California	1	1	Aseguramiento de la aeronave	2	1
6	2022-07-11	15:50:00	2	1	4	2	1	17.183255	-89.246475	Ubicado a 18 MN al "W" de Belmopán, Belice.	Belmopan	2	2022-07-12	00:12:00	13.235355	-70.565670	Ubicado a 82 MN al "NW" de la isla Aruba, Paises bajos.	Aruba	2	1	Aseguramiento de 100 kg de carga ilicita aparentemente cocaina.	2	2
7	2022-07-15	17:04:00	2	2	4	1	2	12.312557	-71.082356	ubicado a 25 millas nauticas al "Norte" de Punta espada, Colombia	Punta Espada	4	2022-07-16	02:51:00	14.568145	93.124567	ubicado a 82 millas nauticas al "Sur"  de Pijijiapa, Chiapas	Chiapas	1	2	Posible aterrizaje en la selva, no se tuvo contacto.	1	3
8	2022-04-17	21:27:00	3	1	1	2	1	4.582345	-90.937560	UBICADO A  502 MILLAS NAUTICAS AL "SW" DE SAN JOSE, COSTA RICA	San Jose	6	2022-04-18	05:47:00	1.023453	82.436778	UBICADO A 114 MILLAS NAUTICAS AL "W" DE MANTA, ECUADOR	Manta	8	1	Aseguramiento de aeronave.	2	4
10	2022-01-23	10:45:00	1	2	3	1	2	6.318246	-80.434256	52 MN AL "SW" CAMBUTAL, PANAMA	Cambutal	10	2022-01-23	14:34:00	10.161324	-85.485432	1/2 MM AL "N" DEL AEROPUERTO DEL TAMARINDO, COSTA RICA	Tamarindo	6	2	Identificacion de aeronave, sin revision	1	5
11	2022-04-04	14:49:00	2	1	2	2	1	12.310024	-88.550012	ubicada a 72 MN al sureste de San Salvador El Salvador	El Salvador	3	2022-04-04	16:40:00	10.070012	-86.090024	ubicado a 28 MN al suroeste de Playa Flamingo, Costa Rica	Flamingo	6	1	Aseguramiento de aeronave,  carga ilicita y 2 personas tripulantes.	2	1
12	0202-04-23	16:49:00	2	2	3	1	1	8.590746	-95.134653	ubicado a 435 MN al "Suroeste" de Monterrico, Guatemala sobre el Océano Pacífico	Monterrico	5	0202-04-23	20:49:00	1.220012	-80.252468	Ubicado a 5 MN al "Sureste" de Sucre, Ecuador.	Sucre	5	2	No se tuvo contacto con la aeronave	1	1
13	2024-06-22	09:30:00	1	1	2	1	1	25.671234	-100.310234	80 km al noreste de Monterrey, Nuevo León	Monterrey	1	2024-06-22	10:00:00	25.671234	-100.310234	80 km al noreste de Monterrey, Nuevo León	Monterrey	1	1	Aseguramiento de aeronave	2	2
14	2024-06-23	14:45:00	2	3	1	2	2	28.123456	-109.123456	60 km al sur de Hermosillo, Sonora	Sonora	1	2024-06-23	15:15:00	28.123456	-109.123456	60 km al sur de Hermosillo, Sonora	Sonora	1	1	Aseguramiento de aeronave y carga	1	3
15	2024-06-24	08:20:00	3	2	4	1	1	31.234567	-114.234567	100 km al oeste de Mexicali, Baja California	Baja California	1	2024-06-24	08:50:00	31.234567	-114.234567	100 km al oeste de Mexicali, Baja California	Baja California	1	1	Aseguramiento de aeronave	2	4
16	2024-06-25	19:10:00	1	1	3	2	2	20.567890	-103.567890	40 km al norte de Guadalajara, Jalisco	Jalisco	1	2024-06-25	19:40:00	20.567890	-103.567890	40 km al norte de Guadalajara, Jalisco	Jalisco	1	1	Identificación de aeronave sin contacto	1	1
17	2024-06-26	12:00:00	2	2	2	1	1	22.345678	-105.345678	50 km al este de Tepic, Nayarit	Nayarit	1	2024-06-26	12:30:00	22.345678	-105.345678	50 km al este de Tepic, Nayarit	Nayarit	1	1	Aseguramiento de aeronave y detención de dos personas	2	2
18	2024-06-27	06:15:00	1	1	3	1	1	18.456789	-99.456789	70 km al sur de Cuernavaca, Morelos	Morelos	1	2024-06-27	06:45:00	18.456789	-99.456789	70 km al sur de Cuernavaca, Morelos	Morelos	1	1	Aseguramiento de aeronave	2	3
19	2024-06-28	10:00:00	2	2	2	2	2	16.678901	-97.678901	50 km al este de Oaxaca, Oaxaca	Oaxaca	1	2024-06-28	10:30:00	16.678901	-97.678901	50 km al este de Oaxaca, Oaxaca	Oaxaca	1	1	Identificación de aeronave sin contacto	1	4
20	2024-06-29	14:45:00	3	3	1	1	1	21.789012	-104.789012	30 km al norte de Tepic, Nayarit	Nayarit	1	2024-06-29	15:15:00	21.789012	-104.789012	30 km al norte de Tepic, Nayarit	Nayarit	1	1	Aseguramiento de aeronave y carga	2	2
21	2024-06-30	09:20:00	1	1	4	2	2	19.890123	-98.890123	80 km al suroeste de Pachuca, Hidalgo	Hidalgo	1	2024-06-30	09:50:00	19.890123	-98.890123	80 km al suroeste de Pachuca, Hidalgo	Hidalgo	1	1	Aseguramiento de aeronave	1	3
22	2024-07-01	11:30:00	2	2	3	1	1	23.901234	-101.901234	60 km al este de Zacatecas, Zacatecas	Zacatecas	1	2024-07-01	12:00:00	23.901234	-101.901234	60 km al este de Zacatecas, Zacatecas	Zacatecas	1	1	Aseguramiento de aeronave y detención de dos personas	2	4
23	2024-07-02	07:50:00	3	1	2	2	2	20.012345	-100.012345	90 km al noroeste de Querétaro, Querétaro	Querétaro	1	2024-07-02	08:20:00	20.012345	-100.012345	90 km al noroeste de Querétaro, Querétaro	Querétaro	1	1	Aseguramiento de aeronave	2	1
24	2024-07-03	18:40:00	1	2	1	1	1	22.123456	-102.123456	40 km al oeste de Aguascalientes, Aguascalientes	Aguascalientes	1	2024-07-03	19:10:00	22.123456	-102.123456	40 km al oeste de Aguascalientes, Aguascalientes	Aguascalientes	1	1	Identificación de aeronave sin contacto	1	2
25	2024-07-04	12:55:00	2	3	4	2	2	17.234567	-96.234567	70 km al sur de Veracruz, Veracruz	Veracruz	1	2024-07-04	13:25:00	17.234567	-96.234567	70 km al sur de Veracruz, Veracruz	Veracruz	1	1	Aseguramiento de aeronave	2	3
26	2024-07-05	16:10:00	3	1	3	1	1	18.345678	-94.345678	50 km al norte de Villahermosa, Tabasco	Tabasco	1	2024-07-05	16:40:00	18.345678	-94.345678	50 km al norte de Villahermosa, Tabasco	Tabasco	1	1	Aseguramiento de aeronave y carga	2	4
27	2024-07-06	14:25:00	1	2	2	2	2	19.456789	-99.456789	30 km al este de Ciudad de México, CDMX	CDMX	1	2024-07-06	14:55:00	19.456789	-99.456789	30 km al este de Ciudad de México, CDMX	CDMX	1	1	Aseguramiento de aeronave	1	3
28	2024-07-07	17:00:00	2	3	1	1	1	24.567890	-106.567890	80 km al oeste de Culiacán, Sinaloa	Sinaloa	1	2024-07-07	17:30:00	24.567890	-106.567890	80 km al oeste de Culiacán, Sinaloa	Sinaloa	1	1	Aseguramiento de aeronave y carga	2	2
29	2024-07-08	11:45:00	3	1	4	2	2	21.678901	-103.678901	60 km al noreste de Tepic, Nayarit	Nayarit	1	2024-07-08	12:15:00	21.678901	-103.678901	60 km al noreste de Tepic, Nayarit	Nayarit	1	1	Identificación de aeronave sin contacto	1	4
30	2024-07-09	09:10:00	1	2	3	1	1	20.789012	-102.789012	50 km al este de Guadalajara, Jalisco	Jalisco	1	2024-07-09	09:40:00	20.789012	-102.789012	50 km al este de Guadalajara, Jalisco	Jalisco	1	1	Aseguramiento de aeronave	2	1
31	2024-07-10	13:35:00	2	3	2	2	2	22.890123	-101.890123	40 km al norte de Zacatecas, Zacatecas	Zacatecas	1	2024-07-10	14:05:00	22.890123	-101.890123	40 km al norte de Zacatecas, Zacatecas	Zacatecas	1	1	Aseguramiento de aeronave y carga	2	2
32	2024-07-11	07:25:00	3	1	1	1	1	18.901234	-99.901234	70 km al sur de Cuernavaca, Morelos	Morelos	1	2024-07-11	07:55:00	18.901234	-99.901234	70 km al sur de Cuernavaca, Morelos	Morelos	1	1	Identificación de aeronave sin contacto	1	3
33	2024-07-12	15:50:00	1	2	4	2	2	23.012345	-100.012345	50 km al oeste de San Luis Potosí, San Luis Potosí	San Luis Potosí	1	2024-07-12	16:20:00	23.012345	-100.012345	50 km al oeste de San Luis Potosí, San Luis Potosí	San Luis Potosí	1	1	Aseguramiento de aeronave	2	4
34	2024-07-13	18:15:00	2	3	3	1	1	21.123456	-98.123456	40 km al norte de Tampico, Tamaulipas	Tamaulipas	1	2024-07-13	18:45:00	21.123456	-98.123456	40 km al norte de Tampico, Tamaulipas	Tamaulipas	1	1	Aseguramiento de aeronave y carga	2	2
35	2024-07-14	14:00:00	3	1	2	2	2	24.234567	-105.234567	60 km al sur de Durango, Durango	Durango	1	2024-07-14	14:30:00	24.234567	-105.234567	60 km al sur de Durango, Durango	Durango	1	1	Identificación de aeronave sin contacto	1	1
36	2024-07-15	08:35:00	1	2	1	1	1	19.345678	-99.345678	30 km al oeste de Ciudad de México, CDMX	CDMX	1	2024-07-15	09:05:00	19.345678	-99.345678	30 km al oeste de Ciudad de México, CDMX	CDMX	1	1	Aseguramiento de aeronave	2	2
37	2024-07-16	11:20:00	2	3	2	2	2	21.456789	-104.456789	80 km al este de Tepic, Nayarit	Nayarit	1	2024-07-16	11:50:00	21.456789	-104.456789	80 km al este de Tepic, Nayarit	Nayarit	1	1	Aseguramiento de aeronave y carga	1	3
38	2024-07-17	07:55:00	3	1	3	1	1	22.567890	-103.567890	50 km al noreste de Zacatecas, Zacatecas	Zacatecas	1	2024-07-17	08:25:00	22.567890	-103.567890	50 km al noreste de Zacatecas, Zacatecas	Zacatecas	1	1	Identificación de aeronave sin contacto	2	4
39	2024-07-18	16:40:00	1	2	4	2	2	20.678901	-101.678901	30 km al oeste de León, Guanajuato	Guanajuato	1	2024-07-18	17:10:00	20.678901	-101.678901	30 km al oeste de León, Guanajuato	Guanajuato	1	1	Aseguramiento de aeronave	1	1
40	2024-07-19	12:25:00	2	3	1	1	1	21.789012	-100.789012	60 km al sur de San Luis Potosí, San Luis Potosí	San Luis Potosí	1	2024-07-19	12:55:00	21.789012	-100.789012	60 km al sur de San Luis Potosí, San Luis Potosí	San Luis Potosí	1	1	Aseguramiento de aeronave y carga	2	2
41	2024-07-20	09:50:00	3	1	2	2	2	19.890123	-98.890123	40 km al norte de Pachuca, Hidalgo	Hidalgo	1	2024-07-20	10:20:00	19.890123	-98.890123	40 km al norte de Pachuca, Hidalgo	Hidalgo	1	1	Identificación de aeronave sin contacto	1	3
42	2024-07-21	18:35:00	1	2	3	1	1	22.901234	-102.901234	50 km al este de Zacatecas, Zacatecas	Zacatecas	1	2024-07-21	19:05:00	22.901234	-102.901234	50 km al este de Zacatecas, Zacatecas	Zacatecas	1	1	Aseguramiento de aeronave y detención de dos personas	2	4
43	2024-07-22	06:15:00	2	3	4	2	2	20.012345	-100.012345	90 km al noreste de Querétaro, Querétaro	Querétaro	1	2024-07-22	06:45:00	20.012345	-100.012345	90 km al noreste de Querétaro, Querétaro	Querétaro	1	1	Aseguramiento de aeronave	2	2
44	2024-07-23	12:00:00	3	1	1	1	1	24.123456	-105.123456	80 km al oeste de Durango, Durango	Durango	1	2024-07-23	12:30:00	24.123456	-105.123456	80 km al oeste de Durango, Durango	Durango	1	1	Identificación de aeronave sin contacto	1	1
45	2024-07-24	17:25:00	1	2	2	2	2	19.234567	-99.234567	30 km al este de Ciudad de México, CDMX	CDMX	1	2024-07-24	17:55:00	19.234567	-99.234567	30 km al este de Ciudad de México, CDMX	CDMX	1	1	Aseguramiento de aeronave y carga	2	2
46	2024-07-25	15:10:00	2	3	1	1	1	21.345678	-104.345678	60 km al oeste de Tepic, Nayarit	Nayarit	1	2024-07-25	15:40:00	21.345678	-104.345678	60 km al oeste de Tepic, Nayarit	Nayarit	1	1	Aseguramiento de aeronave y carga	1	3
47	2024-07-26	09:45:00	3	1	3	1	1	22.456789	-103.456789	50 km al noreste de Zacatecas, Zacatecas	Zacatecas	1	2024-07-26	10:15:00	22.456789	-103.456789	50 km al noreste de Zacatecas, Zacatecas	Zacatecas	1	1	Identificación de aeronave sin contacto	2	4
48	2024-07-27	14:30:00	1	2	4	2	2	20.567890	-101.567890	30 km al oeste de León, Guanajuato	Guanajuato	1	2024-07-27	15:00:00	20.567890	-101.567890	30 km al oeste de León, Guanajuato	Guanajuato	1	1	Aseguramiento de aeronave	1	1
49	2024-07-28	08:25:00	2	3	1	1	1	21.678901	-100.678901	60 km al sur de San Luis Potosí, San Luis Potosí	San Luis Potosí	1	2024-07-28	08:55:00	21.678901	-100.678901	60 km al sur de San Luis Potosí, San Luis Potosí	San Luis Potosí	1	1	Aseguramiento de aeronave y carga	2	2
50	2024-07-29	11:50:00	3	1	2	2	2	19.789012	-98.789012	40 km al norte de Pachuca, Hidalgo	Hidalgo	1	2024-07-29	12:20:00	19.789012	-98.789012	40 km al norte de Pachuca, Hidalgo	Hidalgo	1	1	Identificación de aeronave sin contacto	1	3
51	2024-07-30	07:35:00	1	2	3	1	1	22.890123	-101.890123	50 km al este de Zacatecas, Zacatecas	Zacatecas	1	2024-07-30	08:05:00	22.890123	-101.890123	50 km al este de Zacatecas, Zacatecas	Zacatecas	1	1	Aseguramiento de aeronave y detención de dos personas	2	4
52	2024-07-31	06:15:00	2	3	4	2	2	20.012345	-100.012345	90 km al noreste de Querétaro, Querétaro	Querétaro	1	2024-07-31	06:45:00	20.012345	-100.012345	90 km al noreste de Querétaro, Querétaro	Querétaro	1	1	Aseguramiento de aeronave	2	2
53	2024-08-01	12:00:00	3	1	1	1	1	24.123456	-105.123456	80 km al oeste de Durango, Durango	Durango	1	2024-08-01	12:30:00	24.123456	-105.123456	80 km al oeste de Durango, Durango	Durango	1	1	Identificación de aeronave sin contacto	1	1
54	2024-08-02	17:25:00	1	2	2	2	2	19.234567	-99.234567	30 km al este de Ciudad de México, CDMX	CDMX	1	2024-08-02	17:55:00	19.234567	-99.234567	30 km al este de Ciudad de México, CDMX	CDMX	1	1	Aseguramiento de aeronave y carga	2	2
55	2024-08-03	15:10:00	2	3	1	1	1	21.345678	-104.345678	60 km al oeste de Tepic, Nayarit	Nayarit	1	2024-08-03	15:40:00	21.345678	-104.345678	60 km al oeste de Tepic, Nayarit	Nayarit	1	1	Aseguramiento de aeronave y carga	1	3
56	2024-08-04	09:45:00	3	1	3	1	1	22.456789	-103.456789	50 km al noreste de Zacatecas, Zacatecas	Zacatecas	1	2024-08-04	10:15:00	22.456789	-103.456789	50 km al noreste de Zacatecas, Zacatecas	Zacatecas	1	1	Identificación de aeronave sin contacto	2	4
57	2024-08-05	14:30:00	1	2	4	2	2	20.567890	-101.567890	30 km al oeste de León, Guanajuato	Guanajuato	1	2024-08-05	15:00:00	20.567890	-101.567890	30 km al oeste de León, Guanajuato	Guanajuato	1	1	Aseguramiento de aeronave	1	1
58	2024-08-06	08:25:00	2	3	1	1	1	21.678901	-100.678901	60 km al sur de San Luis Potosí, San Luis Potosí	San Luis Potosí	1	2024-08-06	08:55:00	21.678901	-100.678901	60 km al sur de San Luis Potosí, San Luis Potosí	San Luis Potosí	1	1	Aseguramiento de aeronave y carga	2	2
59	2024-08-07	11:50:00	3	1	2	2	2	19.789012	-98.789012	40 km al norte de Pachuca, Hidalgo	Hidalgo	1	2024-08-07	12:20:00	19.789012	-98.789012	40 km al norte de Pachuca, Hidalgo	Hidalgo	1	1	Identificación de aeronave sin contacto	1	3
60	2024-08-08	07:35:00	1	2	3	1	1	22.890123	-101.890123	50 km al este de Zacatecas, Zacatecas	Zacatecas	1	2024-08-08	08:05:00	22.890123	-101.890123	50 km al este de Zacatecas, Zacatecas	Zacatecas	1	1	Aseguramiento de aeronave y detención de dos personas	2	4
61	2024-08-09	06:15:00	2	3	4	2	2	20.012345	-100.012345	90 km al noreste de Querétaro, Querétaro	Querétaro	1	2024-08-09	06:45:00	20.012345	-100.012345	90 km al noreste de Querétaro, Querétaro	Querétaro	1	1	Aseguramiento de aeronave	2	2
62	2024-08-10	12:00:00	3	1	1	1	1	24.123456	-105.123456	80 km al oeste de Durango, Durango	Durango	1	2024-08-10	12:30:00	24.123456	-105.123456	80 km al oeste de Durango, Durango	Durango	1	1	Identificación de aeronave sin contacto	1	1
63	2024-08-11	17:25:00	1	2	2	2	2	19.234567	-99.234567	30 km al este de Ciudad de México, CDMX	CDMX	1	2024-08-11	17:55:00	19.234567	-99.234567	30 km al este de Ciudad de México, CDMX	CDMX	1	1	Aseguramiento de aeronave y carga	2	2
64	2024-08-12	15:10:00	2	3	1	1	1	21.345678	-104.345678	60 km al oeste de Tepic, Nayarit	Nayarit	1	2024-08-12	15:40:00	21.345678	-104.345678	60 km al oeste de Tepic, Nayarit	Nayarit	1	1	Aseguramiento de aeronave y carga	1	3
65	2024-08-13	09:45:00	3	1	3	1	1	22.456789	-103.456789	50 km al noreste de Zacatecas, Zacatecas	Zacatecas	1	2024-08-13	10:15:00	22.456789	-103.456789	50 km al noreste de Zacatecas, Zacatecas	Zacatecas	1	1	Identificación de aeronave sin contacto	2	4
66	2024-08-14	14:30:00	1	2	4	2	2	20.567890	-101.567890	30 km al oeste de León, Guanajuato	Guanajuato	1	2024-08-14	15:00:00	20.567890	-101.567890	30 km al oeste de León, Guanajuato	Guanajuato	1	1	Aseguramiento de aeronave	1	1
67	2024-08-15	08:25:00	2	3	1	1	1	21.678901	-100.678901	60 km al sur de San Luis Potosí, San Luis Potosí	San Luis Potosí	1	2024-08-15	08:55:00	21.678901	-100.678901	60 km al sur de San Luis Potosí, San Luis Potosí	San Luis Potosí	1	1	Aseguramiento de aeronave y carga	2	2
68	2024-08-16	11:50:00	3	1	2	2	2	19.789012	-98.789012	40 km al norte de Pachuca, Hidalgo	Hidalgo	1	2024-08-16	12:20:00	19.789012	-98.789012	40 km al norte de Pachuca, Hidalgo	Hidalgo	1	1	Identificación de aeronave sin contacto	1	3
69	2024-08-17	07:35:00	1	2	3	1	1	22.890123	-101.890123	50 km al este de Zacatecas, Zacatecas	Zacatecas	1	2024-08-17	08:05:00	22.890123	-101.890123	50 km al este de Zacatecas, Zacatecas	Zacatecas	1	1	Aseguramiento de aeronave y detención de dos personas	2	4
70	2024-08-18	06:15:00	2	3	4	2	2	20.012345	-100.012345	90 km al noreste de Querétaro, Querétaro	Querétaro	1	2024-08-18	06:45:00	20.012345	-100.012345	90 km al noreste de Querétaro, Querétaro	Querétaro	1	1	Aseguramiento de aeronave	2	2
71	2024-08-19	12:00:00	3	1	1	1	1	24.123456	-105.123456	80 km al oeste de Durango, Durango	Durango	1	2024-08-19	12:30:00	24.123456	-105.123456	80 km al oeste de Durango, Durango	Durango	1	1	Identificación de aeronave sin contacto	1	1
72	2024-08-20	17:25:00	1	2	2	2	2	19.234567	-99.234567	30 km al este de Ciudad de México, CDMX	CDMX	1	2024-08-20	17:55:00	19.234567	-99.234567	30 km al este de Ciudad de México, CDMX	CDMX	1	1	Aseguramiento de aeronave y carga	2	2
73	2024-08-21	15:10:00	2	3	1	1	1	21.345678	-104.345678	60 km al oeste de Tepic, Nayarit	Nayarit	1	2024-08-21	15:40:00	21.345678	-104.345678	60 km al oeste de Tepic, Nayarit	Nayarit	1	1	Aseguramiento de aeronave y carga	1	3
74	2024-08-22	09:45:00	3	1	3	1	1	22.456789	-103.456789	50 km al noreste de Zacatecas, Zacatecas	Zacatecas	1	2024-08-22	10:15:00	22.456789	-103.456789	50 km al noreste de Zacatecas, Zacatecas	Zacatecas	1	1	Identificación de aeronave sin contacto	2	4
75	2024-08-23	14:30:00	1	2	4	2	2	20.567890	-101.567890	30 km al oeste de León, Guanajuato	Guanajuato	1	2024-08-23	15:00:00	20.567890	-101.567890	30 km al oeste de León, Guanajuato	Guanajuato	1	1	Aseguramiento de aeronave	1	1
76	2024-08-24	08:25:00	2	3	1	1	1	21.678901	-100.678901	60 km al sur de San Luis Potosí, San Luis Potosí	San Luis Potosí	1	2024-08-24	08:55:00	21.678901	-100.678901	60 km al sur de San Luis Potosí, San Luis Potosí	San Luis Potosí	1	1	Aseguramiento de aeronave y carga	2	2
1213	2023-12-07	11:22:29	3	2	3	1	1	28.327703	-107.341529	34 km al norte de Arnoldstad	Baja California	9	2023-12-07	14:02:39	28.412468	-107.437354	59 km al sur de New Terrence	Baja California	9	1	Identificación de aeronave sin contacto	2	4
1214	2023-09-14	01:19:52	1	2	1	2	2	29.461039	-116.601119	40 km al oeste de Katherinefort	Monterrico	5	2023-09-14	20:15:01	29.470961	-116.615909	53 km al oeste de Joneschester	Monterrico	5	1	Aseguramiento de aeronave y carga	1	2
1215	2023-12-07	07:36:55	2	2	1	2	1	26.052208	-109.526533	26 km al este de Monicamouth	Tamaulipas	7	2023-12-07	08:32:23	26.036401	-109.545145	24 km al oeste de Andersonton	Tamaulipas	7	2	Aseguramiento de aeronave y carga	2	1
1216	2024-03-04	05:04:39	2	2	4	1	2	19.122107	-102.212091	33 km al sur de East Lauraside	Baja California	3	2024-03-04	12:05:56	19.109951	-102.276770	37 km al este de Laurieborough	Baja California	3	1	Aseguramiento de aeronave	1	4
1217	2024-04-01	11:47:19	1	1	3	2	2	20.290436	-94.613868	19 km al norte de Port Jason	Villahermosa	10	2024-04-01	22:51:14	20.328425	-94.524008	97 km al norte de North Reginald	Villahermosa	10	2	Aseguramiento de aeronave	1	3
1218	2024-04-23	22:13:53	3	4	4	2	1	20.061544	-107.102541	44 km al oeste de New Bruce	Villahermosa	4	2024-04-23	14:57:31	20.050035	-107.168445	51 km al este de New Tyronemouth	Villahermosa	4	2	Aseguramiento de aeronave y detención de dos personas	1	3
1219	2024-05-16	02:44:36	2	2	1	2	2	22.998289	-96.528843	68 km al oeste de Blackville	Sinaloa	1	2024-05-16	03:32:43	23.013888	-96.572894	23 km al sur de Lake Nathan	Sinaloa	1	2	Identificación de aeronave sin contacto	2	1
1220	2023-07-05	04:36:25	1	4	2	2	2	22.738411	-112.908833	64 km al oeste de New Sarah	Culiacán	3	2023-07-05	18:51:37	22.701975	-112.927150	56 km al sur de West Coreychester	Culiacán	3	1	No se tuvo contacto con la aeronave	1	4
1221	2024-01-01	06:32:29	1	2	1	2	2	17.363927	-111.254244	73 km al oeste de Rodriguezburgh	Aguascalientes	6	2024-01-01	07:12:06	17.267873	-111.333488	96 km al norte de Lisaport	Aguascalientes	6	1	Aseguramiento de aeronave	2	4
1222	2024-04-11	10:38:25	3	3	3	1	1	29.261288	-86.292372	86 km al norte de Lisaborough	Sinaloa	10	2024-04-11	23:59:02	29.245387	-86.240860	16 km al norte de New Kimberly	Sinaloa	10	2	Aseguramiento de aeronave	1	1
1223	2024-03-10	21:02:14	2	1	1	1	2	28.318451	-112.740530	15 km al norte de Kellyburgh	San Jose	7	2024-03-10	16:47:21	28.340530	-112.764481	30 km al sur de Teresafort	San Jose	7	1	Aseguramiento de aeronave y carga	1	4
1224	2023-12-13	00:30:30	2	4	4	1	2	22.580366	-116.630898	72 km al norte de South Ericland	Tamaulipas	3	2023-12-13	11:32:52	22.595333	-116.638771	10 km al sur de Cynthiatown	Tamaulipas	3	1	Identificación de aeronave sin contacto	1	4
1225	2023-12-25	08:36:33	3	4	3	2	1	29.465463	-107.616408	63 km al sur de Heidiside	Tepic	7	2023-12-25	09:19:50	29.556778	-107.709914	31 km al norte de Port Johnville	Tepic	7	1	No se tuvo contacto con la aeronave	2	1
1226	2023-09-11	12:34:03	1	1	3	1	2	25.484700	-102.528650	69 km al oeste de East David	Monterrey	5	2023-09-11	10:36:35	25.385727	-102.541193	63 km al sur de Port Cynthiafort	Monterrey	5	1	No se tuvo contacto con la aeronave	1	2
1227	2024-06-12	17:08:42	1	4	3	1	1	24.338817	-93.354813	18 km al este de Cindyfort	Monterrey	2	2024-06-12	09:53:36	24.297034	-93.354575	56 km al sur de Peggymouth	Monterrey	2	1	Aseguramiento de aeronave y detención de dos personas	1	3
1228	2024-04-24	17:29:47	3	3	1	2	1	23.010928	-101.450645	46 km al norte de Port Joshuaview	Querétaro	7	2024-04-24	02:24:43	23.015637	-101.400684	32 km al oeste de Amberburgh	Querétaro	7	1	Aseguramiento de aeronave	1	2
1229	2024-03-25	16:35:12	2	2	1	2	1	23.861362	-98.547432	13 km al norte de Port Heidi	Tepic	3	2024-03-25	19:54:55	23.954537	-98.517820	79 km al norte de Anthonyport	Tepic	3	1	No se tuvo contacto con la aeronave	2	2
1230	2023-07-11	03:06:48	2	1	2	1	1	23.154944	-113.755533	85 km al este de West Vickitown	Aguascalientes	5	2023-07-11	03:33:16	23.132815	-113.797172	50 km al sur de New Christinefort	Aguascalientes	5	2	Aseguramiento de aeronave y detención de dos personas	2	3
1231	2024-02-26	13:46:08	2	4	1	2	2	18.187678	-116.826619	45 km al este de Lake Johnfurt	Durango	10	2024-02-26	03:32:44	18.203682	-116.910382	12 km al este de New Autumnfort	Durango	10	2	Aseguramiento de aeronave	2	1
1232	2024-04-02	03:22:31	3	2	1	1	2	18.802053	-113.362984	93 km al oeste de East Chloeberg	Guadalajara	2	2024-04-02	17:51:14	18.814140	-113.316407	35 km al oeste de Guerrerotown	Guadalajara	2	1	Aseguramiento de aeronave	1	3
1233	2023-12-17	02:21:18	2	3	3	2	1	20.938605	-87.552185	82 km al norte de Morrisstad	Cambutal	10	2023-12-17	00:52:02	21.014647	-87.604924	73 km al norte de West Yolandabury	Cambutal	10	1	No se tuvo contacto con la aeronave	2	3
1234	2024-01-03	21:20:39	3	1	1	1	1	20.012620	-89.702284	53 km al este de East Robertshire	Culiacán	9	2024-01-03	16:25:52	20.066675	-89.790914	84 km al sur de Lambfurt	Culiacán	9	1	Aseguramiento de aeronave	1	1
1235	2024-01-04	23:05:07	2	3	4	2	1	26.897826	-104.909733	66 km al este de Garciaburgh	Veracruz	10	2024-01-04	13:40:07	26.837847	-104.970747	89 km al este de Stephenmouth	Veracruz	10	2	Aseguramiento de aeronave y carga	2	3
1236	2024-04-16	19:55:56	3	3	4	2	1	30.911367	-104.901151	95 km al este de Collinsville	Punta Espada	2	2024-04-16	08:08:16	30.848493	-104.840080	55 km al este de Lake Christianberg	Punta Espada	2	2	Identificación de aeronave sin contacto	2	2
1237	2024-02-28	00:12:19	2	1	3	2	2	20.345540	-88.924821	24 km al este de South Matthewmouth	Belmopan	1	2024-02-28	08:09:45	20.263368	-89.022411	55 km al oeste de Larsonton	Belmopan	1	2	Aseguramiento de aeronave y carga	2	1
1238	2024-05-12	16:42:07	2	1	3	2	1	17.156120	-86.938175	22 km al sur de East Cindy	CDMX	7	2024-05-12	21:57:14	17.182822	-87.003762	38 km al norte de East Richard	CDMX	7	1	Aseguramiento de aeronave	2	1
1239	2024-06-07	11:06:12	2	3	3	1	2	21.690428	-88.285876	13 km al este de Gordonbury	Baja California	5	2024-06-07	02:04:51	21.683479	-88.328430	49 km al este de Port Michelleport	Baja California	5	1	No se tuvo contacto con la aeronave	1	3
1240	2024-03-27	20:52:22	1	3	1	1	1	28.246653	-90.294955	43 km al norte de Maryfurt	Sonora	2	2024-03-27	18:21:32	28.242312	-90.287506	20 km al norte de Zacharyside	Sonora	2	1	Aseguramiento de aeronave y carga	2	1
1241	2024-05-04	16:27:58	3	4	2	2	1	24.830665	-98.034624	39 km al oeste de West Josephland	Monterrey	8	2024-05-04	16:13:54	24.735831	-98.101546	42 km al oeste de Foxville	Monterrey	8	1	Aseguramiento de aeronave y detención de dos personas	1	4
1242	2024-03-09	06:30:53	3	2	3	1	2	17.778296	-89.188240	28 km al este de Rossbury	Sonora	4	2024-03-09	15:03:06	17.742879	-89.285265	51 km al norte de East Richardburgh	Sonora	4	1	No se tuvo contacto con la aeronave	1	2
1243	2023-08-19	05:56:31	1	3	3	1	2	21.385969	-95.024659	10 km al este de Dixontown	Guadalajara	6	2023-08-19	01:11:04	21.477468	-95.047416	54 km al norte de East Patrick	Guadalajara	6	2	Identificación de aeronave sin contacto	2	1
1244	2024-03-22	06:31:47	2	2	1	2	1	30.575102	-114.702076	33 km al norte de East Anthonybury	El Salvador	5	2024-03-22	03:12:57	30.497167	-114.742777	10 km al oeste de East Judith	El Salvador	5	2	Aseguramiento de aeronave y detención de dos personas	2	1
1245	2023-07-20	19:31:45	3	3	4	1	2	29.228351	-108.683470	56 km al norte de Douglasside	Monterrico	4	2023-07-20	14:33:46	29.312524	-108.627708	66 km al este de Lake Walterfort	Monterrico	4	2	Aseguramiento de aeronave	1	4
1246	2024-06-13	17:04:13	1	2	2	1	2	27.110243	-113.585384	33 km al este de Lake Mitchell	Sinaloa	6	2024-06-13	22:54:14	27.115843	-113.676700	25 km al sur de Lake Crystal	Sinaloa	6	1	Aseguramiento de aeronave y carga	2	4
1247	2024-05-31	21:22:27	1	1	1	2	1	21.869042	-90.293000	76 km al oeste de New Jessicaville	CDMX	10	2024-05-31	21:19:56	21.919012	-90.281385	85 km al este de New Andrew	CDMX	10	2	Aseguramiento de aeronave	1	4
1248	2023-09-04	18:43:15	1	3	3	2	1	18.632447	-86.551407	17 km al oeste de Jessicachester	Punta Espada	4	2023-09-04	03:43:16	18.702074	-86.636593	74 km al norte de Port Allison	Punta Espada	4	2	No se tuvo contacto con la aeronave	2	3
1249	2024-01-17	13:11:57	2	1	3	1	2	17.594429	-112.672977	16 km al oeste de North Robertville	Hermosillo	1	2024-01-17	21:32:08	17.687633	-112.582027	63 km al norte de East Amanda	Hermosillo	1	1	Aseguramiento de aeronave	1	3
1250	2024-03-13	14:19:09	1	3	4	2	2	22.532164	-114.128126	68 km al sur de Sosahaven	Zacatecas	7	2024-03-13	22:58:36	22.509039	-114.185499	62 km al este de Fieldsbury	Zacatecas	7	2	No se tuvo contacto con la aeronave	2	1
1251	2024-01-17	02:23:01	3	3	2	2	1	17.598404	-98.311682	81 km al oeste de Port Joshuaside	Guadalajara	3	2024-01-17	16:13:39	17.635616	-98.384428	18 km al sur de Elizabethborough	Guadalajara	3	1	Identificación de aeronave sin contacto	2	4
1252	2024-03-03	19:18:23	1	4	1	2	2	19.224226	-88.057572	29 km al oeste de Port Jaredside	Sinaloa	7	2024-03-03	11:52:06	19.184406	-88.099057	53 km al oeste de Waltonmouth	Sinaloa	7	1	Aseguramiento de aeronave	2	4
1253	2023-11-19	08:42:51	3	4	1	2	1	22.047858	-103.308487	32 km al sur de Lake Sonia	Cambutal	3	2023-11-19	06:49:33	22.016664	-103.240939	28 km al este de Kevinland	Cambutal	3	2	Aseguramiento de aeronave y carga	2	4
1254	2023-10-22	05:05:11	2	2	3	1	2	26.261463	-87.164338	60 km al este de New Christianshire	Durango	8	2023-10-22	05:37:09	26.254433	-87.066811	98 km al norte de Alvaradoborough	Durango	8	2	Aseguramiento de aeronave	1	4
1255	2024-05-07	14:32:01	1	4	1	2	2	26.825045	-99.294118	77 km al oeste de Robertfurt	Guadalajara	1	2024-05-07	05:49:58	26.831279	-99.255457	50 km al sur de Michellemouth	Guadalajara	1	2	Identificación de aeronave sin contacto	1	2
1256	2023-08-07	17:37:02	3	2	3	2	2	19.238826	-100.268060	38 km al norte de Beverlymouth	Belmopan	3	2023-08-07	04:14:30	19.275960	-100.179450	15 km al sur de East Brianburgh	Belmopan	3	2	Aseguramiento de aeronave	2	3
1257	2023-12-24	11:37:45	1	2	4	2	1	17.077889	-91.530348	58 km al norte de Williamschester	Querétaro	1	2023-12-24	02:06:22	17.063778	-91.506325	61 km al oeste de Hopkinstown	Querétaro	1	2	Identificación de aeronave sin contacto	2	1
1258	2024-05-08	19:07:36	1	1	1	1	2	23.620560	-103.763975	54 km al norte de Lake Maryville	Tepic	3	2024-05-08	18:42:16	23.573701	-103.787011	12 km al sur de Robertburgh	Tepic	3	1	Aseguramiento de aeronave	2	2
1259	2023-12-13	23:32:10	1	3	4	1	2	30.787049	-94.254701	27 km al sur de Anthonyfort	Veracruz	7	2023-12-13	07:52:33	30.834112	-94.279261	64 km al oeste de Davidtown	Veracruz	7	2	Aseguramiento de aeronave y carga	1	1
1260	2024-02-19	14:46:09	2	1	2	1	2	26.329833	-110.794932	87 km al norte de Mcmahonport	Sinaloa	9	2024-02-19	21:10:18	26.256613	-110.762217	16 km al norte de Moodyland	Sinaloa	9	1	Aseguramiento de aeronave y carga	1	1
1261	2023-09-19	13:51:52	1	4	2	2	2	25.131361	-116.017463	26 km al oeste de Port James	Veracruz	4	2023-09-19	10:27:11	25.039217	-115.925036	25 km al sur de Smithport	Veracruz	4	1	No se tuvo contacto con la aeronave	1	2
1262	2024-04-22	00:00:08	3	4	4	1	1	20.765559	-112.224428	70 km al sur de South Nathan	Villahermosa	3	2024-04-22	00:12:54	20.851079	-112.156138	38 km al oeste de Halltown	Villahermosa	3	2	No se tuvo contacto con la aeronave	1	1
1263	2023-09-09	12:00:07	3	4	3	2	2	25.205061	-94.296637	24 km al oeste de South Tina	Sinaloa	1	2023-09-09	05:39:41	25.175486	-94.350725	89 km al este de Deckertown	Sinaloa	1	1	Identificación de aeronave sin contacto	2	1
1264	2023-07-18	00:08:10	2	2	4	1	1	19.377325	-101.531905	57 km al norte de South Diana	Cambutal	10	2023-07-18	10:54:42	19.438503	-101.606812	33 km al sur de North Andrewtown	Cambutal	10	2	Aseguramiento de aeronave	2	3
1265	2024-01-30	12:25:40	2	4	4	1	2	24.243699	-112.423008	86 km al sur de Andrewstad	Punta Espada	8	2024-01-30	19:10:46	24.197191	-112.401801	27 km al norte de South Charleneberg	Punta Espada	8	2	Identificación de aeronave sin contacto	1	1
1266	2023-11-12	14:24:11	3	2	2	2	1	30.801392	-100.678516	14 km al norte de Conniemouth	Monterrey	1	2023-11-12	03:25:35	30.885552	-100.673123	15 km al sur de Gordonchester	Monterrey	1	2	Aseguramiento de aeronave y carga	1	4
1267	2024-05-13	04:50:59	2	4	3	2	1	24.627989	-111.147467	61 km al norte de East Maryside	Tepic	5	2024-05-13	02:34:16	24.722853	-111.088659	21 km al este de Krystalland	Tepic	5	1	Identificación de aeronave sin contacto	2	2
1268	2023-09-03	19:16:23	2	1	4	2	2	25.381964	-92.741327	30 km al este de Lake Kevin	Baja California	2	2023-09-03	17:37:12	25.453998	-92.819245	41 km al sur de South Brendaville	Baja California	2	1	Aseguramiento de aeronave y detención de dos personas	2	1
1269	2024-01-30	07:04:47	3	4	3	1	2	27.569918	-98.370313	39 km al este de East Anna	Baja California	5	2024-01-30	01:38:15	27.607847	-98.400827	26 km al este de Gutierrezberg	Baja California	5	1	Aseguramiento de aeronave y detención de dos personas	1	3
1270	2024-05-07	06:18:09	1	4	2	1	1	17.357105	-102.371145	94 km al oeste de Williamsview	Monterrico	3	2024-05-07	04:49:14	17.266609	-102.277939	63 km al sur de North Sherrymouth	Monterrico	3	2	Aseguramiento de aeronave	1	4
1271	2024-02-11	14:46:00	3	2	4	2	1	24.390009	-99.519850	69 km al norte de Ricardomouth	Baja California	2	2024-02-11	02:39:12	24.291995	-99.537408	62 km al sur de Johnsborough	Baja California	2	2	Aseguramiento de aeronave y carga	2	1
1272	2023-09-19	23:35:56	2	1	2	1	1	18.053683	-103.177253	39 km al sur de Sanchezfurt	Querétaro	7	2023-09-19	00:20:32	18.099478	-103.165724	97 km al oeste de Edwardtown	Querétaro	7	1	No se tuvo contacto con la aeronave	2	2
1273	2023-11-12	11:01:19	3	4	4	1	2	23.431368	-116.883056	15 km al norte de East Deborah	El Salvador	5	2023-11-12	23:30:58	23.427760	-116.927313	81 km al oeste de West Susan	El Salvador	5	2	Aseguramiento de aeronave	1	2
1274	2024-06-18	00:13:13	1	4	3	2	1	18.333104	-92.786061	97 km al oeste de North Bettytown	Durango	3	2024-06-18	22:57:22	18.417905	-92.872063	13 km al oeste de New Nicole	Durango	3	1	Aseguramiento de aeronave y carga	1	4
1275	2023-11-30	15:55:17	1	4	1	2	2	25.592552	-91.972871	69 km al este de Allisonside	Aguascalientes	4	2023-11-30	06:52:35	25.639540	-91.909893	67 km al sur de South Kathryn	Aguascalientes	4	2	Aseguramiento de aeronave y detención de dos personas	1	1
1276	2024-01-27	02:22:54	2	3	3	2	1	19.377362	-93.141288	46 km al este de Danborough	Cambutal	1	2024-01-27	06:41:36	19.369505	-93.173684	71 km al sur de West Javier	Cambutal	1	1	No se tuvo contacto con la aeronave	1	3
1277	2023-12-03	11:39:14	1	1	2	2	2	21.689628	-98.658180	90 km al sur de Bradleyfurt	Monterrico	8	2023-12-03	08:04:24	21.692391	-98.667170	62 km al oeste de East Adamberg	Monterrico	8	2	No se tuvo contacto con la aeronave	2	2
1278	2024-03-29	23:07:57	2	1	1	1	1	17.021230	-99.133778	99 km al oeste de Jordanchester	El Salvador	8	2024-03-29	16:17:14	17.041041	-99.124973	38 km al oeste de Wilsonside	El Salvador	8	2	Aseguramiento de aeronave	2	4
1279	2024-03-12	12:57:14	2	3	1	1	2	29.779308	-93.385096	23 km al sur de Williamchester	Guadalajara	6	2024-03-12	23:15:45	29.769289	-93.428082	18 km al norte de Judyton	Guadalajara	6	1	Aseguramiento de aeronave y carga	2	2
1280	2024-02-14	19:33:47	3	3	3	1	1	25.095853	-97.582042	69 km al este de Stanleyborough	Villahermosa	3	2024-02-14	08:45:27	25.190992	-97.597220	29 km al este de Hugheston	Villahermosa	3	2	No se tuvo contacto con la aeronave	1	4
1281	2023-12-14	15:02:34	2	3	2	1	2	18.462375	-106.005830	19 km al norte de Benjaminport	Aguascalientes	1	2023-12-14	07:49:06	18.549366	-106.043372	94 km al este de Lake James	Aguascalientes	1	2	Aseguramiento de aeronave	1	4
1282	2023-11-18	05:55:26	2	2	2	1	1	17.998058	-108.002769	64 km al oeste de South Thomaschester	CDMX	9	2023-11-18	04:05:26	17.970017	-108.019800	69 km al sur de Danielshire	CDMX	9	1	Aseguramiento de aeronave y detención de dos personas	1	1
1283	2023-07-15	21:25:57	2	1	3	2	1	23.025945	-96.407659	47 km al sur de East Donaldshire	Tamaulipas	7	2023-07-15	18:23:17	23.008261	-96.330864	46 km al oeste de Bradleybury	Tamaulipas	7	2	Aseguramiento de aeronave y carga	2	4
1284	2024-03-04	14:45:56	3	2	2	1	1	22.467650	-107.609422	40 km al sur de New Scott	Belmopan	7	2024-03-04	09:38:53	22.477208	-107.669860	25 km al norte de Sanchezberg	Belmopan	7	1	Aseguramiento de aeronave y carga	1	3
1285	2024-04-28	15:43:27	1	4	2	2	1	28.718269	-99.744851	27 km al oeste de Michaelville	Querétaro	6	2024-04-28	16:52:21	28.775066	-99.656028	77 km al oeste de Port Summerburgh	Querétaro	6	1	Aseguramiento de aeronave y carga	2	1
1286	2024-02-10	15:52:40	2	2	1	1	1	28.416941	-105.884760	68 km al sur de Villanuevahaven	CDMX	9	2024-02-10	17:50:24	28.380973	-105.976149	23 km al norte de Kyleburgh	CDMX	9	2	Identificación de aeronave sin contacto	1	3
1287	2023-11-03	15:27:46	1	1	3	2	1	17.780015	-86.322448	35 km al norte de Port Jeanne	Villahermosa	7	2023-11-03	23:33:08	17.698059	-86.420428	28 km al oeste de East Gregory	Villahermosa	7	1	No se tuvo contacto con la aeronave	1	2
1288	2023-12-02	02:37:32	1	2	3	2	2	24.933249	-102.793018	22 km al oeste de Lake Bobby	Veracruz	5	2023-12-02	14:24:23	24.888790	-102.796644	51 km al este de West Amanda	Veracruz	5	2	Aseguramiento de aeronave y carga	1	4
1289	2023-07-20	22:02:50	3	2	4	2	1	28.765305	-96.036776	62 km al sur de South Michael	Sonora	6	2023-07-20	21:15:06	28.666156	-95.953256	85 km al norte de Edwardstad	Sonora	6	1	Aseguramiento de aeronave	2	1
1290	2023-12-11	06:48:53	3	2	1	2	1	22.968518	-99.683065	14 km al oeste de North James	Tepic	2	2023-12-11	11:50:39	22.908416	-99.588050	48 km al sur de Lake Craigfurt	Tepic	2	2	Aseguramiento de aeronave y carga	2	2
1291	2023-12-26	15:57:43	2	4	2	1	1	23.638059	-113.437273	53 km al este de Lisaborough	CDMX	6	2023-12-26	23:03:52	23.706464	-113.519366	54 km al este de Haleymouth	CDMX	6	1	Identificación de aeronave sin contacto	1	3
1292	2024-05-24	16:40:16	1	3	1	2	1	26.133795	-104.277888	13 km al oeste de North Davidbury	Cambutal	10	2024-05-24	01:00:32	26.091954	-104.257072	87 km al norte de Joeltown	Cambutal	10	2	Aseguramiento de aeronave	2	1
1293	2023-10-20	12:33:24	1	4	1	2	1	18.668576	-97.122642	28 km al oeste de Kimberlyview	Baja California	8	2023-10-20	04:49:57	18.591638	-97.095026	99 km al oeste de Lake Angelahaven	Baja California	8	1	No se tuvo contacto con la aeronave	1	1
1294	2023-07-15	22:58:56	3	3	4	1	2	27.428392	-114.511608	72 km al oeste de Amberton	CDMX	6	2023-07-15	20:58:33	27.368667	-114.554084	85 km al sur de Lopezland	CDMX	6	1	Aseguramiento de aeronave y carga	2	2
1295	2023-08-25	11:55:15	3	4	1	1	1	18.281787	-112.317060	68 km al sur de South William	Culiacán	1	2023-08-25	23:53:39	18.216285	-112.250220	55 km al sur de Sarahmouth	Culiacán	1	2	Aseguramiento de aeronave y carga	1	1
1296	2024-05-06	17:04:02	2	3	3	1	1	28.436132	-106.181773	34 km al este de East Chad	Tamaulipas	2	2024-05-06	22:52:57	28.470407	-106.112077	37 km al oeste de Brendaberg	Tamaulipas	2	1	Aseguramiento de aeronave y carga	2	3
1297	2023-12-03	05:29:24	3	1	2	1	2	25.440214	-115.920031	13 km al norte de East Ericaburgh	Culiacán	10	2023-12-03	04:32:07	25.343069	-115.886413	40 km al oeste de West Raymondbury	Culiacán	10	2	Identificación de aeronave sin contacto	1	3
1298	2024-01-15	16:43:11	3	1	4	2	1	19.103318	-94.109387	47 km al oeste de Vegaland	Aguascalientes	5	2024-01-15	14:01:47	19.012085	-94.099214	96 km al oeste de South Kelli	Aguascalientes	5	2	Aseguramiento de aeronave y carga	2	3
1299	2023-10-26	15:37:42	1	2	4	2	1	24.578444	-96.683177	64 km al norte de Hernandezland	San Jose	2	2023-10-26	17:15:38	24.666247	-96.742892	68 km al sur de Christinabury	San Jose	2	1	Aseguramiento de aeronave y carga	1	1
1300	2024-04-10	06:47:29	2	4	4	2	2	20.684168	-105.836352	21 km al sur de Port Keithland	Sonora	4	2024-04-10	00:14:17	20.777770	-105.821754	95 km al este de Evelynside	Sonora	4	2	Aseguramiento de aeronave y detención de dos personas	2	2
1301	2023-12-17	18:56:23	1	2	3	2	1	26.843436	-86.655283	11 km al oeste de Smithside	Querétaro	9	2023-12-17	01:54:28	26.753212	-86.623507	13 km al norte de New Barbaraside	Querétaro	9	1	Aseguramiento de aeronave y detención de dos personas	2	3
1302	2023-09-15	06:27:55	2	3	4	2	2	19.517052	-102.418997	31 km al este de Jessicaville	Baja California	3	2023-09-15	13:54:21	19.609616	-102.368767	18 km al este de New Jared	Baja California	3	1	Aseguramiento de aeronave y carga	1	3
1303	2024-04-18	15:10:45	2	4	4	1	2	20.879863	-116.426556	26 km al este de North Michelle	Aguascalientes	9	2024-04-18	03:48:48	20.977114	-116.494741	99 km al norte de East Kim	Aguascalientes	9	2	Aseguramiento de aeronave y detención de dos personas	2	4
1304	2023-08-22	13:09:50	1	3	2	1	2	28.500211	-101.107422	51 km al norte de Dennisville	Tamaulipas	7	2023-08-22	02:38:23	28.484918	-101.104289	13 km al oeste de Chaneyberg	Tamaulipas	7	1	Aseguramiento de aeronave	2	2
1305	2024-06-16	23:33:33	3	2	2	1	1	22.242017	-102.852662	13 km al norte de Sheaborough	Baja California	4	2024-06-16	07:26:22	22.202632	-102.929160	59 km al oeste de Thomasfort	Baja California	4	1	Aseguramiento de aeronave y carga	1	2
1306	2023-09-25	05:04:17	1	4	2	2	2	17.031653	-88.605404	68 km al sur de South Jessicaland	El Salvador	5	2023-09-25	10:00:08	17.015273	-88.640574	45 km al este de Richardstad	El Salvador	5	1	Aseguramiento de aeronave y detención de dos personas	1	4
1307	2023-07-04	16:28:11	3	3	4	2	1	25.246831	-94.119534	32 km al norte de Morrisonton	Cambutal	6	2023-07-04	11:32:04	25.187347	-94.179007	54 km al norte de Shaneshire	Cambutal	6	2	Aseguramiento de aeronave y detención de dos personas	2	1
1308	2024-02-07	13:48:22	2	1	3	1	2	30.156608	-92.453514	33 km al norte de Luisport	Monterrey	5	2024-02-07	18:37:43	30.060293	-92.518342	96 km al sur de South Taylor	Monterrey	5	2	Aseguramiento de aeronave	1	3
1309	2023-07-09	16:45:16	3	4	1	1	1	24.778823	-112.054555	76 km al norte de North Jennifer	Monterrey	2	2023-07-09	12:07:14	24.844559	-112.102132	97 km al este de Port James	Monterrey	2	1	Aseguramiento de aeronave y detención de dos personas	2	3
1310	2023-09-16	04:24:20	1	4	2	1	1	27.410065	-103.773720	25 km al este de New Jason	El Salvador	3	2023-09-16	20:42:32	27.331511	-103.846774	88 km al sur de Bushville	El Salvador	3	2	Aseguramiento de aeronave	2	2
1311	2023-08-22	20:54:32	3	1	1	2	2	26.791787	-92.088965	94 km al norte de Clarkemouth	Veracruz	4	2023-08-22	20:09:10	26.774487	-92.088138	68 km al norte de Jacksonmouth	Veracruz	4	1	Aseguramiento de aeronave y carga	2	3
1312	2023-07-12	17:33:04	1	4	2	2	2	29.036357	-107.716998	55 km al este de Stephensonland	Durango	10	2023-07-12	01:57:50	28.975788	-107.748555	37 km al oeste de Lake Sarahfort	Durango	10	2	Aseguramiento de aeronave y carga	1	4
1313	2023-07-22	16:28:01	3	2	1	1	2	20.626085	-94.096390	17 km al sur de North Sharonport	El Salvador	8	2023-07-22	11:09:44	20.694024	-94.062050	18 km al oeste de North Markfort	El Salvador	8	2	No se tuvo contacto con la aeronave	1	3
1314	2024-03-04	10:30:38	1	4	2	1	2	30.357632	-112.140048	17 km al sur de Jenkinston	Guadalajara	5	2024-03-04	14:49:11	30.325971	-112.042334	96 km al este de Jefferymouth	Guadalajara	5	2	Identificación de aeronave sin contacto	1	2
1315	2023-07-01	22:04:16	1	4	3	2	2	24.256785	-86.000587	66 km al oeste de Floydshire	Tepic	9	2023-07-01	05:38:35	24.197689	-86.068387	83 km al este de West Johnmouth	Tepic	9	1	No se tuvo contacto con la aeronave	2	3
1316	2023-08-01	01:19:43	3	4	2	1	2	24.106323	-99.430612	41 km al este de South Keithborough	Monterrico	2	2023-08-01	15:03:03	24.063925	-99.526146	30 km al norte de East Samuel	Monterrico	2	2	Aseguramiento de aeronave	1	1
1317	2024-06-23	05:55:46	1	4	4	2	1	19.712721	-112.780375	23 km al oeste de North Leslieburgh	Guadalajara	8	2024-06-23	23:22:32	19.707655	-112.726749	90 km al sur de Port Matthew	Guadalajara	8	2	Aseguramiento de aeronave y detención de dos personas	1	3
1318	2023-07-19	18:35:36	2	1	2	1	2	18.756813	-114.634604	55 km al oeste de Stewartside	CDMX	8	2023-07-19	10:21:19	18.724898	-114.616664	94 km al este de Thompsonton	CDMX	8	2	Identificación de aeronave sin contacto	1	2
1319	2023-07-20	19:28:03	3	2	4	1	1	24.561754	-96.267249	72 km al sur de East Melissachester	Querétaro	5	2023-07-20	15:49:52	24.549090	-96.257481	99 km al este de Lake Benjaminmouth	Querétaro	5	1	No se tuvo contacto con la aeronave	2	2
1320	2024-02-22	09:19:54	1	3	1	2	1	21.480901	-103.932281	80 km al oeste de Boyerbury	Villahermosa	6	2024-02-22	18:11:10	21.390475	-103.927019	65 km al norte de Michaelstad	Villahermosa	6	2	Identificación de aeronave sin contacto	2	1
1321	2023-10-24	09:41:08	3	4	2	1	1	17.627954	-100.508046	62 km al este de Shirleyville	El Salvador	3	2023-10-24	19:39:12	17.581482	-100.504380	80 km al oeste de Larsenstad	El Salvador	3	2	Aseguramiento de aeronave	2	1
1322	2024-02-29	14:56:17	1	4	4	2	1	17.213593	-88.013766	82 km al este de North Maria	Hermosillo	10	2024-02-29	15:52:23	17.188521	-87.926445	26 km al oeste de New Kevinfort	Hermosillo	10	2	Aseguramiento de aeronave y carga	2	1
1323	2023-08-25	15:37:39	3	1	3	2	2	27.355649	-92.143696	16 km al norte de Port Joshua	Monterrey	3	2023-08-25	06:19:01	27.397790	-92.078522	24 km al oeste de Sullivanshire	Monterrey	3	1	Aseguramiento de aeronave	1	2
1324	2023-12-30	21:58:45	2	1	4	1	2	20.508616	-103.327743	77 km al sur de Lake Sheilaside	Monterrey	1	2023-12-30	03:09:15	20.607813	-103.354308	22 km al sur de Doylefurt	Monterrey	1	1	Aseguramiento de aeronave	1	3
1325	2023-10-17	09:36:23	3	3	1	2	1	25.722146	-87.032693	44 km al oeste de North Bradfurt	CDMX	6	2023-10-17	12:16:16	25.714430	-87.014086	42 km al oeste de East Stephen	CDMX	6	1	Identificación de aeronave sin contacto	1	4
1326	2024-02-04	04:42:33	3	1	4	2	1	30.191963	-113.602537	39 km al oeste de West Stephanie	Culiacán	9	2024-02-04	15:58:06	30.270080	-113.660450	26 km al norte de North Andrew	Culiacán	9	1	No se tuvo contacto con la aeronave	1	1
1327	2023-10-24	15:30:11	1	4	1	1	2	20.306211	-102.257835	85 km al sur de Christinafurt	Zacatecas	6	2023-10-24	00:23:49	20.286785	-102.273333	36 km al sur de West Patricia	Zacatecas	6	2	No se tuvo contacto con la aeronave	2	3
1328	2024-03-25	09:58:56	1	3	4	1	2	28.839517	-91.299142	95 km al norte de Cummingsfort	Aguascalientes	2	2024-03-25	08:25:32	28.752977	-91.201182	98 km al norte de Hendrickshaven	Aguascalientes	2	1	Identificación de aeronave sin contacto	1	3
1329	2023-11-30	22:20:23	3	1	3	1	2	20.844973	-90.471149	43 km al oeste de Kellyland	Veracruz	2	2023-11-30	21:09:00	20.863346	-90.535915	13 km al este de South Keith	Veracruz	2	2	Aseguramiento de aeronave	1	3
1330	2024-01-20	22:41:07	2	3	1	1	2	28.918691	-104.682362	56 km al sur de Natashahaven	Veracruz	1	2024-01-20	20:26:02	28.937138	-104.760653	85 km al este de New Suzanneport	Veracruz	1	1	Aseguramiento de aeronave	2	2
1331	2023-08-25	02:17:27	3	4	1	1	1	20.649454	-113.530281	73 km al oeste de Johnsonberg	Punta Espada	1	2023-08-25	19:34:02	20.586776	-113.500891	34 km al este de Lake Brittany	Punta Espada	1	1	No se tuvo contacto con la aeronave	1	1
1332	2024-06-10	12:30:51	1	1	1	2	1	17.387773	-93.372478	21 km al norte de Lake Becky	Guadalajara	6	2024-06-10	11:56:25	17.342271	-93.441935	87 km al sur de Jensenside	Guadalajara	6	1	No se tuvo contacto con la aeronave	1	3
1333	2024-05-31	14:43:55	1	3	1	1	2	22.584042	-93.815570	26 km al sur de South Noah	Querétaro	10	2024-05-31	16:10:38	22.613624	-93.796030	12 km al sur de Natalieton	Querétaro	10	1	Identificación de aeronave sin contacto	1	2
1334	2023-12-22	09:42:29	3	2	2	1	1	18.657533	-108.847534	85 km al este de Mariamouth	Veracruz	7	2023-12-22	20:40:44	18.724806	-108.783661	51 km al oeste de Lake Jeffreyside	Veracruz	7	2	Aseguramiento de aeronave	1	3
1335	2024-02-26	13:14:20	1	4	3	2	2	18.564663	-94.061313	16 km al norte de Tammyport	Belmopan	2	2024-02-26	16:16:44	18.543818	-94.140868	54 km al este de Port Stephanieton	Belmopan	2	1	Identificación de aeronave sin contacto	2	1
1336	2023-08-04	14:20:43	1	2	4	2	1	22.315305	-101.816579	64 km al oeste de Hatfieldchester	Baja California	2	2023-08-04	16:31:56	22.347150	-101.835808	13 km al oeste de South Robert	Baja California	2	1	Identificación de aeronave sin contacto	1	4
1337	2023-07-29	13:04:35	1	2	2	2	2	23.310104	-104.396176	87 km al norte de Jenkinsfurt	CDMX	1	2023-07-29	12:06:30	23.320503	-104.378263	29 km al norte de Powellfurt	CDMX	1	2	Aseguramiento de aeronave y detención de dos personas	2	4
1338	2024-03-15	11:39:28	2	4	2	2	2	29.242870	-89.980453	45 km al sur de Michaelberg	Culiacán	3	2024-03-15	07:27:17	29.306682	-90.028989	62 km al este de Smithshire	Culiacán	3	2	Aseguramiento de aeronave y carga	1	4
1339	2024-04-23	07:26:49	1	4	4	2	2	18.569585	-114.466027	81 km al norte de West Lisaberg	Aguascalientes	5	2024-04-23	17:10:15	18.578924	-114.478810	74 km al norte de West Nicholasberg	Aguascalientes	5	2	Identificación de aeronave sin contacto	1	1
1340	2023-12-03	02:26:34	1	4	1	1	2	26.563202	-111.075254	67 km al norte de South Jasmine	Querétaro	6	2023-12-03	07:45:24	26.603612	-111.103820	59 km al norte de Randallstad	Querétaro	6	2	Aseguramiento de aeronave y detención de dos personas	2	2
1341	2024-02-04	08:54:27	1	1	3	2	2	27.565568	-112.875505	39 km al norte de New Jefferychester	Baja California	10	2024-02-04	08:45:55	27.476639	-112.963844	67 km al sur de Lake Saramouth	Baja California	10	2	Aseguramiento de aeronave y detención de dos personas	2	1
1342	2024-02-03	15:34:35	3	1	3	1	1	19.736054	-112.990098	78 km al sur de East Leonardside	Zacatecas	10	2024-02-03	11:59:21	19.713449	-113.064677	23 km al norte de Durhamport	Zacatecas	10	2	Aseguramiento de aeronave	2	3
1343	2024-03-08	17:11:42	1	2	2	1	2	18.736239	-106.643293	14 km al sur de Lake Ashleyside	CDMX	6	2024-03-08	14:24:41	18.791073	-106.633008	64 km al norte de New Austin	CDMX	6	2	No se tuvo contacto con la aeronave	2	4
1344	2024-02-08	09:20:24	3	2	1	2	1	21.827999	-110.790412	95 km al sur de Sanderschester	Querétaro	8	2024-02-08	23:11:02	21.794575	-110.881189	86 km al sur de West Johnhaven	Querétaro	8	1	Identificación de aeronave sin contacto	1	3
1345	2023-12-31	10:13:51	3	1	4	2	1	25.756596	-116.545955	93 km al oeste de Rossborough	Sinaloa	10	2023-12-31	19:26:28	25.677624	-116.502873	36 km al norte de East Victoria	Sinaloa	10	2	Identificación de aeronave sin contacto	2	4
1346	2023-09-05	10:34:38	2	1	3	2	1	30.915006	-116.480480	99 km al norte de Karenburgh	Durango	2	2023-09-05	00:42:37	30.844861	-116.397062	18 km al oeste de Garciaberg	Durango	2	2	Aseguramiento de aeronave y carga	2	1
1347	2024-04-27	15:05:30	1	4	4	1	1	17.044156	-104.461659	76 km al este de North Linda	Cambutal	7	2024-04-27	06:04:30	16.999037	-104.516082	71 km al este de West Davidfurt	Cambutal	7	2	Aseguramiento de aeronave y detención de dos personas	2	2
1348	2023-09-09	22:45:47	2	4	3	2	2	30.855105	-99.189557	71 km al oeste de South Tyrone	San Jose	10	2023-09-09	00:16:06	30.862995	-99.146485	36 km al este de North Tracyfort	San Jose	10	2	Aseguramiento de aeronave y detención de dos personas	1	1
1349	2024-02-20	13:32:50	1	4	2	2	1	18.149025	-93.150094	91 km al este de New Danielshire	CDMX	1	2024-02-20	07:04:16	18.121179	-93.186332	88 km al oeste de Port Angelamouth	CDMX	1	2	Aseguramiento de aeronave y detención de dos personas	1	2
1350	2023-08-13	06:07:50	1	2	4	2	2	19.103382	-104.035478	99 km al este de North Justin	Culiacán	5	2023-08-13	18:06:14	19.177026	-104.038878	82 km al sur de Clarkton	Culiacán	5	1	Aseguramiento de aeronave y carga	1	2
1351	2023-07-03	11:08:29	1	4	3	1	2	18.518529	-111.088295	21 km al sur de New Nicole	Guadalajara	6	2023-07-03	05:55:10	18.440766	-111.018864	99 km al este de Christinaport	Guadalajara	6	1	No se tuvo contacto con la aeronave	2	1
1352	2023-12-03	07:27:06	3	1	4	2	2	25.204697	-102.910219	42 km al norte de Carolside	Veracruz	5	2023-12-03	13:13:45	25.165425	-102.845283	69 km al norte de Grimesview	Veracruz	5	1	No se tuvo contacto con la aeronave	1	3
1353	2024-01-13	06:16:22	3	1	4	1	1	25.386297	-103.872184	99 km al oeste de Martinchester	Veracruz	9	2024-01-13	10:30:32	25.320874	-103.799311	13 km al este de Barnesberg	Veracruz	9	1	Aseguramiento de aeronave y detención de dos personas	1	3
1354	2023-10-05	03:09:30	2	4	2	1	2	20.093242	-98.289315	22 km al este de Bennettmouth	Punta Espada	9	2023-10-05	14:48:15	20.007041	-98.227436	44 km al sur de Stricklandfort	Punta Espada	9	2	No se tuvo contacto con la aeronave	2	3
1355	2024-04-16	10:05:07	2	1	3	1	2	17.391351	-88.703257	16 km al oeste de West Benjamin	Monterrey	8	2024-04-16	16:51:27	17.389033	-88.701174	52 km al oeste de Lake Debra	Monterrey	8	1	No se tuvo contacto con la aeronave	1	1
1356	2024-03-13	09:21:24	2	4	2	2	1	25.432089	-105.818759	13 km al este de Gibsonmouth	Monterrey	6	2024-03-13	20:29:11	25.453273	-105.742704	50 km al norte de Wilsonburgh	Monterrey	6	1	Aseguramiento de aeronave y carga	2	1
1357	2023-11-29	09:12:50	1	3	2	1	2	21.857595	-95.182064	63 km al norte de New Jackie	Hermosillo	2	2023-11-29	23:23:32	21.850594	-95.208136	81 km al oeste de Gardnerbury	Hermosillo	2	2	Aseguramiento de aeronave y detención de dos personas	2	3
1358	2023-12-03	04:12:29	2	2	2	1	2	25.553014	-116.276339	53 km al sur de Michaelhaven	Punta Espada	3	2023-12-03	11:16:51	25.588546	-116.229558	30 km al este de Whitneystad	Punta Espada	3	1	Aseguramiento de aeronave y carga	1	3
1359	2024-02-19	13:08:51	2	2	4	2	1	24.349856	-112.820190	32 km al este de Dylanfurt	Zacatecas	6	2024-02-19	10:24:51	24.365707	-112.774258	68 km al este de Simpsonton	Zacatecas	6	2	No se tuvo contacto con la aeronave	1	2
1360	2024-02-11	11:11:17	2	4	3	1	2	18.043224	-107.358333	49 km al norte de West Megan	Veracruz	7	2024-02-11	11:09:52	17.948171	-107.409782	91 km al este de New Nathan	Veracruz	7	1	Aseguramiento de aeronave	2	2
1361	2023-08-11	23:31:03	2	1	2	2	1	25.175695	-113.961577	31 km al norte de Christinefort	Cambutal	10	2023-08-11	22:33:12	25.079547	-113.928078	84 km al oeste de West Valerie	Cambutal	10	1	Aseguramiento de aeronave y carga	2	2
1362	2024-06-03	15:34:02	1	3	3	2	2	30.815964	-101.720492	68 km al oeste de Colefort	Culiacán	10	2024-06-03	09:57:10	30.891572	-101.621956	26 km al oeste de Williamfort	Culiacán	10	1	Identificación de aeronave sin contacto	2	2
1363	2024-05-01	09:00:53	1	2	4	1	2	30.982444	-109.932576	10 km al sur de East Debra	Cambutal	4	2024-05-01	08:36:25	30.977699	-109.997619	77 km al este de West Richard	Cambutal	4	1	Aseguramiento de aeronave y detención de dos personas	1	4
1364	2024-01-24	04:02:17	2	3	4	2	1	20.792515	-105.757120	54 km al sur de Stevensonview	Zacatecas	4	2024-01-24	02:31:13	20.695146	-105.717667	92 km al sur de Jacksonfurt	Zacatecas	4	2	No se tuvo contacto con la aeronave	2	4
1365	2024-04-29	11:53:39	3	3	1	1	2	23.185138	-91.175587	50 km al oeste de Port Courtney	Zacatecas	10	2024-04-29	03:08:42	23.192782	-91.180670	63 km al norte de Jacquelinemouth	Zacatecas	10	2	Aseguramiento de aeronave y detención de dos personas	2	3
1366	2023-12-04	02:50:57	2	1	4	1	1	27.942653	-87.712893	95 km al oeste de Lake Cliffordburgh	Aguascalientes	9	2023-12-04	15:16:50	27.977652	-87.647570	74 km al sur de Andreamouth	Aguascalientes	9	2	Aseguramiento de aeronave y detención de dos personas	2	1
1367	2023-09-27	16:07:43	2	1	4	1	1	17.344299	-97.783946	89 km al sur de Port Michael	Tepic	10	2023-09-27	08:35:08	17.281070	-97.710465	24 km al este de Lake Jacqueline	Tepic	10	2	Aseguramiento de aeronave y detención de dos personas	1	2
1368	2023-10-31	06:11:41	2	3	1	1	1	22.191508	-99.198392	22 km al sur de Lake Sharonhaven	Villahermosa	9	2023-10-31	02:53:04	22.121765	-99.131393	81 km al este de Davidside	Villahermosa	9	2	No se tuvo contacto con la aeronave	1	1
1369	2024-02-29	04:33:27	3	4	3	2	1	22.011083	-103.011055	48 km al este de West Erica	Aguascalientes	2	2024-02-29	14:51:00	22.003119	-103.018499	47 km al norte de Port Frankburgh	Aguascalientes	2	1	Aseguramiento de aeronave y detención de dos personas	1	1
1370	2024-04-22	02:06:46	1	1	2	1	1	29.852205	-95.887471	78 km al este de Goldenport	Sonora	3	2024-04-22	08:58:15	29.788623	-95.904395	68 km al sur de Joshuachester	Sonora	3	2	Aseguramiento de aeronave y detención de dos personas	1	3
1371	2023-11-20	10:25:36	3	1	3	1	2	24.491838	-88.010538	54 km al este de Rachelmouth	Monterrey	10	2023-11-20	12:55:23	24.489082	-88.050068	72 km al sur de Goldenfurt	Monterrey	10	2	No se tuvo contacto con la aeronave	1	3
1372	2024-05-16	15:56:48	3	4	3	1	2	28.452033	-103.423945	52 km al este de Richardton	Baja California	7	2024-05-16	10:42:40	28.380084	-103.521983	39 km al norte de East Barbarafurt	Baja California	7	1	Identificación de aeronave sin contacto	1	3
1373	2023-08-14	18:28:29	1	2	1	1	2	17.072540	-96.253440	57 km al oeste de Kyleside	Zacatecas	6	2023-08-14	21:30:46	17.043654	-96.317050	26 km al este de East Chad	Zacatecas	6	1	Aseguramiento de aeronave	1	3
1374	2024-06-19	01:54:51	2	3	4	2	1	17.982045	-94.668736	16 km al oeste de Port Karenfort	Tepic	5	2024-06-19	03:05:07	18.008183	-94.672915	10 km al este de East Melissaburgh	Tepic	5	1	Aseguramiento de aeronave	1	4
1375	2023-10-03	08:33:16	1	4	1	2	2	26.945804	-89.689606	60 km al norte de Woodmouth	Veracruz	7	2023-10-03	10:22:58	26.953919	-89.714879	73 km al sur de Goodmantown	Veracruz	7	1	No se tuvo contacto con la aeronave	2	4
1376	2024-05-24	23:47:40	3	3	3	2	2	26.737035	-99.275278	78 km al sur de Dianachester	Tepic	3	2024-05-24	01:04:00	26.666971	-99.360403	43 km al este de Barberberg	Tepic	3	2	Identificación de aeronave sin contacto	2	2
1377	2024-06-20	16:52:58	1	2	1	2	2	26.594833	-107.587503	77 km al sur de South Brandonfurt	Baja California	9	2024-06-20	14:30:09	26.594985	-107.521170	18 km al sur de Lake Rachelland	Baja California	9	1	Aseguramiento de aeronave	1	2
1378	2023-10-04	18:51:31	1	4	3	2	2	18.829031	-86.244252	17 km al oeste de Michaelhaven	Sonora	1	2023-10-04	02:01:11	18.769260	-86.313714	44 km al este de Burtonmouth	Sonora	1	1	Aseguramiento de aeronave	2	4
1379	2023-12-08	21:09:31	2	1	3	2	2	25.288861	-108.332125	77 km al norte de North Eduardo	Punta Espada	1	2023-12-08	12:21:41	25.302123	-108.407180	74 km al norte de Hortonville	Punta Espada	1	1	Aseguramiento de aeronave y detención de dos personas	2	4
1380	2023-07-04	11:02:33	2	4	3	2	1	17.517413	-101.883475	48 km al norte de Lake Timothy	Durango	2	2023-07-04	18:11:08	17.582903	-101.970599	54 km al este de Rubenhaven	Durango	2	1	Aseguramiento de aeronave y detención de dos personas	1	2
1381	2023-12-14	05:26:12	3	3	3	2	2	22.768907	-94.462612	34 km al sur de North Mary	Veracruz	2	2023-12-14	11:26:44	22.747556	-94.422682	36 km al sur de Port James	Veracruz	2	2	Aseguramiento de aeronave y detención de dos personas	2	4
1382	2023-12-09	15:38:58	3	3	2	1	1	17.261909	-102.066209	21 km al este de Petersfurt	Sonora	10	2023-12-09	12:56:48	17.285852	-101.984215	42 km al este de Christopherville	Sonora	10	1	Aseguramiento de aeronave	2	3
1383	2023-10-18	07:25:32	2	2	3	2	1	23.215017	-88.705076	66 km al oeste de Brandonhaven	Punta Espada	4	2023-10-18	10:12:38	23.274135	-88.655427	71 km al este de New Matthewbury	Punta Espada	4	1	No se tuvo contacto con la aeronave	1	1
1384	2024-03-06	21:54:47	3	4	2	2	1	27.116362	-103.771996	20 km al norte de Davisside	Monterrico	8	2024-03-06	06:19:14	27.118440	-103.748444	78 km al oeste de North Thomasview	Monterrico	8	2	Aseguramiento de aeronave	1	1
1385	2023-07-15	02:58:37	1	2	2	1	2	22.601466	-110.601518	27 km al sur de Collinston	Villahermosa	1	2023-07-15	08:07:39	22.691875	-110.504353	67 km al este de Port Kaitlinport	Villahermosa	1	1	Aseguramiento de aeronave	2	3
1386	2023-09-04	18:09:15	1	3	1	2	2	29.826639	-97.624622	24 km al norte de Danielview	Sonora	1	2023-09-04	16:01:44	29.831478	-97.703491	22 km al norte de New Kellyton	Sonora	1	2	Aseguramiento de aeronave y carga	2	4
1387	2024-02-15	02:46:52	1	3	3	1	2	25.813307	-111.172716	35 km al oeste de East Barbara	El Salvador	3	2024-02-15	01:31:04	25.891729	-111.245169	19 km al norte de Chanfort	El Salvador	3	1	Aseguramiento de aeronave	1	1
1388	2024-02-10	02:44:04	1	3	4	1	2	27.679250	-91.804075	86 km al oeste de Port Tyroneborough	Durango	10	2024-02-10	13:57:51	27.773151	-91.805356	50 km al oeste de Lake Shawntown	Durango	10	1	Aseguramiento de aeronave y carga	1	3
1389	2024-05-15	21:55:58	3	1	3	2	2	21.902133	-92.626957	44 km al sur de New Scott	Monterrey	6	2024-05-15	17:03:17	21.811966	-92.641943	32 km al oeste de East Devinshire	Monterrey	6	1	No se tuvo contacto con la aeronave	1	2
1390	2023-08-07	01:13:57	1	3	4	1	2	25.174522	-112.100257	28 km al oeste de Williamsburgh	Sinaloa	9	2023-08-07	11:18:26	25.091003	-112.171463	81 km al oeste de Port Charles	Sinaloa	9	1	No se tuvo contacto con la aeronave	1	1
1391	2024-03-27	11:33:57	2	3	1	1	1	18.568993	-111.797214	37 km al este de Lake Joanmouth	Querétaro	5	2024-03-27	15:52:03	18.651823	-111.807783	56 km al este de New Maria	Querétaro	5	2	Identificación de aeronave sin contacto	1	2
1392	2023-07-29	14:48:00	3	3	1	1	1	28.183067	-96.637943	13 km al oeste de South Kellifort	Cambutal	8	2023-07-29	21:40:46	28.085323	-96.577829	41 km al oeste de Mccoymouth	Cambutal	8	2	Identificación de aeronave sin contacto	1	1
1393	2023-08-29	16:48:05	1	3	4	2	1	30.438125	-101.630851	95 km al norte de Lake Christopher	Aguascalientes	2	2023-08-29	04:21:49	30.406469	-101.564912	91 km al oeste de Pattersonland	Aguascalientes	2	1	Aseguramiento de aeronave y carga	1	1
1394	2023-08-06	22:19:53	3	1	4	2	2	21.369799	-106.749608	61 km al sur de Sextonburgh	CDMX	7	2023-08-06	05:07:59	21.421126	-106.770266	89 km al sur de Brownmouth	CDMX	7	2	Aseguramiento de aeronave y detención de dos personas	2	3
1395	2023-09-11	04:47:31	2	1	2	2	2	20.875317	-106.045248	23 km al este de Xavierton	Baja California	9	2023-09-11	13:12:16	20.843010	-106.086066	44 km al oeste de South Lorichester	Baja California	9	2	Aseguramiento de aeronave y carga	1	1
1396	2023-10-07	17:54:37	2	1	3	1	1	25.955136	-102.953171	30 km al este de North Patrick	El Salvador	4	2023-10-07	05:17:22	25.884264	-102.978648	60 km al sur de Shepherdmouth	El Salvador	4	2	Aseguramiento de aeronave y carga	2	1
1397	2024-06-02	12:37:33	1	2	1	1	1	20.203049	-103.126964	62 km al norte de Judithchester	Aguascalientes	4	2024-06-02	17:15:21	20.120165	-103.203580	78 km al este de Jesuschester	Aguascalientes	4	2	No se tuvo contacto con la aeronave	2	1
1398	2024-02-09	14:05:13	3	1	3	1	1	19.816409	-99.045224	41 km al sur de Aarontown	Sonora	2	2024-02-09	02:59:49	19.830584	-99.082476	63 km al este de New Karimouth	Sonora	2	1	Aseguramiento de aeronave y detención de dos personas	2	4
1399	2024-01-31	08:53:44	3	1	1	2	1	26.532594	-103.148180	86 km al este de Ellismouth	Hermosillo	4	2024-01-31	18:00:24	26.437604	-103.195099	96 km al este de South Lindsayport	Hermosillo	4	1	No se tuvo contacto con la aeronave	1	3
1400	2024-05-04	15:09:14	3	1	1	2	1	17.778825	-92.380505	48 km al oeste de Tracyhaven	Veracruz	5	2024-05-04	18:20:26	17.823419	-92.470305	11 km al oeste de South Barbara	Veracruz	5	2	Aseguramiento de aeronave y detención de dos personas	2	3
1401	2024-06-03	00:11:08	2	3	1	1	1	23.080232	-116.606408	41 km al sur de Michaelport	Guadalajara	10	2024-06-03	13:38:39	23.100662	-116.520246	37 km al sur de Collinborough	Guadalajara	10	2	Aseguramiento de aeronave y carga	1	4
1402	2024-06-21	11:30:40	2	2	4	2	1	30.592252	-111.982612	55 km al este de South Thomas	Culiacán	6	2024-06-21	23:05:27	30.664484	-111.887450	54 km al sur de North David	Culiacán	6	1	Identificación de aeronave sin contacto	2	4
1403	2024-03-20	05:02:33	1	3	2	2	1	20.631352	-93.133372	50 km al norte de Rodriguezberg	Sinaloa	7	2024-03-20	14:11:28	20.623523	-93.156442	58 km al oeste de Port Emily	Sinaloa	7	1	Aseguramiento de aeronave y detención de dos personas	1	2
1404	2024-05-15	12:11:47	3	3	2	2	1	20.843761	-95.155950	75 km al sur de Thomasside	Sonora	7	2024-05-15	02:51:31	20.823927	-95.171087	18 km al sur de Janicetown	Sonora	7	2	Aseguramiento de aeronave	1	3
1405	2023-12-28	22:01:30	2	1	1	2	1	22.256468	-108.870125	13 km al sur de Rodriguezmouth	Veracruz	2	2023-12-28	07:16:59	22.170870	-108.812729	49 km al oeste de East Taraland	Veracruz	2	1	Aseguramiento de aeronave y detención de dos personas	2	1
1406	2024-03-03	00:15:23	2	4	2	1	1	17.987326	-108.517104	69 km al este de Littlechester	Monterrico	9	2024-03-03	16:21:22	18.002799	-108.608419	70 km al este de Riverafort	Monterrico	9	2	Aseguramiento de aeronave y detención de dos personas	2	4
1407	2024-05-02	15:10:09	2	2	1	1	1	26.049983	-103.352357	14 km al oeste de New Brandon	El Salvador	2	2024-05-02	12:27:09	26.147020	-103.283902	37 km al oeste de Michaelmouth	El Salvador	2	1	Aseguramiento de aeronave y detención de dos personas	1	2
1408	2024-05-18	23:51:01	2	3	1	1	1	30.188125	-93.524988	50 km al oeste de Port Matthew	Hermosillo	6	2024-05-18	11:32:31	30.249761	-93.528420	68 km al norte de Hollowayshire	Hermosillo	6	1	No se tuvo contacto con la aeronave	1	4
1409	2023-12-30	03:15:22	1	3	4	1	1	24.527866	-92.060280	62 km al este de Lake Lori	Durango	3	2023-12-30	01:58:36	24.468600	-92.007603	18 km al sur de Scottland	Durango	3	1	Aseguramiento de aeronave y carga	2	4
1410	2023-12-28	13:18:59	3	3	4	1	2	23.411735	-111.719010	93 km al sur de North Jasonstad	Punta Espada	3	2023-12-28	04:16:12	23.475393	-111.675041	61 km al oeste de North Kimberlyside	Punta Espada	3	1	Aseguramiento de aeronave	2	3
1411	2023-09-11	06:16:06	3	4	3	2	2	26.337583	-110.645451	23 km al este de Higginshaven	Querétaro	1	2023-09-11	14:08:54	26.247700	-110.712587	21 km al este de South Michaelview	Querétaro	1	1	Aseguramiento de aeronave y carga	2	2
1412	2024-02-12	05:40:56	3	3	4	2	1	29.195365	-100.470112	48 km al norte de Martinezport	Sinaloa	2	2024-02-12	22:32:50	29.142468	-100.424353	61 km al norte de Singletonfurt	Sinaloa	2	1	Aseguramiento de aeronave	1	1
1413	2023-12-15	10:20:13	2	1	1	1	2	28.014350	-94.688481	44 km al sur de Lake Johnburgh	Sonora	7	2023-12-15	15:30:15	28.052503	-94.769998	80 km al norte de Kelleyburgh	Sonora	7	2	Aseguramiento de aeronave	2	1
1414	2023-12-20	09:42:26	2	3	4	2	1	27.267362	-88.161558	36 km al oeste de West Brandytown	Veracruz	5	2023-12-20	02:58:24	27.173211	-88.150634	59 km al este de Hillbury	Veracruz	5	2	No se tuvo contacto con la aeronave	2	2
1415	2024-03-03	21:58:30	3	2	4	1	2	20.082788	-105.989260	16 km al oeste de West Lisa	Tepic	4	2024-03-03	07:25:15	20.151926	-106.075236	22 km al oeste de Port Erinberg	Tepic	4	2	No se tuvo contacto con la aeronave	1	1
1416	2024-06-05	02:48:11	1	4	3	2	2	24.434320	-88.226821	90 km al este de Nelsontown	El Salvador	4	2024-06-05	02:19:43	24.398706	-88.127912	31 km al este de Jamesbury	El Salvador	4	1	Aseguramiento de aeronave y detención de dos personas	1	2
1417	2024-06-06	13:12:39	1	4	4	2	1	28.365545	-108.034007	65 km al norte de South Mistytown	Tamaulipas	1	2024-06-06	13:26:13	28.425956	-107.972511	52 km al norte de North Brian	Tamaulipas	1	1	No se tuvo contacto con la aeronave	1	3
1418	2023-08-06	02:28:15	1	4	1	1	2	24.366221	-97.954932	16 km al este de Deleontown	Baja California	6	2023-08-06	10:17:50	24.448453	-97.902912	81 km al sur de West Debra	Baja California	6	1	Identificación de aeronave sin contacto	2	4
1419	2023-07-08	15:38:15	1	1	2	2	1	18.234180	-95.561193	95 km al este de South Nicholas	Punta Espada	3	2023-07-08	12:36:19	18.318765	-95.540918	34 km al norte de Adamsshire	Punta Espada	3	1	Aseguramiento de aeronave y detención de dos personas	1	2
1420	2024-03-08	04:53:40	1	4	4	1	1	21.818510	-115.393314	62 km al norte de Longhaven	Villahermosa	8	2024-03-08	07:39:54	21.818625	-115.406702	26 km al este de New Erikaborough	Villahermosa	8	1	Identificación de aeronave sin contacto	1	4
1421	2023-10-16	19:38:45	3	3	3	2	2	21.587685	-111.987754	47 km al norte de West Sarah	CDMX	6	2023-10-16	12:45:33	21.670732	-111.947671	66 km al oeste de Wardside	CDMX	6	1	Identificación de aeronave sin contacto	1	1
1422	2024-04-19	16:46:04	1	1	2	2	1	25.132242	-87.768079	96 km al este de South Devin	Tamaulipas	9	2024-04-19	03:51:35	25.155827	-87.786797	52 km al norte de Amandastad	Tamaulipas	9	1	Aseguramiento de aeronave y carga	1	4
1423	2024-04-08	13:15:51	3	2	2	2	1	18.826491	-112.552262	11 km al este de North Antonio	Sinaloa	5	2024-04-08	15:23:31	18.809131	-112.509345	63 km al norte de South David	Sinaloa	5	1	Aseguramiento de aeronave y detención de dos personas	2	2
1424	2024-02-15	20:09:13	2	2	2	2	2	29.272207	-104.225743	34 km al oeste de Rowebury	Veracruz	3	2024-02-15	21:50:51	29.290321	-104.269558	92 km al sur de West Patrick	Veracruz	3	2	Identificación de aeronave sin contacto	2	1
1425	2024-06-02	07:44:18	2	2	4	1	1	25.782439	-101.078266	80 km al sur de Geoffreyview	Tepic	10	2024-06-02	12:17:23	25.825869	-101.154785	84 km al oeste de Port Nicholasside	Tepic	10	1	Identificación de aeronave sin contacto	1	3
1426	2023-08-04	06:47:51	1	4	2	1	2	23.911960	-115.705936	56 km al norte de Garciaville	CDMX	8	2023-08-04	21:50:08	23.887157	-115.759342	19 km al este de Smithshire	CDMX	8	1	Identificación de aeronave sin contacto	1	4
1427	2024-05-18	21:09:38	2	3	2	1	1	26.494352	-112.308783	47 km al norte de North Juanfurt	Villahermosa	8	2024-05-18	03:22:16	26.425118	-112.270915	96 km al sur de Johnnytown	Villahermosa	8	2	Aseguramiento de aeronave y carga	1	4
1428	2024-01-16	09:35:20	2	2	4	2	2	30.557503	-106.551374	84 km al norte de West Richard	Veracruz	8	2024-01-16	12:29:13	30.628178	-106.570278	25 km al este de South Kyle	Veracruz	8	1	Identificación de aeronave sin contacto	1	2
1429	2023-09-18	07:34:43	2	4	3	1	1	24.910388	-92.919557	80 km al este de Vaughnberg	Aguascalientes	4	2023-09-18	02:04:56	24.981895	-92.928491	19 km al oeste de Michaelstad	Aguascalientes	4	2	Identificación de aeronave sin contacto	1	2
1430	2024-01-08	08:27:45	2	2	2	2	1	17.289816	-109.018225	94 km al norte de East Amandaport	El Salvador	10	2024-01-08	04:37:03	17.255340	-108.921564	30 km al norte de South Maryville	El Salvador	10	2	Aseguramiento de aeronave	1	2
1431	2024-02-10	03:48:04	2	2	3	1	1	30.475222	-99.074254	39 km al oeste de North Robertside	Monterrico	5	2024-02-10	03:03:13	30.549707	-99.115505	50 km al este de Mayston	Monterrico	5	2	Aseguramiento de aeronave y detención de dos personas	1	3
1432	2023-12-19	00:28:39	3	2	4	1	1	20.216607	-100.207277	64 km al sur de Lake Maria	Veracruz	5	2023-12-19	16:13:18	20.263815	-100.125588	68 km al oeste de Lake Jack	Veracruz	5	2	Aseguramiento de aeronave y carga	1	2
1433	2023-12-28	10:05:36	3	1	2	1	2	21.719484	-87.293005	47 km al norte de Ryanport	Sonora	9	2023-12-28	11:01:58	21.718454	-87.331165	75 km al este de West Kimberly	Sonora	9	2	No se tuvo contacto con la aeronave	1	3
1434	2024-02-16	00:56:40	1	4	3	2	1	20.241003	-107.563790	46 km al sur de Lake Williamborough	Veracruz	7	2024-02-16	09:34:11	20.270177	-107.533689	63 km al oeste de North Stephanieville	Veracruz	7	1	Aseguramiento de aeronave	1	4
1435	2023-07-26	08:25:23	3	3	3	1	2	19.136782	-89.044104	85 km al este de New Audreymouth	Villahermosa	3	2023-07-26	09:36:01	19.182988	-88.970039	45 km al este de Lake Katherine	Villahermosa	3	2	Aseguramiento de aeronave y detención de dos personas	1	1
1436	2023-10-23	02:22:08	3	4	2	2	1	25.195905	-111.286937	24 km al oeste de Swansonberg	Veracruz	3	2023-10-23	12:47:20	25.151210	-111.216928	26 km al este de Taylormouth	Veracruz	3	2	Aseguramiento de aeronave y detención de dos personas	2	1
1437	2023-09-01	09:18:51	1	3	3	2	2	28.523785	-114.110811	48 km al oeste de Lake Deborah	San Jose	8	2023-09-01	03:12:27	28.497274	-114.103247	85 km al sur de New Gabriellahaven	San Jose	8	2	Identificación de aeronave sin contacto	2	4
1438	2024-05-25	23:48:02	3	4	1	1	2	24.275595	-105.935441	40 km al oeste de Chadstad	Monterrey	1	2024-05-25	22:53:59	24.256600	-105.921193	99 km al oeste de New Michelle	Monterrey	1	1	Aseguramiento de aeronave y carga	1	2
1439	2023-12-28	00:14:52	2	3	4	2	1	25.791723	-98.578088	97 km al norte de Johnsonstad	Hermosillo	6	2023-12-28	18:42:57	25.823054	-98.588828	96 km al este de North Madison	Hermosillo	6	2	Aseguramiento de aeronave y detención de dos personas	2	2
1440	2024-02-02	03:30:33	2	4	4	1	1	20.034435	-100.104132	14 km al este de Reneeville	Veracruz	7	2024-02-02	20:47:47	20.016808	-100.055490	94 km al norte de Lake Jessica	Veracruz	7	1	Identificación de aeronave sin contacto	1	1
1441	2023-10-20	19:05:48	2	3	3	2	1	18.609487	-102.122567	34 km al este de Thomasberg	Durango	9	2023-10-20	20:43:06	18.533223	-102.046061	44 km al oeste de Georgetown	Durango	9	1	Aseguramiento de aeronave y detención de dos personas	2	1
1442	2024-02-26	11:13:24	3	2	3	1	1	17.186379	-104.620259	47 km al oeste de Brianport	El Salvador	6	2024-02-26	16:29:58	17.145365	-104.674298	50 km al norte de New Kevinburgh	El Salvador	6	2	Identificación de aeronave sin contacto	2	1
1443	2023-10-24	17:14:43	2	4	3	2	1	22.808922	-106.867603	91 km al oeste de New Brian	Aguascalientes	9	2023-10-24	19:30:18	22.783815	-106.892028	53 km al oeste de New Philip	Aguascalientes	9	1	No se tuvo contacto con la aeronave	2	2
1444	2023-11-28	20:23:43	2	2	3	2	2	24.554238	-116.858765	76 km al norte de South Josephtown	Monterrey	2	2023-11-28	12:09:02	24.580527	-116.769584	61 km al este de North Garyberg	Monterrey	2	1	Identificación de aeronave sin contacto	1	1
1445	2024-04-01	17:07:03	3	1	4	1	2	28.663454	-104.713926	41 km al este de Riosview	Guadalajara	10	2024-04-01	10:26:11	28.656950	-104.743474	90 km al sur de New Johnshire	Guadalajara	10	2	Identificación de aeronave sin contacto	1	3
1446	2023-10-27	13:54:19	1	1	1	1	1	23.976391	-98.845283	56 km al norte de West Adam	Tepic	7	2023-10-27	05:45:01	24.059899	-98.898385	55 km al norte de Carolhaven	Tepic	7	2	Identificación de aeronave sin contacto	1	4
1447	2024-06-20	02:17:44	2	2	4	2	1	28.075833	-99.766475	19 km al sur de West Kathymouth	CDMX	4	2024-06-20	11:30:05	28.076096	-99.720524	61 km al norte de Angiehaven	CDMX	4	1	Identificación de aeronave sin contacto	2	2
1448	2023-09-15	07:37:45	2	4	2	1	1	29.986123	-106.234734	48 km al norte de South Christophermouth	Durango	7	2023-09-15	13:06:57	30.067594	-106.328309	60 km al oeste de Brettport	Durango	7	2	No se tuvo contacto con la aeronave	1	1
1449	2024-05-08	18:40:43	1	3	2	1	2	26.473349	-103.469572	57 km al norte de New Janicefort	Punta Espada	4	2024-05-08	16:00:23	26.531414	-103.381729	66 km al este de Port Amanda	Punta Espada	4	1	Aseguramiento de aeronave	2	3
1450	2024-04-14	01:16:27	2	3	1	1	2	29.165805	-109.118863	82 km al oeste de South Kaitlyn	Aguascalientes	7	2024-04-14	11:58:53	29.087641	-109.042851	43 km al oeste de Riverahaven	Aguascalientes	7	2	Aseguramiento de aeronave y carga	2	2
1451	2023-11-12	19:34:40	1	2	3	2	1	18.946713	-87.535288	31 km al norte de Heatherburgh	Querétaro	5	2023-11-12	11:31:55	18.927328	-87.519239	46 km al este de East Jamesland	Querétaro	5	1	Aseguramiento de aeronave	1	1
1452	2024-01-05	01:52:00	3	3	2	2	2	29.728412	-106.464147	44 km al norte de East Jackbury	Tamaulipas	7	2024-01-05	07:01:10	29.689643	-106.385539	21 km al norte de East Julia	Tamaulipas	7	2	Aseguramiento de aeronave	2	1
1453	2023-10-19	08:25:54	1	1	2	2	1	26.881288	-111.188177	18 km al este de East Susan	Sinaloa	2	2023-10-19	02:50:34	26.790064	-111.255217	45 km al norte de Cynthiaton	Sinaloa	2	2	Identificación de aeronave sin contacto	2	2
1454	2024-04-24	19:25:49	3	3	3	2	2	25.281214	-109.863647	26 km al oeste de Nealmouth	Guadalajara	9	2024-04-24	05:04:25	25.210489	-109.875916	88 km al oeste de Buckstad	Guadalajara	9	1	Identificación de aeronave sin contacto	2	2
1455	2023-10-14	16:03:28	3	3	1	2	2	22.452083	-87.704958	60 km al oeste de Lake Steven	Veracruz	5	2023-10-14	21:26:04	22.454559	-87.694959	96 km al sur de Huntville	Veracruz	5	1	No se tuvo contacto con la aeronave	2	3
1456	2024-02-23	11:24:39	2	2	1	1	2	21.147453	-111.137142	59 km al este de Heatherview	El Salvador	2	2024-02-23	13:40:03	21.050460	-111.057870	81 km al oeste de Amandaview	El Salvador	2	2	Aseguramiento de aeronave y detención de dos personas	2	1
1457	2024-01-05	12:15:32	1	2	2	1	1	28.060321	-93.976915	29 km al este de Lake Judytown	Durango	3	2024-01-05	05:30:34	28.079480	-94.010166	85 km al sur de Thomasburgh	Durango	3	1	No se tuvo contacto con la aeronave	2	4
1458	2024-05-23	08:03:29	1	3	1	2	2	29.145448	-95.454316	31 km al este de South Arianachester	Belmopan	1	2024-05-23	01:53:32	29.100554	-95.372743	10 km al este de Shawside	Belmopan	1	1	Aseguramiento de aeronave y carga	1	1
1459	2023-09-06	23:12:27	3	3	4	1	1	29.721429	-96.926186	70 km al norte de East Stevenhaven	Aguascalientes	3	2023-09-06	07:29:57	29.810527	-96.857836	14 km al este de Justinstad	Aguascalientes	3	1	Aseguramiento de aeronave y detención de dos personas	2	1
1460	2023-06-28	23:19:28	1	4	3	2	2	18.372777	-106.199731	80 km al oeste de Lake Todd	CDMX	3	2023-06-28	14:10:00	18.330700	-106.200596	51 km al oeste de North Jeffery	CDMX	3	2	Aseguramiento de aeronave y detención de dos personas	1	3
1461	2023-07-07	04:37:54	1	4	4	1	2	19.684925	-101.022126	77 km al norte de Jasonview	Durango	7	2023-07-07	13:45:38	19.726401	-100.969237	18 km al este de West Jeffreybury	Durango	7	1	Aseguramiento de aeronave y detención de dos personas	1	1
1462	2024-02-08	12:41:53	1	1	4	2	1	22.717039	-92.195422	45 km al norte de Lewisfort	Belmopan	9	2024-02-08	11:24:15	22.742128	-92.239548	58 km al norte de Port Lesliehaven	Belmopan	9	1	Identificación de aeronave sin contacto	2	2
1463	2023-07-28	05:35:45	3	3	2	1	2	24.067545	-108.854872	13 km al sur de Johnmouth	Belmopan	4	2023-07-28	07:19:25	24.031162	-108.826211	45 km al sur de New Sarah	Belmopan	4	2	Aseguramiento de aeronave	2	4
1464	2023-07-20	19:59:28	2	3	3	1	2	24.773405	-90.605089	22 km al oeste de West Maureenberg	Cambutal	7	2023-07-20	09:33:33	24.872327	-90.577310	84 km al este de Stephanieborough	Cambutal	7	1	Aseguramiento de aeronave y detención de dos personas	1	3
1465	2023-09-24	12:24:02	3	2	3	2	1	20.731483	-97.211030	18 km al oeste de Jessicaland	Zacatecas	7	2023-09-24	11:03:59	20.794044	-97.302253	38 km al norte de Matthewburgh	Zacatecas	7	2	Identificación de aeronave sin contacto	2	3
1466	2023-12-10	11:52:58	1	1	1	1	2	18.844760	-111.282592	62 km al este de Holtton	Baja California	2	2023-12-10	23:22:05	18.810940	-111.210486	16 km al este de New Greg	Baja California	2	1	Aseguramiento de aeronave y detención de dos personas	1	3
1467	2023-07-17	01:21:43	3	1	3	2	2	24.710304	-102.530850	36 km al este de Robersonton	Guadalajara	10	2023-07-17	15:54:25	24.716399	-102.475012	58 km al este de Port Krystalside	Guadalajara	10	1	No se tuvo contacto con la aeronave	2	2
1468	2023-10-12	19:46:04	3	2	4	1	1	22.559803	-110.972058	65 km al oeste de Port Jennifertown	San Jose	9	2023-10-12	00:55:55	22.514487	-110.953738	66 km al oeste de North Robertmouth	San Jose	9	1	Aseguramiento de aeronave	2	3
1469	2024-05-01	12:43:04	3	1	1	1	1	18.410251	-97.470242	99 km al oeste de Joelstad	Baja California	7	2024-05-01	02:28:22	18.371206	-97.537978	19 km al sur de North Gailhaven	Baja California	7	1	Aseguramiento de aeronave y carga	1	3
1470	2023-11-22	08:08:13	1	2	1	1	2	24.164966	-94.390445	20 km al este de North Jenniferville	El Salvador	2	2023-11-22	19:48:31	24.204917	-94.381604	13 km al oeste de Chaneyfurt	El Salvador	2	2	No se tuvo contacto con la aeronave	1	2
1471	2024-04-14	10:45:44	3	4	3	1	1	27.518344	-97.348766	58 km al norte de Vasquezland	Monterrey	9	2024-04-14	16:08:23	27.594828	-97.378316	46 km al oeste de Gardnerbury	Monterrey	9	1	Identificación de aeronave sin contacto	2	1
1472	2023-11-09	22:33:31	3	4	1	1	2	29.998373	-113.549291	96 km al oeste de South Josephburgh	Belmopan	3	2023-11-09	22:30:43	29.947312	-113.450273	93 km al norte de Pattersonbury	Belmopan	3	1	Aseguramiento de aeronave y detención de dos personas	1	2
1473	2023-11-28	18:07:26	1	4	2	1	1	25.870553	-115.590031	47 km al norte de Jimmymouth	Belmopan	4	2023-11-28	14:42:39	25.951256	-115.608519	86 km al este de New Reneeport	Belmopan	4	1	Identificación de aeronave sin contacto	1	4
1474	2023-07-10	03:29:25	1	3	3	1	2	21.381998	-94.121840	73 km al norte de Lake Frank	Querétaro	10	2023-07-10	14:52:43	21.283565	-94.142065	61 km al norte de West Patriciaberg	Querétaro	10	1	No se tuvo contacto con la aeronave	2	1
1475	2024-05-27	21:57:48	2	1	3	1	2	29.951799	-109.997536	98 km al oeste de West Samuelburgh	CDMX	10	2024-05-27	21:41:30	29.902412	-110.081347	40 km al oeste de Taylorbury	CDMX	10	2	No se tuvo contacto con la aeronave	1	4
1476	2023-12-31	17:03:19	2	1	1	1	1	19.782642	-98.539892	57 km al sur de Davidsonville	Durango	4	2023-12-31	16:33:46	19.762255	-98.536455	21 km al este de Lake Johnshire	Durango	4	2	Aseguramiento de aeronave y detención de dos personas	1	3
1477	2024-02-20	09:53:28	1	3	2	2	2	18.184483	-108.743462	75 km al oeste de Kevinfort	El Salvador	8	2024-02-20	21:08:52	18.171407	-108.750383	27 km al sur de New Brandon	El Salvador	8	1	Identificación de aeronave sin contacto	2	3
1478	2023-07-09	11:48:50	3	4	4	1	2	24.799147	-101.153784	64 km al sur de Frazierbury	Monterrico	5	2023-07-09	11:25:18	24.824281	-101.067186	65 km al oeste de Jamesmouth	Monterrico	5	2	Aseguramiento de aeronave y detención de dos personas	2	2
1479	2023-10-28	20:29:47	2	1	4	2	2	29.390714	-94.581846	40 km al oeste de Parrishville	CDMX	7	2023-10-28	21:20:44	29.478787	-94.669609	46 km al sur de North Ryanmouth	CDMX	7	2	Aseguramiento de aeronave y detención de dos personas	2	1
1480	2023-08-14	21:30:35	3	4	3	1	1	19.049948	-104.274159	74 km al oeste de Port Jameshaven	Tamaulipas	4	2023-08-14	13:52:07	19.016462	-104.227754	75 km al este de East Jamesshire	Tamaulipas	4	1	Aseguramiento de aeronave y detención de dos personas	2	1
1481	2023-07-02	04:21:59	1	4	3	2	1	23.249155	-96.807799	49 km al este de West Jeffreyland	Sonora	10	2023-07-02	19:56:27	23.212292	-96.866814	79 km al norte de Patriciabury	Sonora	10	2	Aseguramiento de aeronave y detención de dos personas	2	4
1482	2024-01-24	09:35:03	1	4	4	2	2	28.307210	-103.022830	70 km al oeste de Jessicaton	Querétaro	7	2024-01-24	16:04:06	28.370430	-103.072081	50 km al este de Brianmouth	Querétaro	7	1	Aseguramiento de aeronave y detención de dos personas	2	4
1483	2023-08-26	06:52:42	1	2	3	1	1	28.613727	-115.382016	11 km al sur de North Ashley	Zacatecas	5	2023-08-26	21:06:17	28.628884	-115.309582	88 km al sur de Lake Robert	Zacatecas	5	1	Aseguramiento de aeronave y detención de dos personas	1	3
1484	2023-09-07	05:59:48	2	4	1	1	2	28.962696	-86.673578	44 km al norte de Jordanport	Belmopan	2	2023-09-07	03:58:17	28.952219	-86.596316	90 km al oeste de South Mitchell	Belmopan	2	1	No se tuvo contacto con la aeronave	2	4
1485	2023-09-08	13:11:30	1	2	4	1	1	26.768283	-94.077210	31 km al norte de North Sean	Villahermosa	9	2023-09-08	01:00:25	26.726941	-94.035133	97 km al sur de Port Sabrina	Villahermosa	9	1	No se tuvo contacto con la aeronave	1	3
1486	2023-12-11	22:29:43	3	2	2	1	2	27.902208	-94.878443	37 km al sur de Lake Susan	Cambutal	10	2023-12-11	03:05:05	27.814891	-94.973018	99 km al norte de Christinafurt	Cambutal	10	2	Identificación de aeronave sin contacto	2	4
1487	2023-12-11	20:14:54	1	3	4	1	2	29.722114	-93.592345	97 km al norte de Port Sierraton	Zacatecas	2	2023-12-11	15:59:31	29.738709	-93.583967	63 km al sur de Port Amyshire	Zacatecas	2	2	Aseguramiento de aeronave y detención de dos personas	2	1
1488	2023-12-30	12:58:59	1	1	3	2	1	26.249098	-110.225672	43 km al oeste de Ericberg	Zacatecas	9	2023-12-30	06:47:36	26.214590	-110.316822	10 km al oeste de Mayside	Zacatecas	9	1	Identificación de aeronave sin contacto	2	4
1489	2023-08-23	07:06:08	1	4	2	2	1	27.647638	-95.957148	25 km al norte de Port Christina	Tamaulipas	3	2023-08-23	03:05:23	27.644735	-95.882150	51 km al sur de East Richard	Tamaulipas	3	2	Identificación de aeronave sin contacto	1	4
1490	2024-03-11	03:41:21	2	2	3	2	2	28.073383	-114.037656	26 km al norte de Port Michael	San Jose	2	2024-03-11	23:55:43	28.047916	-114.001855	13 km al este de South Daniel	San Jose	2	2	Aseguramiento de aeronave y carga	2	2
1491	2024-03-09	12:54:36	1	1	3	1	2	26.706510	-87.262090	52 km al oeste de Lake Lindsaybury	Sinaloa	9	2024-03-09	20:41:42	26.644548	-87.345673	18 km al oeste de Robertberg	Sinaloa	9	2	Aseguramiento de aeronave y detención de dos personas	1	4
1492	2024-02-26	01:29:48	3	2	3	2	2	29.988917	-93.168404	88 km al oeste de North Ronald	CDMX	4	2024-02-26	15:08:45	30.026229	-93.163756	12 km al sur de Port James	CDMX	4	2	No se tuvo contacto con la aeronave	1	1
1493	2023-10-22	11:54:02	3	2	2	2	1	29.260059	-114.050888	28 km al oeste de Georgeborough	Tepic	9	2023-10-22	11:05:53	29.249671	-113.964147	49 km al norte de South Debra	Tepic	9	2	Aseguramiento de aeronave y carga	1	4
1494	2023-07-05	22:51:59	3	3	1	1	1	17.852959	-110.628454	16 km al norte de Petersonmouth	Veracruz	8	2023-07-05	03:55:27	17.944696	-110.636481	70 km al oeste de Michaelstad	Veracruz	8	2	Identificación de aeronave sin contacto	1	2
1495	2024-01-30	16:32:46	2	2	1	2	2	26.428938	-98.463183	15 km al oeste de Rhondaland	Tamaulipas	8	2024-01-30	20:54:55	26.476155	-98.535049	88 km al este de South Brettside	Tamaulipas	8	2	No se tuvo contacto con la aeronave	2	1
1496	2023-12-08	13:17:36	3	3	4	2	1	27.311297	-87.411927	99 km al sur de Brianborough	Aguascalientes	8	2023-12-08	20:25:03	27.319860	-87.339366	81 km al sur de Murphyfurt	Aguascalientes	8	1	Identificación de aeronave sin contacto	1	3
1497	2023-09-22	03:54:36	1	3	3	2	1	25.471929	-99.259069	35 km al sur de Port Zacharyside	Tamaulipas	7	2023-09-22	05:53:59	25.527946	-99.218613	44 km al este de Owensstad	Tamaulipas	7	2	Aseguramiento de aeronave	2	2
1498	2024-06-01	21:27:28	2	4	3	1	2	21.844344	-112.307465	90 km al oeste de Smithshire	Cambutal	5	2024-06-01	18:25:39	21.875815	-112.345345	25 km al este de South Thomasberg	Cambutal	5	1	Aseguramiento de aeronave	2	4
1499	2024-05-16	11:07:23	3	1	1	1	1	27.509161	-109.486179	80 km al oeste de Christophershire	Monterrico	5	2024-05-16	20:36:57	27.585490	-109.458491	48 km al sur de North Christopher	Monterrico	5	2	Aseguramiento de aeronave y carga	1	4
1500	2024-04-21	13:49:25	1	3	3	2	2	26.134198	-98.226691	57 km al sur de Amandafort	Sinaloa	2	2024-04-21	19:49:34	26.206344	-98.280835	71 km al este de East Deanside	Sinaloa	2	1	Aseguramiento de aeronave y carga	2	2
1501	2024-03-11	10:26:24	2	1	1	1	1	21.683986	-116.956999	12 km al oeste de New Jessicaside	CDMX	7	2024-03-11	04:24:39	21.645291	-116.860785	50 km al norte de West Cindy	CDMX	7	1	Identificación de aeronave sin contacto	2	1
1502	2023-07-24	22:31:31	3	3	4	1	2	26.156310	-110.481069	54 km al norte de North Kelly	Hermosillo	2	2023-07-24	14:51:01	26.208731	-110.418838	43 km al oeste de Pattersonburgh	Hermosillo	2	1	No se tuvo contacto con la aeronave	1	4
1503	2024-03-11	04:06:08	3	3	1	2	2	20.094358	-109.626892	13 km al norte de Smithside	Querétaro	6	2024-03-11	20:31:42	20.046593	-109.616172	30 km al este de Lake Brandonmouth	Querétaro	6	1	Aseguramiento de aeronave	1	1
1504	2024-01-01	10:57:27	3	3	4	2	1	24.367466	-87.842749	64 km al oeste de West Beverlymouth	Hermosillo	10	2024-01-01	11:03:38	24.336987	-87.838051	18 km al sur de Port Davidbury	Hermosillo	10	1	Aseguramiento de aeronave	1	1
1505	2023-09-24	18:13:47	1	3	1	1	2	30.572536	-108.028756	80 km al oeste de North Johnbury	Zacatecas	5	2023-09-24	23:12:15	30.569948	-107.981556	71 km al oeste de East Debra	Zacatecas	5	2	Aseguramiento de aeronave y detención de dos personas	2	3
1506	2024-01-15	12:13:53	3	3	3	2	2	28.974631	-109.680161	41 km al sur de Terriville	Punta Espada	8	2024-01-15	17:15:37	29.036693	-109.735699	15 km al sur de Williamshire	Punta Espada	8	2	Identificación de aeronave sin contacto	2	1
1507	2023-09-22	13:18:35	3	1	3	2	1	24.502328	-86.924154	88 km al norte de Lake Timothy	Tepic	10	2023-09-22	06:49:21	24.509095	-87.007457	41 km al sur de West Heather	Tepic	10	2	No se tuvo contacto con la aeronave	1	2
1508	2024-04-09	21:12:18	2	3	3	1	2	25.286644	-114.716470	48 km al norte de Rodgersfort	Zacatecas	8	2024-04-09	17:29:40	25.385817	-114.686244	68 km al sur de North Calebburgh	Zacatecas	8	2	Aseguramiento de aeronave y detención de dos personas	2	2
1509	2023-11-08	11:24:15	1	3	2	2	1	28.129966	-116.055213	93 km al sur de Elizabethville	Hermosillo	2	2023-11-08	19:08:13	28.209071	-116.101641	82 km al norte de Choibury	Hermosillo	2	2	No se tuvo contacto con la aeronave	1	3
1510	2023-07-19	06:40:41	3	4	1	2	1	29.810558	-113.900876	57 km al este de South Danielview	San Jose	8	2023-07-19	21:05:22	29.884905	-113.967455	66 km al oeste de Lake Jill	San Jose	8	2	Identificación de aeronave sin contacto	1	1
1511	2023-08-12	20:18:25	1	2	3	2	1	29.421699	-112.277653	68 km al este de Port Sabrinaton	Guadalajara	1	2023-08-12	19:36:58	29.356405	-112.317342	82 km al oeste de East Jason	Guadalajara	1	1	Aseguramiento de aeronave y detención de dos personas	1	4
1512	2024-05-26	03:00:18	2	3	4	2	2	27.443783	-108.685714	30 km al este de North Antonio	Guadalajara	2	2024-05-26	10:35:08	27.539215	-108.607740	82 km al sur de North Nicole	Guadalajara	2	1	Identificación de aeronave sin contacto	1	3
1513	2024-05-06	23:42:56	3	3	1	2	1	19.561313	-104.900465	21 km al oeste de South John	Monterrico	2	2024-05-06	18:10:40	19.490168	-104.818650	97 km al norte de Wellsville	Monterrico	2	2	Aseguramiento de aeronave	1	1
1514	2024-06-19	11:13:00	3	1	1	1	1	22.071352	-89.754048	32 km al sur de West Ricardo	Monterrico	4	2024-06-19	19:43:23	22.017739	-89.729750	72 km al norte de West Louis	Monterrico	4	2	Aseguramiento de aeronave y carga	2	4
1515	2023-08-14	22:47:15	2	2	2	1	2	26.114721	-91.839742	20 km al oeste de Taylorland	Sinaloa	1	2023-08-14	03:04:16	26.181103	-91.921159	85 km al norte de Elliottland	Sinaloa	1	1	Identificación de aeronave sin contacto	1	1
1516	2024-03-29	07:40:15	2	1	4	1	1	18.848365	-89.580743	78 km al sur de Port Jocelynport	San Jose	5	2024-03-29	03:04:11	18.921573	-89.499415	63 km al norte de Campbellfurt	San Jose	5	2	Aseguramiento de aeronave	1	1
1517	2024-06-11	18:44:22	1	3	1	2	1	22.614068	-107.201984	78 km al oeste de Santiagoberg	Monterrico	4	2024-06-11	22:48:42	22.524925	-107.110089	10 km al este de New Craigside	Monterrico	4	2	Aseguramiento de aeronave y carga	2	3
1518	2024-01-19	12:50:16	1	1	1	1	1	24.482287	-88.849333	63 km al norte de Port Lindsay	Durango	6	2024-01-19	19:01:57	24.382881	-88.940596	25 km al norte de North Matthewfurt	Durango	6	2	Aseguramiento de aeronave y carga	2	3
1519	2023-10-10	02:46:08	1	2	3	2	2	27.702392	-108.728550	99 km al sur de Cruzborough	Culiacán	6	2023-10-10	09:11:07	27.636505	-108.638003	89 km al este de South Brenda	Culiacán	6	2	Identificación de aeronave sin contacto	1	2
1520	2023-10-30	11:39:42	2	4	3	2	1	21.627735	-100.878598	92 km al este de West Susan	Tamaulipas	2	2023-10-30	09:17:11	21.649337	-100.940837	33 km al norte de Jordanshire	Tamaulipas	2	2	Identificación de aeronave sin contacto	1	1
1521	2023-09-16	23:43:16	3	3	2	2	2	26.026616	-111.969999	92 km al sur de West Anthonyshire	Punta Espada	8	2023-09-16	02:38:08	25.973463	-111.993119	93 km al oeste de Kaneberg	Punta Espada	8	1	Aseguramiento de aeronave	2	1
1522	2024-01-27	19:16:21	3	1	3	1	2	21.543550	-100.274074	23 km al norte de New Williambury	Aguascalientes	6	2024-01-27	21:29:18	21.559909	-100.332110	52 km al este de New Andrew	Aguascalientes	6	1	Aseguramiento de aeronave	1	3
1523	2023-08-07	03:26:12	3	4	1	1	2	23.096757	-112.368291	75 km al este de Thompsonville	Sinaloa	3	2023-08-07	10:23:24	23.007374	-112.413343	36 km al este de Port Jacquelineland	Sinaloa	3	1	Aseguramiento de aeronave	2	3
1524	2024-03-20	13:11:57	2	4	4	2	1	24.920008	-113.614002	79 km al este de West Francesfort	Sonora	9	2024-03-20	03:30:10	24.824254	-113.660336	93 km al este de Lake Peterview	Sonora	9	1	No se tuvo contacto con la aeronave	1	2
1525	2023-07-16	22:07:56	1	2	2	2	2	18.247022	-90.093639	77 km al oeste de New Jenniferhaven	CDMX	9	2023-07-16	06:14:04	18.344450	-90.045029	68 km al este de Hughesmouth	CDMX	9	1	Identificación de aeronave sin contacto	2	2
1526	2023-12-22	22:30:19	2	1	2	2	1	18.982412	-114.852570	57 km al oeste de Padillastad	Aguascalientes	6	2023-12-22	19:36:06	18.983100	-114.892072	58 km al oeste de Richardshire	Aguascalientes	6	1	Aseguramiento de aeronave y detención de dos personas	2	1
1527	2023-11-13	00:42:17	3	1	3	1	1	26.985577	-95.443508	13 km al este de North Mitchellborough	Guadalajara	4	2023-11-13	18:15:09	26.998074	-95.463327	24 km al norte de Port Dawn	Guadalajara	4	2	No se tuvo contacto con la aeronave	1	4
1528	2024-04-03	00:56:18	3	4	2	1	1	25.376722	-113.718991	40 km al sur de Davidland	Sinaloa	4	2024-04-03	13:44:55	25.416169	-113.664159	46 km al oeste de Lake Troy	Sinaloa	4	2	Aseguramiento de aeronave y detención de dos personas	2	3
1529	2023-11-18	09:16:51	2	1	3	1	2	27.990453	-115.715221	12 km al sur de Jillfort	Cambutal	8	2023-11-18	03:43:02	27.965859	-115.690340	15 km al norte de Port Tanya	Cambutal	8	1	Identificación de aeronave sin contacto	1	3
1530	2023-11-17	05:09:51	2	4	1	2	2	24.186358	-115.726041	39 km al norte de Lake Claudiaborough	Tamaulipas	9	2023-11-17	01:21:47	24.148166	-115.718666	30 km al oeste de Harrisport	Tamaulipas	9	2	Aseguramiento de aeronave y carga	2	1
1531	2024-03-20	06:54:31	3	4	1	1	1	21.659014	-86.468542	24 km al oeste de Kelleybury	Hermosillo	3	2024-03-20	01:36:05	21.717941	-86.479745	85 km al norte de West Manuel	Hermosillo	3	1	No se tuvo contacto con la aeronave	1	2
1532	2023-08-28	04:51:47	1	1	4	2	2	29.546102	-113.214225	24 km al sur de Port Samantha	Culiacán	4	2023-08-28	16:02:51	29.603741	-113.183163	82 km al oeste de Walkerton	Culiacán	4	2	Aseguramiento de aeronave	1	4
1533	2023-07-18	22:22:37	2	4	1	2	2	22.120278	-93.022114	85 km al sur de East Destiny	Culiacán	2	2023-07-18	16:09:40	22.197773	-92.970436	81 km al oeste de Lake Taylorside	Culiacán	2	1	Aseguramiento de aeronave y carga	2	3
1534	2024-04-29	11:25:20	1	2	2	2	1	29.651451	-108.563822	14 km al este de Alyssaville	Tamaulipas	2	2024-04-29	09:13:50	29.721435	-108.494520	24 km al norte de Jonesmouth	Tamaulipas	2	1	Aseguramiento de aeronave y carga	2	4
1535	2024-06-25	08:55:08	1	3	4	1	2	21.991224	-88.047996	29 km al este de Stevenville	Querétaro	10	2024-06-25	07:46:32	21.944174	-88.081560	81 km al sur de Browntown	Querétaro	10	2	Aseguramiento de aeronave y detención de dos personas	2	4
1536	2024-01-18	22:20:04	3	1	3	2	1	21.421045	-90.818306	60 km al este de Bateschester	Durango	3	2024-01-18	06:01:10	21.399554	-90.791546	71 km al oeste de Avilaport	Durango	3	1	Identificación de aeronave sin contacto	2	3
1537	2023-10-29	00:40:13	2	4	3	1	1	30.065541	-89.013891	94 km al norte de Port James	Culiacán	4	2023-10-29	01:46:22	29.995903	-89.110073	27 km al oeste de Port Veronicashire	Culiacán	4	1	Identificación de aeronave sin contacto	2	2
1538	2023-12-10	13:57:25	1	4	1	1	1	23.639134	-94.296438	90 km al oeste de East Travisburgh	Baja California	2	2023-12-10	15:31:08	23.625885	-94.348001	35 km al este de Ramseymouth	Baja California	2	2	Identificación de aeronave sin contacto	1	2
1539	2024-05-13	05:19:34	2	2	2	1	2	21.892408	-97.739604	68 km al sur de New Andrew	CDMX	4	2024-05-13	03:22:20	21.837978	-97.658614	20 km al norte de Port Christymouth	CDMX	4	2	Identificación de aeronave sin contacto	2	1
1540	2023-09-07	16:18:32	2	4	4	2	2	28.026212	-116.232723	76 km al oeste de Vasquezberg	El Salvador	3	2023-09-07	16:27:13	27.926431	-116.299674	21 km al este de Heatherside	El Salvador	3	2	No se tuvo contacto con la aeronave	2	1
1541	2024-01-04	18:36:38	1	3	2	1	1	19.508329	-100.400381	11 km al norte de East Mark	Querétaro	10	2024-01-04	08:41:09	19.432595	-100.356177	49 km al sur de Andreabury	Querétaro	10	1	No se tuvo contacto con la aeronave	2	3
1542	2023-12-25	15:12:22	3	4	3	1	1	17.536166	-105.979189	75 km al oeste de North Christophershire	Belmopan	9	2023-12-25	19:02:47	17.557778	-105.879431	15 km al norte de Isaiahtown	Belmopan	9	2	Aseguramiento de aeronave y carga	1	4
1543	2023-12-03	00:59:38	2	3	1	1	2	21.901450	-91.366109	35 km al oeste de Donnamouth	Aguascalientes	10	2023-12-03	15:17:26	21.866834	-91.380374	90 km al este de Davismouth	Aguascalientes	10	1	Aseguramiento de aeronave	2	2
1544	2023-12-26	07:49:42	3	3	2	2	2	21.043984	-95.684668	71 km al oeste de Cisnerosberg	Baja California	4	2023-12-26	02:05:48	21.065172	-95.702512	59 km al este de East Cameronview	Baja California	4	1	Aseguramiento de aeronave y carga	2	1
1545	2023-11-28	16:39:51	3	3	1	1	1	21.565047	-109.042397	93 km al oeste de Berryland	Guadalajara	3	2023-11-28	18:24:52	21.529020	-109.138527	73 km al oeste de North Raymond	Guadalajara	3	2	Aseguramiento de aeronave	1	3
1546	2023-07-22	21:03:14	2	4	4	2	1	26.207464	-96.995347	11 km al este de Loweburgh	Belmopan	4	2023-07-22	07:47:41	26.121820	-96.986242	57 km al sur de Leonardmouth	Belmopan	4	1	Aseguramiento de aeronave y detención de dos personas	1	1
1547	2024-06-25	10:27:21	3	2	4	2	1	19.454480	-94.118937	28 km al norte de Williamsshire	Culiacán	5	2024-06-25	06:02:25	19.442967	-94.121696	58 km al norte de Westborough	Culiacán	5	1	Aseguramiento de aeronave y detención de dos personas	2	3
1548	2023-08-09	07:22:44	3	1	3	2	1	23.648929	-114.476138	53 km al norte de Dustinburgh	Villahermosa	7	2023-08-09	06:40:41	23.658319	-114.382770	91 km al sur de Maryborough	Villahermosa	7	1	Aseguramiento de aeronave y detención de dos personas	2	3
1549	2024-06-24	19:57:43	3	2	2	1	2	30.796910	-103.694183	32 km al sur de North James	Sonora	6	2024-06-24	16:49:36	30.752998	-103.681821	48 km al norte de Connieland	Sonora	6	1	Aseguramiento de aeronave y carga	1	1
1550	2023-12-11	21:17:00	1	4	3	1	1	18.088550	-100.865708	33 km al sur de New Benjamin	El Salvador	3	2023-12-11	11:23:27	18.075466	-100.951781	36 km al oeste de South Barbara	El Salvador	3	1	No se tuvo contacto con la aeronave	1	2
1551	2023-09-15	09:47:38	1	2	2	2	1	26.784762	-97.843400	82 km al sur de Randyview	Tamaulipas	5	2023-09-15	14:29:32	26.874463	-97.801397	35 km al este de Erinfurt	Tamaulipas	5	2	Identificación de aeronave sin contacto	1	3
1552	2023-07-15	15:39:01	1	2	3	1	2	27.670090	-88.166214	81 km al sur de Christopherborough	Guadalajara	8	2023-07-15	12:04:58	27.705969	-88.143447	16 km al sur de Aprilchester	Guadalajara	8	2	Identificación de aeronave sin contacto	2	4
1553	2023-11-30	21:51:04	3	2	1	1	1	29.847087	-103.827248	85 km al este de Mcclureborough	Villahermosa	4	2023-11-30	01:21:23	29.870850	-103.732523	13 km al norte de East Brendanstad	Villahermosa	4	1	Identificación de aeronave sin contacto	2	1
1554	2023-11-19	20:37:21	2	1	1	2	2	21.821912	-108.162501	38 km al sur de Lake Rebeccaland	Tamaulipas	4	2023-11-19	11:44:12	21.849709	-108.171909	95 km al norte de Briannafort	Tamaulipas	4	2	Aseguramiento de aeronave y detención de dos personas	2	3
1555	2023-12-04	06:47:05	3	4	3	1	2	24.818188	-111.394378	66 km al este de Matthewsville	Sinaloa	10	2023-12-04	18:17:21	24.837590	-111.458591	60 km al sur de New Travisbury	Sinaloa	10	2	Aseguramiento de aeronave y detención de dos personas	2	1
1556	2023-09-21	23:21:55	1	2	2	1	1	23.251732	-94.039391	57 km al oeste de North Jaybury	Hermosillo	7	2023-09-21	12:49:17	23.267249	-93.963593	55 km al norte de New Alexamouth	Hermosillo	7	2	Identificación de aeronave sin contacto	1	1
1557	2024-05-06	02:19:06	1	2	2	2	1	17.536044	-116.042670	13 km al oeste de Richardstad	Tamaulipas	5	2024-05-06	18:27:53	17.513979	-115.946769	12 km al este de New Peterchester	Tamaulipas	5	2	Aseguramiento de aeronave y detención de dos personas	1	2
1558	2023-09-28	23:41:43	1	3	4	1	2	22.453858	-113.439677	22 km al oeste de Lucashaven	San Jose	10	2023-09-28	05:55:14	22.469116	-113.477451	33 km al norte de Kimville	San Jose	10	1	No se tuvo contacto con la aeronave	1	2
1559	2023-09-24	01:11:59	1	4	3	1	1	27.900304	-90.411725	50 km al oeste de New Christopher	CDMX	4	2023-09-24	19:53:19	27.999861	-90.484000	53 km al sur de East Dennis	CDMX	4	1	Aseguramiento de aeronave y detención de dos personas	2	1
1560	2024-03-21	03:10:53	1	4	2	1	1	20.652957	-99.216665	22 km al este de Jessicaland	Sinaloa	9	2024-03-21	04:45:11	20.647165	-99.280318	32 km al norte de West Rita	Sinaloa	9	1	Aseguramiento de aeronave y detención de dos personas	1	3
1561	2024-06-24	22:39:44	2	2	3	1	1	22.075312	-87.876132	37 km al este de Lake Amandaburgh	Guadalajara	1	2024-06-24	15:59:19	22.044200	-87.868432	50 km al oeste de West James	Guadalajara	1	2	No se tuvo contacto con la aeronave	2	3
1562	2024-01-05	12:04:18	2	2	3	1	1	18.320177	-93.289422	24 km al oeste de East Annatown	San Jose	10	2024-01-05	05:55:14	18.350613	-93.197870	79 km al sur de Lake Christinaburgh	San Jose	10	2	No se tuvo contacto con la aeronave	2	1
1563	2024-01-25	12:42:43	3	4	2	1	1	29.926460	-113.333385	44 km al este de Mistyshire	Hermosillo	6	2024-01-25	14:31:21	29.926274	-113.360739	93 km al oeste de West Lori	Hermosillo	6	1	Aseguramiento de aeronave y carga	1	1
1564	2023-11-04	18:32:21	3	1	3	2	2	20.796565	-103.353489	25 km al este de South Marcus	Veracruz	4	2023-11-04	02:04:14	20.810641	-103.406195	73 km al sur de Port Richard	Veracruz	4	1	No se tuvo contacto con la aeronave	1	1
1565	2023-08-23	00:39:17	3	4	4	2	1	19.459085	-115.657499	50 km al norte de Port Michelleport	Zacatecas	4	2023-08-23	00:54:11	19.425911	-115.669081	52 km al norte de West Erinside	Zacatecas	4	2	Aseguramiento de aeronave y detención de dos personas	2	3
1566	2024-03-11	13:11:17	1	4	4	1	1	22.398476	-106.849577	49 km al este de New Jamesmouth	El Salvador	10	2024-03-11	20:06:02	22.405149	-106.905565	59 km al oeste de Reneefurt	El Salvador	10	2	No se tuvo contacto con la aeronave	1	4
1567	2024-02-27	15:33:49	3	3	1	1	2	23.479454	-109.275237	30 km al este de West Sarahstad	Cambutal	1	2024-02-27	00:51:06	23.413097	-109.203829	15 km al sur de Rogerborough	Cambutal	1	2	Identificación de aeronave sin contacto	1	1
1568	2023-07-09	19:00:43	3	2	3	1	1	25.129014	-94.902850	69 km al norte de Tracyland	Belmopan	5	2023-07-09	19:10:40	25.049968	-94.892477	75 km al norte de Wilsonshire	Belmopan	5	1	Aseguramiento de aeronave	2	4
1569	2023-08-22	20:38:56	1	1	4	1	2	28.119039	-114.390693	59 km al sur de New Bobbyberg	Tepic	7	2023-08-22	21:42:07	28.121861	-114.380347	72 km al oeste de North Courtneyview	Tepic	7	1	Identificación de aeronave sin contacto	1	2
1570	2024-03-21	18:01:41	3	1	2	2	2	17.537876	-111.299764	26 km al oeste de New Ricardofort	Culiacán	10	2024-03-21	06:25:37	17.592541	-111.265725	54 km al norte de Zamoraport	Culiacán	10	1	Aseguramiento de aeronave y carga	2	4
1571	2023-07-06	03:11:29	2	4	4	1	1	21.541133	-86.048637	97 km al oeste de Port Michael	Cambutal	3	2023-07-06	18:45:00	21.444012	-86.101683	54 km al norte de Brianburgh	Cambutal	3	1	Aseguramiento de aeronave y carga	2	4
1572	2024-04-27	23:20:29	3	1	3	2	1	30.999698	-102.401822	18 km al oeste de South Andreachester	Baja California	8	2024-04-27	17:47:29	30.959248	-102.325771	68 km al oeste de Donovanside	Baja California	8	1	Aseguramiento de aeronave y detención de dos personas	1	1
1573	2024-05-04	06:57:31	1	4	1	1	2	26.898630	-95.332334	75 km al sur de New Kristen	Zacatecas	9	2024-05-04	14:17:42	26.935092	-95.258480	47 km al sur de Lake Kimberlytown	Zacatecas	9	2	Aseguramiento de aeronave	1	3
1574	2024-04-27	13:09:05	2	2	3	2	2	29.653516	-99.525469	98 km al este de Port Danielstad	Baja California	6	2024-04-27	04:50:12	29.630487	-99.507424	48 km al sur de South Nathan	Baja California	6	2	No se tuvo contacto con la aeronave	1	3
1575	2023-08-13	00:21:08	1	1	2	2	1	28.610756	-103.354107	81 km al norte de South Nichole	Querétaro	1	2023-08-13	17:23:53	28.583143	-103.418968	99 km al este de Christineton	Querétaro	1	2	Aseguramiento de aeronave	1	4
1576	2023-12-06	14:32:17	2	1	2	1	2	25.013656	-116.773900	93 km al norte de Smithshire	Aguascalientes	3	2023-12-06	15:28:36	25.082056	-116.678249	31 km al sur de New Dennisburgh	Aguascalientes	3	2	Aseguramiento de aeronave y detención de dos personas	2	1
1577	2023-11-20	20:56:57	1	2	4	1	1	19.383311	-99.156356	99 km al oeste de New Mark	Tepic	9	2023-11-20	19:20:45	19.435324	-99.249481	50 km al oeste de Andersonchester	Tepic	9	2	Aseguramiento de aeronave	1	2
1578	2024-05-13	18:48:55	3	2	4	1	1	23.766496	-108.134209	77 km al este de West Sierraborough	El Salvador	1	2024-05-13	03:05:38	23.864390	-108.099337	32 km al oeste de Woodstad	El Salvador	1	1	Aseguramiento de aeronave y carga	2	1
1579	2024-03-21	01:15:59	3	4	4	2	2	26.756503	-116.497107	70 km al norte de Lake Peter	Monterrico	5	2024-03-21	19:30:45	26.834902	-116.485507	67 km al oeste de South Richardport	Monterrico	5	2	Aseguramiento de aeronave y carga	2	2
1580	2023-07-01	23:48:19	1	2	3	2	1	19.052066	-104.381800	89 km al sur de South Jameschester	Querétaro	5	2023-07-01	06:01:33	18.983197	-104.428543	76 km al sur de Walkerbury	Querétaro	5	1	No se tuvo contacto con la aeronave	1	1
1581	2023-10-15	18:32:39	3	1	4	1	1	18.644734	-100.082798	90 km al sur de North Christopher	Monterrico	9	2023-10-15	22:43:20	18.666684	-100.164215	30 km al este de New Taylorstad	Monterrico	9	1	Identificación de aeronave sin contacto	2	1
1582	2024-06-07	13:23:51	1	2	4	1	2	29.035208	-110.235888	86 km al sur de North Nicole	Zacatecas	1	2024-06-07	16:48:16	29.059819	-110.285490	57 km al sur de Port Justinburgh	Zacatecas	1	2	Aseguramiento de aeronave y detención de dos personas	1	4
1583	2024-06-23	09:36:58	3	2	2	2	1	23.443300	-88.590270	76 km al norte de Averyfort	Monterrico	10	2024-06-23	17:48:18	23.475507	-88.605071	26 km al oeste de Johnsonmouth	Monterrico	10	2	Aseguramiento de aeronave y carga	1	1
1584	2024-04-23	13:57:13	1	3	3	1	1	27.590965	-90.177422	50 km al sur de South Jordanside	Monterrey	6	2024-04-23	02:45:31	27.668065	-90.146143	93 km al este de Morenoview	Monterrey	6	2	Aseguramiento de aeronave	2	4
1585	2024-03-05	10:47:02	2	3	3	1	2	26.423088	-93.775673	53 km al este de New Sarahton	Tamaulipas	1	2024-03-05	04:26:13	26.340425	-93.676607	77 km al oeste de Dukemouth	Tamaulipas	1	1	Identificación de aeronave sin contacto	1	3
1586	2024-01-28	08:16:53	2	2	3	2	1	27.606592	-99.520223	62 km al norte de New James	Belmopan	10	2024-01-28	20:51:10	27.531509	-99.543145	84 km al norte de Port Kevinmouth	Belmopan	10	2	Aseguramiento de aeronave y carga	2	2
1587	2024-03-16	01:27:12	1	1	4	1	1	24.703291	-102.191300	31 km al sur de Lake Glennside	Tepic	6	2024-03-16	20:40:33	24.684646	-102.220693	96 km al oeste de Port Chelsea	Tepic	6	2	No se tuvo contacto con la aeronave	1	3
1588	2024-01-13	18:50:35	1	3	2	1	2	25.123072	-98.679985	33 km al este de East Jenniferfort	El Salvador	7	2024-01-13	06:29:48	25.125151	-98.603982	33 km al oeste de Port Scottberg	El Salvador	7	1	No se tuvo contacto con la aeronave	1	2
1589	2024-01-16	13:55:28	3	3	2	1	2	24.991868	-107.292046	92 km al sur de Joshuaton	San Jose	4	2024-01-16	06:21:33	24.945286	-107.268438	85 km al norte de New Juliemouth	San Jose	4	2	No se tuvo contacto con la aeronave	1	4
1590	2023-10-13	02:40:35	1	1	3	2	1	23.371496	-94.444710	82 km al este de Cynthiachester	CDMX	5	2023-10-13	01:06:28	23.437490	-94.358860	15 km al norte de Hodgesport	CDMX	5	2	Identificación de aeronave sin contacto	2	2
1591	2023-12-17	22:23:37	2	3	2	1	2	19.755207	-101.170549	91 km al sur de Arnoldville	Cambutal	5	2023-12-17	04:45:10	19.812311	-101.233779	38 km al sur de West Brandyshire	Cambutal	5	1	Aseguramiento de aeronave y detención de dos personas	1	4
1592	2023-08-05	17:43:20	1	2	4	1	1	21.534925	-99.376971	26 km al oeste de South Laurenview	El Salvador	7	2023-08-05	02:00:47	21.601844	-99.346236	22 km al norte de Lyonstown	El Salvador	7	1	Identificación de aeronave sin contacto	2	4
1593	2023-11-17	19:22:33	1	3	1	1	1	27.046633	-98.496610	75 km al norte de South Andreafurt	Veracruz	2	2023-11-17	02:20:04	27.121983	-98.477175	11 km al oeste de New Cindy	Veracruz	2	1	No se tuvo contacto con la aeronave	1	2
1594	2024-03-08	12:53:58	2	1	4	2	2	23.889455	-92.667057	73 km al norte de Santosberg	Villahermosa	7	2024-03-08	02:40:27	23.904544	-92.650722	87 km al norte de Port Heather	Villahermosa	7	2	No se tuvo contacto con la aeronave	1	3
1595	2023-07-09	12:43:32	2	3	1	2	2	20.070436	-109.481381	82 km al norte de North Gregoryburgh	Tepic	3	2023-07-09	14:29:01	20.112259	-109.521262	27 km al sur de Jordanhaven	Tepic	3	1	Aseguramiento de aeronave y detención de dos personas	2	2
1596	2024-03-12	09:00:48	3	1	4	1	1	23.866403	-115.425360	89 km al sur de Port Charles	Monterrico	9	2024-03-12	07:28:30	23.841320	-115.389750	79 km al sur de Paynetown	Monterrico	9	2	Identificación de aeronave sin contacto	1	3
1597	2024-05-12	09:40:21	3	1	4	2	2	26.834515	-94.591665	26 km al este de South Jeffrey	Baja California	4	2024-05-12	17:01:01	26.927492	-94.569527	47 km al oeste de North Thomas	Baja California	4	2	Aseguramiento de aeronave y carga	2	4
1598	2023-12-28	04:17:39	1	3	4	1	2	22.119262	-87.497728	77 km al este de Harrisbury	Tepic	8	2023-12-28	22:37:24	22.165909	-87.556943	44 km al este de Port Amy	Tepic	8	1	No se tuvo contacto con la aeronave	1	2
1599	2024-03-24	23:56:59	2	2	4	1	1	26.675465	-100.622418	89 km al oeste de Tommyfort	Tamaulipas	9	2024-03-24	08:56:52	26.749496	-100.550319	96 km al este de Heatherstad	Tamaulipas	9	2	No se tuvo contacto con la aeronave	2	4
1600	2023-10-15	19:44:55	2	4	1	2	2	25.125493	-99.209866	12 km al sur de Jessicashire	Baja California	4	2023-10-15	18:51:49	25.090626	-99.123247	75 km al oeste de Port Jamesbury	Baja California	4	2	Aseguramiento de aeronave y carga	2	1
1601	2024-01-20	18:36:30	2	4	3	1	2	23.210119	-89.992645	41 km al oeste de Gregoryborough	Zacatecas	10	2024-01-20	00:07:45	23.182654	-89.978397	92 km al oeste de Jonesfort	Zacatecas	10	1	Aseguramiento de aeronave y carga	2	4
1602	2023-09-27	10:15:44	1	3	3	1	2	25.649311	-100.407157	97 km al oeste de Heatherville	Belmopan	3	2023-09-27	19:59:26	25.602915	-100.481870	48 km al oeste de West Phyllisberg	Belmopan	3	1	Aseguramiento de aeronave	2	2
1603	2024-01-27	14:12:47	3	2	1	2	2	25.113473	-87.281596	92 km al sur de Wallchester	San Jose	7	2024-01-27	11:20:59	25.060789	-87.252464	52 km al norte de Davidburgh	San Jose	7	2	No se tuvo contacto con la aeronave	2	4
1604	2024-01-24	16:03:39	3	3	2	1	1	29.583631	-98.662959	75 km al este de Payneland	Cambutal	6	2024-01-24	11:56:37	29.513931	-98.743968	62 km al este de Samanthashire	Cambutal	6	2	Aseguramiento de aeronave	1	3
1605	2024-04-14	06:58:08	2	1	2	2	1	20.973707	-86.137541	72 km al oeste de Port Maryport	Tamaulipas	3	2024-04-14	13:52:01	20.938296	-86.088287	72 km al sur de Stricklandport	Tamaulipas	3	1	Aseguramiento de aeronave y detención de dos personas	2	4
1606	2023-09-19	22:09:43	2	4	1	2	1	18.442526	-104.839012	96 km al norte de South Kimberly	Sinaloa	9	2023-09-19	09:23:05	18.418099	-104.814256	21 km al oeste de Port Markstad	Sinaloa	9	2	Aseguramiento de aeronave	1	4
1607	2024-01-02	22:04:49	1	2	3	2	2	29.945675	-111.912824	82 km al este de West Robert	Culiacán	1	2024-01-02	00:46:26	29.911020	-111.944538	43 km al este de Johnborough	Culiacán	1	2	Identificación de aeronave sin contacto	2	2
1608	2023-12-01	07:29:03	2	3	3	2	1	21.886201	-99.781986	23 km al norte de Ashleyville	Monterrey	6	2023-12-01	01:46:43	21.883167	-99.819787	10 km al sur de Port Latashatown	Monterrey	6	1	No se tuvo contacto con la aeronave	2	1
1609	2023-10-09	19:25:25	1	2	2	2	1	25.411520	-102.660137	25 km al sur de South Gail	Querétaro	2	2023-10-09	20:44:17	25.443362	-102.721753	89 km al este de New Jenniferberg	Querétaro	2	1	Aseguramiento de aeronave y detención de dos personas	2	3
1610	2024-02-20	12:58:03	3	1	4	1	2	18.494292	-111.455663	68 km al oeste de Lake Ronaldview	Veracruz	8	2024-02-20	09:01:16	18.507012	-111.482978	76 km al oeste de South Joshua	Veracruz	8	1	Aseguramiento de aeronave y detención de dos personas	2	3
1611	2023-10-17	22:45:46	3	1	1	2	1	22.897714	-99.331601	63 km al oeste de South Alyssa	Culiacán	7	2023-10-17	23:24:17	22.982340	-99.430949	42 km al norte de Lake Patrick	Culiacán	7	2	Aseguramiento de aeronave y detención de dos personas	1	3
1612	2024-04-12	14:42:48	1	4	2	2	2	28.000437	-101.474909	66 km al norte de Lauraland	Zacatecas	3	2024-04-12	20:04:34	27.910072	-101.407877	29 km al norte de Lake Paul	Zacatecas	3	1	Aseguramiento de aeronave y detención de dos personas	2	3
1613	2023-10-05	03:11:37	3	2	4	1	1	25.574513	-87.696620	22 km al este de Stewartberg	Culiacán	9	2023-10-05	21:40:20	25.532263	-87.651089	74 km al oeste de Kellyshire	Culiacán	9	2	No se tuvo contacto con la aeronave	1	3
1614	2023-12-02	21:53:48	3	4	3	1	1	19.963947	-97.618478	97 km al oeste de Mccoymouth	Tamaulipas	10	2023-12-02	20:19:24	19.864066	-97.699835	16 km al este de Karentown	Tamaulipas	10	2	Aseguramiento de aeronave y detención de dos personas	1	1
1615	2023-11-22	02:19:24	2	4	3	1	1	23.109863	-90.956146	16 km al sur de Marioburgh	Cambutal	7	2023-11-22	09:03:56	23.105373	-90.983879	21 km al este de Port Bradleyhaven	Cambutal	7	2	No se tuvo contacto con la aeronave	1	1
1616	2024-05-29	08:53:28	1	2	1	2	2	26.077242	-104.854891	84 km al este de Owensburgh	Monterrey	7	2024-05-29	14:58:22	26.050951	-104.888073	48 km al este de Ingramview	Monterrey	7	1	Aseguramiento de aeronave y carga	2	3
1617	2024-01-25	00:58:51	3	1	1	1	2	20.992121	-106.393124	10 km al sur de New Seth	Baja California	2	2024-01-25	21:56:27	21.014319	-106.361676	91 km al este de North Eriktown	Baja California	2	1	No se tuvo contacto con la aeronave	1	3
1618	2023-08-02	02:27:34	2	1	2	1	1	23.322023	-94.799679	29 km al sur de Lake Brian	Querétaro	1	2023-08-02	10:46:39	23.379725	-94.790829	34 km al oeste de West Sonyaborough	Querétaro	1	1	Identificación de aeronave sin contacto	1	1
1619	2023-09-10	11:19:20	2	3	3	2	2	24.153340	-114.179092	69 km al sur de East Janice	Veracruz	5	2023-09-10	02:41:26	24.131316	-114.249304	62 km al oeste de Anneburgh	Veracruz	5	2	No se tuvo contacto con la aeronave	2	2
1620	2023-06-30	08:31:00	3	2	4	2	2	19.460602	-104.900131	42 km al este de Bryanland	Tamaulipas	10	2023-06-30	23:46:47	19.444039	-104.852993	81 km al sur de Lake Heather	Tamaulipas	10	1	No se tuvo contacto con la aeronave	1	4
1621	2023-10-31	15:23:30	2	3	3	2	2	29.877516	-99.538686	54 km al sur de North Courtneyland	Monterrico	6	2023-10-31	06:49:52	29.828554	-99.476056	84 km al norte de West Gilbert	Monterrico	6	1	No se tuvo contacto con la aeronave	2	3
1622	2023-11-05	06:19:20	3	4	3	1	2	29.547419	-114.673488	52 km al este de Lake Manuel	Sonora	3	2023-11-05	09:44:30	29.534586	-114.742921	53 km al este de Wattston	Sonora	3	1	Identificación de aeronave sin contacto	2	3
1623	2024-01-11	05:07:21	2	4	2	2	1	19.446057	-111.615082	79 km al oeste de Kingshire	Durango	8	2024-01-11	14:35:32	19.515531	-111.684789	52 km al sur de Medinaport	Durango	8	2	Identificación de aeronave sin contacto	1	3
1624	2023-08-09	04:56:52	2	3	2	2	2	22.075700	-108.339647	92 km al este de East Kevinfort	Aguascalientes	7	2023-08-09	14:55:35	22.150735	-108.245123	82 km al norte de Lake Omartown	Aguascalientes	7	1	Identificación de aeronave sin contacto	1	2
1625	2023-11-25	08:42:13	2	4	2	2	1	21.928742	-115.862698	30 km al norte de Lake Sarah	CDMX	7	2023-11-25	08:31:23	21.860543	-115.766226	43 km al norte de Micheleside	CDMX	7	1	No se tuvo contacto con la aeronave	1	1
1626	2024-05-29	02:09:36	1	1	3	1	1	18.556416	-96.089338	34 km al este de New Summerport	Durango	7	2024-05-29	06:20:16	18.579793	-95.993273	20 km al este de North Charlesborough	Durango	7	2	No se tuvo contacto con la aeronave	1	3
1627	2024-03-23	12:28:27	1	1	1	2	1	20.383825	-90.196391	87 km al sur de Spencerland	Monterrey	8	2024-03-23	03:49:46	20.451638	-90.176645	63 km al norte de Jacksonton	Monterrey	8	2	Identificación de aeronave sin contacto	2	1
1628	2023-11-27	14:00:46	3	4	2	1	1	24.438866	-93.049630	90 km al norte de East Joshua	CDMX	6	2023-11-27	03:23:02	24.462153	-92.960207	30 km al sur de Huntermouth	CDMX	6	1	No se tuvo contacto con la aeronave	2	2
1629	2024-01-29	00:11:36	3	4	2	2	2	29.364013	-89.646748	66 km al oeste de West Kristaside	Tamaulipas	7	2024-01-29	08:57:29	29.438853	-89.698254	64 km al este de Gonzalezmouth	Tamaulipas	7	1	No se tuvo contacto con la aeronave	2	3
1630	2023-10-22	19:46:01	2	3	1	2	1	30.223164	-116.944288	16 km al oeste de Zacharystad	Tamaulipas	6	2023-10-22	13:05:35	30.166088	-116.935351	46 km al oeste de West Chad	Tamaulipas	6	2	Aseguramiento de aeronave	2	2
1631	2023-11-05	07:01:44	3	1	1	2	2	19.159420	-94.724084	21 km al sur de Millertown	Punta Espada	8	2023-11-05	20:39:42	19.168490	-94.794362	64 km al norte de Lunaport	Punta Espada	8	2	Aseguramiento de aeronave y detención de dos personas	2	1
1632	2023-10-14	06:16:02	3	1	3	1	1	25.753237	-86.684178	26 km al norte de Karentown	Punta Espada	9	2023-10-14	08:18:27	25.657833	-86.664441	63 km al este de South Lori	Punta Espada	9	2	Identificación de aeronave sin contacto	1	2
1633	2024-05-05	19:34:46	2	3	4	1	1	24.044748	-115.876958	49 km al oeste de West Daniel	Zacatecas	7	2024-05-05	20:52:58	24.144165	-115.849118	33 km al sur de New Brittney	Zacatecas	7	1	No se tuvo contacto con la aeronave	1	3
1634	2023-12-13	02:28:08	3	3	4	1	1	20.502976	-115.649203	97 km al norte de West Markstad	Baja California	9	2023-12-13	22:27:28	20.528829	-115.600647	35 km al norte de Pacemouth	Baja California	9	1	Aseguramiento de aeronave y detención de dos personas	2	3
1635	2024-05-13	19:51:36	1	2	4	2	1	30.544321	-106.598184	37 km al norte de Knightfort	Tamaulipas	6	2024-05-13	03:50:50	30.504418	-106.507988	86 km al oeste de Port Martinville	Tamaulipas	6	2	Aseguramiento de aeronave y carga	1	3
1636	2024-06-04	17:02:10	1	2	4	1	2	28.654187	-94.016108	14 km al este de Dustintown	San Jose	3	2024-06-04	03:47:00	28.706214	-93.976189	45 km al sur de Erinville	San Jose	3	1	Aseguramiento de aeronave	1	2
1637	2024-02-25	13:10:24	2	1	1	2	1	28.934716	-110.523698	15 km al oeste de Lake Cherylmouth	Querétaro	4	2024-02-25	08:16:21	29.017295	-110.542475	46 km al oeste de Gibsonland	Querétaro	4	2	Aseguramiento de aeronave y detención de dos personas	1	4
1638	2023-10-26	05:32:01	2	2	1	2	1	24.820813	-115.723150	16 km al oeste de Zimmermanfort	Sinaloa	9	2023-10-26	00:46:29	24.852686	-115.746604	13 km al este de Villanuevachester	Sinaloa	9	1	Identificación de aeronave sin contacto	1	4
1639	2024-05-04	00:46:01	2	1	2	2	2	21.576851	-96.455441	23 km al oeste de Bartonland	Guadalajara	1	2024-05-04	06:55:29	21.503254	-96.365800	88 km al norte de Jeremychester	Guadalajara	1	2	No se tuvo contacto con la aeronave	1	1
1640	2023-09-07	11:39:37	3	4	2	1	2	24.614851	-111.452703	35 km al sur de Port Stevenborough	Baja California	10	2023-09-07	21:51:45	24.523288	-111.464836	64 km al este de North Tammyside	Baja California	10	2	Aseguramiento de aeronave y detención de dos personas	2	4
1641	2024-02-25	00:33:56	1	4	4	2	2	30.964895	-108.405681	10 km al norte de Dawnport	Villahermosa	4	2024-02-25	00:21:29	31.034452	-108.391708	59 km al sur de Rubenland	Villahermosa	4	1	No se tuvo contacto con la aeronave	1	2
1642	2024-01-01	17:09:05	3	3	4	2	2	19.274857	-87.152656	38 km al este de Tannerfort	Zacatecas	7	2024-01-01	11:39:28	19.337774	-87.215576	92 km al este de Mcmillanstad	Zacatecas	7	2	Aseguramiento de aeronave y detención de dos personas	1	1
1643	2024-04-08	06:35:18	1	2	2	2	1	17.675096	-113.720254	95 km al oeste de East Christopherville	Durango	4	2024-04-08	08:55:08	17.605810	-113.645402	76 km al este de North Coryborough	Durango	4	2	No se tuvo contacto con la aeronave	2	2
1644	2024-06-26	07:30:33	3	2	4	1	1	28.438716	-91.068042	22 km al norte de Castanedafort	Cambutal	5	2024-06-26	03:32:51	28.379862	-91.060080	16 km al este de New John	Cambutal	5	2	Aseguramiento de aeronave y carga	2	4
1645	2024-04-29	18:27:26	1	2	1	1	2	22.714392	-92.900498	20 km al norte de New Colton	Sonora	8	2024-04-29	18:31:21	22.669256	-92.923186	44 km al sur de South Williamchester	Sonora	8	1	Identificación de aeronave sin contacto	2	4
1646	2023-12-24	03:16:29	2	4	1	1	1	29.455537	-107.719766	72 km al oeste de Port Josephport	El Salvador	5	2023-12-24	02:12:11	29.451766	-107.713562	40 km al este de Lake Danielle	El Salvador	5	1	Aseguramiento de aeronave y detención de dos personas	1	3
1647	2023-10-06	09:47:58	3	4	2	2	2	22.605187	-96.785690	58 km al este de Leechester	Baja California	5	2023-10-06	06:19:23	22.546600	-96.823741	76 km al oeste de Jefferyhaven	Baja California	5	2	No se tuvo contacto con la aeronave	1	3
1648	2024-06-18	09:51:56	2	4	2	1	2	30.853428	-113.908336	39 km al norte de Deborahshire	Querétaro	3	2024-06-18	21:11:34	30.755334	-113.877712	85 km al oeste de Saraport	Querétaro	3	1	Identificación de aeronave sin contacto	1	1
1649	2023-08-21	12:39:35	3	3	4	1	1	24.073365	-115.184879	34 km al norte de Brandonbury	Belmopan	9	2023-08-21	18:29:07	24.161269	-115.284584	87 km al este de Mooreside	Belmopan	9	1	Identificación de aeronave sin contacto	2	3
1650	2023-11-19	08:41:42	3	3	3	2	1	25.444880	-112.457860	74 km al oeste de Wrightfurt	San Jose	3	2023-11-19	12:34:20	25.499485	-112.413379	21 km al este de East Maria	San Jose	3	1	Aseguramiento de aeronave	1	4
1651	2023-11-13	04:48:51	3	4	4	2	1	20.185135	-93.969703	52 km al norte de Danaburgh	Monterrey	2	2023-11-13	05:42:12	20.233672	-94.047661	74 km al sur de Port Stephanie	Monterrey	2	2	No se tuvo contacto con la aeronave	2	3
1652	2023-07-24	15:55:51	1	3	4	2	2	23.311210	-94.918764	18 km al oeste de West Karen	Hermosillo	4	2023-07-24	01:28:38	23.404054	-94.927494	42 km al norte de Williamsburgh	Hermosillo	4	1	Aseguramiento de aeronave y carga	2	4
1653	2023-11-27	07:52:28	2	4	3	2	2	30.699787	-105.163556	36 km al norte de Davisbury	Cambutal	8	2023-11-27	14:41:42	30.762192	-105.094881	11 km al sur de Bowenport	Cambutal	8	2	No se tuvo contacto con la aeronave	1	2
1654	2023-10-10	03:09:42	2	2	2	1	1	17.474941	-100.412518	48 km al este de Mathewfort	Baja California	1	2023-10-10	01:22:52	17.375760	-100.337065	15 km al este de Briannamouth	Baja California	1	2	No se tuvo contacto con la aeronave	2	1
1655	2024-04-21	21:55:36	3	1	2	1	1	17.825569	-108.303685	54 km al norte de East Davidfort	San Jose	10	2024-04-21	16:32:53	17.800122	-108.280154	45 km al sur de Thomasborough	San Jose	10	2	No se tuvo contacto con la aeronave	1	2
1656	2023-07-29	16:14:58	1	3	3	2	1	17.598082	-89.433766	44 km al norte de Lake Courtney	Monterrey	9	2023-07-29	22:14:33	17.539475	-89.502519	76 km al oeste de East Jerry	Monterrey	9	1	No se tuvo contacto con la aeronave	2	3
1657	2023-12-15	22:45:59	3	1	3	2	2	29.809286	-100.952655	14 km al norte de Lake Carlosview	Baja California	9	2023-12-15	04:25:36	29.755964	-101.002492	61 km al norte de Allenberg	Baja California	9	1	Aseguramiento de aeronave	1	2
1658	2024-03-05	15:01:15	3	1	1	1	1	19.303017	-115.618314	11 km al este de Lake Amberchester	Guadalajara	4	2024-03-05	07:55:05	19.307095	-115.594504	86 km al sur de West Jessicabury	Guadalajara	4	2	Aseguramiento de aeronave y carga	1	1
1659	2024-05-13	00:42:37	3	4	3	1	2	17.779561	-113.191791	50 km al oeste de Gillberg	Veracruz	2	2024-05-13	11:50:08	17.687882	-113.214705	16 km al norte de Lake Stephanie	Veracruz	2	2	Aseguramiento de aeronave y detención de dos personas	2	1
1660	2024-06-21	01:46:38	1	1	1	2	1	25.981809	-98.877161	43 km al norte de East Dalebury	Veracruz	7	2024-06-21	20:25:07	26.055739	-98.910365	62 km al norte de Troyfort	Veracruz	7	2	Identificación de aeronave sin contacto	1	3
1661	2023-09-06	07:01:37	3	2	1	1	2	19.575336	-86.533433	62 km al oeste de East Douglas	Guadalajara	3	2023-09-06	08:15:49	19.608245	-86.539100	91 km al este de East Joseph	Guadalajara	3	1	No se tuvo contacto con la aeronave	1	4
1662	2023-10-03	17:39:48	3	4	4	1	2	29.661450	-97.713994	42 km al sur de East Juanchester	Belmopan	9	2023-10-03	23:05:34	29.589410	-97.659090	87 km al norte de New Deborahmouth	Belmopan	9	1	Aseguramiento de aeronave	1	3
1663	2024-04-29	10:42:57	1	4	3	1	2	18.590327	-112.618041	43 km al norte de Gordonberg	Querétaro	2	2024-04-29	02:52:58	18.653827	-112.683819	77 km al oeste de New Erica	Querétaro	2	2	Identificación de aeronave sin contacto	1	4
1664	2023-07-06	07:42:17	1	3	2	2	1	23.693908	-96.784598	99 km al oeste de Port Karen	Aguascalientes	7	2023-07-06	11:05:28	23.639226	-96.700463	12 km al norte de Hansentown	Aguascalientes	7	2	Identificación de aeronave sin contacto	2	1
1665	2024-04-30	09:08:20	2	4	3	2	2	28.987870	-90.610610	18 km al este de Lake Ryanhaven	Culiacán	8	2024-04-30	19:57:47	29.050954	-90.680892	28 km al norte de East Brian	Culiacán	8	2	No se tuvo contacto con la aeronave	2	1
1666	2024-06-25	14:31:19	3	2	2	2	2	24.571762	-90.469307	53 km al oeste de Amyhaven	Monterrey	5	2024-06-25	21:17:17	24.621158	-90.488840	49 km al este de Port Thomasland	Monterrey	5	1	Aseguramiento de aeronave y detención de dos personas	2	4
1667	2023-09-25	19:37:30	3	2	2	1	2	30.605451	-112.960123	30 km al oeste de North Davidport	Culiacán	6	2023-09-25	04:29:14	30.651471	-112.940168	42 km al este de Deborahland	Culiacán	6	1	No se tuvo contacto con la aeronave	2	2
1668	2024-05-08	11:10:56	1	1	2	1	2	24.978054	-114.421863	80 km al oeste de Kathrynborough	Tamaulipas	3	2024-05-08	04:26:52	24.930215	-114.463070	52 km al sur de New Travis	Tamaulipas	3	1	Aseguramiento de aeronave y carga	1	2
1669	2023-07-12	05:28:29	1	3	4	1	1	28.132915	-112.258015	44 km al este de East Lauren	Villahermosa	2	2023-07-12	19:26:33	28.132847	-112.165305	61 km al sur de North Barbaraview	Villahermosa	2	1	Aseguramiento de aeronave y detención de dos personas	1	4
1670	2024-02-26	18:14:48	2	3	3	2	2	21.072903	-111.861179	87 km al oeste de South Amandaton	El Salvador	3	2024-02-26	23:36:47	21.003252	-111.929013	68 km al norte de Hooperstad	El Salvador	3	1	Aseguramiento de aeronave y carga	1	2
1671	2023-07-22	23:41:32	1	3	2	1	1	30.529931	-86.770619	96 km al norte de West Joannestad	Punta Espada	4	2023-07-22	19:45:20	30.564793	-86.697611	90 km al norte de North Jamesborough	Punta Espada	4	1	No se tuvo contacto con la aeronave	1	3
1672	2024-04-22	11:25:46	3	4	1	2	1	22.286513	-107.488122	61 km al norte de North Roberthaven	Querétaro	4	2024-04-22	01:07:38	22.216783	-107.467706	97 km al norte de Pagechester	Querétaro	4	1	Identificación de aeronave sin contacto	2	3
1673	2023-11-20	14:58:43	2	4	2	1	2	19.981450	-93.768292	83 km al este de Piercefort	Guadalajara	2	2023-11-20	23:20:18	19.961447	-93.669874	28 km al este de Crystalfort	Guadalajara	2	1	Identificación de aeronave sin contacto	1	4
1674	2023-06-30	21:30:44	1	4	1	1	1	28.658547	-93.236627	72 km al oeste de Michaelborough	Veracruz	1	2023-06-30	12:21:52	28.696880	-93.288039	81 km al oeste de Yvonnefurt	Veracruz	1	1	Aseguramiento de aeronave y detención de dos personas	2	2
1675	2024-06-22	01:06:02	1	2	1	1	2	30.239985	-89.732858	27 km al oeste de Leonland	Sonora	4	2024-06-22	23:21:47	30.218932	-89.756764	90 km al este de Bobfort	Sonora	4	1	Aseguramiento de aeronave y detención de dos personas	2	3
1676	2024-01-17	21:18:16	3	3	4	2	2	19.607148	-113.065753	59 km al sur de Lake Ninaville	Hermosillo	8	2024-01-17	15:30:42	19.541742	-113.123202	89 km al este de East Nathan	Hermosillo	8	2	No se tuvo contacto con la aeronave	2	2
1677	2024-03-18	08:34:20	1	3	3	2	1	23.566362	-114.926396	25 km al sur de North Tonibury	CDMX	1	2024-03-18	08:40:47	23.605203	-114.866464	58 km al norte de South Steven	CDMX	1	2	Identificación de aeronave sin contacto	2	3
1678	2023-12-14	01:32:18	3	4	3	1	1	19.821532	-110.583422	98 km al sur de Jillmouth	Culiacán	8	2023-12-14	22:50:29	19.795771	-110.668652	92 km al este de Andreatown	Culiacán	8	2	Identificación de aeronave sin contacto	2	1
1679	2023-10-08	19:35:02	1	1	2	2	1	17.649677	-103.807879	76 km al este de Amandabury	Sinaloa	4	2023-10-08	07:06:36	17.636429	-103.790631	94 km al este de Adamsfurt	Sinaloa	4	2	Aseguramiento de aeronave	2	2
1680	2024-05-29	11:56:19	1	1	1	1	1	27.141713	-111.288651	12 km al sur de West Robert	Culiacán	10	2024-05-29	20:24:48	27.179738	-111.362894	53 km al oeste de East Francishaven	Culiacán	10	2	No se tuvo contacto con la aeronave	2	3
1681	2023-10-04	04:12:44	3	2	4	2	1	26.828707	-94.681096	15 km al este de Caseyshire	Culiacán	2	2023-10-04	17:12:38	26.749526	-94.746323	61 km al sur de Barberstad	Culiacán	2	1	Identificación de aeronave sin contacto	1	1
1682	2023-07-26	07:40:58	2	3	3	1	2	19.077595	-105.762419	70 km al este de East Ericshire	Veracruz	8	2023-07-26	10:59:42	18.998947	-105.781926	67 km al este de New Bryanport	Veracruz	8	1	Aseguramiento de aeronave	2	3
1683	2023-09-13	02:47:19	1	4	3	2	2	26.711129	-110.543762	72 km al sur de Reyesside	Sonora	2	2023-09-13	18:22:18	26.628259	-110.500177	34 km al este de New Travis	Sonora	2	2	Aseguramiento de aeronave y carga	1	1
1684	2024-02-06	11:35:35	2	2	4	2	1	19.466462	-110.522800	60 km al este de Lorihaven	Veracruz	10	2024-02-06	13:04:49	19.392917	-110.549111	62 km al este de Vickifort	Veracruz	10	1	Aseguramiento de aeronave y detención de dos personas	2	1
1685	2023-11-29	05:23:33	2	4	4	1	2	25.458189	-100.197824	23 km al oeste de Lake Kelseyhaven	Veracruz	7	2023-11-29	16:38:09	25.359840	-100.240377	73 km al sur de West Graceton	Veracruz	7	1	Aseguramiento de aeronave y carga	2	2
1686	2024-04-15	08:57:02	3	1	3	1	2	18.595284	-95.557338	90 km al norte de Crystalshire	Monterrey	3	2024-04-15	07:54:19	18.548035	-95.486439	46 km al sur de East Alexis	Monterrey	3	1	Aseguramiento de aeronave y detención de dos personas	1	4
1687	2024-03-14	08:15:10	2	4	4	1	1	28.985600	-102.997883	45 km al sur de Huffton	Guadalajara	2	2024-03-14	15:20:46	28.959181	-103.071564	65 km al norte de West Kristinberg	Guadalajara	2	2	Aseguramiento de aeronave	1	2
1688	2024-01-24	20:13:44	3	4	4	1	1	23.685249	-93.130968	12 km al sur de West Aaronchester	Tamaulipas	4	2024-01-24	10:26:18	23.642380	-93.218580	76 km al este de West Sandra	Tamaulipas	4	1	No se tuvo contacto con la aeronave	2	2
1689	2023-09-23	10:32:12	3	3	3	2	2	30.857647	-89.107401	28 km al norte de New Josephmouth	Villahermosa	4	2023-09-23	11:32:10	30.901927	-89.139023	50 km al oeste de Haydenside	Villahermosa	4	2	No se tuvo contacto con la aeronave	1	4
1690	2023-08-27	13:20:16	1	2	3	2	1	27.275710	-91.711267	50 km al este de North Alejandrabury	El Salvador	9	2023-08-27	02:07:43	27.179263	-91.644714	15 km al norte de South Patriciaberg	El Salvador	9	2	Aseguramiento de aeronave y carga	1	2
1691	2023-10-06	02:10:39	2	2	2	2	1	25.506192	-110.840598	27 km al sur de Donaldhaven	Tepic	2	2023-10-06	06:11:39	25.557163	-110.756687	30 km al norte de Salazarburgh	Tepic	2	2	Aseguramiento de aeronave	2	4
1692	2024-01-25	07:42:45	3	2	1	2	1	21.205045	-102.968438	45 km al oeste de South Stacy	Hermosillo	9	2024-01-25	09:49:49	21.114501	-102.908650	99 km al oeste de New Kimberly	Hermosillo	9	2	Aseguramiento de aeronave y detención de dos personas	1	2
1693	2023-08-08	06:43:51	1	3	4	1	2	21.647093	-89.060235	30 km al oeste de North Davidtown	Monterrey	5	2023-08-08	09:23:21	21.573527	-89.003016	36 km al oeste de Port Thomas	Monterrey	5	1	Aseguramiento de aeronave y carga	1	3
1694	2024-06-23	06:26:27	1	3	1	1	2	29.194054	-94.010516	41 km al oeste de Masseymouth	CDMX	7	2024-06-23	05:13:11	29.269571	-94.005265	15 km al oeste de Lake Whitney	CDMX	7	2	Aseguramiento de aeronave y detención de dos personas	2	2
1695	2023-12-13	22:11:59	1	1	2	1	1	30.349940	-99.073485	51 km al oeste de Lake Deborahborough	Hermosillo	9	2023-12-13	05:29:10	30.406894	-99.002952	25 km al norte de Gonzalestown	Hermosillo	9	1	Aseguramiento de aeronave y carga	2	1
1696	2024-02-09	14:31:25	3	4	1	1	1	26.044386	-94.835895	24 km al sur de Joshuamouth	Zacatecas	1	2024-02-09	09:56:41	26.106101	-94.889304	48 km al este de Valerieland	Zacatecas	1	1	Aseguramiento de aeronave y detención de dos personas	2	3
1697	2024-02-11	01:49:02	2	3	1	1	2	17.808584	-111.479820	52 km al este de Vaughnburgh	Zacatecas	3	2024-02-11	12:29:55	17.714377	-111.515640	71 km al oeste de Port Jessicafort	Zacatecas	3	1	Aseguramiento de aeronave y detención de dos personas	1	2
1698	2024-06-26	21:14:06	1	2	1	1	1	23.342504	-111.692969	77 km al este de Port Keithtown	Villahermosa	5	2024-06-26	05:38:12	23.373583	-111.687858	82 km al norte de Port William	Villahermosa	5	2	Aseguramiento de aeronave y carga	1	2
1699	2023-12-28	20:15:52	2	4	4	2	2	29.588889	-98.181281	17 km al norte de Montgomerychester	Monterrico	3	2023-12-28	15:40:01	29.598417	-98.129235	12 km al oeste de East Danaland	Monterrico	3	2	No se tuvo contacto con la aeronave	2	3
1700	2023-08-08	23:34:11	2	2	2	1	1	22.325744	-90.475387	72 km al oeste de Josephberg	CDMX	2	2023-08-08	10:05:11	22.372507	-90.466817	67 km al oeste de Lake Kevin	CDMX	2	2	No se tuvo contacto con la aeronave	2	2
1701	2024-03-08	15:58:24	2	3	1	1	1	23.460546	-86.918896	46 km al oeste de Jaredchester	San Jose	4	2024-03-08	17:12:37	23.361198	-86.893728	44 km al norte de East Eddie	San Jose	4	1	Identificación de aeronave sin contacto	1	2
1702	2024-02-20	10:02:26	2	3	1	2	1	19.764476	-110.141529	63 km al norte de Leblancfort	Culiacán	7	2024-02-20	07:04:42	19.677428	-110.230620	74 km al este de Lake Tami	Culiacán	7	1	Aseguramiento de aeronave y detención de dos personas	2	1
1703	2023-11-15	01:05:40	1	2	1	1	1	28.755252	-94.639038	64 km al sur de Virginiaborough	Veracruz	1	2023-11-15	04:43:20	28.700085	-94.557044	47 km al este de North Jacqueline	Veracruz	1	2	No se tuvo contacto con la aeronave	2	4
1704	2024-06-17	19:39:49	3	1	4	2	1	23.111799	-100.733618	66 km al sur de East Edwin	Guadalajara	7	2024-06-17	01:53:25	23.092646	-100.811281	41 km al sur de South Jo	Guadalajara	7	2	Aseguramiento de aeronave y detención de dos personas	1	4
1705	2024-06-18	21:54:25	1	2	3	1	2	30.947582	-116.980261	45 km al sur de East Jeffery	Aguascalientes	3	2024-06-18	10:40:00	31.038010	-116.992295	57 km al norte de North Victoria	Aguascalientes	3	2	Aseguramiento de aeronave y detención de dos personas	2	3
1706	2023-07-25	09:19:12	2	1	4	1	2	28.230507	-91.363496	86 km al oeste de Lake Josephberg	CDMX	2	2023-07-25	21:29:28	28.322248	-91.417125	13 km al este de Beanberg	CDMX	2	2	Identificación de aeronave sin contacto	1	3
1707	2023-12-16	13:48:42	3	1	4	2	2	20.365241	-93.156021	44 km al sur de Christianville	Punta Espada	7	2023-12-16	16:13:10	20.286824	-93.191667	10 km al este de Darrylhaven	Punta Espada	7	1	Aseguramiento de aeronave	2	1
1708	2024-01-23	21:38:00	1	4	2	1	2	20.785532	-90.900973	52 km al este de New Jamesborough	Veracruz	8	2024-01-23	00:01:41	20.823389	-90.851020	24 km al sur de Port Elizabethberg	Veracruz	8	2	No se tuvo contacto con la aeronave	1	4
1709	2023-07-11	01:16:59	2	4	4	2	2	18.922863	-102.537222	75 km al este de New Leroy	CDMX	1	2023-07-11	06:36:11	19.000120	-102.529033	76 km al este de Floresside	CDMX	1	2	Aseguramiento de aeronave y carga	1	2
1710	2023-12-16	02:00:31	3	1	4	1	2	17.116679	-116.246535	89 km al este de East Angela	Aguascalientes	2	2023-12-16	13:50:42	17.064442	-116.297153	66 km al sur de North Cindy	Aguascalientes	2	1	No se tuvo contacto con la aeronave	1	3
1711	2023-12-10	07:24:10	3	2	2	1	1	28.689543	-102.323100	52 km al sur de Lake Carolyn	El Salvador	5	2023-12-10	11:20:59	28.683029	-102.317395	64 km al norte de Johnsonport	El Salvador	5	1	Aseguramiento de aeronave y carga	2	3
1712	2024-01-23	04:51:51	3	1	3	1	2	29.330048	-108.997594	43 km al norte de Michaelbury	Tamaulipas	2	2024-01-23	17:28:43	29.326604	-108.951163	27 km al sur de Lake Emily	Tamaulipas	2	1	Identificación de aeronave sin contacto	1	3
\.


--
-- TOC entry 4879 (class 0 OID 16487)
-- Dependencies: 218
-- Data for Name: cat_grados; Type: TABLE DATA; Schema: alertas; Owner: postgres
--

COPY alertas.cat_grados (id_grado, grados) FROM stdin;
1	guardia
2	Subagente
3	Agente
4	Agente mayor
5	Suboficial
6	Oficial
7	Segundo Subinspector
8	Primer Subinspector
9	Inspector
10	Comisario General
\.


--
-- TOC entry 4881 (class 0 OID 16491)
-- Dependencies: 220
-- Data for Name: cat_pais; Type: TABLE DATA; Schema: alertas; Owner: postgres
--

COPY alertas.cat_pais (id_pais, pais) FROM stdin;
1	Mexico
2	Belice
3	El salvador
4	Colombia
5	Guatemala
6	Costa Rica
7	Chile
8	Ecuador
9	EUA
10	Panama
\.


--
-- TOC entry 4883 (class 0 OID 16495)
-- Dependencies: 222
-- Data for Name: cat_resultado; Type: TABLE DATA; Schema: alertas; Owner: postgres
--

COPY alertas.cat_resultado (id_resultado, resultado) FROM stdin;
1	Positivo
2	Negativo
\.


--
-- TOC entry 4885 (class 0 OID 16499)
-- Dependencies: 224
-- Data for Name: cat_rumbo; Type: TABLE DATA; Schema: alertas; Owner: postgres
--

COPY alertas.cat_rumbo (id_rumbo, rumbo) FROM stdin;
1	Norte
2	Sur
\.


--
-- TOC entry 4887 (class 0 OID 16503)
-- Dependencies: 226
-- Data for Name: cat_tipo_trafico; Type: TABLE DATA; Schema: alertas; Owner: postgres
--

COPY alertas.cat_tipo_trafico (id_tipo, tipo) FROM stdin;
1	Blanco
2	Rothr
3	Alerta Terrestre
4	Ultraligera
\.


--
-- TOC entry 4889 (class 0 OID 16507)
-- Dependencies: 228
-- Data for Name: cat_trafico_status; Type: TABLE DATA; Schema: alertas; Owner: postgres
--

COPY alertas.cat_trafico_status (id_status, status) FROM stdin;
1	Identificado
2	No identificado
\.


--
-- TOC entry 4891 (class 0 OID 16511)
-- Dependencies: 230
-- Data for Name: cat_turno; Type: TABLE DATA; Schema: alertas; Owner: postgres
--

COPY alertas.cat_turno (id_turno, turno) FROM stdin;
1	matutino
2	Vespertino
3	Nocturno
\.


--
-- TOC entry 4893 (class 0 OID 16515)
-- Dependencies: 232
-- Data for Name: tbl_elementos; Type: TABLE DATA; Schema: alertas; Owner: postgres
--

COPY alertas.tbl_elementos (id_elemento, nombre, apellido, apellido2, expediente, id_grado, id_status_responsable) FROM stdin;
1	Julio David	Flores	Conde	55759	6	1
2	Marvin Noel	Guzman	Reyes	58895	8	1
3	Gabriela	Garcia	Mendoza	59121	5	2
4	Aura	Pech	Reyes	205052	1	2
5	Manuel	Barrientos	Quintero	72416	5	2
\.


--
-- TOC entry 4895 (class 0 OID 16519)
-- Dependencies: 234
-- Data for Name: tbl_status_responsable; Type: TABLE DATA; Schema: alertas; Owner: postgres
--

COPY alertas.tbl_status_responsable (id_status_responsable, status) FROM stdin;
1	Si
2	No
\.


--
-- TOC entry 4898 (class 0 OID 16524)
-- Dependencies: 237
-- Data for Name: user_access; Type: TABLE DATA; Schema: alertas; Owner: postgres
--

COPY alertas.user_access (user_id, id_elemento, username, password_hash, email) FROM stdin;
1	1	juldfconde	12345	juldfconde@gmail.com
2	2	marvin12	45678	marvin_1234@gmail.com
3	3	gaby14	132436	gaby123@gmail.com
4	4	aura54	657483	aura43@gmail.com
5	5	manuel43	565674	barrientos234@gmail.com
\.


--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 217
-- Name: bitacora_id_registro_seq; Type: SEQUENCE SET; Schema: alertas; Owner: postgres
--

SELECT pg_catalog.setval('alertas.bitacora_id_registro_seq', 1712, true);


--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 219
-- Name: cat_grados_id_grado_seq; Type: SEQUENCE SET; Schema: alertas; Owner: postgres
--

SELECT pg_catalog.setval('alertas.cat_grados_id_grado_seq', 10, true);


--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 221
-- Name: cat_pais_id_pais_seq; Type: SEQUENCE SET; Schema: alertas; Owner: postgres
--

SELECT pg_catalog.setval('alertas.cat_pais_id_pais_seq', 10, true);


--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 223
-- Name: cat_resultado_id_resultado_seq; Type: SEQUENCE SET; Schema: alertas; Owner: postgres
--

SELECT pg_catalog.setval('alertas.cat_resultado_id_resultado_seq', 2, true);


--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 225
-- Name: cat_rumbo_id_rumbo_seq; Type: SEQUENCE SET; Schema: alertas; Owner: postgres
--

SELECT pg_catalog.setval('alertas.cat_rumbo_id_rumbo_seq', 2, true);


--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 227
-- Name: cat_tipo_trafico_id_tipo_seq; Type: SEQUENCE SET; Schema: alertas; Owner: postgres
--

SELECT pg_catalog.setval('alertas.cat_tipo_trafico_id_tipo_seq', 4, true);


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 229
-- Name: cat_trafico_status_id_status_seq; Type: SEQUENCE SET; Schema: alertas; Owner: postgres
--

SELECT pg_catalog.setval('alertas.cat_trafico_status_id_status_seq', 2, true);


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 231
-- Name: cat_turno_id_turno_seq; Type: SEQUENCE SET; Schema: alertas; Owner: postgres
--

SELECT pg_catalog.setval('alertas.cat_turno_id_turno_seq', 3, true);


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 233
-- Name: tbl_elementos_id_elemento_seq; Type: SEQUENCE SET; Schema: alertas; Owner: postgres
--

SELECT pg_catalog.setval('alertas.tbl_elementos_id_elemento_seq', 5, true);


--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 235
-- Name: tbl_status_responsable_id_status_responsable_seq; Type: SEQUENCE SET; Schema: alertas; Owner: postgres
--

SELECT pg_catalog.setval('alertas.tbl_status_responsable_id_status_responsable_seq', 2, true);


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 236
-- Name: user_access_user_id_seq; Type: SEQUENCE SET; Schema: alertas; Owner: postgres
--

SELECT pg_catalog.setval('alertas.user_access_user_id_seq', 5, true);


--
-- TOC entry 4697 (class 2606 OID 16539)
-- Name: bitacora bitacora_pkey; Type: CONSTRAINT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.bitacora
    ADD CONSTRAINT bitacora_pkey PRIMARY KEY (id_registro);


--
-- TOC entry 4699 (class 2606 OID 16541)
-- Name: cat_grados cat_grados_pkey; Type: CONSTRAINT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.cat_grados
    ADD CONSTRAINT cat_grados_pkey PRIMARY KEY (id_grado);


--
-- TOC entry 4701 (class 2606 OID 16543)
-- Name: cat_pais cat_pais_pkey; Type: CONSTRAINT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.cat_pais
    ADD CONSTRAINT cat_pais_pkey PRIMARY KEY (id_pais);


--
-- TOC entry 4703 (class 2606 OID 16545)
-- Name: cat_resultado cat_resultado_pkey; Type: CONSTRAINT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.cat_resultado
    ADD CONSTRAINT cat_resultado_pkey PRIMARY KEY (id_resultado);


--
-- TOC entry 4705 (class 2606 OID 16547)
-- Name: cat_rumbo cat_rumbo_pkey; Type: CONSTRAINT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.cat_rumbo
    ADD CONSTRAINT cat_rumbo_pkey PRIMARY KEY (id_rumbo);


--
-- TOC entry 4707 (class 2606 OID 16549)
-- Name: cat_tipo_trafico cat_tipo_trafico_pkey; Type: CONSTRAINT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.cat_tipo_trafico
    ADD CONSTRAINT cat_tipo_trafico_pkey PRIMARY KEY (id_tipo);


--
-- TOC entry 4709 (class 2606 OID 16551)
-- Name: cat_trafico_status cat_trafico_status_pkey; Type: CONSTRAINT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.cat_trafico_status
    ADD CONSTRAINT cat_trafico_status_pkey PRIMARY KEY (id_status);


--
-- TOC entry 4711 (class 2606 OID 16553)
-- Name: cat_turno cat_turno_pkey; Type: CONSTRAINT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.cat_turno
    ADD CONSTRAINT cat_turno_pkey PRIMARY KEY (id_turno);


--
-- TOC entry 4713 (class 2606 OID 16555)
-- Name: tbl_elementos tbl_elementos_pkey; Type: CONSTRAINT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.tbl_elementos
    ADD CONSTRAINT tbl_elementos_pkey PRIMARY KEY (id_elemento);


--
-- TOC entry 4715 (class 2606 OID 16557)
-- Name: tbl_status_responsable tbl_status_responsable_pkey; Type: CONSTRAINT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.tbl_status_responsable
    ADD CONSTRAINT tbl_status_responsable_pkey PRIMARY KEY (id_status_responsable);


--
-- TOC entry 4717 (class 2606 OID 16559)
-- Name: user_access user_access_email_key; Type: CONSTRAINT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.user_access
    ADD CONSTRAINT user_access_email_key UNIQUE (email);


--
-- TOC entry 4719 (class 2606 OID 16561)
-- Name: user_access user_access_pkey; Type: CONSTRAINT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.user_access
    ADD CONSTRAINT user_access_pkey PRIMARY KEY (user_id);


--
-- TOC entry 4721 (class 2606 OID 16563)
-- Name: user_access user_access_username_key; Type: CONSTRAINT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.user_access
    ADD CONSTRAINT user_access_username_key UNIQUE (username);


--
-- TOC entry 4722 (class 2606 OID 16564)
-- Name: bitacora bitacora_elemento_capturo_fkey; Type: FK CONSTRAINT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.bitacora
    ADD CONSTRAINT bitacora_elemento_capturo_fkey FOREIGN KEY (elemento_capturo) REFERENCES alertas.tbl_elementos(id_elemento);


--
-- TOC entry 4723 (class 2606 OID 16569)
-- Name: bitacora bitacora_id_pais_deteccion_fkey; Type: FK CONSTRAINT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.bitacora
    ADD CONSTRAINT bitacora_id_pais_deteccion_fkey FOREIGN KEY (id_pais_deteccion) REFERENCES alertas.cat_pais(id_pais);


--
-- TOC entry 4724 (class 2606 OID 16574)
-- Name: bitacora bitacora_id_pais_pcr_fkey; Type: FK CONSTRAINT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.bitacora
    ADD CONSTRAINT bitacora_id_pais_pcr_fkey FOREIGN KEY (id_pais_pcr) REFERENCES alertas.cat_pais(id_pais);


--
-- TOC entry 4725 (class 2606 OID 16579)
-- Name: bitacora bitacora_id_responsable_turno_fkey; Type: FK CONSTRAINT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.bitacora
    ADD CONSTRAINT bitacora_id_responsable_turno_fkey FOREIGN KEY (id_responsable_turno) REFERENCES alertas.tbl_elementos(id_elemento);


--
-- TOC entry 4726 (class 2606 OID 16584)
-- Name: bitacora bitacora_id_resultado_fkey; Type: FK CONSTRAINT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.bitacora
    ADD CONSTRAINT bitacora_id_resultado_fkey FOREIGN KEY (id_resultado) REFERENCES alertas.cat_resultado(id_resultado);


--
-- TOC entry 4727 (class 2606 OID 16589)
-- Name: bitacora bitacora_id_rumbo_fkey; Type: FK CONSTRAINT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.bitacora
    ADD CONSTRAINT bitacora_id_rumbo_fkey FOREIGN KEY (id_rumbo) REFERENCES alertas.cat_rumbo(id_rumbo);


--
-- TOC entry 4728 (class 2606 OID 16594)
-- Name: bitacora bitacora_id_status_fkey; Type: FK CONSTRAINT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.bitacora
    ADD CONSTRAINT bitacora_id_status_fkey FOREIGN KEY (id_status) REFERENCES alertas.cat_trafico_status(id_status);


--
-- TOC entry 4729 (class 2606 OID 16599)
-- Name: bitacora bitacora_id_tipo_trafico_fkey; Type: FK CONSTRAINT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.bitacora
    ADD CONSTRAINT bitacora_id_tipo_trafico_fkey FOREIGN KEY (id_tipo_trafico) REFERENCES alertas.cat_tipo_trafico(id_tipo);


--
-- TOC entry 4730 (class 2606 OID 16604)
-- Name: bitacora bitacora_id_turno_fkey; Type: FK CONSTRAINT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.bitacora
    ADD CONSTRAINT bitacora_id_turno_fkey FOREIGN KEY (id_turno) REFERENCES alertas.cat_turno(id_turno);


--
-- TOC entry 4733 (class 2606 OID 16609)
-- Name: user_access fk_elemento; Type: FK CONSTRAINT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.user_access
    ADD CONSTRAINT fk_elemento FOREIGN KEY (id_elemento) REFERENCES alertas.tbl_elementos(id_elemento);


--
-- TOC entry 4731 (class 2606 OID 16614)
-- Name: tbl_elementos tbl_elementos_id_grado_fkey; Type: FK CONSTRAINT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.tbl_elementos
    ADD CONSTRAINT tbl_elementos_id_grado_fkey FOREIGN KEY (id_grado) REFERENCES alertas.cat_grados(id_grado);


--
-- TOC entry 4732 (class 2606 OID 16619)
-- Name: tbl_elementos tbl_elementos_id_status_responsable_fkey; Type: FK CONSTRAINT; Schema: alertas; Owner: postgres
--

ALTER TABLE ONLY alertas.tbl_elementos
    ADD CONSTRAINT tbl_elementos_id_status_responsable_fkey FOREIGN KEY (id_status_responsable) REFERENCES alertas.tbl_status_responsable(id_status_responsable);


-- Completed on 2024-06-27 10:59:15

--
-- PostgreSQL database dump complete
--

