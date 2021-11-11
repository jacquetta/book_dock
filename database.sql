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
    reading character varying,
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

COPY public.bookusers (bookuser_id, user_id, volume_id, reading, completed) FROM stdin;
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: jacquetta
--

COPY public.reviews (review_id, title, review_title, review, published, user_id, volume_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: jacquetta
--

COPY public.users (user_id, full_name, email, password, book_goal, goal_date) FROM stdin;
1	Pink PRanger	pranger@email.com	Password1	10	2022-02-19 00:00:00
2	Yellow YRanger	yranger@email.com	Password2	20	2022-03-19 00:00:00
3	Red Ranger	rranger@email.com	Password3	55	2022-04-19 00:00:00
4	Green GRanger	granger@email.com	Password4	85	2022-05-19 00:00:00
5	Black BRanger	branger@email.com	Password5	156	2022-06-19 00:00:00
6	Blue RangerB	rangerb@email.com	Password6	300	2022-07-19 00:00:00
\.


--
-- Data for Name: volumes; Type: TABLE DATA; Schema: public; Owner: jacquetta
--

COPY public.volumes (volume_id, title, authors, genre, summary, published_date, page_count, img_links) FROM stdin;
HPBook1	Harry Potter and the Sorcerers Stone	J.K Rowling	fantasy	Boy who finds out he is a wizard and will be going to Hogwarts	1997-06-26 00:00:00	309	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1474154022l/3._SY475_.jpg
HPBook2	Harry Potter and the Chamber of Secrets	J.K Rowling	fantasy	Ever since Harry Potter had come home for the summer, the Dursleys had been so mean and hideous that all Harry wanted was to get back to the Hogwarts School for Witchcraft and Wizardry	1998-07-02 00:00:00	341	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1474169725l/15881._SY475_.jpg
HPBook3	Harry Potter and the Prisoner of Azkaban	J.K Rowling	fantasy	For twelve long years, the dread fortress of Azkaban held an infamous prisoner named Sirius Black.	1999-07-08 00:00:00	435	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1630547330l/5._SY475_.jpg
HPBook4	Harry Potter and the Goblet of Fire	J.K Rowling	fantasy	Harry Potter is midway through his training as a wizard and his coming of age	2000-07-08 00:00:00	734	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1554006152l/6.jpg
HPBook5	Harry Potter and the Order of the Phoenix	J.K Rowling	fantasy	There is a door at the end of a silent corridor. And it’s haunting Harry Pottter’s dreams. Why else would he be waking in the middle of the night, screaming in terror?	2003-06-21 00:00:00	870	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1546910265l/2.jpg
HPBook6	Harry Potter and the Half Blood Prince	J.K Rowling	fantasy	The war against Voldemort is not going well; even Muggle governments are noticing.	2006-07-16 00:00:00	652	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1587697303l/1._SX318_.jpg
HPBook7	Harry Potter and the Deathly Hallows	J.K Rowling	fantasy	Its no longer safe for Harry at Hogwarts, so he and his best friends, Ron and Hermione, are on the run.	2007-07-21 00:00:00	759	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1474171184l/136251._SY475_.jpg
\.


--
-- Name: bookusers_bookuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacquetta
--

SELECT pg_catalog.setval('public.bookusers_bookuser_id_seq', 1, false);


--
-- Name: reviews_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacquetta
--

SELECT pg_catalog.setval('public.reviews_review_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacquetta
--

SELECT pg_catalog.setval('public.users_user_id_seq', 6, true);


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

