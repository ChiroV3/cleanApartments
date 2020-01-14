--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10
-- Dumped by pg_dump version 10.10

-- Started on 2020-01-14 09:44:26

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
-- TOC entry 2862 (class 1262 OID 16505)
-- Name: TestCleaningDb; Type: DATABASE; Schema: -; Owner: TestUser
--

CREATE DATABASE "TestCleaningDb" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Polish_Poland.1250' LC_CTYPE = 'Polish_Poland.1250';


ALTER DATABASE "TestCleaningDb" OWNER TO "TestUser";

\connect "TestCleaningDb"

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
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2864 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 205 (class 1259 OID 16564)
-- Name: ApartmentCleaningActivities; Type: TABLE; Schema: public; Owner: TestUser
--

CREATE TABLE public."ApartmentCleaningActivities" (
    "Id" integer NOT NULL,
    "ApartmentId" integer,
    "CleanerId" integer,
    "HasIssuesToReport" boolean NOT NULL,
    "Notes" text
);


ALTER TABLE public."ApartmentCleaningActivities" OWNER TO "TestUser";

--
-- TOC entry 204 (class 1259 OID 16562)
-- Name: ApartmentCleaningActivities_Id_seq; Type: SEQUENCE; Schema: public; Owner: TestUser
--

CREATE SEQUENCE public."ApartmentCleaningActivities_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ApartmentCleaningActivities_Id_seq" OWNER TO "TestUser";

--
-- TOC entry 2865 (class 0 OID 0)
-- Dependencies: 204
-- Name: ApartmentCleaningActivities_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: TestUser
--

ALTER SEQUENCE public."ApartmentCleaningActivities_Id_seq" OWNED BY public."ApartmentCleaningActivities"."Id";


--
-- TOC entry 201 (class 1259 OID 16532)
-- Name: Apartments; Type: TABLE; Schema: public; Owner: TestUser
--

CREATE TABLE public."Apartments" (
    "ApartmentId" integer NOT NULL,
    "Name" text,
    "LocationId" integer,
    "Status" integer NOT NULL
);


ALTER TABLE public."Apartments" OWNER TO "TestUser";

--
-- TOC entry 200 (class 1259 OID 16530)
-- Name: Apartments_ApartmentId_seq; Type: SEQUENCE; Schema: public; Owner: TestUser
--

CREATE SEQUENCE public."Apartments_ApartmentId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Apartments_ApartmentId_seq" OWNER TO "TestUser";

--
-- TOC entry 2866 (class 0 OID 0)
-- Dependencies: 200
-- Name: Apartments_ApartmentId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: TestUser
--

ALTER SEQUENCE public."Apartments_ApartmentId_seq" OWNED BY public."Apartments"."ApartmentId";


--
-- TOC entry 198 (class 1259 OID 16513)
-- Name: Locations; Type: TABLE; Schema: public; Owner: TestUser
--

CREATE TABLE public."Locations" (
    "Id" integer NOT NULL,
    "Name" text
);


ALTER TABLE public."Locations" OWNER TO "TestUser";

--
-- TOC entry 197 (class 1259 OID 16511)
-- Name: Locations_Id_seq; Type: SEQUENCE; Schema: public; Owner: TestUser
--

CREATE SEQUENCE public."Locations_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Locations_Id_seq" OWNER TO "TestUser";

--
-- TOC entry 2867 (class 0 OID 0)
-- Dependencies: 197
-- Name: Locations_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: TestUser
--

ALTER SEQUENCE public."Locations_Id_seq" OWNED BY public."Locations"."Id";


--
-- TOC entry 207 (class 1259 OID 16585)
-- Name: UserGroupAssignments; Type: TABLE; Schema: public; Owner: TestUser
--

CREATE TABLE public."UserGroupAssignments" (
    "UserGroupAssigmentId" integer NOT NULL,
    "UserId" integer NOT NULL,
    "UserGroupId" uuid NOT NULL
);


ALTER TABLE public."UserGroupAssignments" OWNER TO "TestUser";

--
-- TOC entry 206 (class 1259 OID 16583)
-- Name: UserGroupAssignments_UserGroupAssigmentId_seq; Type: SEQUENCE; Schema: public; Owner: TestUser
--

CREATE SEQUENCE public."UserGroupAssignments_UserGroupAssigmentId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."UserGroupAssignments_UserGroupAssigmentId_seq" OWNER TO "TestUser";

--
-- TOC entry 2868 (class 0 OID 0)
-- Dependencies: 206
-- Name: UserGroupAssignments_UserGroupAssigmentId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: TestUser
--

