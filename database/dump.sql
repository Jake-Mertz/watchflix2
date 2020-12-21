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

ALTER TABLE IF EXISTS ONLY public.products DROP CONSTRAINT IF EXISTS products_pkey;
ALTER TABLE IF EXISTS ONLY public.orders DROP CONSTRAINT IF EXISTS orders_pkey;
ALTER TABLE IF EXISTS ONLY public.carts DROP CONSTRAINT IF EXISTS carts_pkey;
ALTER TABLE IF EXISTS ONLY public."cartItems" DROP CONSTRAINT IF EXISTS "cartItems_pkey";
ALTER TABLE IF EXISTS public.products ALTER COLUMN "productId" DROP DEFAULT;
ALTER TABLE IF EXISTS public.orders ALTER COLUMN "orderId" DROP DEFAULT;
ALTER TABLE IF EXISTS public.carts ALTER COLUMN "cartId" DROP DEFAULT;
ALTER TABLE IF EXISTS public."cartItems" ALTER COLUMN "cartItemId" DROP DEFAULT;
DROP SEQUENCE IF EXISTS public."products_productId_seq";
DROP TABLE IF EXISTS public.products;
DROP SEQUENCE IF EXISTS public."orders_orderId_seq";
DROP TABLE IF EXISTS public.orders;
DROP SEQUENCE IF EXISTS public."carts_cartId_seq";
DROP TABLE IF EXISTS public.carts;
DROP SEQUENCE IF EXISTS public."cartItems_cartItemId_seq";
DROP TABLE IF EXISTS public."cartItems";
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
-- Name: cartItems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."cartItems" (
    "cartItemId" integer NOT NULL,
    "cartId" integer NOT NULL,
    "productId" integer NOT NULL,
    price integer NOT NULL
);


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."cartItems_cartItemId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."cartItems_cartItemId_seq" OWNED BY public."cartItems"."cartItemId";


--
-- Name: carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carts (
    "cartId" integer NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: carts_cartId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."carts_cartId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: carts_cartId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."carts_cartId_seq" OWNED BY public.carts."cartId";


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    "orderId" integer NOT NULL,
    "cartId" integer NOT NULL,
    name text NOT NULL,
    "creditCard" text NOT NULL,
    "shippingAddress" text NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: orders_orderId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."orders_orderId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_orderId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."orders_orderId_seq" OWNED BY public.orders."orderId";


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    "productId" integer NOT NULL,
    name text NOT NULL,
    price integer NOT NULL,
    image text NOT NULL,
    "shortDescription" text NOT NULL,
    "longDescription" text NOT NULL
);


--
-- Name: products_productId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."products_productId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_productId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."products_productId_seq" OWNED BY public.products."productId";


--
-- Name: cartItems cartItemId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems" ALTER COLUMN "cartItemId" SET DEFAULT nextval('public."cartItems_cartItemId_seq"'::regclass);


--
-- Name: carts cartId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts ALTER COLUMN "cartId" SET DEFAULT nextval('public."carts_cartId_seq"'::regclass);


--
-- Name: orders orderId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN "orderId" SET DEFAULT nextval('public."orders_orderId_seq"'::regclass);


--
-- Name: products productId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN "productId" SET DEFAULT nextval('public."products_productId_seq"'::regclass);


