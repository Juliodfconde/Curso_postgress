--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-06-26 20:45:25

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

SELECT pg_catalog.setval('alertas.bitacora_id_registro_seq', 12, true);


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


-- Completed on 2024-06-26 20:45:25

--
-- PostgreSQL database dump complete
--

