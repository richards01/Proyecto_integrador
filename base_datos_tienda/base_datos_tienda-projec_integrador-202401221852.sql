--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-01-22 18:52:41

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

DROP DATABASE projec_integrador;
--
-- TOC entry 4847 (class 1262 OID 33188)
-- Name: projec_integrador; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE projec_integrador WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Peru.1252';


ALTER DATABASE projec_integrador OWNER TO postgres;

\connect projec_integrador

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4848 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 33190)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    id bigint NOT NULL,
    nombre character varying(30) NOT NULL
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- TOC entry 4849 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE categoria; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.categoria IS 'Categoria';


--
-- TOC entry 215 (class 1259 OID 33189)
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categoria_id_seq OWNER TO postgres;

--
-- TOC entry 4850 (class 0 OID 0)
-- Dependencies: 215
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_id_seq OWNED BY public.categoria.id;


--
-- TOC entry 224 (class 1259 OID 33237)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id bigint NOT NULL,
    nombre character varying(50) NOT NULL,
    telefono bigint NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 33236)
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cliente_id_seq OWNER TO postgres;

--
-- TOC entry 4851 (class 0 OID 0)
-- Dependencies: 223
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;


--
-- TOC entry 228 (class 1259 OID 33251)
-- Name: item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item (
    id bigint NOT NULL,
    orden_id integer NOT NULL,
    producto_id integer NOT NULL,
    cantidad bigint NOT NULL,
    monto_venta integer NOT NULL
);


ALTER TABLE public.item OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 33250)
-- Name: item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.item_id_seq OWNER TO postgres;

--
-- TOC entry 4852 (class 0 OID 0)
-- Dependencies: 227
-- Name: item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.item_id_seq OWNED BY public.item.id;


--
-- TOC entry 226 (class 1259 OID 33244)
-- Name: orden; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orden (
    id bigint NOT NULL,
    cliente_id bigint,
    sucursal_id bigint NOT NULL,
    fecha date NOT NULL,
    total real NOT NULL
);


ALTER TABLE public.orden OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 33243)
-- Name: orden_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orden_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orden_id_seq OWNER TO postgres;

--
-- TOC entry 4853 (class 0 OID 0)
-- Dependencies: 225
-- Name: orden_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orden_id_seq OWNED BY public.orden.id;


--
-- TOC entry 218 (class 1259 OID 33197)
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto (
    id bigint NOT NULL,
    nombre character varying(60) NOT NULL,
    marca character varying(30) NOT NULL,
    categoria_id bigint NOT NULL,
    precio_unitario real NOT NULL
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 33196)
-- Name: producto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.producto_id_seq OWNER TO postgres;

--
-- TOC entry 4854 (class 0 OID 0)
-- Dependencies: 217
-- Name: producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_id_seq OWNED BY public.producto.id;


--
-- TOC entry 222 (class 1259 OID 33216)
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock (
    id bigint NOT NULL,
    sucursal_id bigint NOT NULL,
    producto_id integer NOT NULL,
    cantidad integer
);


ALTER TABLE public.stock OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 33215)
-- Name: stock_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stock_id_seq OWNER TO postgres;

--
-- TOC entry 4855 (class 0 OID 0)
-- Dependencies: 221
-- Name: stock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stock_id_seq OWNED BY public.stock.id;


--
-- TOC entry 220 (class 1259 OID 33209)
-- Name: sucursal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sucursal (
    id bigint NOT NULL,
    nombre character varying(50) NOT NULL,
    direccion character varying(150) NOT NULL
);


ALTER TABLE public.sucursal OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 33208)
-- Name: sucursal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sucursal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sucursal_id_seq OWNER TO postgres;

--
-- TOC entry 4856 (class 0 OID 0)
-- Dependencies: 219
-- Name: sucursal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sucursal_id_seq OWNED BY public.sucursal.id;


--
-- TOC entry 4664 (class 2604 OID 33193)
-- Name: categoria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id SET DEFAULT nextval('public.categoria_id_seq'::regclass);


