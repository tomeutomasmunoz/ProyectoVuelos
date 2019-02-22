--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: companias; Type: TABLE; Schema: public; Owner: usuario
--

CREATE TABLE public.companias (
    "idCompania" integer NOT NULL,
    nombre character varying(100) NOT NULL,
    "nombreLogo" integer NOT NULL,
    "uuidLogo" integer NOT NULL
);


ALTER TABLE public.companias OWNER TO usuario;

--
-- Name: companias_idCompania_seq; Type: SEQUENCE; Schema: public; Owner: usuario
--

CREATE SEQUENCE public."companias_idCompania_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."companias_idCompania_seq" OWNER TO usuario;

--
-- Name: companias_idCompania_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usuario
--

ALTER SEQUENCE public."companias_idCompania_seq" OWNED BY public.companias."idCompania";


--
-- Name: companias_nombreLogo_seq; Type: SEQUENCE; Schema: public; Owner: usuario
--

CREATE SEQUENCE public."companias_nombreLogo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."companias_nombreLogo_seq" OWNER TO usuario;

--
-- Name: companias_nombreLogo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usuario
--

ALTER SEQUENCE public."companias_nombreLogo_seq" OWNED BY public.companias."nombreLogo";


--
-- Name: companias_uuidLogo_seq; Type: SEQUENCE; Schema: public; Owner: usuario
--

CREATE SEQUENCE public."companias_uuidLogo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."companias_uuidLogo_seq" OWNER TO usuario;

--
-- Name: companias_uuidLogo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usuario
--

ALTER SEQUENCE public."companias_uuidLogo_seq" OWNED BY public.companias."uuidLogo";


--
-- Name: destinos; Type: TABLE; Schema: public; Owner: usuario
--

