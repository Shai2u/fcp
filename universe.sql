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
-- Name: dwarf_planets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarf_planets (
    name character varying(20),
    dwarf_planets_id integer NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.dwarf_planets OWNER TO freecodecamp;

--
-- Name: dwarf_planets_dwarf_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarf_planets_dwarf_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dwarf_planets_dwarf_id_seq OWNER TO freecodecamp;

--
-- Name: dwarf_planets_dwarf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarf_planets_dwarf_id_seq OWNED BY public.dwarf_planets.dwarf_planets_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth_light_years integer
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
    name character varying(20),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(10,3),
    planet_id integer NOT NULL,
    distance_from_earth_light_years integer
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
    name character varying(20) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(10,3),
    star_id integer NOT NULL,
    distance_from_earth_light_years integer
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
    name character varying(20) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(10,3),
    galaxy_id integer NOT NULL,
    distance_from_earth_light_years integer
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
-- Name: dwarf_planets dwarf_planets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planets ALTER COLUMN dwarf_planets_id SET DEFAULT nextval('public.dwarf_planets_dwarf_id_seq'::regclass);


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
-- Data for Name: dwarf_planets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarf_planets VALUES ('Pluto', 1, 1);
INSERT INTO public.dwarf_planets VALUES ('Ceres', 2, 1);
INSERT INTO public.dwarf_planets VALUES ('Eris', 3, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milkey_way', 'our home galaxy', true, true, 13500, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Our nearest major galaxy', NULL, true, 10000, NULL);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'A galaxy known for its birght halo', false, true, 9000, NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A galaxy with a spiral classic shape', false, false, 400, NULL);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic', 'A dwarf galaxy close to the Milky Way', false, false, 14000, NULL);
INSERT INTO public.galaxy VALUES (6, 'X', 'Unkonwn', NULL, NULL, 10, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Mercury Moon 1', 'A captured asteroid orbiting Mercury.', false, true, 4500.000, 1, NULL);
INSERT INTO public.moon VALUES (2, 'Mercury Moon 2', 'A small irregular moon.', false, true, 4000.000, 1, NULL);
INSERT INTO public.moon VALUES (3, 'Venus Moon 1', 'A faint moon with a thick atmosphere.', true, false, 2000.000, 2, NULL);
INSERT INTO public.moon VALUES (4, 'Venus Moon 2', 'A rocky irregular moon.', false, true, 3000.000, 2, NULL);
INSERT INTO public.moon VALUES (5, 'Moon', 'Earth only natural satellite.', true, true, 4500.000, 3, NULL);
INSERT INTO public.moon VALUES (6, 'Phobos', 'The larger and closer moon of Mars.', false, true, 4500.000, 4, NULL);
INSERT INTO public.moon VALUES (7, 'Deimos', 'The smaller moon of Mars.', false, true, 4500.000, 4, NULL);
INSERT INTO public.moon VALUES (8, 'Io', 'A volcanic moon with constant eruptions.', true, false, 4500.000, 5, NULL);
INSERT INTO public.moon VALUES (9, 'Europa', 'An icy moon with a possible subsurface ocean.', true, true, 4500.000, 5, NULL);
INSERT INTO public.moon VALUES (10, 'Ganymede', 'The largest moon in the Solar System.', true, false, 4500.000, 5, NULL);
INSERT INTO public.moon VALUES (11, 'Callisto', 'A heavily cratered moon.', true, false, 4500.000, 5, NULL);
INSERT INTO public.moon VALUES (12, 'Titan', 'A moon with a dense atmosphere.', true, true, 4500.000, 6, NULL);
INSERT INTO public.moon VALUES (13, 'Enceladus', 'An icy moon with geysers of water.', true, true, 4500.000, 6, NULL);
INSERT INTO public.moon VALUES (14, 'Titania', 'The largest moon of Uranus.', true, false, 4500.000, 7, NULL);
INSERT INTO public.moon VALUES (15, 'Oberon', 'A moon with a dark, cratered surface.', true, false, 4500.000, 7, NULL);
INSERT INTO public.moon VALUES (16, 'Triton', 'A retrograde orbit moon with geysers.', true, false, 4500.000, 8, NULL);
INSERT INTO public.moon VALUES (17, 'Nereid', 'An irregular moon with an eccentric orbit.', false, true, 4500.000, 8, NULL);
INSERT INTO public.moon VALUES (18, 'Exo Moon 1', 'A moon orbiting the exoplanet.', false, true, 3000.000, 22, NULL);
INSERT INTO public.moon VALUES (19, 'Exo Moon 2', 'A rocky irregular moon.', false, true, 2500.000, 22, NULL);
INSERT INTO public.moon VALUES (20, 'Exo Moon 3', 'Unkonwn', NULL, NULL, 2000.000, 22, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The smallest and innermost planet in the Solar System.', true, false, 5790.000, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 'Similar in size to Earth but with a thick, toxic atmosphere.', true, false, 10820.000, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 'The only planet known to support life.', true, true, 14960.000, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 'Known as the Red Planet, it has the tallest volcano in the Solar System.', true, false, 22790.000, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in the Solar System, with a Great Red Spot.', true, false, 77830.000, 1, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Famous for its prominent ring system.', true, false, 14270.000, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 'An ice giant with a tilted axis of rotation.', true, false, 28710.000, 1, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The farthest planet from the Sun, known for its deep blue color.', true, false, 44950.000, 1, NULL);
INSERT INTO public.planet VALUES (22, 'Canis Major b', 'A gas giant orbiting Sirius.', true, false, 34000.000, 2, NULL);
INSERT INTO public.planet VALUES (23, 'Betelgeuse I', 'A rocky planet near the dying red supergiant.', true, false, 15.000, 3, NULL);
INSERT INTO public.planet VALUES (24, 'North Star b', 'A frozen planet orbiting Polaris.', true, false, 8.000, 4, NULL);
INSERT INTO public.planet VALUES (25, 'Rigel A-1', 'A planet scorched by the heat of Rigel.', true, false, 120000.000, 5, NULL);
INSERT INTO public.planet VALUES (26, 'X', 'Unknown planet', false, false, 5.000, 5, NULL);
INSERT INTO public.planet VALUES (27, 'X1', 'Unknown planet1', false, false, 5.000, 4, NULL);
INSERT INTO public.planet VALUES (28, 'X2', 'Unknown planet2', false, false, 5.000, 3, NULL);
INSERT INTO public.planet VALUES (29, 'X3', 'Unknown planet3', false, false, 5.000, 2, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of the Solar System.', true, true, 4600.000, 1, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 'The brightest star in the night sky.', false, true, 242.000, 2, NULL);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'A red supergiant nearing the end of its life.', false, true, 10.000, 3, NULL);
INSERT INTO public.star VALUES (4, 'Polaris', 'The North Star, used for navigation.', false, true, 70.000, 4, NULL);
INSERT INTO public.star VALUES (5, 'Rigel', 'A blue supergiant in the Orion constellation.', false, true, 8.000, 5, NULL);
INSERT INTO public.star VALUES (6, 'X', 'Unknown', NULL, NULL, NULL, 6, NULL);


--
-- Name: dwarf_planets_dwarf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarf_planets_dwarf_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 29, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: dwarf_planets dwarf_planets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planets
    ADD CONSTRAINT dwarf_planets_name_key UNIQUE (name);


--
-- Name: dwarf_planets dwarf_planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planets
    ADD CONSTRAINT dwarf_planets_pkey PRIMARY KEY (dwarf_planets_id);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id PRIMARY KEY (moon_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id PRIMARY KEY (planet_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id PRIMARY KEY (star_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: dwarf_planets fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planets
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