--
-- TOC entry 4668 (class 2604 OID 33240)
-- Name: cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);


--
-- TOC entry 4670 (class 2604 OID 33254)
-- Name: item id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item ALTER COLUMN id SET DEFAULT nextval('public.item_id_seq'::regclass);


--
-- TOC entry 4669 (class 2604 OID 33247)
-- Name: orden id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden ALTER COLUMN id SET DEFAULT nextval('public.orden_id_seq'::regclass);


--
-- TOC entry 4665 (class 2604 OID 33200)
-- Name: producto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto ALTER COLUMN id SET DEFAULT nextval('public.producto_id_seq'::regclass);


--
-- TOC entry 4667 (class 2604 OID 33219)
-- Name: stock id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock ALTER COLUMN id SET DEFAULT nextval('public.stock_id_seq'::regclass);


--
-- TOC entry 4666 (class 2604 OID 33212)
-- Name: sucursal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursal ALTER COLUMN id SET DEFAULT nextval('public.sucursal_id_seq'::regclass);


--
-- TOC entry 4829 (class 0 OID 33190)
-- Dependencies: 216
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categoria VALUES (1, 'Electrónicos');
INSERT INTO public.categoria VALUES (2, 'Ropa');
INSERT INTO public.categoria VALUES (3, 'Hogar');
INSERT INTO public.categoria VALUES (4, 'Deportes');
INSERT INTO public.categoria VALUES (5, 'Juguetes');


--
-- TOC entry 4837 (class 0 OID 33237)
-- Dependencies: 224
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cliente VALUES (1, 'Juan', 123456789);
INSERT INTO public.cliente VALUES (2, 'María', 987654321);
INSERT INTO public.cliente VALUES (3, 'Pedro', 855555555);


--
-- TOC entry 4841 (class 0 OID 33251)
-- Dependencies: 228
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.item VALUES (1, 1, 9, 7, 175);
INSERT INTO public.item VALUES (2, 1, 8, 8, 400);
INSERT INTO public.item VALUES (6, 2, 9, 3, 75);
INSERT INTO public.item VALUES (7, 2, 5, 9, 270);
INSERT INTO public.item VALUES (8, 2, 5, 10, 300);
INSERT INTO public.item VALUES (9, 2, 6, 3, 60);
INSERT INTO public.item VALUES (11, 3, 1, 9, 9000);
INSERT INTO public.item VALUES (16, 4, 1, 4, 4000);
INSERT INTO public.item VALUES (17, 4, 2, 8, 6400);
INSERT INTO public.item VALUES (21, 5, 6, 2, 40);
INSERT INTO public.item VALUES (22, 5, 7, 3, 45);
INSERT INTO public.item VALUES (26, 6, 4, 9, 630);
INSERT INTO public.item VALUES (27, 6, 9, 4, 100);
INSERT INTO public.item VALUES (28, 6, 3, 2, 100);
INSERT INTO public.item VALUES (31, 7, 5, 8, 240);
INSERT INTO public.item VALUES (32, 7, 9, 6, 150);
INSERT INTO public.item VALUES (33, 7, 8, 2, 100);
INSERT INTO public.item VALUES (36, 8, 1, 6, 6000);
INSERT INTO public.item VALUES (37, 8, 1, 10, 10000);
INSERT INTO public.item VALUES (38, 8, 3, 2, 100);
INSERT INTO public.item VALUES (41, 9, 8, 9, 450);
INSERT INTO public.item VALUES (42, 9, 3, 3, 150);
INSERT INTO public.item VALUES (43, 9, 7, 2, 30);
INSERT INTO public.item VALUES (44, 9, 10, 5, 50);
INSERT INTO public.item VALUES (46, 10, 9, 9, 225);
INSERT INTO public.item VALUES (47, 10, 1, 7, 7000);
INSERT INTO public.item VALUES (48, 10, 3, 6, 300);
INSERT INTO public.item VALUES (51, 11, 7, 5, 75);
INSERT INTO public.item VALUES (52, 11, 9, 8, 200);
INSERT INTO public.item VALUES (53, 11, 3, 9, 450);
INSERT INTO public.item VALUES (56, 12, 2, 7, 5600);
INSERT INTO public.item VALUES (57, 12, 1, 5, 5000);
INSERT INTO public.item VALUES (58, 12, 6, 9, 180);
INSERT INTO public.item VALUES (59, 12, 8, 9, 450);
INSERT INTO public.item VALUES (60, 12, 8, 4, 200);
INSERT INTO public.item VALUES (61, 13, 9, 4, 100);
INSERT INTO public.item VALUES (62, 13, 2, 6, 4800);
INSERT INTO public.item VALUES (66, 14, 1, 5, 5000);
INSERT INTO public.item VALUES (67, 14, 4, 7, 490);
INSERT INTO public.item VALUES (71, 15, 9, 6, 150);
INSERT INTO public.item VALUES (72, 15, 5, 9, 270);