CREATE TABLE public.destinos (
    "idDestino" integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.destinos OWNER TO usuario;

--
-- Name: destinos_idDestino_seq; Type: SEQUENCE; Schema: public; Owner: usuario
--

CREATE SEQUENCE public."destinos_idDestino_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."destinos_idDestino_seq" OWNER TO usuario;

--
-- Name: destinos_idDestino_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usuario
--

ALTER SEQUENCE public."destinos_idDestino_seq" OWNED BY public.destinos."idDestino";


--
-- Name: estados; Type: TABLE; Schema: public; Owner: usuario
--

CREATE TABLE public.estados (
    "idEstado" integer NOT NULL,
    estado character varying(255) NOT NULL,
    hora time(6) without time zone NOT NULL,
    cancelado boolean DEFAULT false NOT NULL
);


ALTER TABLE public.estados OWNER TO usuario;

--
-- Name: COLUMN estados.cancelado; Type: COMMENT; Schema: public; Owner: usuario
--

COMMENT ON COLUMN public.estados.cancelado IS 'CANCELADO = TRUE - NO CANCELADO = FALSE';


--
-- Name: estados_idEstado_seq; Type: SEQUENCE; Schema: public; Owner: usuario
--

CREATE SEQUENCE public."estados_idEstado_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."estados_idEstado_seq" OWNER TO usuario;

--
-- Name: estados_idEstado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usuario
--

ALTER SEQUENCE public."estados_idEstado_seq" OWNED BY public.estados."idEstado";


--
-- Name: estados_vuelos; Type: TABLE; Schema: public; Owner: usuario
--

CREATE TABLE public.estados_vuelos (
    "idVuelo" integer NOT NULL,
    "idEstado" integer NOT NULL
);


ALTER TABLE public.estados_vuelos OWNER TO usuario;

--
-- Name: puertas; Type: TABLE; Schema: public; Owner: usuario
--

CREATE TABLE public.puertas (
    "idPuerta" integer NOT NULL,
    letra character varying(100) NOT NULL,
    numero integer NOT NULL
);


ALTER TABLE public.puertas OWNER TO usuario;

--
-- Name: puertas_idPuerta_seq; Type: SEQUENCE; Schema: public; Owner: usuario
--

CREATE SEQUENCE public."puertas_idPuerta_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."puertas_idPuerta_seq" OWNER TO usuario;

--
-- Name: puertas_idPuerta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usuario
--

ALTER SEQUENCE public."puertas_idPuerta_seq" OWNED BY public.puertas."idPuerta";


--
-- Name: vuelos; Type: TABLE; Schema: public; Owner: usuario
--

CREATE TABLE public.vuelos (
    "idVuelo" integer NOT NULL,
    "idCompania" integer NOT NULL,
    "idDestino" integer NOT NULL,
    "idPuerta" integer NOT NULL,
    hora time(6) without time zone NOT NULL,
    informacion character varying(100) NOT NULL
);


ALTER TABLE public.vuelos OWNER TO usuario;

--
-- Name: COLUMN vuelos.informacion; Type: COMMENT; Schema: public; Owner: usuario
--

COMMENT ON COLUMN public.vuelos.informacion IS 'SALIDAS/LLEGADAS';


--
-- Name: vuelos_idVuelo_seq; Type: SEQUENCE; Schema: public; Owner: usuario
--

CREATE SEQUENCE public."vuelos_idVuelo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."vuelos_idVuelo_seq" OWNER TO usuario;

--
-- Name: vuelos_idVuelo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usuario
--

ALTER SEQUENCE public."vuelos_idVuelo_seq" OWNED BY public.vuelos."idVuelo";


--
-- Name: companias idCompania; Type: DEFAULT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY public.companias ALTER COLUMN "idCompania" SET DEFAULT nextval('public."companias_idCompania_seq"'::regclass);


--
-- Name: companias nombreLogo; Type: DEFAULT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY public.companias ALTER COLUMN "nombreLogo" SET DEFAULT nextval('public."companias_nombreLogo_seq"'::regclass);


--
-- Name: companias uuidLogo; Type: DEFAULT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY public.companias ALTER COLUMN "uuidLogo" SET DEFAULT nextval('public."companias_uuidLogo_seq"'::regclass);


--
-- Name: destinos idDestino; Type: DEFAULT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY public.destinos ALTER COLUMN "idDestino" SET DEFAULT nextval('public."destinos_idDestino_seq"'::regclass);


--
-- Name: estados idEstado; Type: DEFAULT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY public.estados ALTER COLUMN "idEstado" SET DEFAULT nextval('public."estados_idEstado_seq"'::regclass);


--
-- Name: puertas idPuerta; Type: DEFAULT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY public.puertas ALTER COLUMN "idPuerta" SET DEFAULT nextval('public."puertas_idPuerta_seq"'::regclass);


--
-- Name: vuelos idVuelo; Type: DEFAULT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY public.vuelos ALTER COLUMN "idVuelo" SET DEFAULT nextval('public."vuelos_idVuelo_seq"'::regclass);


--
-- Data for Name: companias; Type: TABLE DATA; Schema: public; Owner: usuario
--



--
-- Data for Name: destinos; Type: TABLE DATA; Schema: public; Owner: usuario
--



--
-- Data for Name: estados; Type: TABLE DATA; Schema: public; Owner: usuario
--



--
-- Data for Name: estados_vuelos; Type: TABLE DATA; Schema: public; Owner: usuario
--



--
-- Data for Name: puertas; Type: TABLE DATA; Schema: public; Owner: usuario
--



--
-- Data for Name: vuelos; Type: TABLE DATA; Schema: public; Owner: usuario
--



--
-- Name: companias_idCompania_seq; Type: SEQUENCE SET; Schema: public; Owner: usuario
--

SELECT pg_catalog.setval('public."companias_idCompania_seq"', 1, false);


--
-- Name: companias_nombreLogo_seq; Type: SEQUENCE SET; Schema: public; Owner: usuario
--

SELECT pg_catalog.setval('public."companias_nombreLogo_seq"', 1, false);


--
-- Name: companias_uuidLogo_seq; Type: SEQUENCE SET; Schema: public; Owner: usuario
--

SELECT pg_catalog.setval('public."companias_uuidLogo_seq"', 1, false);


--
-- Name: destinos_idDestino_seq; Type: SEQUENCE SET; Schema: public; Owner: usuario
--

SELECT pg_catalog.setval('public."destinos_idDestino_seq"', 1, false);


--
-- Name: estados_idEstado_seq; Type: SEQUENCE SET; Schema: public; Owner: usuario
--

SELECT pg_catalog.setval('public."estados_idEstado_seq"', 1, false);


--
-- Name: puertas_idPuerta_seq; Type: SEQUENCE SET; Schema: public; Owner: usuario
--

SELECT pg_catalog.setval('public."puertas_idPuerta_seq"', 1, false);


--
-- Name: vuelos_idVuelo_seq; Type: SEQUENCE SET; Schema: public; Owner: usuario
--

SELECT pg_catalog.setval('public."vuelos_idVuelo_seq"', 1, false);


--
-- Name: companias companias_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY public.companias
    ADD CONSTRAINT companias_pkey PRIMARY KEY ("idCompania");


--
-- Name: destinos destinos_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY public.destinos
    ADD CONSTRAINT destinos_pkey PRIMARY KEY ("idDestino");


--
-- Name: estados estados_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY public.estados
    ADD CONSTRAINT estados_pkey PRIMARY KEY ("idEstado");


--
-- Name: puertas puertas_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY public.puertas
    ADD CONSTRAINT puertas_pkey PRIMARY KEY ("idPuerta");


--
-- Name: vuelos vuelos_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY public.vuelos
    ADD CONSTRAINT vuelos_pkey PRIMARY KEY ("idVuelo");


--
-- PostgreSQL database dump complete
--