ALTER SEQUENCE public."UserGroupAssignments_UserGroupAssigmentId_seq" OWNED BY public."UserGroupAssignments"."UserGroupAssigmentId";


--
-- TOC entry 199 (class 1259 OID 16522)
-- Name: UserGroups; Type: TABLE; Schema: public; Owner: TestUser
--

CREATE TABLE public."UserGroups" (
    "UserGroupId" uuid NOT NULL,
    "Name" text
);


ALTER TABLE public."UserGroups" OWNER TO "TestUser";

--
-- TOC entry 203 (class 1259 OID 16548)
-- Name: Users; Type: TABLE; Schema: public; Owner: TestUser
--

CREATE TABLE public."Users" (
    "Id" integer NOT NULL,
    "FirstName" text,
    "LastName" text,
    "Username" text,
    "LocationId" integer
);


ALTER TABLE public."Users" OWNER TO "TestUser";

--
-- TOC entry 202 (class 1259 OID 16546)
-- Name: Users_Id_seq; Type: SEQUENCE; Schema: public; Owner: TestUser
--

CREATE SEQUENCE public."Users_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_Id_seq" OWNER TO "TestUser";

--
-- TOC entry 2869 (class 0 OID 0)
-- Dependencies: 202
-- Name: Users_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: TestUser
--

ALTER SEQUENCE public."Users_Id_seq" OWNED BY public."Users"."Id";


--
-- TOC entry 196 (class 1259 OID 16506)
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: TestUser
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__EFMigrationsHistory" OWNER TO "TestUser";

--
-- TOC entry 2710 (class 2604 OID 16567)
-- Name: ApartmentCleaningActivities Id; Type: DEFAULT; Schema: public; Owner: TestUser
--

ALTER TABLE ONLY public."ApartmentCleaningActivities" ALTER COLUMN "Id" SET DEFAULT nextval('public."ApartmentCleaningActivities_Id_seq"'::regclass);


--
-- TOC entry 2708 (class 2604 OID 16535)
-- Name: Apartments ApartmentId; Type: DEFAULT; Schema: public; Owner: TestUser
--

ALTER TABLE ONLY public."Apartments" ALTER COLUMN "ApartmentId" SET DEFAULT nextval('public."Apartments_ApartmentId_seq"'::regclass);


--
-- TOC entry 2707 (class 2604 OID 16516)
-- Name: Locations Id; Type: DEFAULT; Schema: public; Owner: TestUser
--

ALTER TABLE ONLY public."Locations" ALTER COLUMN "Id" SET DEFAULT nextval('public."Locations_Id_seq"'::regclass);


--
-- TOC entry 2711 (class 2604 OID 16588)
-- Name: UserGroupAssignments UserGroupAssigmentId; Type: DEFAULT; Schema: public; Owner: TestUser
--

ALTER TABLE ONLY public."UserGroupAssignments" ALTER COLUMN "UserGroupAssigmentId" SET DEFAULT nextval('public."UserGroupAssignments_UserGroupAssigmentId_seq"'::regclass);


--
-- TOC entry 2709 (class 2604 OID 16551)
-- Name: Users Id; Type: DEFAULT; Schema: public; Owner: TestUser
--

ALTER TABLE ONLY public."Users" ALTER COLUMN "Id" SET DEFAULT nextval('public."Users_Id_seq"'::regclass);


--
-- TOC entry 2727 (class 2606 OID 16572)
-- Name: ApartmentCleaningActivities PK_ApartmentCleaningActivities; Type: CONSTRAINT; Schema: public; Owner: TestUser
--

ALTER TABLE ONLY public."ApartmentCleaningActivities"
    ADD CONSTRAINT "PK_ApartmentCleaningActivities" PRIMARY KEY ("Id");


--
-- TOC entry 2720 (class 2606 OID 16540)
-- Name: Apartments PK_Apartments; Type: CONSTRAINT; Schema: public; Owner: TestUser
--

ALTER TABLE ONLY public."Apartments"
    ADD CONSTRAINT "PK_Apartments" PRIMARY KEY ("ApartmentId");


--
-- TOC entry 2715 (class 2606 OID 16521)
-- Name: Locations PK_Locations; Type: CONSTRAINT; Schema: public; Owner: TestUser
--

ALTER TABLE ONLY public."Locations"
    ADD CONSTRAINT "PK_Locations" PRIMARY KEY ("Id");


--
-- TOC entry 2730 (class 2606 OID 16590)
-- Name: UserGroupAssignments PK_UserGroupAssignments; Type: CONSTRAINT; Schema: public; Owner: TestUser
--

ALTER TABLE ONLY public."UserGroupAssignments"
    ADD CONSTRAINT "PK_UserGroupAssignments" PRIMARY KEY ("UserGroupAssigmentId");


