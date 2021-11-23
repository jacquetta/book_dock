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
    published_date date,
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
16	1	1VQqEAAAQBAJ	true	true
17	1	PXa2bby0oQ0C	true	true
18	1	qU3rAgAAQBAJ	true	true
19	1	jVYnCgAAQBAJ	true	true
12	1	mZwbCwAAQBAJ	true	true
13	1	ncCpDAAAQBAJ	true	true
14	1	DjeCDwAAQBAJ	true	true
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: jacquetta
--

COPY public.reviews (review_id, title, review_title, review, published, user_id, volume_id) FROM stdin;
1	The Four Sacred Secrets			2021-11-23 13:17:23.832541	1	uUaBDwAAQBAJ
2	Think Python	Testing		2021-11-23 13:23:43.886673	1	mZwbCwAAQBAJ
4	title	test	review	2015-11-11 00:00:00	1	uUaBDwAAQBAJ
5	Five Nights at Freddy's: The Silver Eyes	Testing	testing	2021-11-23 13:46:12.925124	1	u683DgAAQBAJ
6	Harry Potter and the Cursed Child			2021-11-23 13:46:31.952817	1	kLAoswEACAAJ
7	#FutureBoards			2021-11-23 13:47:53.868015	1	XtecDwAAQBAJ
8	#FutureBoards	test	ugh	2021-11-23 13:47:58.823233	1	XtecDwAAQBAJ
9	#FutureBoards	Testing		2021-11-23 13:48:16.988641	1	XtecDwAAQBAJ
10	#FutureBoards	Testing	test	2021-11-23 13:48:19.612775	1	XtecDwAAQBAJ
11	The Four Sacred Secrets			2021-11-23 13:48:49.188883	1	uUaBDwAAQBAJ
12	The Four Sacred Secrets	test	rtdj	2021-11-23 13:48:55.874488	1	uUaBDwAAQBAJ
13	Official Five Nights at Freddy's Coloring Book	Testing		2021-11-23 13:53:09.989898	1	uAylzQEACAAJ
14	Into the Pit (Five Nights at Freddy’s: Fazbear Frights #1)			2021-11-23 13:54:36.490185	1	4LqdDwAAQBAJ
15	The Freddy Files (Five Nights At Freddy's)	Testing		2021-11-23 13:56:03.604855	1	zkQuDgAAQBAJ
16	Fantastic Beasts and Where to Find Them	Testing		2021-11-23 14:24:27.392281	1	eq9XvgAACAAJ
17	Make Anything Happen	test	another	2021-11-23 15:28:26.038974	1	DjeCDwAAQBAJ
18	My Secrets	Testing		2021-11-23 15:28:59.263428	1	1EC-jwEACAAJ
19	Prankster: An AFK Book (Five Nights at Freddy’s: Fazbear Frights #11)	Testing		2021-11-23 15:31:15.421338	1	1VQqEAAAQBAJ
20	JavaScript: The Good Parts	Testing		2021-11-23 15:37:19.239534	1	PXa2bby0oQ0C
21	Speaking JavaScript	Testing	ugh	2021-11-23 15:38:52.581707	1	qU3rAgAAQBAJ
22	Pro Git	Testing	Still Testing	2021-11-23 15:39:37.511232	1	jVYnCgAAQBAJ
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
HPBook1	Harry Potter and the Sorcerers Stone	J.K Rowling	fantasy	Boy who finds out he is a wizard and will be going to Hogwarts	1997-06-26	309	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1474154022l/3._SY475_.jpg
HPBook2	Harry Potter and the Chamber of Secrets	J.K Rowling	fantasy	Ever since Harry Potter had come home for the summer, the Dursleys had been so mean and hideous that all Harry wanted was to get back to the Hogwarts School for Witchcraft and Wizardry	1998-07-02	341	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1474169725l/15881._SY475_.jpg
HPBook3	Harry Potter and the Prisoner of Azkaban	J.K Rowling	fantasy	For twelve long years, the dread fortress of Azkaban held an infamous prisoner named Sirius Black.	1999-07-08	435	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1630547330l/5._SY475_.jpg
HPBook4	Harry Potter and the Goblet of Fire	J.K Rowling	fantasy	Harry Potter is midway through his training as a wizard and his coming of age	2000-07-08	734	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1554006152l/6.jpg
HPBook5	Harry Potter and the Order of the Phoenix	J.K Rowling	fantasy	There is a door at the end of a silent corridor. And it’s haunting Harry Pottter’s dreams. Why else would he be waking in the middle of the night, screaming in terror?	2003-06-21	870	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1546910265l/2.jpg
HPBook6	Harry Potter and the Half Blood Prince	J.K Rowling	fantasy	The war against Voldemort is not going well; even Muggle governments are noticing.	2006-07-16	652	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1587697303l/1._SX318_.jpg
HPBook7	Harry Potter and the Deathly Hallows	J.K Rowling	fantasy	Its no longer safe for Harry at Hogwarts, so he and his best friends, Ron and Hermione, are on the run.	2007-07-21	759	https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1474171184l/136251._SY475_.jpg
uUaBDwAAQBAJ	The Four Sacred Secrets	['Preethaji', 'Krishnaji']	['Body, Mind & Spirit']	NATIONAL BESTSELLER In the bestselling tradition of The Four Agreements, learn how to access the hidden power of consciousness, shed anxiety, and cultivate a life of wealth and happiness with this eye-opening and accessible guide outlining the four keys to success—from the founders of the revolutionary O&O Academy. From stress to calm. From isolation to love. From chaos to peace. From lack to abundance. The Four Sacred Secrets combines proven scientific approaches with ancient spiritual practices to take you on a journey that will open your mind to an extraordinary destiny. Drawing on the power of our untapped consciousness, brilliant insights will help you find solutions to long-held challenges. The easy-to-follow meditations included in this book will transform your experience of reality and open you to the power of creating a beautiful life for yourself. Including ancient fables and modern stories that will speak intimately to your heart, this life-transforming book fuses the transcendental and the scientific, the mystical and the practical, to guide you to consciously create wealth, heal your heart, awaken yourself to love, and help you to make peace with your true self. The Four Sacred Secrets will cast its spell on you from the first page and guide you to life in a beautiful state.	2019-08-06	192	http://books.google.com/books/content?id=uUaBDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api
mZwbCwAAQBAJ	Think Python	['Allen B. Downey']	['Computers']	If you want to learn how to program, working with Python is an excellent way to start. This hands-on guide takes you through the language a step at a time, beginning with basic programming concepts before moving on to functions, recursion, data structures, and object-oriented design. This second edition and its supporting code have been updated for Python 3. Through exercises in each chapter, you’ll try out programming concepts as you learn them. Think Python is ideal for students at the high school or college level, as well as self-learners, home-schooled students, and professionals who need to learn programming basics. Beginners just getting their feet wet will learn how to start with Python in a browser. Start with the basics, including language syntax and semantics Get a clear definition of each programming concept Learn about values, variables, statements, functions, and data structures in a logical progression Discover how to work with files and databases Understand objects, methods, and object-oriented programming Use debugging techniques to fix syntax, runtime, and semantic errors Explore interface design, data structures, and GUI-based programs through case studies	2015-12-02	292	http://books.google.com/books/content?id=mZwbCwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api
u683DgAAQBAJ	Five Nights at Freddy's: The Silver Eyes	['Scott  Cawthon']	['Juvenile Fiction']	Ten years after the horrific murders at Freddy Fazbear's Pizza that ripped their town apart, Charlie, whose father owned the restaurant, and her childhood friends reunite on the anniversary of the tragedy and find themselves at the old pizza place which had been locked up and abandoned for years. After they discover a way inside, they realize that things are not as they used to be. The four adult-sized animatronic mascots that once entertained patrons have changed. They now have a dark secret . . . and a murderous agenda. *Not suitable for younger readers*	2017-03-06	400	http://books.google.com/books/content?id=u683DgAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api
kLAoswEACAAJ	Harry Potter and the Cursed Child	['J. K. Rowling', 'Jack Thorne', 'John Tiffany']	['Fiction']	The official playscript of the original West End production of Harry Potter and the Cursed Child. It was always difficult being Harry Potter and it isn't much easier now that he is an overworked employee of the Ministry of Magic, a husband, and father of three school-age children. While Harry grapples with a past that refuses to stay where it belongs, his youngest son Albus must struggle with the weight of a family legacy he never wanted. As past and present fuse ominously, both father and son learn the uncomfortable truth: sometimes, darkness comes from unexpected places. The playscript for Harry Potter and the Cursed Child was originally released as a 'special rehearsal edition' alongside the opening of Jack Thorne's play in London's West End in summer 2016. Based on an original story by J.K. Rowling, John Tiffany and Jack Thorne, the play opened to rapturous reviews from theatregoers and critics alike, while the official playscript became an immediate global bestseller. This revised paperback edition updates the 'special rehearsal edition' with the conclusive and final dialogue from the play, which has subtly changed since its rehearsals, as well as a conversation piece between director John Tiffany and writer Jack Thorne, who share stories and insights about reading playscripts. This edition also includes useful background information including the Potter family tree and a timeline of events from the wizarding world prior to the beginning of Harry Potter and the Cursed Child.	2017-07-25	352	http://books.google.com/books/content?id=kLAoswEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api
XtecDwAAQBAJ	#FutureBoards	['Sarah Centrella']	['Self-Help']	Learn to create the ultimate vision board to actualize the life you want with this essential guide! A #FutureBoard takes the idea of a vision board one step further—it’s a true visual representation of your desired future life. When utilized correctly, it can be a great tool to help you to turn your dreams into reality—and this book shows you how to do exactly that. #FutureBoards explains how to identify and create your ideal future with intention, and shows you step-by-step how to create a fabulous board worthy of your wildest dreams and so you can use it to upgrade your entire life. Get ready to make the life you’re dreaming about a reality with your very own #FutureBoard!	2019-07-09	224	http://books.google.com/books/content?id=XtecDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api
uAylzQEACAAJ	Official Five Nights at Freddy's Coloring Book	['Scholastic']	['Juvenile Fiction']	Five Nights at Freddy's fans won't want to miss this awesome coloring book! Color in scenes featuring all of your favorite FNAF characters. Based on the best-selling horror video game series Five Nights at Freddy's, this coloring book is packed full of terrifyingly wonderful scenes for FNAF fans to color in and enjoy. From Chica and Foxy to Freddy himself, this Five Nights at Freddy's extravaganza has 96 pages of coloring fun perfect for any Freddy Fazbear's Pizza super fan!	2021-01-05	96	http://books.google.com/books/content?id=uAylzQEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api
4LqdDwAAQBAJ	Into the Pit (Five Nights at Freddy’s: Fazbear Frights #1)	['Scott Cawthon', 'Elley Cooper']	['Young Adult Fiction']	Five Nights at Freddy's fans won't want to miss this pulse-pounding collection of three novella-length tales that will keep even the bravest player up at night . . .	2019-12-26	208	http://books.google.com/books/content?id=4LqdDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api
zkQuDgAAQBAJ	The Freddy Files (Five Nights At Freddy's)	['Scott Cawthon']	['Juvenile Nonfiction']	Don't miss the first official guide to the world of the bestselling horror video game series, Five Nights at Freddy's, including easter eggs, gameplay tips, and the most hotly-debated fan theories.	2017-08-29	160	http://books.google.com/books/content?id=zkQuDgAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api
eq9XvgAACAAJ	Fantastic Beasts and Where to Find Them: Cinematic Guide: Newt Scamander Do Not Feed Out	['Felicity Baker']	none	The essential film companion for Newt Scamander! Relive the magic of Newt's world with this hardback guidebook featuring your favourite scenes and quotes from Fantastic Beasts and Where to Find Them.	2017-02-02	64	http://books.google.com/books/content?id=eq9XvgAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api
f280CwAAQBAJ	Harry Potter: The Complete Collection (1-7)	['J.K. Rowling']	['Young Adult Fiction']	All seven eBooks in the multi-award winning, internationally bestselling Harry Potter series, available as one download with stunning cover art by Olly Moss. Enjoy the stories that have captured the imagination of millions worldwide. Having now become classics of our time, the Harry Potter ebooks never fail to bring comfort and escapism to readers of all ages. With its message of hope, belonging and the enduring power of truth and love, the story of the Boy Who Lived continues to delight generations of new readers.	2015-12-14	4236	http://books.google.com/books/content?id=f280CwAAQBAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api
ncCpDAAAQBAJ	Think DSP	['Allen B. Downey']	['Technology & Engineering']	If you understand basic mathematics and know how to program with Python, you’re ready to dive into signal processing. While most resources start with theory to teach this complex subject, this practical book introduces techniques by showing you how they’re applied in the real world. In the first chapter alone, you’ll be able to decompose a sound into its harmonics, modify the harmonics, and generate new sounds. Author Allen Downey explains techniques such as spectral decomposition, filtering, convolution, and the Fast Fourier Transform. This book also provides exercises and code examples to help you understand the material. You’ll explore: Periodic signals and their spectrums Harmonic structure of simple waveforms Chirps and other sounds whose spectrum changes over time Noise signals and natural sources of noise The autocorrelation function for estimating pitch The discrete cosine transform (DCT) for compression The Fast Fourier Transform for spectral analysis Relating operations in time to filters in the frequency domain Linear time-invariant (LTI) system theory Amplitude modulation (AM) used in radio Other books in this series include Think Stats and Think Bayes, also by Allen Downey.	2016-07-12	168	http://books.google.com/books/content?id=ncCpDAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api
DjeCDwAAQBAJ	Make Anything Happen	['Carrie Lindsey']	['Self-Help']	Everyone wants to accomplish their goals and live the life of which they dream. But in today’s busy age, how do we make that happen? This interactive book helps readers live an intentional life by determining their priorities and tapping into their creativity to create beautiful and functional vision boards and manageable action plans to achieve their goals. Through guided worksheets, vision board templates and samples, and planning pages, author Carrie Lindsey inspires readers to get clear on what they really want and then make it happen. Getting your life in order has never been so much fun! What would happen if you set aside a little time to write down what makes you excited and what drags you down? What if you took it a step further and set specific goals for living your best life? What if that process could be creative, exciting, and lead to actual change? Use the guided worksheets to establish your priorities Create vision boards that make your goals concrete and attainable Discover strategies to manifest the life of your dreams Change is hard, but it’s worth it. And with this book, it’s also a heck of a lot of fun. Readers also have access to a private Facebook group full of members who are working towards living their dreams.	2018-06-12	176	http://books.google.com/books/content?id=DjeCDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api
1EC-jwEACAAJ	My Secrets	['D. J. Benz']	none	Alise has uncovered a web of family secrets reading her mother's journals that connect to the lives of those closest to her. Now she has to contend with her new career as Director of Global Charity at TG and the irresistible Tyler Moore, while harboring secrets of her own. Tyler Moore is new in town and wants to make his mark on the world as the new Director of Marketing at TG, but at the same time he wants Alise Addison with a passion he's never known. Tyler becomes engrossed in Alise's life as an old flame from her mother's past returns to exact revenge, while also harboring a secret that threatens a relationship between them. Together Alise and Tyler are about to discover that every family has their secrets and some family secrets should stay hidden. Excerpt: My Secrets: Book Two in The Secret Series "You've known about this for weeks! Alise, I trusted you and you lied to me! What else are you keeping from me?" He really didn't want me to answer that question because it was a truckload of secrets. "As a matter of fact you know what don't answer that! You were right. Your just like your mother!"	2016-03-31	266	http://books.google.com/books/content?id=1EC-jwEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api
1VQqEAAAQBAJ	Prankster: An AFK Book (Five Nights at Freddy’s: Fazbear Frights #11)	['Scott Cawthon', 'Elley Cooper', 'Andrea Waggener']	['Young Adult Fiction']	Five Nights at Freddy's fans won't want to miss this pulse-pounding collection of three novella-length tales that will keep even the bravest FNAF player up at night... Standing up for yourself can be hard . . .Jeremiah decides he's done being the butt of his coworker's jokes at their small game studio. Joel is counting the days until he can quit his family's garden center and hit the road to a new life. Aimee finally works up the courage to ditch her loud-mouthed, annoying friend at Freddy Fazbear's Pizza. But when it comes to Five Nights at Freddy's, even the most well-meaning actions can reap horrible consequences. In this eleventh volume, Five Nights at Freddy's creator Scott Cawthon spins three sinister novella-length stories from different corners of his series' canon. Readers beware: This collection of terrifying tales is enough to unsettle even the most hardened Five Nights at Freddy's fans.	2021-11-02	224	http://books.google.com/books/content?id=1VQqEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api
PXa2bby0oQ0C	JavaScript: The Good Parts	['Douglas Crockford']	['Computers']	Most programming languages contain good and bad parts, but JavaScript has more than its share of the bad, having been developed and released in a hurry before it could be refined. This authoritative book scrapes away these bad features to reveal a subset of JavaScript that's more reliable, readable, and maintainable than the language as a whole—a subset you can use to create truly extensible and efficient code. Considered the JavaScript expert by many people in the development community, author Douglas Crockford identifies the abundance of good ideas that make JavaScript an outstanding object-oriented programming language-ideas such as functions, loose typing, dynamic objects, and an expressive object literal notation. Unfortunately, these good ideas are mixed in with bad and downright awful ideas, like a programming model based on global variables. When Java applets failed, JavaScript became the language of the Web by default, making its popularity almost completely independent of its qualities as a programming language. In JavaScript: The Good Parts, Crockford finally digs through the steaming pile of good intentions and blunders to give you a detailed look at all the genuinely elegant parts of JavaScript, including: Syntax Objects Functions Inheritance Arrays Regular expressions Methods Style Beautiful features The real beauty? As you move ahead with the subset of JavaScript that this book presents, you'll also sidestep the need to unlearn all the bad parts. Of course, if you want to find out more about the bad parts and how to use them badly, simply consult any other JavaScript book. With JavaScript: The Good Parts, you'll discover a beautiful, elegant, lightweight and highly expressive language that lets you create effective code, whether you're managing object libraries or just trying to get Ajax to run fast. If you develop sites or applications for the Web, this book is an absolute must.	2008-05-08	172	http://books.google.com/books/content?id=PXa2bby0oQ0C&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api
qU3rAgAAQBAJ	Speaking JavaScript	['Axel Rauschmayer']	['Computers']	Like it or not, JavaScript is everywhere these days—from browser to server to mobile—and now you, too, need to learn the language or dive deeper than you have. This concise book guides you into and through JavaScript, written by a veteran programmer who once found himself in the same position. Speaking JavaScript helps you approach the language with four standalone sections. First, a quick-start guide teaches you just enough of the language to help you be productive right away. More experienced JavaScript programmers will find a complete and easy-to-read reference that covers each language feature in depth. Complete contents include: JavaScript quick start: Familiar with object-oriented programming? This part helps you learn JavaScript quickly and properly. JavaScript in depth: Learn details of ECMAScript 5, from syntax, variables, functions, and object-oriented programming to regular expressions and JSON with lots of examples. Pick a topic and jump in. Background: Understand JavaScript’s history and its relationship with other programming languages. Tips, tools, and libraries: Survey existing style guides, best practices, advanced techniques, module systems, package managers, build tools, and learning resources.	2014-02-25	460	http://books.google.com/books/content?id=qU3rAgAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api
jVYnCgAAQBAJ	Pro Git	['Scott Chacon', 'Ben Straub']	['Computers']	Pro Git (Second Edition) is your fully-updated guide to Git and its usage in the modern world. Git has come a long way since it was first developed by Linus Torvalds for Linux kernel development. It has taken the open source world by storm since its inception in 2005, and this book teaches you how to use it like a pro. Effective and well-implemented version control is a necessity for successful web projects, whether large or small. With this book you’ll learn how to master the world of distributed version workflow, use the distributed features of Git to the full, and extend Git to meet your every need. Written by Git pros Scott Chacon and Ben Straub, Pro Git (Second Edition) builds on the hugely successful first edition, and is now fully updated for Git version 2.0, as well as including an indispensable chapter on GitHub. It’s the best book for all your Git needs.	2014-11-18	419	http://books.google.com/books/content?id=jVYnCgAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api
\.


--
-- Name: bookusers_bookuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacquetta
--

SELECT pg_catalog.setval('public.bookusers_bookuser_id_seq', 19, true);


--
-- Name: reviews_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacquetta
--

SELECT pg_catalog.setval('public.reviews_review_id_seq', 22, true);


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

