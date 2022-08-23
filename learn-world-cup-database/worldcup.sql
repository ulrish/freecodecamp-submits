--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(60) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(60) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (129, 2018, 'Final', 1729, 1730, 4, 2);
INSERT INTO public.games VALUES (130, 2018, 'Third Place', 1731, 1732, 2, 0);
INSERT INTO public.games VALUES (131, 2018, 'Semi-Final', 1730, 1732, 2, 1);
INSERT INTO public.games VALUES (132, 2018, 'Semi-Final', 1729, 1731, 1, 0);
INSERT INTO public.games VALUES (133, 2018, 'Quarter-Final', 1730, 1738, 3, 2);
INSERT INTO public.games VALUES (134, 2018, 'Quarter-Final', 1732, 1740, 2, 0);
INSERT INTO public.games VALUES (135, 2018, 'Quarter-Final', 1731, 1742, 2, 1);
INSERT INTO public.games VALUES (136, 2018, 'Quarter-Final', 1729, 1744, 2, 0);
INSERT INTO public.games VALUES (137, 2018, 'Eighth-Final', 1732, 1746, 2, 1);
INSERT INTO public.games VALUES (138, 2018, 'Eighth-Final', 1740, 1748, 1, 0);
INSERT INTO public.games VALUES (139, 2018, 'Eighth-Final', 1731, 1750, 3, 2);
INSERT INTO public.games VALUES (140, 2018, 'Eighth-Final', 1742, 1752, 2, 0);
INSERT INTO public.games VALUES (141, 2018, 'Eighth-Final', 1730, 1754, 2, 1);
INSERT INTO public.games VALUES (142, 2018, 'Eighth-Final', 1738, 1756, 2, 1);
INSERT INTO public.games VALUES (143, 2018, 'Eighth-Final', 1744, 1758, 2, 1);
INSERT INTO public.games VALUES (144, 2018, 'Eighth-Final', 1729, 1760, 4, 3);
INSERT INTO public.games VALUES (145, 2014, 'Final', 1761, 1760, 1, 0);
INSERT INTO public.games VALUES (146, 2014, 'Third Place', 1763, 1742, 3, 0);
INSERT INTO public.games VALUES (147, 2014, 'Semi-Final', 1760, 1763, 1, 0);
INSERT INTO public.games VALUES (148, 2014, 'Semi-Final', 1761, 1742, 7, 1);
INSERT INTO public.games VALUES (149, 2014, 'Quarter-Final', 1763, 1770, 1, 0);
INSERT INTO public.games VALUES (150, 2014, 'Quarter-Final', 1760, 1731, 1, 0);
INSERT INTO public.games VALUES (151, 2014, 'Quarter-Final', 1742, 1746, 2, 1);
INSERT INTO public.games VALUES (152, 2014, 'Quarter-Final', 1761, 1729, 1, 0);
INSERT INTO public.games VALUES (153, 2014, 'Eighth-Final', 1742, 1778, 2, 1);
INSERT INTO public.games VALUES (154, 2014, 'Eighth-Final', 1746, 1744, 2, 0);
INSERT INTO public.games VALUES (155, 2014, 'Eighth-Final', 1729, 1782, 2, 0);
INSERT INTO public.games VALUES (156, 2014, 'Eighth-Final', 1761, 1784, 2, 1);
INSERT INTO public.games VALUES (157, 2014, 'Eighth-Final', 1763, 1752, 2, 1);
INSERT INTO public.games VALUES (158, 2014, 'Eighth-Final', 1770, 1788, 2, 1);
INSERT INTO public.games VALUES (159, 2014, 'Eighth-Final', 1760, 1748, 1, 0);
INSERT INTO public.games VALUES (160, 2014, 'Eighth-Final', 1731, 1792, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (1729, 'France');
INSERT INTO public.teams VALUES (1730, 'Croatia');
INSERT INTO public.teams VALUES (1731, 'Belgium');
INSERT INTO public.teams VALUES (1732, 'England');
INSERT INTO public.teams VALUES (1738, 'Russia');
INSERT INTO public.teams VALUES (1740, 'Sweden');
INSERT INTO public.teams VALUES (1742, 'Brazil');
INSERT INTO public.teams VALUES (1744, 'Uruguay');
INSERT INTO public.teams VALUES (1746, 'Colombia');
INSERT INTO public.teams VALUES (1748, 'Switzerland');
INSERT INTO public.teams VALUES (1750, 'Japan');
INSERT INTO public.teams VALUES (1752, 'Mexico');
INSERT INTO public.teams VALUES (1754, 'Denmark');
INSERT INTO public.teams VALUES (1756, 'Spain');
INSERT INTO public.teams VALUES (1758, 'Portugal');
INSERT INTO public.teams VALUES (1760, 'Argentina');
INSERT INTO public.teams VALUES (1761, 'Germany');
INSERT INTO public.teams VALUES (1763, 'Netherlands');
INSERT INTO public.teams VALUES (1770, 'Costa Rica');
INSERT INTO public.teams VALUES (1778, 'Chile');
INSERT INTO public.teams VALUES (1782, 'Nigeria');
INSERT INTO public.teams VALUES (1784, 'Algeria');
INSERT INTO public.teams VALUES (1788, 'Greece');
INSERT INTO public.teams VALUES (1792, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 160, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 1792, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--