--
-- Data for Name: cartItems; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."cartItems" ("cartItemId", "cartId", "productId", price) FROM stdin;
1	4	2	2595
2	5	2	2595
3	5	2	2595
4	5	2	2595
5	6	1	2999
6	6	2	2595
7	7	1	2999
8	7	1	2999
9	7	2	2595
10	7	1	2999
11	7	3	2900
12	7	1	2999
13	7	1	2999
14	8	3	2900
15	9	3	2900
16	9	3	2900
17	9	4	999
18	10	3	2900
19	11	3	2900
20	12	3	2900
21	13	3	2900
22	14	3	2900
23	7	1	2999
24	15	1	2999
25	15	3	2900
26	16	3	2900
27	17	1	2999
28	18	1	2999
29	19	2	1900
30	20	1	1700
31	20	2	1900
32	20	2	1900
33	20	3	1200
34	20	3	1200
35	20	3	1200
36	20	3	1200
37	21	6	1700
38	21	4	2500
39	22	6	1700
40	22	2	1900
41	22	1	1700
42	22	2	1900
43	22	3	1200
44	22	4	2500
45	22	5	1700
46	22	6	1700
47	22	1	1700
48	22	2	1900
49	22	2	1900
50	23	2	1900
51	24	1	1700
52	25	1	1700
53	25	3	1200
54	26	2	1900
55	27	2	1900
56	27	2	1900
57	27	1	1700
58	27	1	1700
59	28	2	1900
60	28	6	1700
61	29	1	1700
62	29	6	1700
63	30	6	1700
64	31	1	1700
65	32	3	1200
66	33	1	1700
67	34	3	1200
68	35	2	1900
69	36	2	1900
70	37	3	1200
71	37	2	1900
72	37	1	1700
73	37	2	1900
74	38	2	1900
75	38	1	1700
76	38	3	1200
77	38	4	2500
78	38	5	1700
79	38	6	1700
80	38	6	1700
81	38	6	1700
82	38	6	1700
83	38	6	1700
84	38	6	1700
85	38	6	1700
86	38	6	1700
87	38	6	1700
88	38	6	1700
89	38	1	1700
90	38	1	1700
91	38	1	1700
92	38	1	1700
93	38	1	1700
94	38	1	1700
95	38	1	1700
96	38	1	1700
97	38	1	1700
98	38	1	1700
99	38	3	1200
100	38	3	1200
101	38	3	1200
102	38	3	1200
103	38	3	1200
104	38	3	1200
105	38	5	1700
106	38	5	1700
107	38	5	1700
108	38	5	1700
109	38	5	1700
110	38	5	1700
111	39	1	1700
112	39	2	1900
113	39	2	1900
114	39	2	1900
115	39	2	1900
116	39	2	1900
117	39	1	1700
118	39	1	1700
119	39	2	1900
120	39	2	1900
121	39	2	1900
122	39	2	1900
123	39	2	1900
124	39	2	1900
125	39	2	1900
126	39	2	1900
127	39	2	1900
128	39	2	1900
129	39	2	1900
130	39	2	1900
131	39	2	1900
132	39	2	1900
133	39	2	1900
134	39	2	1900
135	39	2	1900
136	39	1	1700
137	39	1	1700
138	39	1	1700
139	39	1	1700
140	39	1	1700
141	39	1	1700
142	39	1	1700
143	39	1	1700
144	39	1	1700
145	39	1	1700
146	39	1	1700
147	39	1	1700
148	39	1	1700
149	39	1	1700
150	39	1	1700
151	39	2	1900
152	39	2	1900
153	39	2	1900
154	39	2	1900
155	39	2	1900
156	39	1	1700
157	39	1	1700
158	39	2	1900
159	39	2	1900
160	39	2	1900
161	39	2	1900
162	39	2	1900
163	39	2	1900
164	39	2	1900
165	39	2	1900
166	39	2	1900
167	39	2	1900
168	39	2	1900
169	39	2	1900
170	39	1	1700
171	39	1	1700
172	40	1	1700
173	40	2	1900
174	41	3	1200
175	41	2	1900
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.carts ("cartId", "createdAt") FROM stdin;
1	2020-09-29 13:17:52.522439-04
2	2020-09-29 13:24:28.987461-04
3	2020-09-29 13:25:39.428085-04
4	2020-09-29 13:34:16.623114-04
5	2020-09-29 13:38:21.03334-04
6	2020-09-29 19:24:17.479979-04
7	2020-09-30 13:00:41.037715-04
8	2020-09-30 15:23:51.440379-04
9	2020-09-30 15:26:42.129608-04
10	2020-09-30 15:50:49.328886-04
11	2020-09-30 15:55:11.686554-04
12	2020-09-30 15:55:19.451265-04
13	2020-09-30 15:56:14.910039-04
14	2020-09-30 16:01:51.26818-04
15	2020-09-30 22:16:10.162236-04
16	2020-09-30 22:40:00.557176-04
17	2020-10-01 11:25:08.264339-04
18	2020-10-01 12:03:55.567172-04
19	2020-10-01 18:14:16.12519-04
20	2020-10-01 19:26:48.015309-04
21	2020-10-01 22:40:24.879905-04
22	2020-10-02 10:21:33.413522-04
23	2020-10-02 15:46:05.112802-04
24	2020-10-02 15:57:56.292495-04
25	2020-10-02 15:58:38.070229-04
26	2020-10-02 16:24:02.193874-04
27	2020-10-02 16:27:39.09561-04
28	2020-10-02 17:06:36.509033-04
29	2020-10-07 14:29:23.833-04
30	2020-10-07 14:29:56.466455-04
31	2020-10-12 15:09:21.339882-04
32	2020-10-12 15:14:59.642029-04
33	2020-10-21 17:31:39.541231-04
34	2020-10-22 12:36:47.455544-04
35	2020-10-22 12:44:20.999792-04
36	2020-10-22 12:45:46.033957-04
37	2020-10-22 12:50:18.19684-04
38	2020-10-22 13:12:07.526653-04
39	2020-10-22 13:23:41.675699-04
40	2020-11-19 13:04:55.081854-05
41	2020-11-19 14:28:29.765866-05
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders ("orderId", "cartId", name, "creditCard", "shippingAddress", "createdAt") FROM stdin;
43	9	jake	1234567890987654	yemen	2020-09-30 15:49:23.443983-04
44	9	jake	1234567890987654	yemen	2020-09-30 15:50:04.457164-04
45	9	jake	1234567890987654	yemen	2020-09-30 15:50:22.208863-04
46	9	jake	1234567890987654	yemen	2020-09-30 15:52:08.171131-04
47	9	jake	1234567890987654	yemen	2020-09-30 15:52:53.193341-04
48	9	jake	1234567890987654	yemen	2020-09-30 15:53:14.55666-04
49	4	jake	1234567890987654	yemen	2020-09-30 15:53:28.600698-04
50	4	jake	1234567890987654	yemen	2020-09-30 15:54:11.408116-04
51	4	jake	1234567890987654	yemen	2020-09-30 15:55:04.810309-04
52	4	jake	1234567890987654	yemen	2020-09-30 15:55:14.57071-04
53	9	jake	1234567890987654	yemen	2020-09-30 15:55:34.052313-04
54	9	jake	1234567890987654	yemen	2020-09-30 15:56:18.948692-04
55	9	jake	1234567890987654	yemen	2020-09-30 15:56:26.609212-04
56	9	jake	1234567890987654	yemen	2020-09-30 15:56:41.685011-04
57	9	jake	1234567890987654	yemen	2020-09-30 15:56:43.265754-04
58	9	jake	1234567890987654	yemen	2020-09-30 15:56:44.41773-04
59	9	jake	1234567890987654	yemen	2020-09-30 15:56:45.498416-04
60	9	jake	1234567890987654	yemen	2020-09-30 15:56:46.391083-04
61	9	jake	1234567890987654	yemen	2020-09-30 15:56:47.204182-04
62	9	jake	1234567890987654	yemen	2020-09-30 15:56:47.987797-04
63	9	jake	1234567890987654	yemen	2020-09-30 15:56:48.862727-04
64	9	jake	1234567890987654	yemen	2020-09-30 15:56:49.687337-04
65	9	jake	1234567890987654	yemen	2020-09-30 15:56:50.558427-04
66	9	jake	1234567890987654	yemen	2020-09-30 15:59:21.360299-04
67	9	jake	1234567890987654	yemen	2020-09-30 16:02:09.365885-04
80	7	Jake	gfdfg	ordurrrrrrrrrrrr	2020-09-30 21:55:18.577362-04
81	15	Jake	gfdfg	ertisefeg	2020-09-30 22:17:24.314063-04
82	16				2020-09-30 22:40:13.905684-04
83	16	Jake	gfdfg	fghjk	2020-09-30 22:40:24.279777-04
84	17	Jake	gfdfg	dfghdfgh	2020-10-01 11:25:32.393461-04
85	18	Jake	tgttt	jhghjk	2020-10-01 16:13:06.072556-04
86	19				2020-10-01 18:19:46.387775-04
87	19	Jake	gfdfg	dfg	2020-10-01 18:26:55.526472-04
88	20	Jake	gfdfg	sergtrwerg	2020-10-01 22:40:17.096179-04
89	22				2020-10-02 10:21:59.83245-04
90	22				2020-10-02 13:07:53.30158-04
91	22	Jake	34543	trfesgrd	2020-10-02 15:45:45.504938-04
92	23				2020-10-02 15:48:30.937528-04
93	23				2020-10-02 15:51:40.149622-04
94	23				2020-10-02 15:57:30.720051-04
95	23				2020-10-02 15:57:33.861249-04
96	23	Jake			2020-10-02 15:57:37.087704-04
97	23	Jake	gfdfg	sdfdsdf	2020-10-02 15:57:43.970922-04
98	24	Jake			2020-10-02 15:58:03.463631-04
99	24	Jake			2020-10-02 15:58:09.27808-04
100	24	Jake	gfdfg	zxczxc	2020-10-02 15:58:27.564369-04
101	25				2020-10-02 16:01:59.87076-04
102	25				2020-10-02 16:15:35.254391-04
103	25				2020-10-02 16:15:36.731492-04
104	25				2020-10-02 16:15:47.088345-04
105	25				2020-10-02 16:15:55.645342-04
106	25	Jake			2020-10-02 16:19:09.092624-04
107	25	Jake	gfdfg		2020-10-02 16:19:12.433958-04
108	25	Jake	gfdfg	xfdgdh	2020-10-02 16:19:16.060786-04
109	26				2020-10-02 16:25:36.956324-04
110	26	Jake	gfdfg	ghhjhf	2020-10-02 16:25:43.317789-04
111	27				2020-10-02 17:04:46.6708-04
112	27	Jake	gfdfg	dfgfdfg	2020-10-02 17:05:14.38658-04
113	29	Jake	gfdfg	dfg	2020-10-07 14:29:52.398549-04
114	31	Jake	gfdfg	ghj	2020-10-12 15:09:39.374305-04
115	32	Jake	gfdfg	ftyujkl	2020-10-12 15:15:15.3508-04
116	33	Jake	345	juk	2020-10-21 17:32:11.258521-04
117	34	Jake	gfdfg	hjk	2020-10-22 12:37:00.881276-04
118	35	ghj	hjk	hjkl	2020-10-22 12:44:33.351599-04
119	36	Jake	gfdfg	hjk	2020-10-22 12:46:00.35797-04
120	37	Jake	gfdfg	sdfghjk	2020-10-22 13:11:59.333866-04
121	38	Jake	ghj	ghjm	2020-10-22 13:13:08.662275-04
122	39	Jake	gfdfg	hjk	2020-10-22 13:33:28.791548-04
123	40	dfg	dfg	dfg	2020-11-19 14:26:12.249706-05
124	41	wer	wer	wer	2020-11-19 14:29:00.53886-05
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products ("productId", name, price, image, "shortDescription", "longDescription") FROM stdin;
1	Fender Stratocaster	1700	/images2/fender-strat.png	Often copied, but never surpassed, the Stratocaster is arguably the world’s most-loved electric guitar.	Electrifying the music world since its debut in 1954, its natural, versatile sound made the Stratocaster the benchmark for exceptional guitar tones. The American Professional Stratocaster isn’t a re-imagining of the classic design; it’s the authentic original model, evolved. The choice of musical legends since its release, the Stratocaster feel and sound set the world on fire, powering music movements from electric blues to EDM, and everything in-between. In your hands this Strat is ready to navigate the creative twists and turns of your music, inspiring you to express yourself in new ways through your playing.
2	Fender Telecaster	1900	/images2/fender-telly.jpg	Leo Fender's 1952 Telecaster legitimized the electric guitar as a mainstream instrument.	The American Ultra Telecaster features a unique 'Modern D' neck profile with rolled fingerboard edges for hours of playing comfort, and the tapered neck heel allows easy access to the highest register. A speedy 10-14 compound-radius fingerboard with 22 medium-jumbo frets means effortless and accurate soloing, while the Ultra Noiseless pickups and advanced wiring options provide endless tonal possibilities, without hum. This versatile, state-of-the-art instrument will inspire you to push your playing to new heights.
3	ESP LTD Sparrowhawk Military Green Sunburst	1200	/images2/ESP-LTD-sparrowhawk.png	Bill Kelliher of the widely-respected American rock band Mastodon joined the ESP artist family in 2016.	For 2017, ESP is proud to debut the LTD Bill Kelliher Sparrowhawk, which offers set-thru construction at 24.75” scale, with mahogany body, 3-piece mahogany neck, ebony fingerboard, a TonePros locking TOM bridge and tailpiece, and Kelliher’s Lace Sensor Divinator signature pickups. The Sparrowhawk is being offered in Military Green Sunburst Satin finish. Includes hardshell case.
4	Gibson Les Paul	2500	/images2/gibson-les-paul.jpg	From its carved maple top to its stockpile of premium features, the Gibson Les Paul Standard ’60s is ready to rock. Burstbucker pickups and handwired electronics deliver a massive tone arsenal.	When it comes to capturing vintage Patent Applied For (PAF) humbucker tone, nothing beats the sound of this Les Paul Standard’s Burstbucker 61 pickups. This humbucker pays tribute to 1961, which happens to be the year Gibson started using Alnico V magnets, providing these pickups with greater touch sensitivity and high-frequency output. These magnets — along with period-correct unmatched windings on the bobbins — capture the subtle historical variations in true humbucker tone. Plug into your favorite amp, and experience smooth low-end response, complex midrange crunch, and sweet-sounding highs. These pickups sound great clean or they can be used to push your amp into overdrive for the legendary fat, snarling tone you can only get with a humbucker. Under the hood, the control assembly is handwired with matched potentiometers and Orange Drop capacitors, ensuring that you’ll hear the mellifluous voice of your Les Paul Standard ’60s in all its glory, even when you back down your volume.
6	Rickenbacker 620 Deluxe	1700	/images2/rickenbacker-620-fireglo.png	The Rickenbacker 620 electric guitar offers you the unmistakable jangle of a great Ricky with the performance of a great solidbody.	The 620 was first released in the 1950s to offer budding rock 'n' rollers a great instrument to play. It has since been seen in the hands of such guitar luminaries as Mike Campbell of Tom Petty and the Heartbreakers. The 620's all-maple construction and Hi-gain single-coil pickups deliver the legendary tone that goes hand in hand with the Rickenbacker name. And the 620 even boasts the famed Rick-O-Sound stereo output for expanded sonic possibilities.
5	Gibson Explorer	1700	/images2/white-explorer.png	The modern Gibson Explorer embodies all the trail-blazing style of the 1958 original, from its eye-catching angular body and hockey stick headstock to its red-hot rock appeal.	Gibson built the Explorer with a solid mahogany body and rosewood-topped set mahogany neck, so you know you’re in for rich tones, great sustain, and outstanding midrange character every time you plug in. The Gibson Explorer has been embraced by hard rockers the world over (and quite a few here at Sweetwater) for decades; its set-neck construction and fast-playing SlimTaper neck profile combine to give you an unbeatable sonic weapon onstage or in the studio. From the tonewoods to the rock-solid set neck to the top-shelf hardware, the Gibson Explorer was made to rock.
\.


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."cartItems_cartItemId_seq"', 175, true);


--
-- Name: carts_cartId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."carts_cartId_seq"', 41, true);


--
-- Name: orders_orderId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."orders_orderId_seq"', 124, true);


--
-- Name: products_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."products_productId_seq"', 1, false);


--
-- Name: cartItems cartItems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems"
    ADD CONSTRAINT "cartItems_pkey" PRIMARY KEY ("cartItemId");


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY ("cartId");


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY ("orderId");


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY ("productId");


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

