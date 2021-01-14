--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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

ALTER TABLE IF EXISTS ONLY public.movies DROP CONSTRAINT IF EXISTS movies_pkey;
ALTER TABLE IF EXISTS ONLY public.lists DROP CONSTRAINT IF EXISTS lists_pkey;
ALTER TABLE IF EXISTS ONLY public."listItems" DROP CONSTRAINT IF EXISTS "listItems_pkey";
ALTER TABLE IF EXISTS public.movies ALTER COLUMN "productId" DROP DEFAULT;
ALTER TABLE IF EXISTS public.lists ALTER COLUMN "listId" DROP DEFAULT;
ALTER TABLE IF EXISTS public."listItems" ALTER COLUMN "listItemId" DROP DEFAULT;
DROP SEQUENCE IF EXISTS public."movies_productId_seq";
DROP TABLE IF EXISTS public.movies;
DROP SEQUENCE IF EXISTS public."lists_listId_seq";
DROP TABLE IF EXISTS public.lists;
DROP SEQUENCE IF EXISTS public."listItems_listItemId_seq";
DROP TABLE IF EXISTS public."listItems";
DROP EXTENSION IF EXISTS plpgsql;
DROP SCHEMA IF EXISTS public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: listItems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."listItems" (
    "listItemId" integer NOT NULL,
    "listId" integer NOT NULL,
    "movieId" integer NOT NULL
);


--
-- Name: listItems_listItemId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."listItems_listItemId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: listItems_listItemId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."listItems_listItemId_seq" OWNED BY public."listItems"."listItemId";


--
-- Name: lists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lists (
    "listId" integer NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: lists_listId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."lists_listId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lists_listId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."lists_listId_seq" OWNED BY public.lists."listId";


--
-- Name: movies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movies (
    "productId" integer NOT NULL,
    title text NOT NULL,
    year integer NOT NULL,
    genre text NOT NULL,
    description text NOT NULL,
    image text NOT NULL
);


--
-- Name: movies_productId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."movies_productId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: movies_productId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."movies_productId_seq" OWNED BY public.movies."productId";


--
-- Name: listItems listItemId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."listItems" ALTER COLUMN "listItemId" SET DEFAULT nextval('public."listItems_listItemId_seq"'::regclass);


--
-- Name: lists listId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lists ALTER COLUMN "listId" SET DEFAULT nextval('public."lists_listId_seq"'::regclass);


--
-- Name: movies productId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movies ALTER COLUMN "productId" SET DEFAULT nextval('public."movies_productId_seq"'::regclass);


--
-- Data for Name: listItems; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."listItems" ("listItemId", "listId", "movieId") FROM stdin;
\.


--
-- Data for Name: lists; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lists ("listId", "createdAt") FROM stdin;
\.


--
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.movies ("productId", title, year, genre, description, image) FROM stdin;
1	Atomic Blonde	2017	Action/Thriller	Charlize Theron pulls a fast one	/images/atomic-blonde1.jpg
2	The Good The Bad and the Ugly	1966	Spaghetti Western	Some cowboys chase after gold	/images/thegoodbadandugly.jpg
3	Pirates of the Caribbean: The Curse of the Black Pearl	2003	Adventure/Action	Cortez's cursed gold gets returned	/images/pirates.jpeg
4	Howl's Moving Castle	2004	Fantasy/Adventure	A witch meets a wandering wizard	/images/howlsmovingcastle.png
\.


--
-- Name: listItems_listItemId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."listItems_listItemId_seq"', 1, false);


--
-- Name: lists_listId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."lists_listId_seq"', 1, false);


--
-- Name: movies_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."movies_productId_seq"', 4, true);


--
-- Name: listItems listItems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."listItems"
    ADD CONSTRAINT "listItems_pkey" PRIMARY KEY ("listItemId");


--
-- Name: lists lists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lists
    ADD CONSTRAINT lists_pkey PRIMARY KEY ("listId");


--
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY ("productId");


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

