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
    goal_date date
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
1	4	HPBook1	false	false
6	1	HPBook1	false	false
5	1	HPBook6	false	false
4	1	HPBook4	false	false
3	1	HPBook3	false	false
17	1	JjplDwAAQBAJ	true	true
21	1	L196MiLaqFIC	false	false
22	1	mZwbCwAAQBAJ	false	false
23	1	d_f1DwAAQBAJ	false	false
24	1	wnwszgEACAAJ	false	false
25	1	8KhXzo96YjkC	false	false
26	4	2hAoCgAAQBAJ	true	true
27	4	qT_-wQEACAAJ	false	false
29	4	ncCpDAAAQBAJ	false	false
30	4	cmNSzQEACAAJ	false	false
31	4	zkQuDgAAQBAJ	false	false
32	4	47udDwAAQBAJ	false	false
33	4	1VQqEAAAQBAJ	false	false
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
1	Pink PRanger	pranger@email.com	Password1	10	2022-02-19
2	Yellow YRanger	yranger@email.com	Password2	20	2022-03-19
3	Red Ranger	rranger@email.com	Password3	55	2022-04-19
4	Green GRanger	granger@email.com	Password4	85	2022-05-19
5	Black BRanger	branger@email.com	Password5	156	2022-06-19
6	Blue RangerB	rangerb@email.com	Password6	300	2022-07-19
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
XtecDwAAQBAJ	#FutureBoards	['Sarah	none	Learn	2019-07-09 00:00:00	224	none
d_f1DwAAQBAJ	Python	['Reuven	none	The	2020-08-04 00:00:00	248	none
lMM4jgEACAAJ	Harry	['Inc.	none	Packed	2015-11-10 00:00:00	96	{'smallThumbnail':
TOCgDwAAQBAJ	The	['Ben	none	This	2019-07-05 00:00:00	219	{'smallThumbnail':
mZwbCwAAQBAJ	Think	['Allen	none	If	2015-12-02 00:00:00	292	{'smallThumbnail':
L196MiLaqFIC	Python	['Allen	none	Python	2009-03-09 00:00:00	251	{'smallThumbnail':
JjplDwAAQBAJ	Hustle	['Sarah	none	From	2019-07-02 00:00:00	392	http://books.google.com/books/content?id=JjplDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api
wnwszgEACAAJ	Python	['Vaskaran	none	Python	2021-01-16 00:00:00	325	http://books.google.com/books/content?id=wnwszgEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api
8KhXzo96YjkC	I	['Dodie	none	One	2003-04-01 00:00:00	352	http://books.google.com/books/content?id=8KhXzo96YjkC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api
2hAoCgAAQBAJ	Golden	none	none	Includes	2016-07-26 00:00:00	368	http://books.google.com/books/content?id=2hAoCgAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api
qT_-wQEACAAJ	The Golden Girls: You Are My Golden Girl	none	none	Let your spouse, sister, mom, or best friend know, "you're my Golden Girl" with this charming DIY gift book, inspired by everyone's favorite foursome from The Golden Girls: Dorothy, Rose, Blanche, and Sophia. Whether your recipient is a Rose or decidedly a Sophia, this is the perfect way to let her know how you feel about your friendship. Once you fill in the prompts, this book becomes a personalized gift full of funny, memorable, and sweet expressions of appreciation that your loved one will cherish for years to come. This gift book features full-color photography from The Golden Girls throughout.	2019-10-08 00:00:00	96	http://books.google.com/books/content?id=qT_-wQEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api
ncCpDAAAQBAJ	Think DSP	['Allen B. Downey']	none	If you understand basic mathematics and know how to program with Python, you’re ready to dive into signal processing. While most resources start with theory to teach this complex subject, this practical book introduces techniques by showing you how they’re applied in the real world. In the first chapter alone, you’ll be able to decompose a sound into its harmonics, modify the harmonics, and generate new sounds. Author Allen Downey explains techniques such as spectral decomposition, filtering, convolution, and the Fast Fourier Transform. This book also provides exercises and code examples to help you understand the material. You’ll explore: Periodic signals and their spectrums Harmonic structure of simple waveforms Chirps and other sounds whose spectrum changes over time Noise signals and natural sources of noise The autocorrelation function for estimating pitch The discrete cosine transform (DCT) for compression The Fast Fourier Transform for spectral analysis Relating operations in time to filters in the frequency domain Linear time-invariant (LTI) system theory Amplitude modulation (AM) used in radio Other books in this series include Think Stats and Think Bayes, also by Allen Downey.	2016-07-12 00:00:00	168	http://books.google.com/books/content?id=ncCpDAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api
cmNSzQEACAAJ	Harry Potter and the Philosopher's Stone: MinaLima Edition	['J. K. Rowling']	['Hogwarts School of Witchcraft and Wizardry (Imaginary organization)']	Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed giant of a man called Rubeus Hagrid bursts in with some astonishing news: Harry Potter is a wizard, and he has a place at Hogwarts School of Witchcraft and Wizardry. An incredible adventure is about to begin!	2020-10-20 00:00:00	368	http://books.google.com/books/content?id=cmNSzQEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api
zkQuDgAAQBAJ	The Freddy Files (Five Nights At Freddy's)	['Scott Cawthon']	['Juvenile Nonfiction']	Don't miss the first official guide to the world of the bestselling horror video game series, Five Nights at Freddy's, including easter eggs, gameplay tips, and the most hotly-debated fan theories.	2017-08-29 00:00:00	160	http://books.google.com/books/content?id=zkQuDgAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api
47udDwAAQBAJ	Fetch (Five Nights at Freddy’s: Fazbear Frights #2)	['Scott Cawthon', 'Carly Anne West', 'Andrea Waggener']	['Young Adult Fiction']	The Fazbear Frights series continues with three more bone-chilling, novella-length tales to keep even the bravest Five Nights at Freddy's player up at night...	2020-03-03 00:00:00	272	http://books.google.com/books/content?id=47udDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api
1VQqEAAAQBAJ	Prankster: An AFK Book (Five Nights at Freddy’s: Fazbear Frights #11)	['Scott Cawthon', 'Elley Cooper', 'Andrea Waggener']	['Young Adult Fiction']	Five Nights at Freddy's fans won't want to miss this pulse-pounding collection of three novella-length tales that will keep even the bravest FNAF player up at night... Standing up for yourself can be hard . . .Jeremiah decides he's done being the butt of his coworker's jokes at their small game studio. Joel is counting the days until he can quit his family's garden center and hit the road to a new life. Aimee finally works up the courage to ditch her loud-mouthed, annoying friend at Freddy Fazbear's Pizza. But when it comes to Five Nights at Freddy's, even the most well-meaning actions can reap horrible consequences. In this eleventh volume, Five Nights at Freddy's creator Scott Cawthon spins three sinister novella-length stories from different corners of his series' canon. Readers beware: This collection of terrifying tales is enough to unsettle even the most hardened Five Nights at Freddy's fans.	2021-11-02 00:00:00	224	http://books.google.com/books/content?id=1VQqEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api
\.


--
-- Name: bookusers_bookuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacquetta
--

SELECT pg_catalog.setval('public.bookusers_bookuser_id_seq', 33, true);


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