--
-- TOC entry 4839 (class 0 OID 33244)
-- Dependencies: 226
-- Data for Name: orden; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orden VALUES (1, 1, 3, '2023-12-06', 575);
INSERT INTO public.orden VALUES (2, 2, 1, '2023-12-06', 705);
INSERT INTO public.orden VALUES (3, 3, 3, '2023-12-06', 9000);
INSERT INTO public.orden VALUES (4, 2, 3, '2023-12-06', 10400);
INSERT INTO public.orden VALUES (5, 3, 3, '2023-12-06', 85);
INSERT INTO public.orden VALUES (6, 1, 1, '2023-12-06', 830);
INSERT INTO public.orden VALUES (7, 1, 1, '2023-12-06', 490);
INSERT INTO public.orden VALUES (8, 3, 3, '2023-12-06', 16100);
INSERT INTO public.orden VALUES (9, 3, 2, '2023-12-06', 680);
INSERT INTO public.orden VALUES (10, 2, 1, '2023-12-06', 7525);
INSERT INTO public.orden VALUES (11, 2, 3, '2023-12-06', 725);
INSERT INTO public.orden VALUES (12, 3, 1, '2023-12-06', 11430);
INSERT INTO public.orden VALUES (13, 3, 3, '2023-12-06', 4900);
INSERT INTO public.orden VALUES (14, 3, 3, '2023-12-06', 5490);
INSERT INTO public.orden VALUES (15, 1, 1, '2023-12-06', 420);


--
-- TOC entry 4831 (class 0 OID 33197)
-- Dependencies: 218
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.producto VALUES (1, 'Televisor', 'Sony', 1, 1000);
INSERT INTO public.producto VALUES (2, 'Laptop', 'HP', 1, 800);
INSERT INTO public.producto VALUES (3, 'Camisa', 'Zara', 2, 50);
INSERT INTO public.producto VALUES (4, 'Pantalón', 'Levi''s', 2, 70);
INSERT INTO public.producto VALUES (5, 'Sartén', 'T-fal', 3, 30);
INSERT INTO public.producto VALUES (6, 'Toalla', 'Cannon', 3, 20);
INSERT INTO public.producto VALUES (7, 'Pelota', 'Nike', 4, 15);
INSERT INTO public.producto VALUES (8, 'Raqueta', 'Wilson', 4, 50);
INSERT INTO public.producto VALUES (9, 'Muñeca', 'Barbie', 5, 25);
INSERT INTO public.producto VALUES (10, 'Carro', 'Hot Wheels', 5, 10);


