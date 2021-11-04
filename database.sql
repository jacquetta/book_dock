--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bookusers; Type: TABLE; Schema: public; Owner: jacquetta
--

CREATE TABLE public.bookusers (
    bookuser_id integer NOT NULL,
    user_id integer NOT NULL,
    volume_id character varying NOT NULL,
    completed character varying
);


ALTER TABLE public.bookusers OWNER TO jacquetta;

--
-- Name: bookusers_bookuser_id_seq; Type: SEQUENCE; Schema: public; Owner: jacquetta
--

CREATE SEQUENCE public.bookusers_bookuser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bookusers_bookuser_id_seq OWNER TO jacquetta;

--
-- Name: bookusers_bookuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jacquetta
--

ALTER SEQUENCE public.bookusers_bookuser_id_seq OWNED BY public.bookusers.bookuser_id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: jacquetta
--

CREATE TABLE public.reviews (
    review_id integer NOT NULL,
    title character varying NOT NULL,
    review_title character varying NOT NULL,
    review text NOT NULL,
    published timestamp without time zone,
    user_id integer NOT NULL,
    volume_id character varying NOT NULL
);


ALTER TABLE public.reviews OWNER TO jacquetta;

--
-- Name: reviews_review_id_seq; Type: SEQUENCE; Schema: public; Owner: jacquetta
--

CREATE SEQUENCE public.reviews_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_review_id_seq OWNER TO jacquetta;

--
-- Name: reviews_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jacquetta
--

ALTER SEQUENCE public.reviews_review_id_seq OWNED BY public.reviews.review_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: jacquetta
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    full_name character varying NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(20) NOT NULL,
    book_goal integer,
    goal_date timestamp without time zone
);


ALTER TABLE public.users OWNER TO jacquetta;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: jacquetta
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO jacquetta;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jacquetta
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: volumes; Type: TABLE; Schema: public; Owner: jacquetta
--

CREATE TABLE public.volumes (
    volume_id character varying NOT NULL,
    title character varying NOT NULL,
    authors character varying,
    genre character varying,
    summary text,
    published_date timestamp without time zone,
    page_count integer,
    img_links character varying
);


ALTER TABLE public.volumes OWNER TO jacquetta;

--
-- Name: bookusers bookuser_id; Type: DEFAULT; Schema: public; Owner: jacquetta
--

ALTER TABLE ONLY public.bookusers ALTER COLUMN bookuser_id SET DEFAULT nextval('public.bookusers_bookuser_id_seq'::regclass);


--
-- Name: reviews review_id; Type: DEFAULT; Schema: public; Owner: jacquetta
--

ALTER TABLE ONLY public.reviews ALTER COLUMN review_id SET DEFAULT nextval('public.reviews_review_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: jacquetta
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: bookusers; Type: TABLE DATA; Schema: public; Owner: jacquetta
--

COPY public.bookusers (bookuser_id, user_id, volume_id, completed) FROM stdin;
1	1	HP1	false
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: jacquetta
--

COPY public.reviews (review_id, title, review_title, review, published, user_id, volume_id) FROM stdin;
1	Harry Potter and the Sorcerer's Stone	Great Book	Awesome read and takes you to another world	\N	1	HP1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: jacquetta
--

COPY public.users (user_id, full_name, email, password, book_goal, goal_date) FROM stdin;
1	Janey Doe	janey@gmail.com	password	3	2021-11-02 16:12:16.682776
2	Betty Test	bettytest@email.com	Password123	30	2021-12-31 00:00:00
3	Luigi Nintendo	luigi@email.com	Luigi2021	40	2022-03-24 00:00:00
\.


--
-- Data for Name: volumes; Type: TABLE DATA; Schema: public; Owner: jacquetta
--

COPY public.volumes (volume_id, title, authors, genre, summary, published_date, page_count, img_links) FROM stdin;
HP1	Harry Potter and the Sorcerer's Stone	J.K Rowling	fantasy	Boy who finds out he is a wizard and will be going to Hogwarts	1997-06-26 00:00:00	309	img for book
\.


--
-- Name: bookusers_bookuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacquetta
--

SELECT pg_catalog.setval('public.bookusers_bookuser_id_seq', 1, true);


--
-- Name: reviews_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacquetta
--

SELECT pg_catalog.setval('public.reviews_review_id_seq', 1, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacquetta
--

SELECT pg_catalog.setval('public.users_user_id_seq', 3, true);


--
-- Name: bookusers bookusers_pkey; Type: CONSTRAINT; Schema: public; Owner: jacquetta
--

ALTER TABLE ONLY public.bookusers
    ADD CONSTRAINT bookusers_pkey PRIMARY KEY (bookuser_id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: jacquetta
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (review_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: jacquetta
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: jacquetta
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: volumes volumes_pkey; Type: CONSTRAINT; Schema: public; Owner: jacquetta
--

ALTER TABLE ONLY public.volumes
    ADD CONSTRAINT volumes_pkey PRIMARY KEY (volume_id);


--
-- Name: bookusers bookusers_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jacquetta
--

ALTER TABLE ONLY public.bookusers
    ADD CONSTRAINT bookusers_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: bookusers bookusers_volume_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jacquetta
--

ALTER TABLE ONLY public.bookusers
    ADD CONSTRAINT bookusers_volume_id_fkey FOREIGN KEY (volume_id) REFERENCES public.volumes(volume_id);


--
-- Name: reviews reviews_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jacquetta
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: reviews reviews_volume_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jacquetta
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_volume_id_fkey FOREIGN KEY (volume_id) REFERENCES public.volumes(volume_id);


--
-- PostgreSQL database dump complete
--

