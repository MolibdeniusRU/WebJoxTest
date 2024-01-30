--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: doctrine_migration_versions; Type: TABLE; Schema: public; Owner: webjoxtest
--

CREATE TABLE public.doctrine_migration_versions
(
    version        character varying(191) NOT NULL,
    executed_at    timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer
);


ALTER TABLE public.doctrine_migration_versions
    OWNER TO webjoxtest;

--
-- Name: post; Type: TABLE; Schema: public; Owner: webjoxtest
--

CREATE TABLE public.post
(
    id             integer                        NOT NULL,
    tag_id         integer,
    content        text                           NOT NULL,
    create_at      timestamp(0) without time zone NOT NULL,
    state          character varying(255)         NOT NULL,
    photo_filename character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.post
    OWNER TO webjoxtest;

--
-- Name: COLUMN post.create_at; Type: COMMENT; Schema: public; Owner: webjoxtest
--

COMMENT ON COLUMN public.post.create_at IS '(DC2Type:datetime_immutable)';


--
-- Name: post_id_seq; Type: SEQUENCE; Schema: public; Owner: webjoxtest
--

CREATE SEQUENCE public.post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_id_seq OWNER TO webjoxtest;

--
-- Name: tag; Type: TABLE; Schema: public; Owner: webjoxtest
--

CREATE TABLE public.tag
(
    id   integer                NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.tag
    OWNER TO webjoxtest;

--
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: webjoxtest
--

CREATE SEQUENCE public.tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tag_id_seq OWNER TO webjoxtest;

--
-- Name: user; Type: TABLE; Schema: public; Owner: webjoxtest
--

CREATE TABLE public."user"
(
    id          integer                NOT NULL,
    username    character varying(180) NOT NULL,
    roles       json                   NOT NULL,
    password    character varying(255) NOT NULL,
    email       character varying(255) NOT NULL,
    is_verified boolean                NOT NULL
);


ALTER TABLE public."user"
    OWNER TO webjoxtest;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: webjoxtest
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO webjoxtest;

--
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: webjoxtest
--

COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
DoctrineMigrations\\Version20240125143631	2024-01-25 14:41:44	352
DoctrineMigrations\\Version20240125205645	2024-01-25 20:57:57	114
DoctrineMigrations\\Version20240126002926	2024-01-26 00:30:15	223
DoctrineMigrations\\Version20240129115433	2024-01-29 11:55:54	374
DoctrineMigrations\\Version20240129132748	2024-01-29 13:36:31	102
\.


--
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: webjoxtest
--

COPY public.post (id, tag_id, content, create_at, state, photo_filename) FROM stdin;
3	1	Это пост про науку	2024-01-26 15:48:00	published	science1.jpg
14	3	Архитектурные шедевры: красота и функциональность 🏰\r\n\r\nОт небоскребов до инновационных мостов, архитектура не только удивляет своей красотой, но и обеспечивает функциональность. Какие здания в мире вызывают у вас восхищение?	2024-01-30 15:05:33	published	building1.jpg
15	3	Инфраструктура города будущего: умные и устойчивые города 🌆\r\n\r\nЭнергоэффективные дома, интеллектуальные системы управления транспортом, зеленые зоны — строительство городов будущего нацелено на создание комфортной и устойчивой среды. Как вы видите развитие городской инфраструктуры в будущем?	2024-01-30 15:06:07	published	building2.jpg
16	3	3D-печать в строительстве: революция в создании домов 🏡\r\n\r\nИнновационные методы строительства с использованием 3D-печати обещают сократить сроки и стоимость строительства. Как вы оцениваете перспективы 3D-печати в строительстве?	2024-01-30 15:06:46	published	building3.jpg
17	3	Энергоэффективные технологии в строительстве: забота о планете 🌍\r\n\r\nОт солнечных панелей до умных систем управления энергопотреблением, строительство становится более экологичным и энергоэффективным. Какие инновации в области энергосбережения вам известны?	2024-01-30 15:07:29	published	building4.jpg
11	2	Современные технологии: мощь инноваций 🚀\r\n\r\nТехника неуклонно ведет нас в будущее, преобразуя наш мир с каждым днем. Смарт-гаджеты, искусственный интеллект, электромобили — вот лишь некоторые вехи нашего технологического путешествия. Какие изобретения впечатляют вас больше всего?	2024-01-30 13:59:41	published	tech3.jpg
10	2	5 инновационных технологий, которые меняют игру 🌐\r\n\r\nКвантовые компьютеры: революция в области вычислений.\r\nИнтернет вещей: когда каждое устройство становится умным.\r\nБеспилотные транспортные средства: будущее автомобильного мира.\r\nГенетическая редакция: ключ к новым методам лечения.\r\nЭнергия из возобновляемых источников: чистое будущее наших городов.	2024-01-26 15:59:00	draft	tech2.jpg
9	2	Техника в повседневной жизни: удобство и эффективность 💼\r\n\r\nОт умных холодильников, которые составляют список покупок, до беспилотных пылесосов, облегчающих уборку — техника сделала нашу жизнь более комфортной и продуктивной. Какие технологии вы используете, чтобы сделать свой день более эффективным?	2024-01-26 15:58:00	published	tech1.jpg
12	2	Будущее мобильности: транспорт завтрашнего дня 🚗\r\n\r\nЭлектрические автомобили, гиперлупы, беспилотные дроны — техника меняет картину городской мобильности. Как вы видите будущее транспорта, и какие инновации вас вдохновляют?	2024-01-30 14:59:58	published	tech4.jpg
13	2	Технологии в медицине: лечение будущего 💉\r\n\r\nОт роботов-хирургов до виртуальной реальности в реабилитации — техника внедряется в сферу здравоохранения, помогая лечить и ухаживать за пациентами более эффективно. Какие медицинские технологии вызывают у вас интерес?	2024-01-30 15:00:44	published	tech5.jpg
8	1	Научные открытия: исследование неизведанных границ 🔬\r\n\r\nОткрытия в области космоса, микробиологии, искусственного интеллекта — наука расширяет границы нашего понимания мира. Какие последние научные открытия вас заинтересовали?	2024-01-26 15:56:00	published	science6.jpg
7	1	Технологии в медицине: лечение будущего 💊\r\n\r\nГенетическая терапия, тканевая инженерия, нейронаука — наука и технологии в медицине совершают удивительные прорывы. Как вы видите влияние науки на будущее медицины?	2024-01-26 15:55:00	published	science5.jpg
6	1	Экологическая наука: борьба за зеленое будущее 🌿\r\n\r\nИсследования в области климатических изменений, возобновляемых источников энергии, охраны окружающей среды — наука играет ключевую роль в поиске решений экологических проблем. Какие экологические исследования вас впечатлили?	2024-01-26 15:53:00	draft	science4.jpg
5	1	Научное образование: строим будущее знаний 📚\r\n\r\nЦифровые технологии, онлайн-курсы, интерактивные эксперименты — научное образование становится доступным и захватывающим. Какие методы обучения в науке вас вдохновляют?	2024-01-26 15:52:00	published	science3.jpg
4	1	Биотехнологии: искусство работы с живым 🧬\r\n\r\nГенетическая модификация, клеточная терапия, искусственные органы — биотехнологии открывают новые возможности в области здравоохранения и сельского хозяйства. Как вы оцениваете влияние биотехнологий на нашу жизнь?	2024-01-26 15:51:00	published	science2.jpg
18	3	Строительство на Луне и Марсе: новые горизонты человечества 🌌\r\n\r\nИсследование возможности строительства на других планетах становится ближе к реальности. Как вы представляете себе будущее строительства в космосе?	2024-01-30 15:08:18	published	building5.jpg
19	4	Современное искусство: экспрессия в новом формате 🎨\r\n\r\nЦифровые технологии, виртуальная реальность, интерактивные инсталляции — современные художники находят новые способы самовыражения. Какие произведения современного искусства вызывают у вас восторг?	2024-01-30 15:11:40	published	art1.jpg
20	4	Искусство и технологии: гармония в креативности 🤖\r\n\r\nРоботы-художники, искусственный интеллект в создании музыки — технологии вносят новые аспекты в творческий процесс. Как вы оцениваете влияние технологий на искусство?	2024-01-30 15:12:11	published	art2.jpg
21	4	Стрит-арт и граффити: уличное искусство в городском пространстве 🏙️\r\n\r\nУличные художники используют городскую среду в качестве холста, чтобы делиться своими идеями и сообщениями. Какие произведения уличного искусства привлекают ваше внимание?	2024-01-30 15:13:24	published	art3.jpg
22	4	Виртуальные выставки и музеи: искусство без границ 🌐\r\n\r\nОнлайн-платформы позволяют наслаждаться искусством виртуально, преодолевая географические и временные ограничения. Какие виртуальные выставки вы посетили и чем они вас впечатлили?	2024-01-30 15:13:58	published	art4.jpg
23	4	Архитектурная иллюзия: здания, играющие с воображением 🧠\r\n\r\nЗдания с необычной архитектурой, создающие иллюзию движения или меняющие форму, придают городскому ландшафту уникальный характер. Какие архитектурные иллюзии вам известны?	2024-01-30 15:14:56	published	art5.jpg
24	5	Магия в истории: от древности до современности 📜\r\n\r\nВ разных культурах магия занимала важное место, будь то религиозные обряды, ритуалы или волшебные практики. Как вы видите связь между магией и культурным наследием?	2024-01-30 15:15:37	published	magic1.jpg
25	5	Магия в литературе и искусстве: мистика в творчестве ✨\r\n\r\nВолшебные миры, волшебные существа и волшебные заклинания — магия стала вдохновением для многих художников и писателей. Какие произведения искусства о магии вам особенно запомнились?	2024-01-30 15:16:23	published	magic2.jpg
26	5	Современная магия: технологии и волшебство 🤖\r\n\r\nВиртуальная реальность, голография, инновационные технологии — современные разработки могут напоминать о волшебстве. Какие технологии для вас самые волшебные?	2024-01-30 15:16:59	published	magic3.jpg
27	5	Магия в повседневной жизни: традиции и современность 🕯️\r\n\r\nРуны, амулеты, обряды — некоторые люди до сих пор верят в силу магии и прибегают к ней в повседневной жизни. Какие магические практики вызывают у вас интерес?	2024-01-30 15:17:47	published	magic4.jpg
28	5	"Магия в кино: экранная волшебная стихия 🎬\r\n\r\nФильмы о волшебстве и магии завораживают зрителей, перенося их в удивительные миры и приключения. Какие фильмы о магии для вас стали настоящими шедеврами?	2024-01-30 15:18:26	published	magic5.jpg
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: webjoxtest
--

COPY public.tag (id, name) FROM stdin;
1	Наука
2	Техника
3	Строительство
5	Магия
4	Искусcтво
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: webjoxtest
--

COPY public."user" (id, username, roles, password, email, is_verified) FROM stdin;
2	admin	["ROLE_ADMIN"]	$2y$13$fvtIRBwIjpK66MPZSqy9Re/BR6tVbXlPyHV0XjpfV/48uFR3Lv5hy	admin@test.com	f
12	Anton	["ROLE_MODERATOR"]	$2y$13$P9z3RoZ1C6c2ER32eE3YJe7WkB4nR28X.vA0pCQLYeaX3O68yKrX2	molibdenius@gmail.com	f
\.


--
-- Name: post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webjoxtest
--

SELECT pg_catalog.setval('public.post_id_seq', 28, true);


--
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webjoxtest
--

SELECT pg_catalog.setval('public.tag_id_seq', 5, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webjoxtest
--

SELECT pg_catalog.setval('public.user_id_seq', 12, true);


--
-- Name: doctrine_migration_versions doctrine_migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: webjoxtest
--

ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);


--
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: webjoxtest
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);


--
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: webjoxtest
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: webjoxtest
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: idx_5a8a6c8dbad26311; Type: INDEX; Schema: public; Owner: webjoxtest
--

CREATE INDEX idx_5a8a6c8dbad26311 ON public.post USING btree (tag_id);


--
-- Name: uniq_8d93d649f85e0677; Type: INDEX; Schema: public; Owner: webjoxtest
--

CREATE UNIQUE INDEX uniq_8d93d649f85e0677 ON public."user" USING btree (username);


--
-- Name: post fk_5a8a6c8dbad26311; Type: FK CONSTRAINT; Schema: public; Owner: webjoxtest
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT fk_5a8a6c8dbad26311 FOREIGN KEY (tag_id) REFERENCES public.tag (id);


--
-- PostgreSQL database dump complete
--

