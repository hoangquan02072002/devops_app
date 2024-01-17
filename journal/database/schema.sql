--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0 (Debian 16.0-2)
-- Dumped by pg_dump version 16.0 (Debian 16.0-2)

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: gradebook; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gradebook (
    id integer NOT NULL,
    year integer NOT NULL,
    student_id integer NOT NULL,
    discipline_id integer NOT NULL,
    mark integer NOT NULL
);


ALTER TABLE public.gradebook OWNER TO postgres;

--
-- Name: gradebook_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gradebook_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gradebook_id_seq OWNER TO postgres;

--
-- Name: gradebook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gradebook_id_seq OWNED BY public.gradebook.id;


--
-- Name: planofstudy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planofstudy (
    id integer NOT NULL,
    speciality character varying(100) NOT NULL,
    discipline character varying(100) NOT NULL,
    semester integer NOT NULL,
    hours integer NOT NULL,
    exam_or_test character varying(100) NOT NULL
);


ALTER TABLE public.planofstudy OWNER TO postgres;

--
-- Name: planofstudy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planofstudy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.planofstudy_id_seq OWNER TO postgres;

--
-- Name: planofstudy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planofstudy_id_seq OWNED BY public.planofstudy.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id integer NOT NULL,
    lastname character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    surname character varying(100) NOT NULL,
    admission_year integer NOT NULL,
    education_form character varying(100) NOT NULL,
    "group" character varying(100) NOT NULL
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_id_seq OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: gradebook id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gradebook ALTER COLUMN id SET DEFAULT nextval('public.gradebook_id_seq'::regclass);


--
-- Name: planofstudy id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planofstudy ALTER COLUMN id SET DEFAULT nextval('public.planofstudy_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: gradebook pk_gradebook; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gradebook
    ADD CONSTRAINT pk_gradebook PRIMARY KEY (id);


--
-- Name: planofstudy pk_planofstudy; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planofstudy
    ADD CONSTRAINT pk_planofstudy PRIMARY KEY (id);


--
-- Name: students pk_students; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT pk_students PRIMARY KEY (id);


--
-- Name: gradebook fk_gradebook_discipline_id_planofstudy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gradebook
    ADD CONSTRAINT fk_gradebook_discipline_id_planofstudy FOREIGN KEY (discipline_id) REFERENCES public.planofstudy(id);


--
-- Name: gradebook fk_gradebook_student_id_students; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gradebook
    ADD CONSTRAINT fk_gradebook_student_id_students FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- Name: TABLE alembic_version; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.alembic_version TO quannguyen;


--
-- Name: TABLE gradebook; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.gradebook TO quannguyen;


--
-- Name: TABLE planofstudy; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.planofstudy TO quannguyen;


--
-- Name: TABLE students; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.students TO quannguyen;


--
-- PostgreSQL database dump complete
--