--
-- TOC entry 4835 (class 0 OID 33216)
-- Dependencies: 222
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.stock VALUES (1, 1, 1, 65);
INSERT INTO public.stock VALUES (2, 1, 2, 71);
INSERT INTO public.stock VALUES (3, 1, 3, 8);
INSERT INTO public.stock VALUES (4, 1, 4, 42);
INSERT INTO public.stock VALUES (5, 1, 5, 61);
INSERT INTO public.stock VALUES (6, 1, 6, 14);
INSERT INTO public.stock VALUES (7, 1, 7, 70);
INSERT INTO public.stock VALUES (8, 1, 8, 66);
INSERT INTO public.stock VALUES (9, 1, 9, 13);
INSERT INTO public.stock VALUES (10, 1, 10, 68);
INSERT INTO public.stock VALUES (11, 2, 1, 14);
INSERT INTO public.stock VALUES (12, 2, 2, 67);
INSERT INTO public.stock VALUES (13, 2, 3, 74);
INSERT INTO public.stock VALUES (14, 2, 4, 32);
INSERT INTO public.stock VALUES (15, 2, 5, 75);
INSERT INTO public.stock VALUES (16, 2, 6, 37);
INSERT INTO public.stock VALUES (17, 2, 7, 14);
INSERT INTO public.stock VALUES (18, 2, 8, 42);
INSERT INTO public.stock VALUES (19, 2, 9, 51);
INSERT INTO public.stock VALUES (20, 2, 10, 41);
INSERT INTO public.stock VALUES (21, 3, 1, 59);
INSERT INTO public.stock VALUES (22, 3, 2, 98);
INSERT INTO public.stock VALUES (23, 3, 3, 52);
INSERT INTO public.stock VALUES (24, 3, 4, 85);
INSERT INTO public.stock VALUES (25, 3, 5, 31);
INSERT INTO public.stock VALUES (26, 3, 6, 17);
INSERT INTO public.stock VALUES (27, 3, 7, 13);
INSERT INTO public.stock VALUES (28, 3, 8, 18);
INSERT INTO public.stock VALUES (29, 3, 9, 76);
INSERT INTO public.stock VALUES (30, 3, 10, 1);


--
-- TOC entry 4833 (class 0 OID 33209)
-- Dependencies: 220
-- Data for Name: sucursal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sucursal VALUES (1, 'Sucursal A', 'Calle 1');
INSERT INTO public.sucursal VALUES (2, 'Sucursal B', 'Calle 2');
INSERT INTO public.sucursal VALUES (3, 'Sucursal C', 'Calle 3');


--
-- TOC entry 4857 (class 0 OID 0)
-- Dependencies: 215
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_id_seq', 1, false);


--
-- TOC entry 4858 (class 0 OID 0)
-- Dependencies: 223
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_seq', 1, false);


--
-- TOC entry 4859 (class 0 OID 0)
-- Dependencies: 227
-- Name: item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.item_id_seq', 1, false);


--
-- TOC entry 4860 (class 0 OID 0)
-- Dependencies: 225
-- Name: orden_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orden_id_seq', 1, false);


--
-- TOC entry 4861 (class 0 OID 0)
-- Dependencies: 217
-- Name: producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producto_id_seq', 1, false);


--
-- TOC entry 4862 (class 0 OID 0)
-- Dependencies: 221
-- Name: stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_id_seq', 1, false);


--
-- TOC entry 4863 (class 0 OID 0)
-- Dependencies: 219
-- Name: sucursal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sucursal_id_seq', 1, false);


--
-- TOC entry 4672 (class 2606 OID 33195)
-- Name: categoria categoria_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pk PRIMARY KEY (id);


--
-- TOC entry 4680 (class 2606 OID 33242)
-- Name: cliente cliente_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pk PRIMARY KEY (id);


--
-- TOC entry 4684 (class 2606 OID 33256)
-- Name: item item_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pk PRIMARY KEY (id);


--
-- TOC entry 4682 (class 2606 OID 33249)
-- Name: orden orden_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden
    ADD CONSTRAINT orden_pk PRIMARY KEY (id);


--
-- TOC entry 4674 (class 2606 OID 33202)
-- Name: producto producto_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pk PRIMARY KEY (id);


--
-- TOC entry 4678 (class 2606 OID 33221)
-- Name: stock stock_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pk PRIMARY KEY (id);


--
-- TOC entry 4676 (class 2606 OID 33214)
-- Name: sucursal sucursal_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursal
    ADD CONSTRAINT sucursal_pk PRIMARY KEY (id);


-- Completed on 2024-01-22 18:52:41

--
-- PostgreSQL database dump complete
--