--
-- TOC entry 2717 (class 2606 OID 16529)
-- Name: UserGroups PK_UserGroups; Type: CONSTRAINT; Schema: public; Owner: TestUser
--

ALTER TABLE ONLY public."UserGroups"
    ADD CONSTRAINT "PK_UserGroups" PRIMARY KEY ("UserGroupId");


--
-- TOC entry 2723 (class 2606 OID 16556)
-- Name: Users PK_Users; Type: CONSTRAINT; Schema: public; Owner: TestUser
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "PK_Users" PRIMARY KEY ("Id");


--
-- TOC entry 2713 (class 2606 OID 16510)
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: TestUser
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- TOC entry 2724 (class 1259 OID 16596)
-- Name: IX_ApartmentCleaningActivities_ApartmentId; Type: INDEX; Schema: public; Owner: TestUser
--

CREATE INDEX "IX_ApartmentCleaningActivities_ApartmentId" ON public."ApartmentCleaningActivities" USING btree ("ApartmentId");


--
-- TOC entry 2725 (class 1259 OID 16597)
-- Name: IX_ApartmentCleaningActivities_CleanerId; Type: INDEX; Schema: public; Owner: TestUser
--

CREATE INDEX "IX_ApartmentCleaningActivities_CleanerId" ON public."ApartmentCleaningActivities" USING btree ("CleanerId");


--
-- TOC entry 2718 (class 1259 OID 16598)
-- Name: IX_Apartments_LocationId; Type: INDEX; Schema: public; Owner: TestUser
--

CREATE INDEX "IX_Apartments_LocationId" ON public."Apartments" USING btree ("LocationId");


--
-- TOC entry 2728 (class 1259 OID 16599)
-- Name: IX_UserGroupAssignments_UserId; Type: INDEX; Schema: public; Owner: TestUser
--

CREATE INDEX "IX_UserGroupAssignments_UserId" ON public."UserGroupAssignments" USING btree ("UserId");


--
-- TOC entry 2721 (class 1259 OID 16600)
-- Name: IX_Users_LocationId; Type: INDEX; Schema: public; Owner: TestUser
--

CREATE INDEX "IX_Users_LocationId" ON public."Users" USING btree ("LocationId");


--
-- TOC entry 2733 (class 2606 OID 16573)
-- Name: ApartmentCleaningActivities FK_ApartmentCleaningActivities_Apartments_ApartmentId; Type: FK CONSTRAINT; Schema: public; Owner: TestUser
--

ALTER TABLE ONLY public."ApartmentCleaningActivities"
    ADD CONSTRAINT "FK_ApartmentCleaningActivities_Apartments_ApartmentId" FOREIGN KEY ("ApartmentId") REFERENCES public."Apartments"("ApartmentId") ON DELETE RESTRICT;


--
-- TOC entry 2734 (class 2606 OID 16578)
-- Name: ApartmentCleaningActivities FK_ApartmentCleaningActivities_Users_CleanerId; Type: FK CONSTRAINT; Schema: public; Owner: TestUser
--

ALTER TABLE ONLY public."ApartmentCleaningActivities"
    ADD CONSTRAINT "FK_ApartmentCleaningActivities_Users_CleanerId" FOREIGN KEY ("CleanerId") REFERENCES public."Users"("Id") ON DELETE RESTRICT;


--
-- TOC entry 2731 (class 2606 OID 16541)
-- Name: Apartments FK_Apartments_Locations_LocationId; Type: FK CONSTRAINT; Schema: public; Owner: TestUser
--

ALTER TABLE ONLY public."Apartments"
    ADD CONSTRAINT "FK_Apartments_Locations_LocationId" FOREIGN KEY ("LocationId") REFERENCES public."Locations"("Id") ON DELETE RESTRICT;


--
-- TOC entry 2735 (class 2606 OID 16591)
-- Name: UserGroupAssignments FK_UserGroupAssignments_Users_UserId; Type: FK CONSTRAINT; Schema: public; Owner: TestUser
--

ALTER TABLE ONLY public."UserGroupAssignments"
    ADD CONSTRAINT "FK_UserGroupAssignments_Users_UserId" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;


--
-- TOC entry 2732 (class 2606 OID 16557)
-- Name: Users FK_Users_Locations_LocationId; Type: FK CONSTRAINT; Schema: public; Owner: TestUser
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "FK_Users_Locations_LocationId" FOREIGN KEY ("LocationId") REFERENCES public."Locations"("Id") ON DELETE RESTRICT;


-- Completed on 2020-01-14 09:44:26

--
-- PostgreSQL database dump complete
--

