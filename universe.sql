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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    has_life boolean,
    n_stars integer,
    n_planets integer,
    n_moon integer,
    distance_from_earth numeric NOT NULL,
    description text
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
-- Name: galaxy_star_planet_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_star_planet_moon (
    galaxy_star_planet_moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL
);


ALTER TABLE public.galaxy_star_planet_moon OWNER TO freecodecamp;

--
-- Name: galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq OWNED BY public.galaxy_star_planet_moon.galaxy_star_planet_moon_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    has_life boolean,
    distance_from_earth numeric NOT NULL,
    description text,
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
    name character varying(100) NOT NULL,
    has_life boolean,
    n_moon integer,
    distance_from_earth numeric NOT NULL,
    description text,
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
    name character varying(100) NOT NULL,
    has_life boolean,
    n_planets integer,
    n_moon integer,
    distance_from_earth numeric NOT NULL,
    description text,
    galaxy_id integer NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon ALTER COLUMN galaxy_star_planet_moon_id SET DEFAULT nextval('public.galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, 2, 8, 180, 100000.00, 'The galaxy containing our Solar System.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, 1, 6, 130, 2200000.00, 'The closest spiral galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', false, 4, 5, 50, 3000000.00, 'A small spiral galaxy near the Andromeda Galaxy.');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', false, 1, 0, 0, 55000000.00, 'A massive elliptical galaxy in the Virgo Cluster.');
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', false, 1, 0, 0, 29000000.00, 'An edge-on spiral galaxy with a prominent dust lane.');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', false, 3, 0, 0, 163000.00, 'A satellite galaxy of the Milky Way, visible from the Southern Hemisphere.');


--
-- Data for Name: galaxy_star_planet_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_star_planet_moon VALUES (1, 'Earth-Moon System', 1, 1, 3, 1);
INSERT INTO public.galaxy_star_planet_moon VALUES (2, 'Mars-Phobos System', 1, 1, 4, 2);
INSERT INTO public.galaxy_star_planet_moon VALUES (3, 'Jupiter-Ganymede System', 1, 1, 5, 4);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', false, 384400.00, 'The Earth''s only natural satellite.', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 9376.00, 'A moon of Mars, one of its two moons.', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 23460.00, 'A moon of Mars, the smaller and outermost moon.', 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', false, 628300.00, 'The largest moon of Jupiter and in the Solar System.', 5);
INSERT INTO public.moon VALUES (5, 'Callisto', false, 1882700.00, 'A moon of Jupiter, known for its heavily cratered surface.', 5);
INSERT INTO public.moon VALUES (6, 'Io', false, 421800.00, 'A moon of Jupiter, known for its volcanic activity.', 5);
INSERT INTO public.moon VALUES (7, 'Europa', false, 671100.00, 'A moon of Jupiter, known for its icy surface and subsurface ocean.', 5);
INSERT INTO public.moon VALUES (8, 'Titan', false, 1257060.00, 'The largest moon of Saturn, with a thick atmosphere.', 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', false, 147948.00, 'A moon of Saturn, known for its geysers of water vapor and ice particles.', 6);
INSERT INTO public.moon VALUES (10, 'Mimas', false, 185520.00, 'A moon of Saturn, known for its large Herschel Crater.', 6);
INSERT INTO public.moon VALUES (11, 'Miranda', false, 129780.00, 'A moon of Uranus, known for its complex terrain.', 7);
INSERT INTO public.moon VALUES (12, 'Titania', false, 435910.00, 'The largest moon of Uranus.', 7);
INSERT INTO public.moon VALUES (13, 'Oberon', false, 583520.00, 'A moon of Uranus, second largest and outermost.', 7);
INSERT INTO public.moon VALUES (14, 'Triton', false, 3547600.00, 'The largest moon of Neptune, and the only large moon in the Solar System with a retrograde orbit.', 8);
INSERT INTO public.moon VALUES (15, 'Proteus', false, 117647.00, 'A moon of Neptune, known for its irregular shape.', 8);
INSERT INTO public.moon VALUES (16, 'Charon', false, 19571.00, 'The largest moon of Pluto, and is more than half the size of Pluto itself.', 9);
INSERT INTO public.moon VALUES (17, 'Nix', false, 44480.00, 'A moon of Pluto, one of its smaller moons.', 9);
INSERT INTO public.moon VALUES (18, 'Hydra', false, 64500.00, 'A moon of Pluto, one of its smaller moons.', 9);
INSERT INTO public.moon VALUES (19, 'Phobetor', false, 1065.00, 'A moon of Neptune.', 8);
INSERT INTO public.moon VALUES (20, 'S/2004 S 13', false, 1004.00, 'A moon of Uranus.', 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 0, 77000000.00, 'The smallest and innermost planet in the Solar System.', 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, 0, 261000000.00, 'The second planet from the Sun and the hottest planet in our Solar System.', 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, 1, 0, 'Our home planet, the third planet from the Sun.', 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, 2, 400000000.00, 'The fourth planet from the Sun, known as the Red Planet.', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 79, 600000000.00, 'The largest planet in our Solar System.', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 82, 1200000000.00, 'The second-largest planet and known for its extensive ring system.', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 27, 2600000000.00, 'The seventh planet from the Sun, known for its sideways rotation.', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 14, 4300000000.00, 'The eighth and farthest planet from the Sun.', 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', false, 0, 4.24, 'An exoplanet orbiting Proxima Centauri, the closest known exoplanet to Earth.', 4);
INSERT INTO public.planet VALUES (10, 'Pandora', false, 1, 370000000.00, 'A moon of the gas giant Polyphemus, featured in the movie Avatar.', 5);
INSERT INTO public.planet VALUES (11, 'Endor', false, 1, 125000000.00, 'A moon of the gas giant planet Yavin in the Star Wars universe.', 6);
INSERT INTO public.planet VALUES (12, 'Tatooine', false, 3, 104000000.00, 'A desert planet with two suns, featured in the Star Wars universe.', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, 8, 200, 1.496, 'The star at the center of our Solar System.', 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', false, 2, 0, 4.37, 'The primary star of the Alpha Centauri system.', 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', false, 2, 0, 4.37, 'The companion star of the Alpha Centauri system.', 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', false, 0, 0, 4.24, 'The closest known star to the Sun.', 1);
INSERT INTO public.star VALUES (5, 'Sirius', false, 2, 0, 8.60, 'The brightest star in the night sky.', 1);
INSERT INTO public.star VALUES (6, 'Betelgeuse', false, 0, 0, 643.0, 'A red supergiant in the constellation Orion.', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT galaxy_star_planet_moon_pkey PRIMARY KEY (galaxy_star_planet_moon_id);


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
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy_star_planet_moon unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: galaxy_star_planet_moon fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_star_planet_moon fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT fk_moon FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: galaxy_star_planet_moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: galaxy_star_planet_moon fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
