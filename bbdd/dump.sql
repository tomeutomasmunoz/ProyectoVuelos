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
    "uuidLogo" uuid NOT NULL
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
-- Name: companias idCompania; Type: DEFAULT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY public.companias ALTER COLUMN "idCompania" SET DEFAULT nextval('public."companias_idCompania_seq"'::regclass);


--
-- Name: companias nombreLogo; Type: DEFAULT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY public.companias ALTER COLUMN "nombreLogo" SET DEFAULT nextval('public."companias_nombreLogo_seq"'::regclass);


--
-- Data for Name: companias; Type: TABLE DATA; Schema: public; Owner: usuario
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
-- Name: companias companias_pkey; Type: CONSTRAINT; Schema: public; Owner: usuario
--

ALTER TABLE ONLY public.companias
    ADD CONSTRAINT companias_pkey PRIMARY KEY ("idCompania");


--
-- PostgreSQL database dump complete
--

