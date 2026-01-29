--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: g_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.g_type (
    g_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    dummy integer DEFAULT 0
);


ALTER TABLE public.g_type OWNER TO freecodecamp;

--
-- Name: g_type_g_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.g_type_g_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.g_type_g_type_id_seq OWNER TO freecodecamp;

--
-- Name: g_type_g_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.g_type_g_type_id_seq OWNED BY public.g_type.g_type_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance numeric(8,2),
    has_black_hole boolean,
    g_type_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(100) NOT NULL,
    diameter_in_km integer NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(10) NOT NULL,
    has_life boolean NOT NULL,
    number_of_moons integer NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    is_binary boolean NOT NULL,
    color text NOT NULL,
    constellation character varying(30),
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: g_type g_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.g_type ALTER COLUMN g_type_id SET DEFAULT nextval('public.g_type_g_type_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: g_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.g_type VALUES (1, 'Spiral', 0);
INSERT INTO public.g_type VALUES (2, 'Irregular Dwarf', 0);
INSERT INTO public.g_type VALUES (3, 'Barred Spiral', 0);
INSERT INTO public.g_type VALUES (4, 'Elliptical', 0);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0.00, true, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2.50, false, 1);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 28.00, false, 1);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 163000.00, false, 2);
INSERT INTO public.galaxy VALUES (5, 'NGC 1300', 61.00, false, 3);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 13.00, false, 4);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 'Yellow cast', 3500, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Heavily cratered', 22, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Maybe a captured asteroid', 13, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Largest moon in solar system', 5268, 5);
INSERT INTO public.moon VALUES (5, 'Io', 'Volcanically Active', 3642, 5);
INSERT INTO public.moon VALUES (6, 'Europa', 'Made of silicate rock', 3120, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Tidally heated', 4820, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Has dense atmosphere', 5150, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 'Discovered in 1672', 3056, 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'Plumes from Enceladus is the source of the material in Saturn''s E ring.', 1000, 6);
INSERT INTO public.moon VALUES (11, 'Titania', 'Surface has water ice and frozen carbon dioxide', 1578, 7);
INSERT INTO public.moon VALUES (12, 'Oberon', 'Named after Shakespeare play Midsummers Night Dream', 1522, 7);
INSERT INTO public.moon VALUES (13, 'Miranda', 'Has surface features of fractures, faults, valleys, craters', 472, 7);
INSERT INTO public.moon VALUES (14, 'Triton', 'Covered by frozen nitrogen', 2710, 8);
INSERT INTO public.moon VALUES (15, 'Nereid', 'Appears neutral in color', 360, 8);
INSERT INTO public.moon VALUES (16, 'Charon', 'Discovered in 1978 by Naval Observatory Flagstaff Station', 1212, 10);
INSERT INTO public.moon VALUES (17, 'Vanth', 'Angular separation from planet is 0.25 arcseconds', 886, 11);
INSERT INTO public.moon VALUES (18, 'Hi''iaka', 'Orbits planet every 49 days', 310, 12);
INSERT INTO public.moon VALUES (19, 'Namaka', 'Orbits planet every 18 days', 170, 12);
INSERT INTO public.moon VALUES (20, 'Amalthea', 'Reddish in color.', 166, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, '''Mercury''', false, 0, 1);
INSERT INTO public.planet VALUES (2, '''Venus''', false, 0, 1);
INSERT INTO public.planet VALUES (3, '''Earth''', true, 1, 1);
INSERT INTO public.planet VALUES (4, '''Mars''', false, 2, 1);
INSERT INTO public.planet VALUES (5, '''Jupitor''', false, 97, 1);
INSERT INTO public.planet VALUES (6, '''Saturn''', false, 275, 1);
INSERT INTO public.planet VALUES (7, '''Uranus''', false, 28, 1);
INSERT INTO public.planet VALUES (8, '''Neptune''', false, 16, 1);
INSERT INTO public.planet VALUES (9, '''Astroids''', false, 0, 1);
INSERT INTO public.planet VALUES (10, '''Pluto''', false, 5, 1);
INSERT INTO public.planet VALUES (11, '''Orcus''', false, 1, 1);
INSERT INTO public.planet VALUES (12, '''Haumea''', false, 5, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, false, 'Yellow', 'None', 1, 'The Sun');
INSERT INTO public.star VALUES (2, true, 'Blue-White', 'Canus Major', 1, 'Sirius');
INSERT INTO public.star VALUES (3, false, 'Red', 'Scorpius', 1, 'Antares');
INSERT INTO public.star VALUES (4, false, 'Blue', 'Carina', 1, 'Canopus');
INSERT INTO public.star VALUES (5, false, 'Red', 'Taurus', 1, 'Aldebaran');
INSERT INTO public.star VALUES (6, true, 'Blue-White', 'Leo', 1, 'Regulus');
INSERT INTO public.star VALUES (7, true, 'Blue', 'Orion', 1, 'Mintaka');


--
-- Name: g_type_g_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.g_type_g_type_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: g_type g_type_id_name_uniq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.g_type
    ADD CONSTRAINT g_type_id_name_uniq UNIQUE (name);


--
-- Name: g_type g_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.g_type
    ADD CONSTRAINT g_type_pkey PRIMARY KEY (g_type_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star uniq_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uniq_name UNIQUE (name);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: planet unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--
