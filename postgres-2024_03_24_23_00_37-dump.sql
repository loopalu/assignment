--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: seq_client; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_client
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_client OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id bigint DEFAULT nextval('public.seq_client'::regclass) NOT NULL,
    name character varying(70) NOT NULL,
    agreedtoterms boolean NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: seq_clientsector; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_clientsector
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_clientsector OWNER TO postgres;

--
-- Name: clientsector; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientsector (
    id bigint DEFAULT nextval('public.seq_clientsector'::regclass) NOT NULL,
    clientid bigint NOT NULL,
    sectorid bigint NOT NULL
);


ALTER TABLE public.clientsector OWNER TO postgres;

--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO postgres;

--
-- Name: seq_sector; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_sector
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_sector OWNER TO postgres;

--
-- Name: sector; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sector (
    id bigint DEFAULT nextval('public.seq_sector'::regclass) NOT NULL,
    sectorname character varying(100) NOT NULL,
    parentid bigint
);


ALTER TABLE public.sector OWNER TO postgres;

--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.client (id, name, agreedtoterms) VALUES (1, 'Aivar', true);
INSERT INTO public.client (id, name, agreedtoterms) VALUES (2, 'Bob', true);
INSERT INTO public.client (id, name, agreedtoterms) VALUES (3, 'Bobo', true);
INSERT INTO public.client (id, name, agreedtoterms) VALUES (4, 'LinkedIn', true);


--
-- Data for Name: clientsector; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.clientsector (id, clientid, sectorid) VALUES (76, 4, 25);
INSERT INTO public.clientsector (id, clientid, sectorid) VALUES (77, 4, 122);
INSERT INTO public.clientsector (id, clientid, sectorid) VALUES (32, 3, 18);
INSERT INTO public.clientsector (id, clientid, sectorid) VALUES (36, 2, 342);
INSERT INTO public.clientsector (id, clientid, sectorid) VALUES (46, 1, 342);
INSERT INTO public.clientsector (id, clientid, sectorid) VALUES (47, 1, 111);
INSERT INTO public.clientsector (id, clientid, sectorid) VALUES (48, 1, 113);


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (1, '1', 'create initial tables', 'SQL', 'V1__create_initial_tables.sql', 1306983890, 'postgres', '2024-03-23 19:35:35.12764', 108, true);
INSERT INTO public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (2, '2', 'insert sector values', 'SQL', 'V2__insert_sector_values.sql', 718437666, 'postgres', '2024-03-23 19:35:35.296412', 88, true);
INSERT INTO public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (3, '3', 'drop selected column', 'SQL', 'V3__drop_selected_column.sql', -78957892, 'postgres', '2024-03-23 19:35:35.420377', 5, true);


--
-- Data for Name: sector; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sector (id, sectorname, parentid) VALUES (1, 'Manufacturing', NULL);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (19, 'Construction materials', 1);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (18, 'Electronics and Optics', 1);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (6, 'Food and Beverage', 1);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (342, 'Bakery & confectionery products', 6);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (43, 'Beverages', 6);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (42, 'Fish & fish products', 6);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (40, 'Meat & meat products', 6);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (39, 'Milk & dairy products', 6);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (437, 'Other', 6);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (378, 'Sweets & snack food', 6);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (13, 'Furniture', 1);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (389, 'Bathroom/sauna', 13);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (385, 'Bedroom', 13);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (390, 'Children’s room', 13);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (98, 'Kitchen', 13);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (101, 'Living room', 13);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (392, 'Office', 13);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (394, 'Other (Furniture)', 13);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (341, 'Outdoor', 13);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (99, 'Project furniture', 13);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (12, 'Machinery', 1);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (94, 'Machinery components', 12);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (91, 'Machinery equipment/tools', 12);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (224, 'Manufacture of machinery', 12);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (97, 'Maritime', 12);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (271, 'Aluminium and steel workboats', 97);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (269, 'Boat/Yacht building', 97);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (230, 'Ship repair and conversion', 97);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (93, 'Metal structures', 12);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (508, 'Other', 12);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (227, 'Repair and maintenance service', 12);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (11, 'Metalworking', 1);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (67, 'Construction of metal structures', 11);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (263, 'Houses and buildings', 11);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (267, 'Metal products', 11);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (542, 'Metal works', 11);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (75, 'CNC-machining', 542);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (62, 'Forgings, Fasteners', 542);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (69, 'Gas, Plasma, Laser cutting', 542);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (66, 'MIG, TIG, Aluminum welding', 542);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (9, 'Plastic and Rubber', 1);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (54, 'Packaging', 9);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (556, 'Plastic goods', 9);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (559, 'Plastic processing technology', 9);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (55, 'Blowing', 559);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (57, 'Moulding', 559);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (53, 'Plastics welding and processing', 559);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (560, 'Plastic profiles', 9);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (5, 'Printing', 1);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (148, 'Advertising', 5);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (150, 'Book/Periodicals printing', 5);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (145, 'Labelling and packaging printing', 5);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (7, 'Textile and Clothing', 1);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (44, 'Clothing', 7);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (45, 'Textile', 7);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (8, 'Wood', 1);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (337, 'Other (Wood)', 8);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (51, 'Wooden building materials', 8);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (47, 'Wooden houses', 8);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (3, 'Other', NULL);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (37, 'Creative industries', 3);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (29, 'Energy technology', 3);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (33, 'Environment', 3);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (2, 'Service', NULL);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (25, 'Business services', 2);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (35, 'Engineering', 2);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (28, 'Information Technology and Telecommunications', 2);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (581, 'Data processing, Web portals, E-marketing', 28);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (576, 'Programming, Consultancy', 28);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (121, 'Software, Hardware', 28);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (122, 'Telecommunications', 28);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (22, 'Tourism', 2);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (141, 'Translation services', 2);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (21, 'Transport and Logistics', 2);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (111, 'Air', 21);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (114, 'Rail', 21);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (112, 'Road', 21);
INSERT INTO public.sector (id, sectorname, parentid) VALUES (113, 'Water', 21);


--
-- Name: seq_client; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_client', 4, true);


--
-- Name: seq_clientsector; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_clientsector', 77, true);


--
-- Name: seq_sector; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_sector', 1, false);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- Name: clientsector clientsector_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientsector
    ADD CONSTRAINT clientsector_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: sector sector_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sector
    ADD CONSTRAINT sector_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- Name: idx_client_agreedtoterms; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_client_agreedtoterms ON public.client USING btree (agreedtoterms);


--
-- Name: idx_client_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_client_name ON public.client USING btree (name);


--
-- Name: idx_clientsector_clientid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clientsector_clientid ON public.clientsector USING btree (clientid);


--
-- Name: idx_clientsector_sectorid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clientsector_sectorid ON public.clientsector USING btree (sectorid);


--
-- Name: idx_sector_parentid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_sector_parentid ON public.sector USING btree (parentid);


--
-- Name: idx_sector_sectorname; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_sector_sectorname ON public.sector USING btree (sectorname);


--
-- Name: clientsector clientsector_clientid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientsector
    ADD CONSTRAINT clientsector_clientid_fkey FOREIGN KEY (clientid) REFERENCES public.client(id);


--
-- Name: clientsector clientsector_sectorid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientsector
    ADD CONSTRAINT clientsector_sectorid_fkey FOREIGN KEY (sectorid) REFERENCES public.sector(id);


--
-- Name: sector sector_parentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sector
    ADD CONSTRAINT sector_parentid_fkey FOREIGN KEY (parentid) REFERENCES public.sector(id);


--
-- PostgreSQL database dump complete
--

