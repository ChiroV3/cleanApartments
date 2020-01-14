--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10
-- Dumped by pg_dump version 10.10

-- Started on 2020-01-14 09:45:36

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
-- TOC entry 2859 (class 0 OID 16513)
-- Dependencies: 198
-- Data for Name: Locations; Type: TABLE DATA; Schema: public; Owner: TestUser
--

COPY public."Locations" ("Id", "Name") FROM stdin;
1	Test1
2	Test2
\.


--
-- TOC entry 2862 (class 0 OID 16532)
-- Dependencies: 201
-- Data for Name: Apartments; Type: TABLE DATA; Schema: public; Owner: TestUser
--

COPY public."Apartments" ("ApartmentId", "Name", "LocationId", "Status") FROM stdin;
2	the art of serenity	1	1
3	barbakan apartments	1	1
1	the old town view	1	3
\.


--
-- TOC entry 2864 (class 0 OID 16548)
-- Dependencies: 203
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: TestUser
--

COPY public."Users" ("Id", "FirstName", "LastName", "Username", "LocationId") FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 16564)
-- Dependencies: 205
-- Data for Name: ApartmentCleaningActivities; Type: TABLE DATA; Schema: public; Owner: TestUser
--

COPY public."ApartmentCleaningActivities" ("Id", "ApartmentId", "CleanerId", "HasIssuesToReport", "Notes") FROM stdin;
1	1	\N	t	\N
2	2	\N	t	fads
3	1	\N	t	notes
4	2	\N	t	test
5	1	\N	t	notes
6	2	\N	f	\N
7	1	\N	f	\N
8	2	\N	f	asdf
9	1	\N	t	f
10	2	\N	f	afsd
11	3	\N	f	saf
12	1	\N	f	asdf
13	1	\N	f	\N
14	1	\N	f	\N
15	1	\N	t	\N
16	1	\N	f	\N
17	1	\N	f	notes
18	1	\N	f	\N
\.


--
-- TOC entry 2868 (class 0 OID 16585)
-- Dependencies: 207
-- Data for Name: UserGroupAssignments; Type: TABLE DATA; Schema: public; Owner: TestUser
--

COPY public."UserGroupAssignments" ("UserGroupAssigmentId", "UserId", "UserGroupId") FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 16522)
-- Dependencies: 199
-- Data for Name: UserGroups; Type: TABLE DATA; Schema: public; Owner: TestUser
--

COPY public."UserGroups" ("UserGroupId", "Name") FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 16506)
-- Dependencies: 196
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: TestUser
--

COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
20200108142913_init	2.2.6-servicing-10079
\.


--
-- TOC entry 2874 (class 0 OID 0)
-- Dependencies: 204
-- Name: ApartmentCleaningActivities_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: TestUser
--

SELECT pg_catalog.setval('public."ApartmentCleaningActivities_Id_seq"', 18, true);


--
-- TOC entry 2875 (class 0 OID 0)
-- Dependencies: 200
-- Name: Apartments_ApartmentId_seq; Type: SEQUENCE SET; Schema: public; Owner: TestUser
--

SELECT pg_catalog.setval('public."Apartments_ApartmentId_seq"', 1, false);


--
-- TOC entry 2876 (class 0 OID 0)
-- Dependencies: 197
-- Name: Locations_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: TestUser
--

SELECT pg_catalog.setval('public."Locations_Id_seq"', 1, false);


--
-- TOC entry 2877 (class 0 OID 0)
-- Dependencies: 206
-- Name: UserGroupAssignments_UserGroupAssigmentId_seq; Type: SEQUENCE SET; Schema: public; Owner: TestUser
--

SELECT pg_catalog.setval('public."UserGroupAssignments_UserGroupAssigmentId_seq"', 1, false);


--
-- TOC entry 2878 (class 0 OID 0)
-- Dependencies: 202
-- Name: Users_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: TestUser
--

SELECT pg_catalog.setval('public."Users_Id_seq"', 1, false);


-- Completed on 2020-01-14 09:45:36

--
-- PostgreSQL database dump complete
--

