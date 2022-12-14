--
-- The file is owned by SIMON SIN Chun Hung
-- Mathematician, Developer, HKUST graduate
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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    galaxy_type character varying(30),
    galaxy_group character varying(30) NOT NULL,
    constellation character varying(30)
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
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    radius_in_km integer,
    atmosphere boolean,
    orbital_velocity_km_o_sec numeric,
    orbital_period_days integer
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    planet_types text,
    star_id integer NOT NULL,
    num_of_moons integer,
    orbital_period_in_day integer,
    orbital_velocity_km_o_s numeric,
    ring_system boolean,
    global_magnetic_field boolean
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying(30),
    star_temp_in_k integer,
    star_radius_rel_sun numeric,
    star_mass_rel_sun numeric
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
-- Name: uni_junction; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.uni_junction (
    name character varying(30) NOT NULL,
    uni_junction_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer,
    moon_id integer
);


ALTER TABLE public.uni_junction OWNER TO freecodecamp;

--
-- Name: uni_junction_uni_junction_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.uni_junction_uni_junction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uni_junction_uni_junction_id_seq OWNER TO freecodecamp;

--
-- Name: uni_junction_uni_junction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.uni_junction_uni_junction_id_seq OWNED BY public.uni_junction.uni_junction_id;


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
-- Name: uni_junction uni_junction_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.uni_junction ALTER COLUMN uni_junction_id SET DEFAULT nextval('public.uni_junction_uni_junction_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 'SBbc', 'local group', 'Sagittarius');
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 'SAsb', 'local group', 'Andromeda');
INSERT INTO public.galaxy VALUES ('Triangulum', 3, 'SAscd', 'local group', 'Triangulum');
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud', 4, 'lrr/SB(s)m', 'local group', 'Dorado');
INSERT INTO public.galaxy VALUES ('Small Magellanic Cloud', 5, 'SB(s)m pec', 'local group', 'Tucana');
INSERT INTO public.galaxy VALUES ('Aquarius Dwarf', 6, 'lB(s)m', 'local group', 'Aquarius');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Luna', 1, 3, 1737, false, 1.03, 28);
INSERT INTO public.moon VALUES ('Phobos', 2, 4, 1243, false, 2.14, 1);
INSERT INTO public.moon VALUES ('Deimos', 3, 4, 252, false, 1.36, 1);
INSERT INTO public.moon VALUES ('Ganymede', 4, 5, 2631, true, 10.88, 7);
INSERT INTO public.moon VALUES ('Callisto', 5, 5, 2400, true, 8.21, 17);
INSERT INTO public.moon VALUES ('IO', 6, 5, 1815, true, 17.34, 2);
INSERT INTO public.moon VALUES ('Europa', 7, 5, 1569, true, 13.74, 4);
INSERT INTO public.moon VALUES ('Titan', 8, 6, 2575, true, 5.58, 16);
INSERT INTO public.moon VALUES ('Rhea', 9, 6, 765, true, 8.49, 5);
INSERT INTO public.moon VALUES ('lapetus', 10, 6, 730, false, 79.33, 79);
INSERT INTO public.moon VALUES ('Dione', 11, 6, 560, false, 10.03, 3);
INSERT INTO public.moon VALUES ('Tethys', 12, 6, 530, false, 11.36, 2);
INSERT INTO public.moon VALUES ('Titania', 13, 7, 789, true, 3.65, 9);
INSERT INTO public.moon VALUES ('Oberon', 14, 7, 761, false, 3.15, 13);
INSERT INTO public.moon VALUES ('Umbriel', 15, 7, 585, false, 4.67, 4);
INSERT INTO public.moon VALUES ('Arial', 16, 7, 579, false, 5.52, 3);
INSERT INTO public.moon VALUES ('Miranda', 17, 7, 236, false, 4.67, 4);
INSERT INTO public.moon VALUES ('Triton', 18, 8, 1350, true, 4.39, 6);
INSERT INTO public.moon VALUES ('Proteus', 19, 8, 200, false, 7.63, 1);
INSERT INTO public.moon VALUES ('Charon', 20, 9, 586, false, 0.23, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('mercury', 1, 'classical', 5, 0, 88, 47.4, false, true);
INSERT INTO public.planet VALUES ('Venus', 2, 'classical', 5, 0, 225, 35, false, false);
INSERT INTO public.planet VALUES ('Earth', 3, 'classical', 5, 1, 365, 29.8, false, true);
INSERT INTO public.planet VALUES ('Mars', 4, 'classical', 5, 2, 687, 24.1, false, false);
INSERT INTO public.planet VALUES ('Jupiter', 5, 'classical', 5, 79, 4331, 13.1, true, true);
INSERT INTO public.planet VALUES ('Saturn', 6, 'classical', 5, 82, 10747, 9.7, true, true);
INSERT INTO public.planet VALUES ('Uranus', 7, 'classical', 5, 27, 30589, 6.8, true, true);
INSERT INTO public.planet VALUES ('Neptune', 8, 'classical', 5, 14, 59800, 5.4, true, true);
INSERT INTO public.planet VALUES ('Pluto', 9, 'classical', 5, 5, 90560, 4.7, false, NULL);
INSERT INTO public.planet VALUES ('Proxima b', 10, 'exoplanet', 4, 0, 4015, NULL, NULL, true);
INSERT INTO public.planet VALUES ('Proxima c', 12, 'exoplanet', 4, 0, 1928, NULL, true, NULL);
INSERT INTO public.planet VALUES ('Proxima d', 11, 'exoplanet', 4, 0, 5, NULL, NULL, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('10 Lacertae', 1, 2, 'O', 40000, 10, 50);
INSERT INTO public.star VALUES ('Spica', 2, 4, 'B', 20000, 5, 10);
INSERT INTO public.star VALUES ('Sirius A', 3, 6, 'A', 8500, 1.7, 2);
INSERT INTO public.star VALUES ('Proxima Centauri', 4, 3, 'F', 6500, 1.3, 1.5);
INSERT INTO public.star VALUES ('Sun', 5, 1, 'G', 5700, 1, 1);
INSERT INTO public.star VALUES ('Alpha Centauri B', 6, 5, 'K', 4500, 0.8, 0.7);
INSERT INTO public.star VALUES ('Betelgeuse', 7, 2, 'M', 3200, 0.3, 0.2);


--
-- Data for Name: uni_junction; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.uni_junction VALUES ('item1', 1, 1, 5, 1, NULL);
INSERT INTO public.uni_junction VALUES ('item2', 2, 1, 5, 2, NULL);
INSERT INTO public.uni_junction VALUES ('item3', 3, 1, 5, 3, 1);
INSERT INTO public.uni_junction VALUES ('item4', 4, 1, 5, 4, 2);
INSERT INTO public.uni_junction VALUES ('item5', 5, 1, 5, 4, 3);
INSERT INTO public.uni_junction VALUES ('item6', 6, 1, 5, 5, 4);
INSERT INTO public.uni_junction VALUES ('item7', 7, 1, 5, 5, 5);
INSERT INTO public.uni_junction VALUES ('item8', 8, 1, 5, 5, 6);
INSERT INTO public.uni_junction VALUES ('item9', 9, 1, 5, 5, 7);
INSERT INTO public.uni_junction VALUES ('item10', 10, 1, 5, 6, 8);
INSERT INTO public.uni_junction VALUES ('item11', 11, 1, 5, 6, 9);
INSERT INTO public.uni_junction VALUES ('item12', 12, 1, 5, 6, 10);
INSERT INTO public.uni_junction VALUES ('item13', 13, 1, 5, 6, 11);
INSERT INTO public.uni_junction VALUES ('item14', 14, 1, 5, 6, 12);
INSERT INTO public.uni_junction VALUES ('item15', 15, 1, 5, 7, 13);
INSERT INTO public.uni_junction VALUES ('item16', 16, 1, 5, 7, 14);
INSERT INTO public.uni_junction VALUES ('item17', 17, 1, 5, 7, 15);
INSERT INTO public.uni_junction VALUES ('item18', 18, 1, 5, 7, 16);
INSERT INTO public.uni_junction VALUES ('item19', 19, 1, 5, 7, 17);
INSERT INTO public.uni_junction VALUES ('item20', 20, 1, 5, 8, 18);
INSERT INTO public.uni_junction VALUES ('item21', 21, 1, 5, 8, 19);
INSERT INTO public.uni_junction VALUES ('item22', 22, 1, 5, 9, 20);
INSERT INTO public.uni_junction VALUES ('item23', 23, 2, 1, NULL, NULL);
INSERT INTO public.uni_junction VALUES ('item24', 24, 2, 7, NULL, NULL);
INSERT INTO public.uni_junction VALUES ('item25', 25, 3, 4, 10, NULL);
INSERT INTO public.uni_junction VALUES ('item26', 26, 3, 4, 11, NULL);
INSERT INTO public.uni_junction VALUES ('item27', 27, 3, 4, 12, NULL);
INSERT INTO public.uni_junction VALUES ('item28', 28, 4, 2, NULL, NULL);
INSERT INTO public.uni_junction VALUES ('item29', 29, 5, 6, NULL, NULL);
INSERT INTO public.uni_junction VALUES ('item30', 30, 6, 3, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: uni_junction_uni_junction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.uni_junction_uni_junction_id_seq', 30, true);


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
-- Name: uni_junction uni_junction_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.uni_junction
    ADD CONSTRAINT uni_junction_name_key UNIQUE (name);


--
-- Name: uni_junction uni_junction_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.uni_junction
    ADD CONSTRAINT uni_junction_pkey PRIMARY KEY (uni_junction_id);


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
