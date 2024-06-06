--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: usernames; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.usernames (
    user_id integer NOT NULL,
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.usernames OWNER TO freecodecamp;

--
-- Name: usernames_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.usernames_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usernames_user_id_seq OWNER TO freecodecamp;

--
-- Name: usernames_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.usernames_user_id_seq OWNED BY public.usernames.user_id;


--
-- Name: usernames user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usernames ALTER COLUMN user_id SET DEFAULT nextval('public.usernames_user_id_seq'::regclass);


--
-- Data for Name: usernames; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.usernames VALUES (59, 'user_1717646916056', 2, 12);
INSERT INTO public.usernames VALUES (49, 'user_1717646484005', 2, 444);
INSERT INTO public.usernames VALUES (48, 'user_1717646484006', 5, 472);
INSERT INTO public.usernames VALUES (58, 'user_1717646916057', 5, 1000);
INSERT INTO public.usernames VALUES (51, 'user_1717646653842', 2, 111);
INSERT INTO public.usernames VALUES (50, 'user_1717646653843', 5, 131);
INSERT INTO public.usernames VALUES (61, 'user_1717646927585', 2, 590);
INSERT INTO public.usernames VALUES (53, 'user_1717646802888', 2, 426);
INSERT INTO public.usernames VALUES (60, 'user_1717646927586', 5, 108);
INSERT INTO public.usernames VALUES (52, 'user_1717646802889', 5, 26);
INSERT INTO public.usernames VALUES (55, 'user_1717646818410', 2, 125);
INSERT INTO public.usernames VALUES (63, 'user_1717646955916', 2, 299);
INSERT INTO public.usernames VALUES (54, 'user_1717646818411', 5, 152);
INSERT INTO public.usernames VALUES (47, 'test', 3, 1);
INSERT INTO public.usernames VALUES (62, 'user_1717646955917', 5, 219);
INSERT INTO public.usernames VALUES (57, 'user_1717646864235', 2, 127);
INSERT INTO public.usernames VALUES (56, 'user_1717646864236', 5, 23);
INSERT INTO public.usernames VALUES (65, 'user_1717646965850', 2, 819);
INSERT INTO public.usernames VALUES (64, 'user_1717646965851', 5, 177);


--
-- Name: usernames_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.usernames_user_id_seq', 65, true);


--
-- Name: usernames usernames_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usernames
    ADD CONSTRAINT usernames_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

