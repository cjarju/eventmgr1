--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

-- Started on 2017-04-10 18:07:38

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2248 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 187 (class 1259 OID 16404)
-- Name: event_dates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE event_dates (
    id integer NOT NULL,
    event_id integer,
    event_date date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- TOC entry 186 (class 1259 OID 16402)
-- Name: event_dates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE event_dates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2249 (class 0 OID 0)
-- Dependencies: 186
-- Name: event_dates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE event_dates_id_seq OWNED BY event_dates.id;


--
-- TOC entry 189 (class 1259 OID 16413)
-- Name: event_info_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE event_info_types (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone
);


--
-- TOC entry 188 (class 1259 OID 16411)
-- Name: event_info_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE event_info_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2250 (class 0 OID 0)
-- Dependencies: 188
-- Name: event_info_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE event_info_types_id_seq OWNED BY event_info_types.id;


--
-- TOC entry 191 (class 1259 OID 16421)
-- Name: event_item_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE event_item_types (
    id integer NOT NULL,
    event_id integer NOT NULL,
    item_type_id integer NOT NULL,
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 190 (class 1259 OID 16419)
-- Name: event_item_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE event_item_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2251 (class 0 OID 0)
-- Dependencies: 190
-- Name: event_item_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE event_item_types_id_seq OWNED BY event_item_types.id;


--
-- TOC entry 193 (class 1259 OID 16429)
-- Name: event_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE event_items (
    id integer NOT NULL,
    event_id integer NOT NULL,
    item_id integer NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    days integer DEFAULT 1 NOT NULL,
    cost1_per_unit numeric(11,2),
    cost2_per_unit numeric(11,2),
    cost3_per_unit numeric(11,2),
    width real DEFAULT 1.0 NOT NULL,
    height real DEFAULT 1.0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone
);


--
-- TOC entry 192 (class 1259 OID 16427)
-- Name: event_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE event_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2252 (class 0 OID 0)
-- Dependencies: 192
-- Name: event_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE event_items_id_seq OWNED BY event_items.id;


--
-- TOC entry 195 (class 1259 OID 16441)
-- Name: event_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE event_types (
    id integer NOT NULL,
    event_type_name character varying(50) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone
);


--
-- TOC entry 194 (class 1259 OID 16439)
-- Name: event_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE event_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2253 (class 0 OID 0)
-- Dependencies: 194
-- Name: event_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE event_types_id_seq OWNED BY event_types.id;


--
-- TOC entry 197 (class 1259 OID 16449)
-- Name: events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE events (
    id integer NOT NULL,
    date_requested date NOT NULL,
    event_name character varying(100) NOT NULL,
    organizers character varying(100) NOT NULL,
    location character varying(100) NOT NULL,
    requested_by character varying(100) NOT NULL,
    perceived_benefits character varying(1000) NOT NULL,
    goodwill character varying(1000) NOT NULL,
    event_type_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone
);


--
-- TOC entry 196 (class 1259 OID 16447)
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2254 (class 0 OID 0)
-- Dependencies: 196
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- TOC entry 199 (class 1259 OID 16460)
-- Name: item_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE item_types (
    id integer NOT NULL,
    item_type_name character varying(100) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    description character varying(255),
    has_dimensions boolean DEFAULT false NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 16458)
-- Name: item_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE item_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2255 (class 0 OID 0)
-- Dependencies: 198
-- Name: item_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE item_types_id_seq OWNED BY item_types.id;


--
-- TOC entry 201 (class 1259 OID 16469)
-- Name: items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE items (
    id integer NOT NULL,
    item_name character varying(100) NOT NULL,
    cost1_per_unit numeric(11,2),
    cost2_per_unit numeric(11,2),
    cost3_per_unit numeric(11,2),
    item_type_id integer NOT NULL,
    width real DEFAULT 1.0 NOT NULL,
    height real DEFAULT 1.0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone
);


--
-- TOC entry 200 (class 1259 OID 16467)
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2256 (class 0 OID 0)
-- Dependencies: 200
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE items_id_seq OWNED BY items.id;


--
-- TOC entry 185 (class 1259 OID 16395)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 16479)
-- Name: user_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_roles (
    id integer NOT NULL,
    name character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- TOC entry 202 (class 1259 OID 16477)
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2257 (class 0 OID 0)
-- Dependencies: 202
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_roles_id_seq OWNED BY user_roles.id;


--
-- TOC entry 205 (class 1259 OID 16487)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    user_role_id integer,
    name character varying(100),
    email character varying(255),
    password_digest character varying(255),
    remember_token character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- TOC entry 204 (class 1259 OID 16485)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2258 (class 0 OID 0)
-- Dependencies: 204
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 2062 (class 2604 OID 16407)
-- Name: event_dates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY event_dates ALTER COLUMN id SET DEFAULT nextval('event_dates_id_seq'::regclass);


--
-- TOC entry 2063 (class 2604 OID 16416)
-- Name: event_info_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY event_info_types ALTER COLUMN id SET DEFAULT nextval('event_info_types_id_seq'::regclass);


--
-- TOC entry 2064 (class 2604 OID 16424)
-- Name: event_item_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY event_item_types ALTER COLUMN id SET DEFAULT nextval('event_item_types_id_seq'::regclass);


--
-- TOC entry 2065 (class 2604 OID 16432)
-- Name: event_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY event_items ALTER COLUMN id SET DEFAULT nextval('event_items_id_seq'::regclass);


--
-- TOC entry 2070 (class 2604 OID 16444)
-- Name: event_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY event_types ALTER COLUMN id SET DEFAULT nextval('event_types_id_seq'::regclass);


--
-- TOC entry 2071 (class 2604 OID 16452)
-- Name: events id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- TOC entry 2072 (class 2604 OID 16463)
-- Name: item_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY item_types ALTER COLUMN id SET DEFAULT nextval('item_types_id_seq'::regclass);


--
-- TOC entry 2074 (class 2604 OID 16472)
-- Name: items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY items ALTER COLUMN id SET DEFAULT nextval('items_id_seq'::regclass);


--
-- TOC entry 2077 (class 2604 OID 16482)
-- Name: user_roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_roles ALTER COLUMN id SET DEFAULT nextval('user_roles_id_seq'::regclass);


--
-- TOC entry 2078 (class 2604 OID 16490)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2223 (class 0 OID 16404)
-- Dependencies: 187
-- Data for Name: event_dates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY event_dates (id, event_id, event_date, created_at, updated_at) FROM stdin;
154	7	2014-03-07	\N	\N
155	8	2014-04-05	\N	\N
156	9	2014-03-23	\N	\N
157	10	2014-03-28	\N	\N
158	11	2014-03-28	\N	\N
159	12	2014-03-29	\N	\N
160	13	2014-04-04	\N	\N
161	14	2014-05-09	\N	\N
162	15	2014-03-31	\N	\N
163	16	2014-03-30	\N	\N
164	17	2014-04-12	\N	\N
165	18	2014-04-25	\N	\N
166	19	2014-05-09	\N	\N
167	20	2014-04-05	\N	\N
168	21	2014-04-21	\N	\N
169	54	2014-05-23	\N	\N
170	53	2014-05-10	\N	\N
171	55	2014-05-31	\N	\N
172	24	2014-04-26	\N	\N
173	25	2014-04-25	\N	\N
174	26	2014-05-10	\N	\N
175	27	2014-04-18	\N	\N
176	38	2014-06-07	\N	\N
177	40	2014-05-02	\N	\N
178	41	2014-05-30	\N	\N
179	42	2014-05-09	\N	\N
180	43	2014-04-21	\N	\N
181	75	2014-06-14	\N	\N
182	62	2014-06-14	\N	\N
183	46	2014-05-02	\N	\N
184	47	2014-04-25	\N	\N
185	76	2014-06-07	\N	\N
186	49	2014-05-17	\N	\N
187	50	2014-05-03	\N	\N
188	51	2014-05-02	\N	\N
189	61	2014-06-13	\N	\N
190	60	2014-05-31	\N	\N
191	64	2014-05-30	\N	\N
192	67	2014-05-30	\N	\N
193	66	2014-05-25	\N	\N
194	69	2014-05-17	\N	\N
195	88	2014-08-17	\N	\N
196	71	2014-06-13	\N	\N
197	72	2014-06-07	\N	\N
198	73	2014-06-06	\N	\N
199	74	2014-06-13	\N	\N
200	77	2014-06-20	\N	\N
201	78	2014-06-26	\N	\N
202	79	2014-06-21	\N	\N
203	84	2014-07-28	\N	\N
204	113	2014-11-15	\N	\N
205	114	2014-11-01	\N	\N
206	83	2014-07-29	\N	\N
207	85	2014-07-29	\N	\N
208	86	2014-08-29	\N	\N
209	87	2014-08-31	\N	\N
210	89	2014-08-30	\N	\N
211	90	2014-08-09	\N	\N
212	91	2014-10-24	\N	\N
213	92	2014-08-16	\N	\N
214	93	2014-08-14	\N	\N
215	98	2014-09-01	\N	\N
216	99	2014-10-16	\N	\N
217	97	2014-08-24	\N	\N
218	96	2014-09-03	\N	\N
219	100	2014-10-18	\N	\N
220	101	2014-10-10	\N	\N
221	104	2014-10-05	\N	\N
222	103	2014-10-01	\N	\N
223	105	2014-10-04	\N	\N
224	106	2014-10-03	\N	\N
225	107	2014-11-07	\N	\N
226	108	2014-11-01	\N	\N
227	109	2014-10-31	\N	\N
228	110	2014-11-14	\N	\N
229	111	2014-11-17	\N	\N
230	112	2014-10-25	\N	\N
231	115	2014-10-25	\N	\N
232	116	2014-12-05	\N	\N
233	117	2014-10-01	\N	\N
234	118	2014-11-22	\N	\N
235	119	2014-11-28	\N	\N
236	120	2014-11-01	\N	\N
237	123	2014-11-22	\N	\N
238	144	2014-12-13	\N	\N
239	124	2014-11-07	\N	\N
240	125	2014-11-14	\N	\N
241	145	2014-11-29	\N	\N
242	146	2014-12-26	\N	\N
243	148	2014-12-05	\N	\N
244	149	2014-12-31	\N	\N
245	150	2014-12-25	\N	\N
246	151	2014-12-06	\N	\N
247	152	2014-12-18	\N	\N
248	169	2014-12-25	\N	\N
249	164	2014-12-24	\N	\N
250	165	2014-12-27	\N	\N
251	166	2014-12-13	\N	\N
252	167	2015-01-09	\N	\N
253	168	2014-12-20	\N	\N
254	159	2014-12-28	\N	\N
255	160	2014-12-26	\N	\N
256	161	2014-12-25	\N	\N
257	171	2014-12-31	\N	\N
258	172	2014-12-25	\N	\N
259	173	2014-12-27	\N	\N
260	174	2015-01-31	\N	\N
261	293	2015-10-01	\N	\N
262	176	2015-01-17	\N	\N
263	371	2016-02-06	\N	\N
264	332	2015-12-04	\N	\N
265	298	2015-11-07	\N	\N
266	290	2015-09-29	\N	\N
267	179	2015-02-20	\N	\N
268	180	2015-01-30	\N	\N
269	185	2015-01-31	\N	\N
270	184	2015-02-06	\N	\N
271	281	2015-08-29	\N	\N
272	186	2015-02-07	\N	\N
273	187	2015-02-20	\N	\N
274	188	2015-03-06	\N	\N
275	189	2015-02-18	\N	\N
276	305	2015-12-25	\N	\N
277	253	2015-05-29	\N	\N
278	192	2015-02-14	\N	\N
279	193	2015-02-28	\N	\N
280	195	2015-02-21	\N	\N
281	196	2015-02-07	\N	\N
282	197	2015-03-07	\N	\N
283	286	2015-09-11	\N	\N
284	199	2015-02-20	\N	\N
285	200	2015-02-14	\N	\N
286	285	2015-09-28	\N	\N
287	203	2015-03-07	\N	\N
288	209	2015-03-28	\N	\N
289	204	2015-03-14	\N	\N
290	205	2015-03-07	\N	\N
291	288	2015-09-27	\N	\N
292	207	2015-03-28	\N	\N
293	208	2015-03-14	\N	\N
294	210	2015-03-27	\N	\N
295	211	2015-04-03	\N	\N
296	212	2015-04-06	\N	\N
297	226	2015-03-27	\N	\N
298	227	2015-04-04	\N	\N
299	214	2015-04-06	\N	\N
300	215	2015-05-01	\N	\N
301	216	2015-03-28	\N	\N
302	228	2015-04-04	\N	\N
303	218	2015-04-10	\N	\N
304	219	2015-04-10	\N	\N
305	220	2015-04-18	\N	\N
306	221	2015-04-04	\N	\N
307	222	2015-04-05	\N	\N
308	223	2015-03-27	\N	\N
309	224	2015-04-04	\N	\N
310	225	2015-04-18	\N	\N
311	229	2015-04-25	\N	\N
312	230	2015-04-18	\N	\N
313	231	2015-04-12	\N	\N
314	232	2015-04-18	\N	\N
315	233	2015-04-11	\N	\N
316	234	2015-04-18	\N	\N
317	236	2015-05-01	\N	\N
318	250	2015-05-22	\N	\N
319	238	2015-05-08	\N	\N
320	241	2015-05-08	\N	\N
321	242	2015-05-08	\N	\N
322	251	2015-05-29	\N	\N
323	284	2015-09-01	\N	\N
324	245	2015-05-09	\N	\N
325	282	2015-09-06	\N	\N
326	283	2015-09-24	\N	\N
327	247	2015-06-12	\N	\N
328	249	2015-05-22	\N	\N
329	252	2015-05-16	\N	\N
330	254	2015-06-06	\N	\N
331	306	2015-12-11	\N	\N
332	256	2015-06-14	\N	\N
333	257	2015-05-23	\N	\N
334	258	2015-05-31	\N	\N
335	259	2015-06-07	\N	\N
336	260	2015-05-29	\N	\N
337	261	2015-06-06	\N	\N
338	262	2015-05-22	\N	\N
339	263	2015-06-06	\N	\N
340	264	2015-06-01	\N	\N
341	265	2015-06-05	\N	\N
342	266	2015-07-04	\N	\N
343	268	2015-07-19	\N	\N
344	269	2015-07-17	\N	\N
345	270	2015-07-24	\N	\N
346	287	2015-10-01	\N	\N
347	280	2015-08-30	\N	\N
348	272	2015-07-24	\N	\N
349	273	2015-07-28	\N	\N
350	274	2015-08-08	\N	\N
351	278	2015-11-07	\N	\N
352	276	2015-08-15	\N	\N
353	277	2015-08-15	\N	\N
354	307	2015-10-30	\N	\N
355	295	2015-11-06	\N	\N
356	296	2015-10-31	\N	\N
357	297	2015-11-14	\N	\N
358	308	2015-10-24	\N	\N
359	309	2015-11-06	\N	\N
360	310	2015-10-31	\N	\N
361	311	2015-11-21	\N	\N
362	328	2015-11-27	\N	\N
363	329	2015-12-05	\N	\N
364	313	2015-11-06	\N	\N
365	367	2016-03-04	\N	\N
366	315	2015-11-19	\N	\N
367	316	2015-11-28	\N	\N
368	317	2015-11-14	\N	\N
369	318	2015-11-13	\N	\N
370	319	2015-11-21	\N	\N
371	320	2015-12-12	\N	\N
372	321	2015-11-14	\N	\N
373	372	2016-02-07	\N	\N
374	323	2015-12-05	\N	\N
375	324	2015-11-21	\N	\N
376	325	2015-11-28	\N	\N
377	326	2015-11-21	\N	\N
378	327	2015-12-24	\N	\N
379	330	2015-11-29	\N	\N
380	333	2015-11-28	\N	\N
381	334	2015-11-27	\N	\N
382	369	2016-02-13	\N	\N
383	370	2016-02-20	\N	\N
384	337	2015-12-24	\N	\N
385	338	2015-12-18	\N	\N
386	368	2016-03-25	\N	\N
387	340	2016-01-03	\N	\N
388	341	2015-12-25	\N	\N
389	342	2015-12-27	\N	\N
390	343	2015-12-18	\N	\N
391	344	2015-12-19	\N	\N
392	345	2015-12-31	\N	\N
393	346	2015-12-26	\N	\N
394	347	2015-12-27	\N	\N
395	348	2016-01-02	\N	\N
396	349	2015-12-31	\N	\N
397	350	2016-01-29	\N	\N
398	351	2016-01-08	\N	\N
399	352	2016-01-30	\N	\N
400	353	2016-02-12	\N	\N
401	354	2016-01-30	\N	\N
402	355	2016-01-29	\N	\N
403	356	2016-02-05	\N	\N
404	357	2016-01-30	\N	\N
405	358	2016-01-23	\N	\N
406	359	2016-02-12	\N	\N
407	361	2016-02-06	\N	\N
408	362	2016-02-26	\N	\N
409	363	2016-01-23	\N	\N
410	364	2016-02-05	\N	\N
411	365	2016-02-06	\N	\N
412	366	2016-01-31	\N	\N
413	373	2016-02-26	\N	\N
414	374	2016-02-14	\N	\N
415	375	2016-02-27	\N	\N
416	378	2016-02-02	\N	\N
417	377	2016-01-28	\N	\N
418	379	2016-02-04	\N	\N
419	380	2016-02-14	\N	\N
420	381	2016-02-20	\N	\N
421	382	2016-02-20	\N	\N
422	383	2016-02-19	\N	\N
423	384	2016-03-05	\N	\N
424	385	2016-04-02	\N	\N
425	386	2016-03-12	\N	\N
426	387	2016-03-05	\N	\N
427	388	2016-03-19	\N	\N
428	389	2016-03-12	\N	\N
429	390	2016-03-11	\N	\N
430	391	2016-04-02	\N	\N
431	392	2016-03-15	\N	\N
432	393	2016-04-03	\N	\N
433	394	2016-03-28	\N	\N
434	395	2016-03-18	\N	\N
435	396	2016-03-26	\N	\N
436	397	2016-04-02	\N	\N
437	398	2016-04-08	\N	\N
438	399	2016-03-26	\N	\N
439	400	2016-05-06	\N	\N
440	401	2016-03-26	\N	\N
441	402	2016-04-16	\N	\N
442	403	2016-04-29	\N	\N
443	404	2016-04-15	\N	\N
444	405	2016-04-30	\N	\N
445	406	2016-04-24	\N	\N
446	407	2016-04-23	\N	\N
447	408	2016-04-23	\N	\N
448	409	2016-04-29	\N	\N
449	410	2016-04-22	\N	\N
450	411	2016-04-26	\N	\N
451	412	2016-04-23	\N	\N
452	413	2016-04-23	\N	\N
453	414	2016-04-05	\N	\N
454	415	2016-05-14	\N	\N
455	416	2016-05-01	\N	\N
456	417	2016-05-12	\N	\N
457	418	2016-05-22	\N	\N
458	419	2016-05-21	\N	\N
459	420	2016-06-03	\N	\N
460	422	2016-04-29	\N	\N
461	423	2016-04-30	\N	\N
462	424	2016-04-29	\N	\N
463	437	2016-05-21	\N	\N
464	426	2016-05-28	\N	\N
465	427	2016-05-28	\N	\N
466	428	2016-05-15	\N	\N
467	435	2016-05-21	\N	\N
468	430	2016-05-20	\N	\N
469	431	2016-05-21	\N	\N
470	432	2016-05-20	\N	\N
471	442	2016-06-04	\N	\N
472	434	2016-05-27	\N	\N
473	436	2016-05-27	\N	\N
474	438	2016-05-20	\N	\N
475	439	2016-05-22	\N	\N
476	440	2015-12-12	\N	\N
477	441	2015-05-22	\N	\N
478	443	2016-05-21	\N	\N
479	444	2016-07-23	\N	\N
480	445	2016-06-26	\N	\N
481	448	2016-07-23	\N	\N
482	447	2016-07-09	\N	\N
483	449	2016-07-22	\N	\N
484	450	2016-07-18	\N	\N
485	451	2016-07-22	\N	\N
486	452	2016-07-31	\N	\N
487	453	2016-07-21	\N	\N
488	454	2016-07-30	\N	\N
489	455	2016-07-29	\N	\N
490	456	2016-07-30	\N	\N
491	457	2016-07-29	\N	\N
1	1	2017-03-28	2017-03-21 21:08:04.341596	2017-03-21 21:08:04.341596
2	1	2017-03-29	2017-03-21 21:08:04.431661	2017-03-21 21:08:04.431661
\.


--
-- TOC entry 2259 (class 0 OID 0)
-- Dependencies: 186
-- Name: event_dates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('event_dates_id_seq', 4, true);


--
-- TOC entry 2225 (class 0 OID 16413)
-- Dependencies: 189
-- Data for Name: event_info_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY event_info_types (id, name, created_at, updated_at) FROM stdin;
1	Event Items	2017-03-02 00:00:00	2017-03-02 00:00:00
2	Sponsorship Form	2017-03-02 00:00:00	2017-03-02 00:00:00
\.


--
-- TOC entry 2260 (class 0 OID 0)
-- Dependencies: 188
-- Name: event_info_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('event_info_types_id_seq', 1, false);


--
-- TOC entry 2227 (class 0 OID 16421)
-- Dependencies: 191
-- Data for Name: event_item_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY event_item_types (id, event_id, item_type_id, description, created_at, updated_at) FROM stdin;
6	7	4	Banners for Publicity	2014-03-18 13:25:18	2014-03-18 13:25:18
7	7	1	Air time on Afri-Radio Only	2014-03-18 13:25:19	2014-03-18 13:25:19
8	7	5	20,000 subscribers	2014-03-18 13:25:19	2014-03-18 13:25:19
9	7	6	Credit for Communication	2014-03-18 13:25:19	2014-03-18 13:25:19
10	7	7	P.A system for 4 locations	2014-03-18 13:25:19	2014-03-18 13:25:19
11	8	6	Golden Numbers	2014-03-18 15:24:51	2014-03-18 15:24:51
12	8	9	10 T-shirts	2014-03-18 15:24:51	2014-03-18 15:24:51
13	8	10	Footballs, Umbrellas, Phones	2014-03-19 10:23:12	2014-03-19 10:23:45
14	9	4	Back Drop	2014-03-19 16:04:48	2014-03-19 16:04:48
15	9	6	Credit for Communication	2014-03-19 16:04:48	2014-03-19 16:04:48
16	9	7	P.A System	2014-03-19 16:04:48	2014-03-19 16:04:48
17	10	1	On Afri-Radio Only	2014-03-19 16:18:30	2014-03-19 16:18:30
18	10	2	On Daily Observer	2014-03-19 16:18:31	2014-03-19 16:18:31
19	10	4	2 Banners	2014-03-19 16:18:31	2014-03-19 16:18:31
20	10	5	20,000 Subscribers	2014-03-19 16:18:31	2014-03-19 16:18:31
21	10	6	Credit For Communication	2014-03-19 16:18:31	2014-03-19 16:18:31
22	10	7	P.A System	2014-03-19 16:18:31	2014-03-19 16:18:31
23	11	1	7 spots on Afri Radio	2014-03-25 11:01:53	2014-03-25 11:01:53
24	11	4	Outdoor publicity	2014-03-25 11:01:53	2014-03-25 11:01:53
25	11	6	For Communication	2014-03-25 11:01:53	2014-03-25 11:01:53
26	11	7	P.A System	2014-03-25 11:01:53	2014-03-25 11:01:53
27	12	1	6 spots on Afri-Radio	2014-03-25 11:27:37	2014-03-25 11:27:37
28	12	4	Outdoor publicity	2014-03-25 11:27:37	2014-03-25 11:27:37
29	12	6	Credit for communication	2014-03-25 11:27:37	2014-03-25 11:27:37
30	13	4	Outdoor Publicity	2014-03-25 11:43:55	2014-03-25 11:43:55
31	13	5	10,000 Subscribers	2014-03-25 11:43:56	2014-03-25 11:43:56
32	13	6	Credit for Communication	2014-03-25 11:43:56	2014-03-25 11:43:56
33	13	1	Description	2014-03-25 11:44:31	2014-03-25 11:44:31
34	14	1	10 spots on Afri-Radio	2014-03-25 12:23:40	2014-03-25 12:23:40
35	14	4	Outdoor Publicity	2014-03-25 12:23:41	2014-03-25 12:23:41
36	14	5	10,000 Subscribers	2014-03-25 12:23:41	2014-03-25 12:23:41
37	14	6	Credit & Sim Cards	2014-03-25 12:23:41	2014-03-25 12:23:41
38	15	1	Description	2014-03-27 17:05:56	2014-03-27 17:05:56
39	16	7	P.A System	2014-03-28 13:45:39	2014-03-28 13:45:39
40	16	9	20 T-Shirts	2014-03-28 13:45:40	2014-03-28 13:45:40
41	17	4	Outdoor Publicity	2014-03-31 12:42:52	2014-03-31 12:42:52
42	17	5	10,000 Subcribers	2014-03-31 12:42:52	2014-03-31 12:42:52
43	17	6	2000 Real Credit	2014-03-31 12:42:52	2014-03-31 12:42:52
44	18	1	On Afri-Radio & West Coast Radio	2014-04-01 12:44:47	2014-04-01 12:44:47
45	18	4	Outdoor Publicity	2014-04-01 12:44:48	2014-04-01 12:44:48
46	18	5	SMS Broadcast	2014-04-01 12:44:48	2014-04-01 12:44:48
47	18	6	Communication	2014-04-01 12:44:48	2014-04-01 12:44:48
48	19	4	Outdoor Publicity	2014-04-01 15:41:37	2014-04-01 15:41:37
49	19	6	Communication	2014-04-01 15:41:38	2014-04-01 15:41:38
50	19	1	Description	2014-04-01 15:42:39	2014-04-01 15:42:39
51	19	7	Description	2014-04-01 15:43:04	2014-04-01 15:43:04
52	20	1	Description	2014-04-01 16:34:14	2014-04-01 16:34:14
53	21	1	On Afri-Radio Only	2014-04-01 16:52:35	2014-04-01 16:52:35
54	21	4	Outdoor Publicity	2014-04-01 16:52:36	2014-04-01 16:52:36
58	24	1	Radio Advert	2014-04-04 12:18:08	2014-04-04 12:18:08
59	24	4	Outdoor Publicity	2014-04-04 12:18:08	2014-04-04 12:18:08
60	24	5	10,000 Subscribers	2014-04-04 12:18:08	2014-04-04 12:18:08
61	24	6	Communication	2014-04-04 12:18:08	2014-04-04 12:18:08
62	25	1	On Afri-Radio & Other Radios	2014-04-04 15:03:59	2014-04-04 15:03:59
63	25	4	Outdoor Publicity	2014-04-04 15:03:59	2014-04-04 15:03:59
64	25	5	20,000 SMS Broadcast	2014-04-04 15:03:59	2014-04-04 15:03:59
65	25	6	Credit for Communication	2014-04-04 15:04:00	2014-04-04 15:04:00
66	25	7	P.A System	2014-04-04 15:04:00	2014-04-04 15:04:00
67	26	1	Radio Advert on Vibes and Afri Radio	2014-04-07 13:57:51	2014-04-07 13:57:51
68	26	4	Outdoor Publicity	2014-04-07 13:57:51	2014-04-07 13:57:51
69	26	6	Communication	2014-04-07 13:57:51	2014-04-07 13:57:51
70	26	7	P.A System	2014-04-07 13:57:51	2014-04-07 13:57:51
71	27	1	On Afri-Radio Only	2014-04-07 14:40:27	2014-04-07 14:40:27
72	21	7	Description	2014-04-07 18:07:03	2014-04-07 18:07:03
97	38	6	Communiction	2014-04-08 13:52:48	2014-04-08 13:52:48
99	38	1	Advertisement for(10)ten days	2014-04-08 13:52:48	2014-04-08 13:52:48
107	40	6	Communication	2014-04-09 15:30:01	2014-04-09 15:30:01
108	40	5	Advertisement	2014-04-09 15:30:01	2014-04-09 15:30:01
109	40	4	Outdoor Publicty	2014-04-09 15:30:01	2014-04-09 15:30:01
110	40	1	Air time at Afri radio only	2014-04-09 15:30:01	2014-04-09 15:30:01
112	41	1	Air time on all radio stations	2014-04-09 15:44:37	2014-04-09 15:44:37
113	41	2	Advertisement	2014-04-09 15:44:37	2014-04-09 15:44:37
114	41	4	Outdoor Publicty	2014-04-09 15:44:37	2014-04-09 15:44:37
115	41	5	advertisement	2014-04-09 15:44:38	2014-04-09 15:44:38
116	41	6	Communication	2014-04-09 15:44:38	2014-04-09 15:44:38
117	41	7	Sound System	2014-04-09 15:44:38	2014-04-09 15:44:38
118	42	1	Radio Advert on Afri-Radio & Other Radios	2014-04-14 12:54:26	2014-04-14 12:54:26
119	42	2	2 spots 	2014-04-14 12:54:27	2014-04-14 12:54:27
120	42	4	Outdoor Publicity	2014-04-14 12:54:27	2014-04-14 12:54:27
121	42	5	50,000 subscribers	2014-04-14 12:54:27	2014-04-14 12:54:27
122	42	6	Credit and Sims for Communication	2014-04-14 12:54:27	2014-04-14 12:54:27
123	40	7	Description	2014-04-15 17:14:40	2014-04-15 17:14:40
124	43	1	Air time to all radio stations	2014-04-15 18:36:19	2014-04-15 18:36:19
125	43	2	Advertisement on Daily Observer	2014-04-15 18:36:20	2014-04-15 18:36:20
126	43	4	Out Door Advertisement	2014-04-15 18:36:20	2014-04-15 18:36:20
127	43	5	Advertisement	2014-04-15 18:36:20	2014-04-15 18:36:20
128	43	6	Communication	2014-04-15 18:36:20	2014-04-15 18:36:20
129	43	7	P.A System	2014-04-15 18:36:20	2014-04-15 18:36:20
135	46	1	Air time on all radio stations	2014-04-16 14:18:58	2014-04-16 14:18:58
136	46	4	outdoor Advertisement 	2014-04-16 14:18:58	2014-04-16 14:18:58
137	46	5	Publicity	2014-04-16 14:18:58	2014-04-16 14:18:58
139	46	7	P.A System	2014-04-16 14:18:59	2014-04-16 14:18:59
140	47	1	Air time on all radio stations	2014-04-17 16:09:20	2014-04-17 16:09:20
141	47	4	Outdoor Publicity	2014-04-17 16:09:20	2014-04-17 16:09:20
144	49	1	Air time on Afri-radio and Other Radio Stations	2014-04-22 14:17:38	2014-04-22 14:17:38
146	49	6	Communication	2014-04-22 14:17:39	2014-04-22 14:17:39
148	50	1	Air time on Afri-radio and Other Radio Stations	2014-04-22 14:33:04	2014-04-22 14:33:04
149	50	4	Outdoor Publicity	2014-04-22 14:33:05	2014-04-22 14:33:05
150	50	6	Communication	2014-04-22 14:33:05	2014-04-22 14:33:05
151	51	1	Radio Advert on Afri-Radio & Other Radios	2014-04-25 15:54:59	2014-04-25 15:54:59
152	51	2	On Daily Observer	2014-04-25 15:55:00	2014-04-25 15:55:00
153	51	4	Outdoor Publicity	2014-04-25 15:55:00	2014-04-25 15:55:00
154	51	5	20,000 Subscribers	2014-04-25 15:55:00	2014-04-25 15:55:00
155	51	11	Description	2014-04-25 15:56:39	2014-04-25 15:56:39
156	51	6	Description	2014-04-29 13:44:16	2014-04-29 13:44:16
157	51	7	Description	2014-04-29 14:45:45	2014-04-29 14:45:45
165	53	1	Air time on Afri-radio Only	2014-05-06 11:43:21	2014-05-06 11:43:21
166	49	5	Description	2014-05-06 16:00:16	2014-05-06 16:00:16
167	54	6	For Communication	2014-05-07 12:48:42	2014-05-07 12:48:42
168	54	5	20,000 Subscribers	2014-05-07 12:48:42	2014-05-07 12:48:42
170	54	1	On Afri-Radio & Other Radios	2014-05-07 12:48:43	2014-05-07 12:48:43
171	55	2	On Daily Observer	2014-05-07 15:03:26	2014-05-07 15:03:26
172	55	1	On Afri-Radio & Other Radios	2014-05-07 15:03:26	2014-05-07 15:03:26
173	55	6	For Communication	2014-05-07 15:03:27	2014-05-07 15:03:27
174	55	5	30,000 Subscribers	2014-05-07 15:03:27	2014-05-07 15:03:27
175	55	7	Stage, Lights & Bridge	2014-05-07 15:03:27	2014-05-07 15:03:27
180	60	1	Air time on Afri-radio and all other radio stations	2014-05-08 17:06:58	2014-05-08 17:06:58
181	60	6	Credits for communication	2014-05-08 17:06:58	2014-05-08 17:06:58
182	60	5	Description	2014-05-08 17:53:59	2014-05-08 17:53:59
183	61	1	Air time on Afri-radio and other radio stations	2014-05-09 11:30:24	2014-05-09 11:30:24
184	61	2	Advertisement on newspapers	2014-05-09 11:30:24	2014-05-09 11:30:24
185	61	5	Publicity Via sms to subscribers	2014-05-09 11:30:24	2014-05-09 11:30:24
186	61	6	Credit for comunication	2014-05-09 11:30:24	2014-05-09 11:30:24
187	61	7	P.A System	2014-05-09 11:30:24	2014-05-09 11:30:24
188	62	1	Air time on Afri-radio only	2014-05-09 11:48:33	2014-05-09 11:48:33
189	62	4	Outdoor Publicity	2014-05-09 11:48:34	2014-05-09 11:48:34
190	62	6	Credits for communication	2014-05-09 11:48:34	2014-05-09 11:48:34
191	54	4	Description	2014-05-14 12:26:24	2014-05-14 12:26:24
193	54	13	Description	2014-05-14 13:10:18	2014-05-14 13:10:18
195	54	12	Description	2014-05-14 16:37:32	2014-05-14 16:37:32
196	64	1	Air time at Afri-radio and other radio stations	2014-05-15 12:30:38	2014-05-15 12:30:38
198	64	6	Credit for communication	2014-05-15 12:30:38	2014-05-15 12:30:38
199	66	1	Air time at Afri-radio and other radio stations	2014-05-15 13:05:37	2014-05-15 13:05:37
200	66	2	Newspaper advert on Daily Observer	2014-05-15 13:05:37	2014-05-15 13:05:37
202	67	1	Air time at Afri-radio and other radio stations	2014-05-15 13:24:50	2014-05-15 13:24:50
203	67	6	Credit for communication	2014-05-15 13:24:50	2014-05-15 13:24:50
204	69	7	P.A System	2014-05-16 12:00:24	2014-05-16 12:00:24
209	71	6	Credits for communication	2014-05-27 13:47:09	2014-05-27 13:47:09
210	71	9	T-Shirts for Participants	2014-05-27 13:47:09	2014-05-27 13:47:09
211	71	1	Air time at Afri-radi and other radio stations	2014-05-27 13:47:09	2014-05-27 13:47:09
212	72	1	Airtime at Afri-radio and Other Radio Stations	2014-05-27 13:58:20	2014-05-27 13:58:20
213	72	4	Outdoor branding for advertisement	2014-05-27 13:58:20	2014-05-27 13:58:20
214	72	5	Publicity	2014-05-27 13:58:21	2014-05-27 13:58:21
215	72	6	Credits for communication	2014-05-27 13:58:21	2014-05-27 13:58:21
216	73	1	Airtime at Afri-radio and Other Radio Stations	2014-05-27 14:08:13	2014-05-27 14:08:13
217	73	4	Outdoor advertisement	2014-05-27 14:08:13	2014-05-27 14:08:13
218	73	6	Credits for communication	2014-05-27 14:08:13	2014-05-27 14:08:13
219	74	1	Air time at Afri-radio and Other radio stations	2014-05-28 12:28:13	2014-05-28 12:28:13
220	74	4	Outdoor Publicity	2014-05-28 12:28:13	2014-05-28 12:28:13
221	74	5	sms to subscribers	2014-05-28 12:28:13	2014-05-28 12:28:13
222	74	6	Credits for communication	2014-05-28 12:28:13	2014-05-28 12:28:13
223	75	4	Description	2014-05-30 13:34:12	2014-05-30 13:34:12
224	76	6	For Communication	2014-06-03 13:40:30	2014-06-03 13:40:30
225	76	5	20,000 Subscribers	2014-06-03 13:40:30	2014-06-03 13:40:30
226	76	4	1 Billboard	2014-06-03 13:40:30	2014-06-03 13:40:30
227	76	7	Lights	2014-06-03 13:40:30	2014-06-03 13:40:30
228	77	1	Air time at Afri-radio only	2014-06-12 14:19:13	2014-06-12 14:19:13
229	77	4	Outdoor advertisement 	2014-06-12 14:19:13	2014-06-12 14:19:13
230	77	5	sms broadcast to Africell subscribers with in greater Banjul	2014-06-12 14:19:13	2014-06-12 14:19:13
231	77	6	Credits for communication	2014-06-12 14:19:13	2014-06-12 14:19:13
232	78	1	Air time at Afri-radio only	2014-06-18 16:27:07	2014-06-18 16:27:07
233	78	4	Outdoor publicity during event	2014-06-18 16:27:07	2014-06-18 16:27:07
234	78	5	sms broadcast to africell subscribers in greater banjul	2014-06-18 16:27:08	2014-06-18 16:27:08
235	78	6	Credit for communication	2014-06-18 16:27:08	2014-06-18 16:27:08
238	83	13	Panel at Afri radio only.	2014-07-15 16:50:37	2014-07-15 16:50:37
239	83	7	Sound System	2014-07-15 16:50:37	2014-07-15 16:50:37
240	83	6	Credits for communication	2014-07-15 16:50:37	2014-07-15 16:50:37
241	83	5	sms to Africell subscribers with in greater Banjul	2014-07-15 16:50:37	2014-07-15 16:50:37
242	83	1	Air time on Afri-radio and other radio stations	2014-07-15 16:50:37	2014-07-15 16:50:37
243	84	6	Credits for comunication	2014-07-21 15:31:05	2014-07-21 15:31:05
244	84	5	sms broadcast to Africell subscribers in greater banjul	2014-07-21 15:31:05	2014-07-21 15:31:05
245	84	1	Air time at Afri-radio only	2014-07-21 15:31:06	2014-07-21 15:31:06
246	85	1	Air time on Afri radio only	2014-07-23 11:36:26	2014-07-23 11:36:26
247	86	1	Air time on Afri-radio only	2014-07-31 16:33:14	2014-07-31 16:33:14
249	86	5	sms broadcast to Africell subscribers in greater Banjul	2014-07-31 16:33:14	2014-07-31 16:33:14
250	86	6	Credit for communication	2014-07-31 16:33:14	2014-07-31 16:33:14
251	86	7	P.A System	2014-07-31 16:33:14	2014-07-31 16:33:14
252	87	1	Air time on Afri-radio only	2014-07-31 16:44:48	2014-07-31 16:44:48
255	87	6	Credit for communication	2014-07-31 16:44:48	2014-07-31 16:44:48
257	88	9	T-Shirts for participants	2014-08-05 17:34:13	2014-08-05 17:34:13
258	88	6	Credits for communication	2014-08-05 17:34:13	2014-08-05 17:34:13
259	88	5	sms broadcast to Africell subscribers within CRR-Upcountry only	2014-08-05 17:34:14	2014-08-05 17:34:14
260	88	1	Air time at Afri-radio only	2014-08-05 17:34:14	2014-08-05 17:34:14
261	89	10	Football Cones,Jersey and frist Aid Boxes	2014-08-06 14:54:49	2014-08-06 14:54:49
262	89	9	T-Shirts for Fans and Ajax Football team 	2014-08-06 14:54:49	2014-08-06 14:54:49
263	89	4	Outdoor Publicity	2014-08-06 14:54:49	2014-08-06 14:54:49
264	90	1	Air time at Afri-radio only	2014-08-08 12:00:40	2014-08-08 12:00:40
265	91	1	Air time at Afri-radio and other radio stations	2014-08-11 18:15:38	2014-08-11 18:15:38
266	91	4	Outdoor publicity	2014-08-11 18:15:38	2014-08-11 18:15:38
267	91	5	sms broadcast to africell subsrcibers with in greater banjul	2014-08-11 18:15:38	2014-08-11 18:15:38
268	91	6	credits for communication and Winners	2014-08-11 18:15:38	2014-08-11 18:15:38
269	91	13	One hour talk show/panel at Afri-radio only.	2014-08-11 18:15:38	2014-08-11 18:15:38
270	93	1	Air time at Afri-radio only	2014-08-12 17:26:10	2014-08-12 17:26:10
271	93	5	Sms broadcast to africell subscribers with in greater banjul	2014-08-12 17:26:10	2014-08-12 17:26:10
272	93	6	credit for Communication	2014-08-12 17:26:10	2014-08-12 17:26:10
273	92	7	Description	2014-08-12 18:09:09	2014-08-12 18:09:09
274	96	1	Air time at Afri-radio and other radio stations	2014-08-13 14:17:30	2014-08-13 14:17:30
275	96	2	Publicity	2014-08-13 14:17:31	2014-08-13 14:17:31
277	96	5	sms broadcast to africell subscribers with in greater banjul	2014-08-13 14:17:32	2014-08-13 14:17:32
278	96	6	Credits for communication	2014-08-13 14:17:32	2014-08-13 14:17:32
279	96	14	Description	2014-08-13 17:37:55	2014-08-13 17:37:55
280	97	1	Air time at Afri-radio and other radio stations	2014-08-19 16:37:12	2014-08-19 16:37:12
281	98	13	1hr Talk show on Afri-Radio	2014-09-01 11:51:27	2014-09-01 11:51:27
282	98	1	On Afri-Radio Only	2014-09-01 11:51:27	2014-09-01 11:51:27
283	98	2	4 spots on the newspaper	2014-09-01 11:51:27	2014-09-01 11:51:27
284	98	5	Description	2014-09-01 11:52:30	2014-09-01 11:52:30
285	99	5	150,000 subscribers	2014-09-08 18:31:44	2014-09-08 18:31:44
286	99	4	Billboards and Banners	2014-09-08 18:31:44	2014-09-08 18:31:44
287	99	2	2 spots	2014-09-08 18:31:44	2014-09-08 18:31:44
288	99	1	on 3 Radio Stations	2014-09-08 18:31:45	2014-09-08 18:31:45
289	100	6	Credits for Communication	2014-09-23 17:49:25	2014-09-23 17:49:25
290	100	5	sms to africell subscribers with in greater Banjul	2014-09-23 17:49:25	2014-09-23 17:49:25
291	100	4	Outdoor Branding	2014-09-23 17:49:25	2014-09-23 17:49:25
292	100	1	Air time at Afri-radio only	2014-09-23 17:49:25	2014-09-23 17:49:25
293	101	7	P.A System	2014-09-23 18:12:22	2014-09-23 18:12:22
294	101	6	Credits for Communication	2014-09-23 18:12:22	2014-09-23 18:12:22
295	101	5	sms to africell subscribers within greater banjul	2014-09-23 18:12:23	2014-09-23 18:12:23
296	101	4	Outdoor branding	2014-09-23 18:12:23	2014-09-23 18:12:23
297	101	1	Air time at Afri-radio only	2014-09-23 18:12:23	2014-09-23 18:12:23
302	103	1	Air time at Afri-radio only	2014-09-24 14:34:18	2014-09-24 14:34:18
305	103	6	Credits for Communication	2014-09-24 14:34:18	2014-09-24 14:34:18
306	104	1	Air time at Afri-radio only	2014-09-24 14:45:46	2014-09-24 14:45:46
307	105	1	Air time at Afri-radio only	2014-09-30 17:27:04	2014-09-30 17:27:04
308	106	1	Air time at Afri-radio only	2014-09-30 18:19:20	2014-09-30 18:19:20
309	107	4	Back Drop	2014-10-13 12:57:43	2014-10-13 12:57:43
310	107	2	Publicity	2014-10-13 12:57:43	2014-10-13 12:57:43
311	107	1	Publicity	2014-10-13 12:57:43	2014-10-13 12:57:43
312	107	5	20,000 subscribers	2014-10-13 12:57:43	2014-10-13 12:57:43
313	107	6	For Communication	2014-10-13 12:57:44	2014-10-13 12:57:44
314	107	7	P.A System	2014-10-13 12:57:44	2014-10-13 12:57:44
315	107	11	Rental of additional materials for Sound	2014-10-13 12:57:44	2014-10-13 12:57:44
316	108	1	Air time at Afri-radio and other radio stations	2014-10-15 16:58:18	2014-10-15 16:58:18
318	109	1	Air time at Afri-radio only	2014-10-15 17:05:25	2014-10-15 17:05:25
319	109	5	sms broadcast to Africell subscribers with in greater Banjul	2014-10-15 17:05:25	2014-10-15 17:05:25
320	109	6	Credits for Communication	2014-10-15 17:05:26	2014-10-15 17:05:26
321	110	1	Air time at Afri-radio and other radio stations	2014-10-15 17:14:20	2014-10-15 17:14:20
323	110	5	Sms broadcast to africell subscribers with in Greater Banjul	2014-10-15 17:14:21	2014-10-15 17:14:21
324	110	6	Credits for Communication	2014-10-15 17:14:21	2014-10-15 17:14:21
325	110	13	air time talk show on Afri radio only	2014-10-15 17:14:21	2014-10-15 17:14:21
326	111	1	Air time at Afri-radio only	2014-10-17 13:10:09	2014-10-17 13:10:09
328	111	6	Credits for Communication	2014-10-17 13:10:09	2014-10-17 13:10:09
329	111	9	T-shirts for participants/students	2014-10-17 13:10:09	2014-10-17 13:10:09
330	112	1	Air time at Afri-radio only	2014-10-17 14:32:28	2014-10-17 14:32:28
331	112	6	Credits for Communication	2014-10-17 14:32:28	2014-10-17 14:32:28
332	108	13	Description	2014-10-20 15:06:42	2014-10-20 15:06:42
334	113	1	Air time at Afri-radio only	2014-10-21 12:16:11	2014-10-21 12:16:11
335	113	5	Sms broadcast to Africell subscribers with in greater banjul areas	2014-10-21 12:16:11	2014-10-21 12:16:11
336	113	6	Credits for Communication	2014-10-21 12:16:11	2014-10-21 12:16:11
337	113	13	Air time at Afri-radio only talk show	2014-10-21 12:16:12	2014-10-21 12:16:12
338	114	1	Air time at Afri-radio and other radio stations	2014-10-22 13:15:35	2014-10-22 13:15:35
339	114	4	Outdoor Branding	2014-10-22 13:15:36	2014-10-22 13:15:36
340	114	5	sms to africell subscribers with in greater banjul areas	2014-10-22 13:15:36	2014-10-22 13:15:36
341	114	6	Credits for Communication	2014-10-22 13:15:36	2014-10-22 13:15:36
342	114	7	P.A System	2014-10-22 13:15:36	2014-10-22 13:15:36
343	114	11	Cash for Winners	2014-10-22 13:15:37	2014-10-22 13:15:37
344	114	13	Air time at Afri-radio only,talk show	2014-10-22 13:15:37	2014-10-22 13:15:37
345	115	1	Publicity on afri radio	2014-10-22 15:57:33	2014-10-22 15:57:33
346	115	13	1hr Talk show on Afri-Radio	2014-10-22 15:57:33	2014-10-22 15:57:33
347	116	1	Radio Advert on Afri-Radio & Other Radios	2014-10-27 11:04:35	2014-10-27 11:04:35
348	116	6	Credit for communication	2014-10-27 11:04:35	2014-10-27 11:04:35
349	116	7	P.A System	2014-10-27 11:04:35	2014-10-27 11:04:35
350	116	13	30 mins talk show	2014-10-27 11:04:35	2014-10-27 11:04:35
351	117	1	On Afri-Radio Only	2014-10-28 12:49:23	2014-10-28 12:49:23
352	117	7	P.A System	2014-10-28 12:49:23	2014-10-28 12:49:23
353	110	7	Description	2014-10-28 13:13:57	2014-10-28 13:13:57
354	118	1	Air time at Afri-radio and other radio stations	2014-10-29 12:54:07	2014-10-29 12:54:07
356	118	6	Credits for Communication	2014-10-29 12:54:09	2014-10-29 12:54:09
357	119	1	Air time at Afri-radio and Brikama fm only	2014-10-29 13:03:10	2014-10-29 13:03:10
358	119	7	P.A System	2014-10-29 13:03:10	2014-10-29 13:03:10
359	120	1	Air time at Afri-radio only	2014-10-30 16:18:22	2014-10-30 16:18:22
368	123	6	Credits for Communication	2014-10-31 13:25:26	2014-10-31 13:25:26
369	123	5	sms to africell subscribers with in greater Banjul 	2014-10-31 13:25:27	2014-10-31 13:25:27
371	123	1	Air time at Afri-radio only	2014-10-31 13:25:27	2014-10-31 13:25:27
373	124	1	Air time at Afri-radio and Brikama fm only	2014-11-04 13:21:43	2014-11-04 13:21:43
374	124	13	30 minutes air time Afri radio only	2014-11-04 13:21:43	2014-11-04 13:21:43
375	123	13	Description	2014-11-04 14:11:41	2014-11-04 14:11:41
376	125	1	Air time at Afri-radio and other radio stations	2014-11-05 13:35:41	2014-11-05 13:35:41
377	125	4	Outdoor Branding	2014-11-05 13:35:41	2014-11-05 13:35:41
378	125	5	Sms to Africell subscribers with in greater Banjul	2014-11-05 13:35:42	2014-11-05 13:35:42
379	125	6	Credits for Communication	2014-11-05 13:35:42	2014-11-05 13:35:42
380	125	7	P.A System	2014-11-05 13:35:42	2014-11-05 13:35:42
381	119	6	Description	2014-11-18 15:17:51	2014-11-18 15:17:51
390	144	13	30mins talkshow on Afri-radio	2014-11-19 13:23:32	2014-11-19 13:23:32
391	144	9	20 T-shirts	2014-11-19 13:23:32	2014-11-19 13:23:32
392	144	7	P.A System	2014-11-19 13:23:32	2014-11-19 13:23:32
393	144	6	Credit for communication	2014-11-19 13:23:32	2014-11-19 13:23:32
394	144	5	50,000 subscribers	2014-11-19 13:23:33	2014-11-19 13:23:33
395	144	2	on the daily observer	2014-11-19 13:23:33	2014-11-19 13:23:33
396	144	1	on Afri-radio and other radios	2014-11-19 13:23:33	2014-11-19 13:23:33
397	145	1	Air time at Afri-radio only	2014-11-20 16:30:32	2014-11-20 16:30:32
398	146	1	Air time at Afri-radio and other radio stations	2014-11-21 11:14:01	2014-11-21 11:14:01
399	146	2	Daily Observer	2014-11-21 11:14:01	2014-11-21 11:14:01
400	146	4	Outdoor Branding	2014-11-21 11:14:01	2014-11-21 11:14:01
401	146	5	Sms broadcast with in greater bamjul areas	2014-11-21 11:14:01	2014-11-21 11:14:01
402	146	6	Credits for Communication	2014-11-21 11:14:01	2014-11-21 11:14:01
405	146	13	30 minutes Air time at Afri-radio only	2014-11-21 11:14:01	2014-11-21 11:14:01
407	116	5	Description	2014-11-25 17:10:33	2014-11-25 17:10:33
408	116	4	Description	2014-11-25 17:10:58	2014-11-25 17:10:58
409	116	2	Description	2014-11-25 17:11:48	2014-11-25 17:11:48
417	148	5	Sms broadcast with in Greater Banjul Areas	2014-12-02 11:43:03	2014-12-02 11:43:03
418	149	4	Outdoor Branding	2014-12-02 12:05:25	2014-12-02 12:05:25
419	149	6	Credits for Communication	2014-12-02 12:05:25	2014-12-02 12:05:25
420	149	9	T-Shirt for Participants	2014-12-02 12:05:25	2014-12-02 12:05:25
421	150	1	Air time at Afri-radio and other radio stations	2014-12-02 12:43:07	2014-12-02 12:43:07
422	150	4	Outdoor Branding	2014-12-02 12:43:07	2014-12-02 12:43:07
423	150	5	Sms broadcast with in Greater Banjul Areas	2014-12-02 12:43:07	2014-12-02 12:43:07
424	150	6	Credits for Communication	2014-12-02 12:43:07	2014-12-02 12:43:07
425	150	7	P.A System	2014-12-02 12:43:07	2014-12-02 12:43:07
426	151	6	Credits for Communication	2014-12-02 12:53:08	2014-12-02 12:53:08
427	151	7	P.A System	2014-12-02 12:53:09	2014-12-02 12:53:09
428	159	1	On Afri-Radio & Other Radios	2014-12-02 13:32:33	2014-12-02 13:32:33
429	159	2	2 Spots	2014-12-02 13:32:33	2014-12-02 13:32:33
430	159	4	8 Billboards	2014-12-02 13:32:33	2014-12-02 13:32:33
431	159	5	50,000 Subscribers	2014-12-02 13:32:33	2014-12-02 13:32:33
432	159	6	Communication	2014-12-02 13:32:33	2014-12-02 13:32:33
433	159	11	Description	2014-12-02 13:33:12	2014-12-02 13:33:12
434	160	1	On Afri-Radio & Other Radios	2014-12-02 14:55:57	2014-12-02 14:55:57
435	160	2	News Paper Advert	2014-12-02 14:55:57	2014-12-02 14:55:57
436	160	4	Outdoor Publicty	2014-12-02 14:55:58	2014-12-02 14:55:58
437	160	5	20,000 Subscribers	2014-12-02 14:55:58	2014-12-02 14:55:58
438	160	6	Communication	2014-12-02 14:55:58	2014-12-02 14:55:58
439	160	9	T-Shirts	2014-12-02 14:55:58	2014-12-02 14:55:58
440	160	13	Talk show on Afri Radio	2014-12-02 14:55:58	2014-12-02 14:55:58
441	161	1	On Afri-Radio & Other Radios	2014-12-02 15:34:49	2014-12-02 15:34:49
442	161	2	News Paper Advert	2014-12-02 15:34:49	2014-12-02 15:34:49
443	161	4	Outdoor Publicity	2014-12-02 15:34:49	2014-12-02 15:34:49
444	161	5	20000 Subscribers	2014-12-02 15:34:49	2014-12-02 15:34:49
445	161	6	Communication	2014-12-02 15:34:49	2014-12-02 15:34:49
446	161	7	Stage Lights	2014-12-02 15:34:49	2014-12-02 15:34:49
447	161	13	Talk Show on Afri-Radio	2014-12-02 15:34:49	2014-12-02 15:34:49
448	164	6	Credits for Communication	2014-12-02 16:55:30	2014-12-02 16:55:30
449	164	5	Sms broadcast with in Greater Banjul Areas	2014-12-02 16:55:30	2014-12-02 16:55:30
450	164	4	Outdoor Branding	2014-12-02 16:55:30	2014-12-02 16:55:30
451	164	1	Air time at Afri-radio and other radio stations	2014-12-02 16:55:30	2014-12-02 16:55:30
452	165	4	Outdoor Branding	2014-12-04 10:55:56	2014-12-04 10:55:56
453	165	1	Air time at Afri-radio and other radio stations	2014-12-04 10:55:57	2014-12-04 10:55:57
454	165	5	Sms broadcast with in Greater Banjul Areas	2014-12-04 10:55:57	2014-12-04 10:55:57
455	165	7	P.A System	2014-12-04 10:55:57	2014-12-04 10:55:57
456	165	9	T-Shirts	2014-12-04 10:55:57	2014-12-04 10:55:57
459	166	5	Sms broadcast with in Greater Banjul Areas	2014-12-04 11:12:21	2014-12-04 11:12:21
460	166	7	P.A System	2014-12-04 11:12:21	2014-12-04 11:12:21
461	166	6	Description	2014-12-08 17:25:43	2014-12-08 17:25:43
462	167	1	Description	2014-12-09 15:05:26	2014-12-09 15:05:26
463	167	2	Description	2014-12-09 15:05:26	2014-12-09 15:05:26
464	167	4	Description	2014-12-09 15:05:26	2014-12-09 15:05:26
465	167	5	Description	2014-12-09 15:05:26	2014-12-09 15:05:26
466	167	6	Description	2014-12-09 15:05:26	2014-12-09 15:05:26
467	167	9	Description	2014-12-09 15:05:26	2014-12-09 15:05:26
468	168	1	Air time at Afri-radio and other radio stations	2014-12-10 16:38:52	2014-12-10 16:38:52
469	168	4	Outdoor Branding	2014-12-10 16:38:52	2014-12-10 16:38:52
470	168	5	Sms broadcast with in Greater Banjul Areas	2014-12-10 16:38:52	2014-12-10 16:38:52
471	168	6	Credits for Communication	2014-12-10 16:38:52	2014-12-10 16:38:52
472	168	13	Air time at Afri-radio only,30 minutes	2014-12-10 16:38:52	2014-12-10 16:38:52
473	169	9	T-Shits for participants	2014-12-16 09:49:57	2014-12-16 09:49:57
478	171	5	Sms broadcast with in Greater Banjul Areas	2014-12-16 16:57:18	2014-12-16 16:57:18
479	171	4	Outdoor Branding	2014-12-16 16:57:18	2014-12-16 16:57:18
480	171	1	Air time at Afri-radio and Fmb Brikama	2014-12-16 16:57:18	2014-12-16 16:57:18
481	171	6	Credits for Communication	2014-12-16 16:57:18	2014-12-16 16:57:18
482	171	13	Air time at Afri-radio only,30 minutes	2014-12-16 16:57:18	2014-12-16 16:57:18
483	172	9	T-Shits for participants	2014-12-19 12:07:56	2014-12-19 12:07:56
484	173	1	Air time at Afri-radio only	2014-12-22 11:55:55	2014-12-22 11:55:55
485	174	1	Air time at Afri-radio and other radio stations	2015-01-05 12:07:33	2015-01-05 12:07:33
486	174	4	Outdoor Branding	2015-01-05 12:07:33	2015-01-05 12:07:33
487	174	5	Sms broadcast with in Greater Banjul Areas	2015-01-05 12:07:33	2015-01-05 12:07:33
488	174	6	Credits for Communication	2015-01-05 12:07:33	2015-01-05 12:07:33
489	174	9	T-Shits for participants	2015-01-05 12:07:33	2015-01-05 12:07:33
491	176	1	Air time at Afri-radio only	2015-01-08 10:42:52	2015-01-08 10:42:52
492	176	4	Outdoor Branding	2015-01-08 10:42:52	2015-01-08 10:42:52
493	176	6	Credits for Communication	2015-01-08 10:42:52	2015-01-08 10:42:52
494	176	7	P.A System	2015-01-08 10:42:52	2015-01-08 10:42:52
501	174	7	Description	2015-01-08 13:59:24	2015-01-08 13:59:24
507	179	1	Air time at Afri-radio only	2015-01-13 13:34:15	2015-01-13 13:34:15
508	179	2	Publicity Newspaper Observer/Point	2015-01-13 13:34:15	2015-01-13 13:34:15
509	179	4	Outdoor Branding	2015-01-13 13:34:15	2015-01-13 13:34:15
510	179	5	Sms broadcast with in Greater Banjul Areas	2015-01-13 13:34:15	2015-01-13 13:34:15
511	179	6	Credits for Communication	2015-01-13 13:34:15	2015-01-13 13:34:15
512	179	7	P.A System	2015-01-13 13:34:15	2015-01-13 13:34:15
513	179	9	T-Shits for participants	2015-01-13 13:34:15	2015-01-13 13:34:15
514	179	13	Air time at Afri-radio only,30 minutes	2015-01-13 13:34:15	2015-01-13 13:34:15
515	180	1	Air time at Afri-radio only	2015-01-13 13:46:30	2015-01-13 13:46:30
516	180	4	Outdoor Branding	2015-01-13 13:46:30	2015-01-13 13:46:30
517	180	5	Sms broadcast with in Greater Banjul Areas	2015-01-13 13:46:30	2015-01-13 13:46:30
518	180	6	Credits for Communication	2015-01-13 13:46:30	2015-01-13 13:46:30
519	180	7	P.A System	2015-01-13 13:46:30	2015-01-13 13:46:30
521	184	1	Air time at Afri-radio only	2015-01-14 12:37:25	2015-01-14 12:37:25
522	184	4	Outdoor Branding	2015-01-14 12:37:25	2015-01-14 12:37:25
523	184	5	Sms broadcast with in Greater Banjul Areas	2015-01-14 12:37:25	2015-01-14 12:37:25
524	184	6	Credits for Communication	2015-01-14 12:37:25	2015-01-14 12:37:25
525	184	7	P.A System	2015-01-14 12:37:25	2015-01-14 12:37:25
526	185	1	Air time at Afri-radio only	2015-01-14 14:33:39	2015-01-14 14:33:39
1598	313	6	\N	2016-03-20 00:00:00	2016-03-20 00:00:00
527	185	4	Outdoor Branding	2015-01-14 14:33:39	2015-01-14 14:33:39
528	185	5	Sms broadcast with in Greater Banjul Areas	2015-01-14 14:33:39	2015-01-14 14:33:39
529	185	6	Credits for Communication	2015-01-14 14:33:39	2015-01-14 14:33:39
530	185	9	T-Shits for participants	2015-01-14 14:33:39	2015-01-14 14:33:39
531	186	1	Air time at Afri-radio only	2015-01-26 15:30:27	2015-01-26 15:30:27
532	186	4	Outdoor Branding	2015-01-26 15:30:27	2015-01-26 15:30:27
533	186	5	Sms broadcast with in Greater Banjul Areas	2015-01-26 15:30:27	2015-01-26 15:30:27
534	186	6	Credits for Communication	2015-01-26 15:30:27	2015-01-26 15:30:27
535	186	7	P.A System,Stage&Lights	2015-01-26 15:30:27	2015-01-26 15:30:27
536	186	11	Cash for Winners-Final	2015-01-26 15:30:27	2015-01-26 15:30:27
537	186	13	Air time at Afri-radio only,30 Minutes	2015-01-26 15:30:27	2015-01-26 15:30:27
539	187	2	Newspaper advert Observer,Point	2015-01-26 16:49:14	2015-01-26 16:49:14
540	187	4	Outdoor Branding	2015-01-26 16:49:14	2015-01-26 16:49:14
541	187	5	Sms broadcast with in Greater Banjul Areas	2015-01-26 16:49:14	2015-01-26 16:49:14
542	187	6	Credits for Communication	2015-01-26 16:49:14	2015-01-26 16:49:14
543	187	7	P.A System	2015-01-26 16:49:14	2015-01-26 16:49:14
544	187	13	Air time at Afri-radio only,30 Minutes talk show	2015-01-26 16:49:14	2015-01-26 16:49:14
545	188	1	Air time at Afri-radio and other radio stations	2015-01-27 13:37:10	2015-01-27 13:37:10
546	188	4	Outdoor Branding	2015-01-27 13:37:10	2015-01-27 13:37:10
547	188	5	Sms broadcast with in Greater Banjul Areas	2015-01-27 13:37:10	2015-01-27 13:37:10
548	188	6	Credits for Communication	2015-01-27 13:37:10	2015-01-27 13:37:10
549	188	7	P.A System	2015-01-27 13:37:10	2015-01-27 13:37:10
550	188	11	Cash for logistics	2015-01-27 13:37:10	2015-01-27 13:37:10
551	188	13	Air time at Afri-radio only,30 Minutes	2015-01-27 13:37:10	2015-01-27 13:37:10
553	189	1	Air time at Afri-radio only	2015-01-27 13:47:07	2015-01-27 13:47:07
554	189	4	Outdoor Branding	2015-01-27 13:47:07	2015-01-27 13:47:07
555	189	5	Sms broadcast with in Greater Banjul Areas	2015-01-27 13:47:07	2015-01-27 13:47:07
556	189	6	Credits for Communication	2015-01-27 13:47:07	2015-01-27 13:47:07
557	189	7	P.A System	2015-01-27 13:47:07	2015-01-27 13:47:07
558	189	13	Air time at Afri-radio only,30 minutes	2015-01-27 13:47:07	2015-01-27 13:47:07
561	192	1	Air time at Afri-radio only	2015-02-03 16:33:34	2015-02-03 16:33:34
562	192	5	Sms broadcast with in Greater Banjul Areas	2015-02-03 16:33:34	2015-02-03 16:33:34
563	193	1	Radio Advert on Afri-Radio and other Radios	2015-02-03 17:39:39	2015-02-03 17:39:39
564	193	2	On Daily Observer & Point	2015-02-03 17:39:39	2015-02-03 17:39:39
565	193	3	On GRTS	2015-02-03 17:39:39	2015-02-03 17:39:39
566	193	4	Outdoor Publicity	2015-02-03 17:39:39	2015-02-03 17:39:39
567	193	5	50,000 Subscribers	2015-02-03 17:39:39	2015-02-03 17:39:39
568	193	6	For Communication	2015-02-03 17:39:39	2015-02-03 17:39:39
569	193	7	Bridge & Lights	2015-02-03 17:39:39	2015-02-03 17:39:39
570	193	11	For logistics & Payments	2015-02-03 17:39:39	2015-02-03 17:39:39
571	193	13	On Afri-Radio 	2015-02-03 17:39:39	2015-02-03 17:39:39
575	195	1	Air time at Afri-radio only	2015-02-04 10:59:06	2015-02-04 10:59:06
576	195	5	Sms broadcast with in Greater Banjul Areas	2015-02-04 10:59:06	2015-02-04 10:59:06
577	195	6	Credits for Communication	2015-02-04 10:59:06	2015-02-04 10:59:06
578	195	7	P.A System	2015-02-04 10:59:06	2015-02-04 10:59:06
579	195	9	T-Shits for participants	2015-02-04 10:59:06	2015-02-04 10:59:06
580	195	13	Air time at Afri-radio only,30 minutes	2015-02-04 10:59:06	2015-02-04 10:59:06
581	196	1	Air time at Afri-radio only	2015-02-04 11:33:15	2015-02-04 11:33:15
582	196	4	Outdoor Branding	2015-02-04 11:33:15	2015-02-04 11:33:15
583	196	5	Sms broadcast with in Greater Banjul Areas	2015-02-04 11:33:15	2015-02-04 11:33:15
584	196	6	Credits for Communication	2015-02-04 11:33:15	2015-02-04 11:33:15
585	196	7	P.A System	2015-02-04 11:33:15	2015-02-04 11:33:15
586	197	1	Air time at Afri-radio and other radio stations	2015-02-09 17:10:11	2015-02-09 17:10:11
587	197	4	Outdoor Branding	2015-02-09 17:10:11	2015-02-09 17:10:11
588	197	5	Sms broadcast with in Greater Banjul Areas	2015-02-09 17:10:11	2015-02-09 17:10:11
589	197	6	Credits for Communication	2015-02-09 17:10:11	2015-02-09 17:10:11
590	197	9	T-Shits for participants	2015-02-09 17:10:11	2015-02-09 17:10:11
591	197	13	Air time at Afri-radio only,30 minutes	2015-02-09 17:10:12	2015-02-09 17:10:12
593	199	1	Air time at Afri-radio only	2015-02-10 16:36:20	2015-02-10 16:36:20
594	199	5	Sms broadcast with in Greater Banjul Areas	2015-02-10 16:36:20	2015-02-10 16:36:20
595	199	6	Credits for Communication	2015-02-10 16:36:20	2015-02-10 16:36:20
597	200	4	Outdoor Branding	2015-02-10 17:06:24	2015-02-10 17:06:24
598	200	7	P.A System	2015-02-10 17:06:25	2015-02-10 17:06:25
607	203	1	Air time at Afri-radio and other radio stations	2015-02-16 12:35:24	2015-02-16 12:35:24
608	203	4	Outdoor Branding	2015-02-16 12:35:24	2015-02-16 12:35:24
609	203	5	Sms broadcast with in Greater Banjul Areas	2015-02-16 12:35:24	2015-02-16 12:35:24
610	203	6	Credits for Communication	2015-02-16 12:35:24	2015-02-16 12:35:24
611	203	7	P.A System	2015-02-16 12:35:24	2015-02-16 12:35:24
613	203	13	Air time at Afri-radio only,30 minutes talk show	2015-02-16 12:35:24	2015-02-16 12:35:24
614	204	4	Outdoor Branding	2015-03-02 12:22:18	2015-03-02 12:22:18
615	204	1	Air time at Afri-radio only	2015-03-02 12:22:18	2015-03-02 12:22:18
616	204	5	Sms broadcast with in Greater Banjul Areas	2015-03-02 12:22:18	2015-03-02 12:22:18
617	204	7	P.A System	2015-03-02 12:22:18	2015-03-02 12:22:18
618	205	1	Air time at Afri-radio only	2015-03-02 16:07:21	2015-03-02 16:07:21
619	205	4	Outdoor Branding	2015-03-02 16:07:21	2015-03-02 16:07:21
620	205	5	Sms broadcast with in Greater Banjul Areas	2015-03-02 16:07:21	2015-03-02 16:07:21
621	205	6	Credits for Communication	2015-03-02 16:07:21	2015-03-02 16:07:21
625	207	1	Air time at Afri-radio only	2015-03-02 16:46:57	2015-03-02 16:46:57
626	207	4	Outdoor Branding	2015-03-02 16:46:57	2015-03-02 16:46:57
627	207	5	Sms broadcast with in Greater Banjul Areas	2015-03-02 16:46:57	2015-03-02 16:46:57
628	207	6	Credits for Communication	2015-03-02 16:46:57	2015-03-02 16:46:57
629	207	7	P.A System	2015-03-02 16:46:57	2015-03-02 16:46:57
630	207	13	30 minutes talk show at Afri radio only	2015-03-02 16:46:57	2015-03-02 16:46:57
631	208	1	Air time at Afri-radio only	2015-03-03 11:20:39	2015-03-03 11:20:39
632	208	4	Outdoor Branding	2015-03-03 11:20:39	2015-03-03 11:20:39
633	208	5	Sms broadcast with in Greater Banjul Areas	2015-03-03 11:20:39	2015-03-03 11:20:39
634	208	6	Credits for Communication	2015-03-03 11:20:39	2015-03-03 11:20:39
635	208	7	P.A System	2015-03-03 11:20:39	2015-03-03 11:20:39
636	209	13	Air time at Afri-radio only	2015-03-03 13:26:18	2015-03-03 13:26:18
637	209	9	T-Shits for participants	2015-03-03 13:26:18	2015-03-03 13:26:18
638	209	6	Credits for Communication	2015-03-03 13:26:18	2015-03-03 13:26:18
639	209	5	Sms broadcast with in Greater Banjul Areas	2015-03-03 13:26:18	2015-03-03 13:26:18
640	209	4	Outdoor Branding	2015-03-03 13:26:18	2015-03-03 13:26:18
641	209	1	30 minutes talk show at afri radio only	2015-03-03 13:26:18	2015-03-03 13:26:18
643	210	6	Credits for Communication	2015-03-04 12:35:24	2015-03-04 12:35:24
644	210	5	Sms broadcast with in Greater Banjul Areas	2015-03-04 12:35:24	2015-03-04 12:35:24
645	210	4	Outdoor Branding	2015-03-04 12:35:24	2015-03-04 12:35:24
646	210	1	Air time at Afri-radio only	2015-03-04 12:35:24	2015-03-04 12:35:24
647	210	13	30 minutes talk show at afri radio only.	2015-03-04 12:35:24	2015-03-04 12:35:24
648	211	1	Air time at Afri-radio only	2015-03-04 12:45:03	2015-03-04 12:45:03
649	211	4	Outdoor Branding	2015-03-04 12:45:03	2015-03-04 12:45:03
650	211	5	Sms broadcast with in Greater Banjul Areas	2015-03-04 12:45:03	2015-03-04 12:45:03
651	211	6	Credits for Communication	2015-03-04 12:45:03	2015-03-04 12:45:03
652	211	13	30 minutes talk show at afri radio only	2015-03-04 12:45:03	2015-03-04 12:45:03
653	212	4	Outdoor Branding	2015-03-10 15:38:55	2015-03-10 15:38:55
654	212	1	Air time at Afri-radio only	2015-03-10 15:38:55	2015-03-10 15:38:55
655	212	6	Credits for Communication	2015-03-10 15:38:55	2015-03-10 15:38:55
656	212	9	T-Shits for participants	2015-03-10 15:38:55	2015-03-10 15:38:55
661	214	7	P.A System	2015-03-12 10:48:41	2015-03-12 10:48:41
662	215	1	Air time at Afri-radio and other radio stations	2015-03-12 10:57:31	2015-03-12 10:57:31
663	215	4	Outdoor Branding	2015-03-12 10:57:31	2015-03-12 10:57:31
664	215	5	Sms broadcast with in Greater Banjul Areas	2015-03-12 10:57:31	2015-03-12 10:57:31
665	215	6	Credits for Communication	2015-03-12 10:57:31	2015-03-12 10:57:31
666	215	13	Air time at Afri-radio only,30 minutes at Afri radio only	2015-03-12 10:57:31	2015-03-12 10:57:31
667	216	1	Air time at Afri-radio only	2015-03-12 13:09:32	2015-03-12 13:09:32
668	216	4	Outdoor Branding	2015-03-12 13:09:32	2015-03-12 13:09:32
669	216	5	Sms broadcast with in Greater Banjul Areas	2015-03-12 13:09:32	2015-03-12 13:09:32
670	216	6	Credits for Communication	2015-03-12 13:09:32	2015-03-12 13:09:32
672	216	13	30 minutes talk show at afri radio only	2015-03-12 13:09:32	2015-03-12 13:09:32
679	218	1	Air time at Afri-radio only	2015-03-12 13:27:53	2015-03-12 13:27:53
680	218	4	Outdoor Branding	2015-03-12 13:27:53	2015-03-12 13:27:53
681	218	5	Sms broadcast with in Greater Banjul Areas	2015-03-12 13:27:53	2015-03-12 13:27:53
682	218	6	Credits for Communication	2015-03-12 13:27:53	2015-03-12 13:27:53
685	218	13	30 minutes at afri radio only.	2015-03-12 13:27:53	2015-03-12 13:27:53
686	219	1	Air time at Afri-radio only	2015-03-16 11:59:59	2015-03-16 11:59:59
687	219	2	Newspaper Advert on Observer/Point Newspaper	2015-03-16 11:59:59	2015-03-16 11:59:59
688	219	4	Outdoor Branding	2015-03-16 11:59:59	2015-03-16 11:59:59
689	219	5	Sms broadcast with in Greater Banjul Areas	2015-03-16 11:59:59	2015-03-16 11:59:59
690	219	6	Credits for Communication	2015-03-16 11:59:59	2015-03-16 11:59:59
691	219	7	P.A System	2015-03-16 11:59:59	2015-03-16 11:59:59
692	219	11	Cash for logistic	2015-03-16 11:59:59	2015-03-16 11:59:59
693	219	13	30 minutes talk show at Afri radio only.	2015-03-16 11:59:59	2015-03-16 11:59:59
694	220	1	Air time at Afri-radio only	2015-03-16 13:33:16	2015-03-16 13:33:16
695	220	4	Outdoor Branding	2015-03-16 13:33:16	2015-03-16 13:33:16
696	220	5	Sms broadcast with in Greater Banjul Areas	2015-03-16 13:33:16	2015-03-16 13:33:16
697	220	6	Credits for Communication	2015-03-16 13:33:16	2015-03-16 13:33:16
698	220	7	P.A System	2015-03-16 13:33:16	2015-03-16 13:33:16
699	220	9	T-Shits for participants	2015-03-16 13:33:16	2015-03-16 13:33:16
700	220	13	30 minutes talk show at Afri-radio only	2015-03-16 13:33:17	2015-03-16 13:33:17
701	214	6	Description	2015-03-16 16:20:55	2015-03-16 16:20:55
702	221	4	Outdoor Branding	2015-03-17 12:21:11	2015-03-17 12:21:11
703	221	1	Air time at Afri-radio only	2015-03-17 12:21:12	2015-03-17 12:21:12
704	221	5	Sms broadcast with in Greater Banjul Areas	2015-03-17 12:21:12	2015-03-17 12:21:12
705	221	6	Credits for Communication	2015-03-17 12:21:12	2015-03-17 12:21:12
706	221	7	P.A System	2015-03-17 12:21:12	2015-03-17 12:21:12
707	221	9	T-Shits for participants	2015-03-17 12:21:12	2015-03-17 12:21:12
708	221	13	30 minutes talk show on afri radio only.	2015-03-17 12:21:12	2015-03-17 12:21:12
709	221	2	Description	2015-03-17 12:27:43	2015-03-17 12:27:43
710	222	1	Air time at Afri-radio only	2015-03-19 11:23:54	2015-03-19 11:23:54
711	222	2	Daily Observer	2015-03-19 11:23:55	2015-03-19 11:23:55
712	222	4	Outdoor Branding	2015-03-19 11:23:55	2015-03-19 11:23:55
713	222	5	Sms broadcast with in Greater Banjul Areas	2015-03-19 11:23:55	2015-03-19 11:23:55
714	222	6	Credits for Communication	2015-03-19 11:23:55	2015-03-19 11:23:55
715	222	7	P.A System	2015-03-19 11:23:55	2015-03-19 11:23:55
716	222	9	T-Shits for participants	2015-03-19 11:23:55	2015-03-19 11:23:55
717	222	13	30 minutes talk show afri radio only	2015-03-19 11:23:55	2015-03-19 11:23:55
718	223	1	Air time at Afri-radio only	2015-03-19 12:14:59	2015-03-19 12:14:59
719	223	4	Outdoor Branding	2015-03-19 12:14:59	2015-03-19 12:14:59
720	223	5	Sms broadcast with in Greater Banjul Areas	2015-03-19 12:14:59	2015-03-19 12:14:59
721	223	6	Credits for Communication	2015-03-19 12:14:59	2015-03-19 12:14:59
722	223	7	P.A System	2015-03-19 12:14:59	2015-03-19 12:14:59
723	223	13	30 minutes talk show at afri radio only	2015-03-19 12:14:59	2015-03-19 12:14:59
724	224	1	Air time at Afri-radio only	2015-03-23 16:36:37	2015-03-23 16:36:37
725	224	4	Outdoor Branding	2015-03-23 16:36:37	2015-03-23 16:36:37
726	224	5	Sms broadcast with in Greater Banjul Areas	2015-03-23 16:36:37	2015-03-23 16:36:37
727	224	6	Credits for Communication	2015-03-23 16:36:37	2015-03-23 16:36:37
728	224	13	30 minutes talk show Afri radio only	2015-03-23 16:36:37	2015-03-23 16:36:37
729	225	1	Air time at Afri-radio only	2015-03-24 11:41:05	2015-03-24 11:41:05
730	225	4	Outdoor Branding	2015-03-24 11:41:05	2015-03-24 11:41:05
731	225	5	Sms broadcast with in Greater Banjul Areas	2015-03-24 11:41:05	2015-03-24 11:41:05
732	225	6	Credits for Communication	2015-03-24 11:41:05	2015-03-24 11:41:05
733	225	7	P.A System	2015-03-24 11:41:05	2015-03-24 11:41:05
734	225	13	30 minutes talk show at afri radio only.	2015-03-24 11:41:05	2015-03-24 11:41:05
735	226	7	P.A System	2015-03-25 10:14:02	2015-03-25 10:14:02
736	227	4	Outdoor Branding	2015-03-25 10:32:39	2015-03-25 10:32:39
737	227	6	Description	2015-03-25 11:18:33	2015-03-25 11:18:33
738	227	1	Description	2015-03-25 12:52:12	2015-03-25 12:52:12
739	228	5	Sms broadcast with in Greater Banjul Areas	2015-03-27 14:59:30	2015-03-27 14:59:30
740	228	4	Outdoor Branding	2015-03-27 14:59:30	2015-03-27 14:59:30
741	228	1	Air time at Afri-radio only	2015-03-27 14:59:30	2015-03-27 14:59:30
742	229	7	Description	2015-04-08 10:31:26	2015-04-08 10:31:26
743	229	6	Description	2015-04-08 10:31:26	2015-04-08 10:31:26
744	229	4	Description	2015-04-08 10:31:26	2015-04-08 10:31:26
745	230	1	Air time at Afri-radio only	2015-04-08 10:42:32	2015-04-08 10:42:32
746	230	4	Outdoor Branding	2015-04-08 10:42:32	2015-04-08 10:42:32
747	230	5	Sms broadcast with in Greater Banjul Areas	2015-04-08 10:42:32	2015-04-08 10:42:32
748	230	6	Credits for Communication	2015-04-08 10:42:32	2015-04-08 10:42:32
749	230	13	30 minutes talk show at Afr radio only	2015-04-08 10:42:32	2015-04-08 10:42:32
751	231	7	P.A System	2015-04-08 11:15:03	2015-04-08 11:15:03
752	232	1	Air time at Afri-radio only	2015-04-08 13:14:20	2015-04-08 13:14:20
753	232	4	Outdoor Branding	2015-04-08 13:14:20	2015-04-08 13:14:20
754	232	5	Sms broadcast with in Greater Banjul Areas	2015-04-08 13:14:20	2015-04-08 13:14:20
755	232	6	Credits for Communication	2015-04-08 13:14:20	2015-04-08 13:14:20
756	232	13	30 minutes talk show on afri radio only	2015-04-08 13:14:20	2015-04-08 13:14:20
757	233	1	Air time at Afri-radio only	2015-04-08 17:46:30	2015-04-08 17:46:30
758	233	4	Outdoor Branding	2015-04-08 17:46:30	2015-04-08 17:46:30
759	233	5	Sms broadcast with in Greater Banjul Areas	2015-04-08 17:46:31	2015-04-08 17:46:31
760	233	6	Credits for Communication	2015-04-08 17:46:31	2015-04-08 17:46:31
761	233	13	30 minutes talk show on Afri radio only	2015-04-08 17:46:31	2015-04-08 17:46:31
762	234	1	Air time at Afri-radio only	2015-04-09 12:52:03	2015-04-09 12:52:03
763	234	4	Outdoor Branding	2015-04-09 12:52:03	2015-04-09 12:52:03
764	234	5	Sms broadcast with in Greater Banjul Areas	2015-04-09 12:52:03	2015-04-09 12:52:03
765	234	6	Credits for Communication	2015-04-09 12:52:04	2015-04-09 12:52:04
766	234	7	P.A System	2015-04-09 12:52:04	2015-04-09 12:52:04
767	234	13	30 minutes talk show at afri radio only	2015-04-09 12:52:04	2015-04-09 12:52:04
773	215	7	Description	2015-04-17 12:16:10	2015-04-17 12:16:10
774	236	7	P.A System	2015-04-17 13:06:18	2015-04-17 13:06:18
780	238	1	Air time at Afri-radio only	2015-04-21 11:22:26	2015-04-21 11:22:26
786	241	11	Cash for rental opf P.A System	2015-04-21 11:40:41	2015-04-21 11:40:41
787	241	5	Sms broadcast with in Greater Banjul Areas	2015-04-21 11:40:41	2015-04-21 11:40:41
788	241	4	Outdoor Branding	2015-04-21 11:40:41	2015-04-21 11:40:41
789	241	1	Air time at Afri-radio only	2015-04-21 11:40:41	2015-04-21 11:40:41
790	242	6	Credits for Communication	2015-04-27 11:45:19	2015-04-27 11:45:19
791	242	5	Sms broadcast with in Greater Banjul Areas	2015-04-27 11:45:19	2015-04-27 11:45:19
792	242	4	Outdoor Branding	2015-04-27 11:45:19	2015-04-27 11:45:19
793	242	1	Air time at Afri-radio only	2015-04-27 11:45:19	2015-04-27 11:45:19
806	245	1	Air time at Afri-radio only	2015-04-28 16:19:33	2015-04-28 16:19:33
807	245	4	Outdoor Branding	2015-04-28 16:19:33	2015-04-28 16:19:33
808	245	5	Sms broadcast with in Greater Banjul Areas	2015-04-28 16:19:33	2015-04-28 16:19:33
809	245	6	Credits for Communication	2015-04-28 16:19:34	2015-04-28 16:19:34
810	245	13	30 Minutes talk show at afri radio only	2015-04-28 16:19:34	2015-04-28 16:19:34
814	247	1	On Afri-Radio & Other Radios	2015-05-05 12:13:29	2015-05-05 12:13:29
815	247	2	2 spots on the new papers	2015-05-05 12:13:29	2015-05-05 12:13:29
816	247	4	Outdoor branding	2015-05-05 12:13:29	2015-05-05 12:13:29
817	247	5	10,000 subscribers	2015-05-05 12:13:29	2015-05-05 12:13:29
818	247	6	For Communication	2015-05-05 12:13:29	2015-05-05 12:13:29
819	247	7	Lights	2015-05-05 12:13:29	2015-05-05 12:13:29
820	247	13	On Afri-Radio & Other Radios	2015-05-05 12:13:29	2015-05-05 12:13:29
828	249	1	On Afri-Radio 	2015-05-06 16:36:08	2015-05-06 16:36:08
829	249	4	Outdoor Publicity	2015-05-06 16:36:08	2015-05-06 16:36:08
830	249	7	Description	2015-05-06 16:36:23	2015-05-06 16:36:23
831	250	6	Credit for Communication	2015-05-07 15:50:01	2015-05-07 15:50:01
832	250	5	20,000 Subscribers	2015-05-07 15:50:01	2015-05-07 15:50:01
833	250	4	Outdoor publicity	2015-05-07 15:50:01	2015-05-07 15:50:01
834	250	1	On Afri-Radio & Other Radios	2015-05-07 15:50:01	2015-05-07 15:50:01
835	250	7	P.A System	2015-05-07 15:50:01	2015-05-07 15:50:01
838	251	4	Outdoor branding	2015-05-08 14:55:09	2015-05-08 14:55:09
839	251	1	On Afri-Radio & Other Radios	2015-05-08 14:55:09	2015-05-08 14:55:09
840	251	5	30,000 subscribers	2015-05-08 14:55:09	2015-05-08 14:55:09
841	251	6	For communication	2015-05-08 14:55:09	2015-05-08 14:55:09
842	251	7	P.A system and Stage	2015-05-08 14:55:09	2015-05-08 14:55:09
843	251	13	On Afri-Radio & Other Radios	2015-05-08 14:55:10	2015-05-08 14:55:10
844	252	1	On Afri-Radio 	2015-05-08 15:13:49	2015-05-08 15:13:49
845	252	4	Outdoor branding	2015-05-08 15:13:49	2015-05-08 15:13:49
846	253	1	Air time at Afri-radio only	2015-05-11 10:08:58	2015-05-11 10:08:58
847	253	4	Outdoor Branding	2015-05-11 10:08:58	2015-05-11 10:08:58
848	253	5	Sms broadcast with in Greater Banjul Areas	2015-05-11 10:08:58	2015-05-11 10:08:58
849	254	1	Air time at Afri-radio only	2015-05-11 11:45:46	2015-05-11 11:45:46
850	254	5	Sms broadcast with in Greater Banjul Areas	2015-05-11 11:45:46	2015-05-11 11:45:46
851	254	6	Credits for Communication	2015-05-11 11:45:46	2015-05-11 11:45:46
852	254	13	30 minutes talk show on Afri radio only.	2015-05-11 11:45:46	2015-05-11 11:45:46
856	256	1	Air time at Afri-radio only	2015-05-18 11:25:57	2015-05-18 11:25:57
857	256	4	Outdoor Branding	2015-05-18 11:25:57	2015-05-18 11:25:57
858	256	6	Credits for Communication	2015-05-18 11:25:57	2015-05-18 11:25:57
859	256	7	P.A System	2015-05-18 11:25:57	2015-05-18 11:25:57
860	257	1	Air time at Afri-radio only	2015-05-18 14:39:19	2015-05-18 14:39:19
861	258	1	Air time at Afri-radio and other radio stations	2015-05-19 12:40:18	2015-05-19 12:40:18
862	258	4	Outdoor Branding	2015-05-19 12:40:18	2015-05-19 12:40:18
863	258	6	Credits for Communication	2015-05-19 12:40:18	2015-05-19 12:40:18
864	259	1	Air time at Afri-radio and other radio stations	2015-05-19 12:53:41	2015-05-19 12:53:41
865	259	4	Outdoor Branding	2015-05-19 12:53:41	2015-05-19 12:53:41
866	259	5	Sms broadcast with in Greater Banjul Areas	2015-05-19 12:53:41	2015-05-19 12:53:41
867	259	6	Credits for Communication	2015-05-19 12:53:41	2015-05-19 12:53:41
869	259	13	30 Minutes talk show at Afri radio only	2015-05-19 12:53:41	2015-05-19 12:53:41
870	260	4	Outdoor Branding	2015-05-20 14:33:47	2015-05-20 14:33:47
871	261	7	P.A System	2015-05-20 16:30:13	2015-05-20 16:30:13
872	261	4	Outdoor Branding	2015-05-20 16:30:13	2015-05-20 16:30:13
873	261	1	Air time at Afri-radio only	2015-05-20 16:30:13	2015-05-20 16:30:13
874	262	4	Outdoor branding	2015-05-20 17:25:17	2015-05-20 17:25:17
875	262	6	Credit for Communication	2015-05-20 17:25:17	2015-05-20 17:25:17
876	262	13	On Afri-Radio 	2015-05-20 17:25:17	2015-05-20 17:25:17
877	262	1	Description	2015-05-20 17:25:36	2015-05-20 17:25:36
878	263	1	Air time at Afri-radio only	2015-05-21 12:00:38	2015-05-21 12:00:38
879	263	2	newspaper adverts observer	2015-05-21 12:00:38	2015-05-21 12:00:38
880	263	4	Outdoor Branding	2015-05-21 12:00:38	2015-05-21 12:00:38
881	263	5	Sms broadcast with in Greater Banjul Areas	2015-05-21 12:00:38	2015-05-21 12:00:38
882	263	7	P.A System	2015-05-21 12:00:38	2015-05-21 12:00:38
883	263	13	30 minutes talk show afri radio only.	2015-05-21 12:00:38	2015-05-21 12:00:38
884	264	5	Sms broadcast in farafenni 	2015-05-27 10:26:41	2015-05-27 10:26:41
885	265	1	Air time at Afri-radio only	2015-05-28 16:23:57	2015-05-28 16:23:57
886	265	4	Outdoor Branding	2015-05-28 16:23:57	2015-05-28 16:23:57
887	265	5	Sms broadcast with in Greater Banjul Areas	2015-05-28 16:23:57	2015-05-28 16:23:57
888	265	6	Credits for Communication	2015-05-28 16:23:57	2015-05-28 16:23:57
889	254	4	Description	2015-06-09 12:45:27	2015-06-09 12:45:27
892	268	1	Air time at Afri-radio and West coast	2015-07-01 14:52:20	2015-07-01 14:52:20
893	268	4	Outdoor Branding	2015-07-01 14:52:20	2015-07-01 14:52:20
894	268	5	Sms broadcast with in Greater Banjul Areas	2015-07-01 14:52:20	2015-07-01 14:52:20
895	268	6	Credits for Communication	2015-07-01 14:52:20	2015-07-01 14:52:20
897	268	13	Talk show on afri radio only.	2015-07-01 14:52:20	2015-07-01 14:52:20
898	269	4	Outdoor Branding	2015-07-07 14:02:00	2015-07-07 14:02:00
900	269	6	Description	2015-07-08 14:17:06	2015-07-08 14:17:06
901	270	6	Credits for Winners	2015-07-20 14:39:26	2015-07-20 14:39:26
902	270	10	Afri touch mobile for Winners	2015-07-20 14:39:26	2015-07-20 14:39:26
906	272	4	Outdoor Branding	2015-07-20 16:34:26	2015-07-20 16:34:26
907	272	7	Stage only	2015-07-20 16:34:26	2015-07-20 16:34:26
909	273	4	Outdoor Branding	2015-07-29 10:38:34	2015-07-29 10:38:34
910	274	7	P.A System	2015-08-03 12:17:13	2015-08-03 12:17:13
911	274	9	T-Shits for participants	2015-08-03 12:17:13	2015-08-03 12:17:13
915	276	7	P.A System+stage+screens	2015-08-04 14:38:41	2015-08-04 14:38:41
916	277	4	Outdoor branding	2015-08-10 17:42:40	2015-08-10 17:42:40
917	278	13	Air time at Afri-radio only	2015-08-19 15:52:55	2015-08-19 15:52:55
918	278	7	P.A System	2015-08-19 15:52:55	2015-08-19 15:52:55
919	278	6	Credits for Communication	2015-08-19 15:52:55	2015-08-19 15:52:55
920	278	5	Sms broadcast with in Greater Banjul Areas	2015-08-19 15:52:55	2015-08-19 15:52:55
921	278	4	Outdoor Branding	2015-08-19 15:52:55	2015-08-19 15:52:55
922	278	1	Air time at Afri-radio and other radio stations	2015-08-19 15:52:55	2015-08-19 15:52:55
926	280	7	P.A System	2015-08-19 16:10:17	2015-08-19 16:10:17
927	280	6	Credits for Communication	2015-08-19 16:10:17	2015-08-19 16:10:17
928	280	4	Outdoor Branding	2015-08-19 16:10:17	2015-08-19 16:10:17
930	281	11	Cash for Jersey,and Beeps	2015-08-21 13:22:10	2015-08-21 13:22:10
931	282	1	Air time at Afri-radio only	2015-08-24 15:34:49	2015-08-24 15:34:49
933	282	5	Sms broadcast with in Greater Banjul Areas	2015-08-24 15:34:49	2015-08-24 15:34:49
934	282	4	Outdoor Branding	2015-08-24 15:34:49	2015-08-24 15:34:49
935	282	2	Newspaper advert	2015-08-24 15:34:49	2015-08-24 15:34:49
936	283	7	P.A System	2015-08-24 16:17:35	2015-08-24 16:17:35
937	283	6	Credits for Communication	2015-08-24 16:17:35	2015-08-24 16:17:35
938	283	5	Sms broadcast with in Greater Banjul Areas	2015-08-24 16:17:35	2015-08-24 16:17:35
939	283	4	Outdoor Branding	2015-08-24 16:17:35	2015-08-24 16:17:35
940	283	1	Air time at Afri-radio and other radio stations	2015-08-24 16:17:35	2015-08-24 16:17:35
941	283	13	30 minutes talk show on Afri radio only	2015-08-24 16:17:35	2015-08-24 16:17:35
942	283	11	Cash for Certificate and Awards	2015-08-24 16:17:35	2015-08-24 16:17:35
943	284	4	Outdoor Branding	2015-08-31 15:25:04	2015-08-31 15:25:04
944	285	7	P.A System	2015-09-01 11:31:09	2015-09-01 11:31:09
945	285	6	Credits for Communication	2015-09-01 11:31:09	2015-09-01 11:31:09
946	285	5	Sms broadcast with in Greater Banjul Areas	2015-09-01 11:31:09	2015-09-01 11:31:09
947	285	4	Outdoor Branding	2015-09-01 11:31:09	2015-09-01 11:31:09
948	285	1	Air time at Afri-radio and other radio stations	2015-09-01 11:31:09	2015-09-01 11:31:09
949	286	1	Air time at Afri-radio only	2015-09-09 16:16:36	2015-09-09 16:16:36
950	287	1	Air time at Afri-radio only	2015-09-09 16:20:41	2015-09-09 16:20:41
951	288	13	Air time at Afri-radio only	2015-09-10 14:58:35	2015-09-10 14:58:35
953	288	4	Outdoor Branding	2015-09-10 14:58:35	2015-09-10 14:58:35
954	288	6	Credits for Communication	2015-09-10 14:58:35	2015-09-10 14:58:35
955	288	5	Sms broadcast with in Greater Banjul Areas	2015-09-10 14:58:35	2015-09-10 14:58:35
956	288	1	Air time at Afri-radio and other radio stations	2015-09-10 14:58:35	2015-09-10 14:58:35
962	290	6	Credits for Communication	2015-09-10 15:20:19	2015-09-10 15:20:19
964	290	4	Outdoor Branding	2015-09-10 15:20:20	2015-09-10 15:20:20
965	290	1	Air time at Afri-radio only	2015-09-10 15:20:20	2015-09-10 15:20:20
972	293	4	Outdoor Branding	2015-09-17 16:30:33	2015-09-17 16:30:33
973	293	7	P.A System	2015-09-17 16:30:33	2015-09-17 16:30:33
979	295	1	Air time at Afri-radio and other radio stations	2015-09-29 16:31:22	2015-09-29 16:31:22
980	295	4	Outdoor Branding	2015-09-29 16:31:22	2015-09-29 16:31:22
981	295	5	Sms broadcast with in Greater Banjul Areas	2015-09-29 16:31:22	2015-09-29 16:31:22
982	295	6	Credits for Communication	2015-09-29 16:31:22	2015-09-29 16:31:22
983	295	7	P.A System	2015-09-29 16:31:22	2015-09-29 16:31:22
985	295	13	Air time at Afri-radio only,30 minutes talk show	2015-09-29 16:31:23	2015-09-29 16:31:23
986	296	1	Air time at Afri-radio and other radio stations	2015-09-29 16:43:35	2015-09-29 16:43:35
987	296	4	Outdoor Branding	2015-09-29 16:43:35	2015-09-29 16:43:35
988	296	5	Sms broadcast with in Greater Banjul Areas	2015-09-29 16:43:35	2015-09-29 16:43:35
989	296	6	Credits for Communication	2015-09-29 16:43:35	2015-09-29 16:43:35
991	296	13	30 minutes Air time on Afri-radio 	2015-09-29 16:43:35	2015-09-29 16:43:35
992	297	1	Air time at Afri-radio and other radio stations	2015-09-29 16:57:13	2015-09-29 16:57:13
993	297	4	Outdoor Branding	2015-09-29 16:57:14	2015-09-29 16:57:14
994	297	5	Sms broadcast with in Greater Banjul Areas	2015-09-29 16:57:14	2015-09-29 16:57:14
995	297	6	Credits for Communication	2015-09-29 16:57:14	2015-09-29 16:57:14
996	297	7	P.A System	2015-09-29 16:57:14	2015-09-29 16:57:14
997	297	13	30 minutes Air time on Afri-radio 	2015-09-29 16:57:14	2015-09-29 16:57:14
998	298	1	Air time at Afri-radio and other radio stations	2015-10-06 15:54:00	2015-10-06 15:54:00
999	298	6	Credits for Communication	2015-10-06 15:54:00	2015-10-06 15:54:00
1000	298	5	Sms broadcast with in Greater Banjul Areas	2015-10-06 15:54:00	2015-10-06 15:54:00
1001	298	4	Outdoor Branding	2015-10-06 15:54:00	2015-10-06 15:54:00
1002	298	13	30 minutes Air time on Afri-radio 	2015-10-06 15:54:00	2015-10-06 15:54:00
1006	305	1	Air time at Afri-radio and other radio stations	2015-10-15 12:59:24	2015-10-15 12:59:24
1007	305	5	Sms broadcast with in Greater Banjul Areas	2015-10-15 12:59:24	2015-10-15 12:59:24
1008	305	4	Outdoor Branding	2015-10-15 12:59:24	2015-10-15 12:59:24
1009	305	2	Publicity on Newspapers	2015-10-15 12:59:24	2015-10-15 12:59:24
1011	305	13	30 minutes Air time on Afri-radio 	2015-10-15 12:59:24	2015-10-15 12:59:24
1012	305	6	Credits for Communication	2015-10-15 12:59:24	2015-10-15 12:59:24
1013	306	1	Air time at Afri-radio and other radio stations	2015-10-15 13:09:46	2015-10-15 13:09:46
1014	306	4	Outdoor Branding	2015-10-15 13:09:47	2015-10-15 13:09:47
1015	306	5	Sms broadcast with in Greater Banjul Areas	2015-10-15 13:09:47	2015-10-15 13:09:47
1016	306	6	Credits for Communication	2015-10-15 13:09:47	2015-10-15 13:09:47
1017	306	7	P.A System	2015-10-15 13:09:47	2015-10-15 13:09:47
1019	306	11	Cash for logistic	2015-10-15 13:09:47	2015-10-15 13:09:47
1020	306	13	30 minutes Air time on Afri-radio 	2015-10-15 13:09:47	2015-10-15 13:09:47
1021	307	1	Air time at Afri-radio only	2015-10-20 10:19:46	2015-10-20 10:19:46
1022	308	7	P.A System	2015-10-22 10:31:41	2015-10-22 10:31:41
1023	309	1	Air time at Afri-radio only	2015-10-23 12:00:24	2015-10-23 12:00:24
1024	309	5	Sms broadcast with in Greater Banjul Areas	2015-10-23 12:00:24	2015-10-23 12:00:24
1025	309	7	P.A System	2015-10-23 12:00:24	2015-10-23 12:00:24
1026	310	1	Air time at Afri-radio only	2015-10-23 12:05:03	2015-10-23 12:05:03
1027	310	5	Sms broadcast with in Greater Banjul Areas	2015-10-23 12:05:03	2015-10-23 12:05:03
1028	310	6	Credits for Communication	2015-10-23 12:05:03	2015-10-23 12:05:03
1029	309	13	Description	2015-10-26 14:26:56	2015-10-26 14:26:56
1030	311	1	Air time at Afri-radio and other radio stations	2015-10-27 10:35:00	2015-10-27 10:35:00
1031	311	4	Outdoor Branding	2015-10-27 10:35:00	2015-10-27 10:35:00
1032	311	5	Sms broadcast with in Greater Banjul Areas	2015-10-27 10:35:00	2015-10-27 10:35:00
1033	311	6	Credits for Communication	2015-10-27 10:35:00	2015-10-27 10:35:00
1034	311	7	P.A System	2015-10-27 10:35:00	2015-10-27 10:35:00
1035	311	13	30 minutes Air time on Afri-radio 	2015-10-27 10:35:00	2015-10-27 10:35:00
1041	313	1	Adverts on Afri-Radio	2015-11-02 13:19:42	2015-11-02 13:19:42
1042	313	5	10,000 Subscribers	2015-11-02 13:19:42	2015-11-02 13:19:42
1043	313	7	P.A System & Lights	2015-11-02 13:19:42	2015-11-02 13:19:42
1050	313	11	Description	2015-11-02 17:07:10	2015-11-02 17:07:10
1051	315	1	On Afri-Radio 	2015-11-03 16:06:34	2015-11-03 16:06:34
1052	315	4	Outdoor branding	2015-11-03 16:06:34	2015-11-03 16:06:34
1053	315	7	P.A System	2015-11-03 16:06:34	2015-11-03 16:06:34
1054	315	13	On Afri-Radio 	2015-11-03 16:06:34	2015-11-03 16:06:34
1055	316	1	Air time at Afri-radio only	2015-11-04 10:42:04	2015-11-04 10:42:04
1056	316	4	Outdoor Branding	2015-11-04 10:42:04	2015-11-04 10:42:04
1057	316	5	Sms broadcast with in Greater Banjul Areas	2015-11-04 10:42:04	2015-11-04 10:42:04
1058	316	6	Credits for Communication	2015-11-04 10:42:04	2015-11-04 10:42:04
1060	316	13	30 minutes Air time on Afri-radio 	2015-11-04 10:42:04	2015-11-04 10:42:04
1061	317	1	Air time at Afri-radio only	2015-11-04 11:54:24	2015-11-04 11:54:24
1062	317	4	Outdoor Branding	2015-11-04 11:54:24	2015-11-04 11:54:24
1063	317	5	Sms broadcast with in Greater Banjul Areas	2015-11-04 11:54:25	2015-11-04 11:54:25
1064	317	6	Credits for Communication	2015-11-04 11:54:25	2015-11-04 11:54:25
1065	317	7	P.A System	2015-11-04 11:54:25	2015-11-04 11:54:25
1066	318	1	Air time at Afri-radio only	2015-11-04 12:23:50	2015-11-04 12:23:50
1067	319	1	Air time at Afri-radio only	2015-11-04 12:49:06	2015-11-04 12:49:06
1068	319	4	Outdoor Branding	2015-11-04 12:49:06	2015-11-04 12:49:06
1069	319	6	Credits for Communication	2015-11-04 12:49:06	2015-11-04 12:49:06
1070	320	1	Air time at Afri-radio only	2015-11-04 13:09:55	2015-11-04 13:09:55
1071	320	4	Outdoor Branding	2015-11-04 13:09:55	2015-11-04 13:09:55
1072	320	5	Sms broadcast with in Greater Banjul Areas	2015-11-04 13:09:55	2015-11-04 13:09:55
1073	320	6	Credits for Communication	2015-11-04 13:09:55	2015-11-04 13:09:55
1074	320	13	30 minutes Air time on Afri-radio 	2015-11-04 13:09:55	2015-11-04 13:09:55
1075	321	1	Air time at Afri-radio only	2015-11-06 11:50:01	2015-11-06 11:50:01
1076	321	4	Outdoor Branding	2015-11-06 11:50:02	2015-11-06 11:50:02
1077	321	5	Sms broadcast with in Greater Banjul Areas	2015-11-06 11:50:02	2015-11-06 11:50:02
1078	321	6	Credits for Communication	2015-11-06 11:50:02	2015-11-06 11:50:02
1084	323	4	Outdoor branding	2015-11-07 14:46:40	2015-11-07 14:46:40
1085	324	1	On Afri-Radio 	2015-11-07 15:07:00	2015-11-07 15:07:00
1086	324	4	Outdoor branding	2015-11-07 15:07:00	2015-11-07 15:07:00
1087	324	5	10,000 Subscribers	2015-11-07 15:07:00	2015-11-07 15:07:00
1088	324	7	P.A System	2015-11-07 15:07:00	2015-11-07 15:07:00
1089	324	13	On Afri-Radio 	2015-11-07 15:07:00	2015-11-07 15:07:00
1090	325	1	On Afri-Radio 	2015-11-07 16:38:11	2015-11-07 16:38:11
1091	325	4	Outdoor branding	2015-11-07 16:38:11	2015-11-07 16:38:11
1092	325	5	5000 Subscribers	2015-11-07 16:38:11	2015-11-07 16:38:11
1093	325	6	For Communication	2015-11-07 16:38:12	2015-11-07 16:38:12
1094	325	7	Stage	2015-11-07 16:38:12	2015-11-07 16:38:12
1095	326	7	P.A System	2015-11-16 11:11:11	2015-11-16 11:11:11
1096	326	9	Jersey for both teams	2015-11-16 11:11:11	2015-11-16 11:11:11
1097	327	4	Outdoor Branding	2015-11-16 11:37:02	2015-11-16 11:37:02
1098	327	6	Credits for Communication	2015-11-16 11:37:02	2015-11-16 11:37:02
1099	327	11	Transportation(Vehicle Rental)25 Passengers	2015-11-16 11:37:02	2015-11-16 11:37:02
1100	328	6	Credits for Communication	2015-11-18 16:30:25	2015-11-18 16:30:25
1101	328	5	Sms broadcast with in Greater Banjul Areas	2015-11-18 16:30:25	2015-11-18 16:30:25
1102	328	4	Outdoor Branding	2015-11-18 16:30:26	2015-11-18 16:30:26
1103	328	1	Air time at Afri-radio only	2015-11-18 16:30:26	2015-11-18 16:30:26
1104	329	1	Air time at Afri-radio only	2015-11-18 16:38:41	2015-11-18 16:38:41
1105	329	4	Outdoor Branding	2015-11-18 16:38:41	2015-11-18 16:38:41
1106	329	5	Sms broadcast with in Greater Banjul Areas	2015-11-18 16:38:41	2015-11-18 16:38:41
1107	329	6	Credits for Communication	2015-11-18 16:38:41	2015-11-18 16:38:41
1108	329	7	Stage	2015-11-18 16:38:41	2015-11-18 16:38:41
1109	330	7	P.A System	2015-11-19 08:47:00	2015-11-19 08:47:00
1116	332	1	On Afri-Radio 	2015-11-24 11:52:22	2015-11-24 11:52:22
1117	332	2	News Paper Ad	2015-11-24 11:52:22	2015-11-24 11:52:22
1118	332	4	Outdoor branding	2015-11-24 11:52:22	2015-11-24 11:52:22
1119	332	5	5000 Subscribers	2015-11-24 11:52:22	2015-11-24 11:52:22
1120	332	6	For Communication	2015-11-24 11:52:22	2015-11-24 11:52:22
1121	332	7	Bridge & Lights	2015-11-24 11:52:22	2015-11-24 11:52:22
1122	333	4	Description	2015-11-26 15:03:49	2015-11-26 15:03:49
1123	333	11	Description	2015-11-26 15:05:00	2015-11-26 15:05:00
1130	337	1	On Afri-Radio 	2015-12-03 13:02:28	2015-12-03 13:02:28
1131	337	4	Outdoor branding	2015-12-03 13:02:28	2015-12-03 13:02:28
1132	337	6	For Communication	2015-12-03 13:02:28	2015-12-03 13:02:28
1133	337	7	P.A System	2015-12-03 13:02:28	2015-12-03 13:02:28
1134	338	1	On Afri-Radio 	2015-12-03 13:11:11	2015-12-03 13:11:11
1135	338	4	Outdoor branding	2015-12-03 13:11:11	2015-12-03 13:11:11
1136	338	5	10,000 Subscribers	2015-12-03 13:11:11	2015-12-03 13:11:11
1137	338	6	For Communication	2015-12-03 13:11:11	2015-12-03 13:11:11
1143	340	4	Outdoor branding	2015-12-03 14:14:09	2015-12-03 14:14:09
1144	340	6	For Communication	2015-12-03 14:14:10	2015-12-03 14:14:10
1145	340	11	To buy sport materials and T-shirts	2015-12-03 14:14:10	2015-12-03 14:14:10
1146	341	2	Ad on the newspapers 	2015-12-03 14:19:32	2015-12-03 14:19:32
1147	341	4	Outdoor branding	2015-12-03 14:19:32	2015-12-03 14:19:32
1148	341	5	10,000 Subscribers	2015-12-03 14:19:32	2015-12-03 14:19:32
1149	341	6	For communication	2015-12-03 14:19:32	2015-12-03 14:19:32
1150	341	7	Lights	2015-12-03 14:19:32	2015-12-03 14:19:32
1151	342	1	On Afri-Radio 	2015-12-03 15:35:18	2015-12-03 15:35:18
1152	342	4	Outdoor branding	2015-12-03 15:35:18	2015-12-03 15:35:18
1153	342	5	20,000 Subscribers	2015-12-03 15:35:18	2015-12-03 15:35:18
1154	342	6	For communication	2015-12-03 15:35:18	2015-12-03 15:35:18
1155	343	1	On Afri-Radio 	2015-12-03 15:48:19	2015-12-03 15:48:19
1156	343	4	Outdoor branding	2015-12-03 15:48:19	2015-12-03 15:48:19
1157	344	1	On Afri-Radio 	2015-12-14 13:58:17	2015-12-14 13:58:17
1158	344	4	Outdoor branding	2015-12-14 13:58:17	2015-12-14 13:58:17
1159	344	5	10,000 subscribers in Sukuta area	2015-12-14 13:58:17	2015-12-14 13:58:17
1160	344	7	Stage	2015-12-14 13:58:17	2015-12-14 13:58:17
1161	345	4	Outdoor branding	2015-12-14 15:54:24	2015-12-14 15:54:24
1162	345	5	10,000 subscribers	2015-12-14 15:54:24	2015-12-14 15:54:24
1163	345	7	Stage	2015-12-14 15:54:24	2015-12-14 15:54:24
1164	346	1	Air time at Afri-radio only	2015-12-21 14:15:05	2015-12-21 14:15:05
1165	346	4	Outdoor Branding	2015-12-21 14:15:05	2015-12-21 14:15:05
1166	346	5	Sms broadcast with in Greater Banjul Areas	2015-12-21 14:15:05	2015-12-21 14:15:05
1167	346	7	P.A System	2015-12-21 14:15:06	2015-12-21 14:15:06
1168	347	1	Air time at Afri-radio only	2015-12-21 15:46:28	2015-12-21 15:46:28
1169	348	1	Air time at Afri-radio and other radio stations	2015-12-29 10:24:37	2015-12-29 10:24:37
1170	348	2	Newspaper	2015-12-29 10:24:37	2015-12-29 10:24:37
1171	348	3	Television GRTS	2015-12-29 10:24:37	2015-12-29 10:24:37
1172	348	4	Outdoor Branding	2015-12-29 10:24:38	2015-12-29 10:24:38
1173	348	5	Sms broadcast with in Greater Banjul Areas	2015-12-29 10:24:38	2015-12-29 10:24:38
1174	348	6	Credits for Communication	2015-12-29 10:24:38	2015-12-29 10:24:38
1175	348	7	Bridge&Lights	2015-12-29 10:24:38	2015-12-29 10:24:38
1176	348	11		2015-12-29 10:24:38	2015-12-29 10:24:38
1177	348	13	talk show at Afri radio only	2015-12-29 10:24:38	2015-12-29 10:24:38
1178	349	1	Air time at Afri-radio only	2015-12-29 10:33:31	2015-12-29 10:33:31
1179	349	4	Outdoor Branding	2015-12-29 10:33:31	2015-12-29 10:33:31
1180	349	5	Sms broadcast with in Greater Banjul Areas	2015-12-29 10:33:31	2015-12-29 10:33:31
1181	345	6	Description	2015-12-30 12:48:25	2015-12-30 12:48:25
1182	350	1	Air time at Afri-radio only	2016-01-04 12:21:44	2016-01-04 12:21:44
1183	350	4	Outdoor Branding	2016-01-04 12:21:44	2016-01-04 12:21:44
1184	350	5	Sms broadcast with in Greater Banjul Areas	2016-01-04 12:21:44	2016-01-04 12:21:44
1185	350	6	Credits for Communication	2016-01-04 12:21:44	2016-01-04 12:21:44
1186	350	7	P.A System	2016-01-04 12:21:44	2016-01-04 12:21:44
1187	351	1	Air time at Afri-radio only	2016-01-04 13:20:31	2016-01-04 13:20:31
1188	351	4	Outdoor Branding	2016-01-04 13:20:31	2016-01-04 13:20:31
1189	351	5	Sms broadcast with in Greater Banjul Areas	2016-01-04 13:20:31	2016-01-04 13:20:31
1190	351	6	Credits for Communication	2016-01-04 13:20:31	2016-01-04 13:20:31
1191	351	7	P.A System	2016-01-04 13:20:31	2016-01-04 13:20:31
1192	351	13	30 minutes Air time on Afri-radio 	2016-01-04 13:20:31	2016-01-04 13:20:31
1193	352	1	Air time at Afri-radio only	2016-01-05 12:06:23	2016-01-05 12:06:23
1194	353	1	Air time at Afri-radio only	2016-01-05 15:36:30	2016-01-05 15:36:30
1195	353	4	Outdoor Branding	2016-01-05 15:36:30	2016-01-05 15:36:30
1196	353	5	Sms broadcast with in Greater Banjul Areas	2016-01-05 15:36:30	2016-01-05 15:36:30
1197	353	6	Credits for Communication	2016-01-05 15:36:30	2016-01-05 15:36:30
1198	353	7	P.A System	2016-01-05 15:36:30	2016-01-05 15:36:30
1199	354	1	Air time at Afri-radio only	2016-01-07 11:00:51	2016-01-07 11:00:51
1200	354	4	Outdoor Branding	2016-01-07 11:00:51	2016-01-07 11:00:51
1201	354	5	Sms broadcast with in Greater Banjul Areas	2016-01-07 11:00:51	2016-01-07 11:00:51
1202	354	6	Credits for Communication	2016-01-07 11:00:51	2016-01-07 11:00:51
1203	354	13	30 minutes Air time on Afri-radio 	2016-01-07 11:00:51	2016-01-07 11:00:51
1204	355	1	Air time at Afri-radio only	2016-01-12 11:14:27	2016-01-12 11:14:27
1205	355	4	Outdoor Branding	2016-01-12 11:14:27	2016-01-12 11:14:27
1206	355	5	Sms broadcast with in Greater Banjul Areas	2016-01-12 11:14:27	2016-01-12 11:14:27
1207	355	6	Credits for Communication	2016-01-12 11:14:27	2016-01-12 11:14:27
1208	355	7	Stage	2016-01-12 11:14:27	2016-01-12 11:14:27
1209	355	13	30 minutes Air time on Afri-radio 	2016-01-12 11:14:27	2016-01-12 11:14:27
1210	356	1	Air time at Afri-radio and other radio stations	2016-01-14 11:05:57	2016-01-14 11:05:57
1211	356	4	Outdoor Branding	2016-01-14 11:05:57	2016-01-14 11:05:57
1212	356	5	Sms broadcast with in Greater Banjul Areas	2016-01-14 11:05:57	2016-01-14 11:05:57
1213	356	6	Credits for Communication	2016-01-14 11:05:57	2016-01-14 11:05:57
1214	356	7	P.A System+stage	2016-01-14 11:05:57	2016-01-14 11:05:57
1215	356	13	30 minutes Air time on Afri-radio 	2016-01-14 11:05:57	2016-01-14 11:05:57
1216	356	14	Billbaord fixing	2016-01-14 11:05:57	2016-01-14 11:05:57
1217	357	1	Air time at Afri-radio only	2016-01-14 11:12:13	2016-01-14 11:12:13
1218	357	4	Outdoor Branding	2016-01-14 11:12:13	2016-01-14 11:12:13
1219	357	5	Sms broadcast with in Greater Banjul Areas	2016-01-14 11:12:13	2016-01-14 11:12:13
1220	357	6	Credits for Communication	2016-01-14 11:12:13	2016-01-14 11:12:13
1221	357	7	P.A System	2016-01-14 11:12:13	2016-01-14 11:12:13
1222	358	1	Air time at Afri-radio only	2016-01-15 08:26:16	2016-01-15 08:26:16
1223	358	4	Outdoor Branding	2016-01-15 08:26:16	2016-01-15 08:26:16
1224	358	5	Sms broadcast with in Greater Banjul Areas	2016-01-15 08:26:16	2016-01-15 08:26:16
1225	358	6	Credits for Communication	2016-01-15 08:26:16	2016-01-15 08:26:16
1226	358	7	P.A System&Lights	2016-01-15 08:26:16	2016-01-15 08:26:16
1231	361	13	30 minutes Air time on Afri-radio 	2016-01-18 15:54:14	2016-01-18 15:54:14
1232	361	1	Air time at Afri-radio only	2016-01-18 15:54:14	2016-01-18 15:54:14
1233	362	7	P.A System+stage+Lights	2016-01-19 10:48:00	2016-01-19 10:48:00
1234	363	1	Air time at Afri-radio only	2016-01-19 16:42:04	2016-01-19 16:42:04
1235	363	4	Outdoor Branding	2016-01-19 16:42:04	2016-01-19 16:42:04
1236	363	7	P.A System	2016-01-19 16:42:04	2016-01-19 16:42:04
1237	364	1	Air time at Afri-radio only	2016-01-20 09:16:46	2016-01-20 09:16:46
1238	364	4	Outdoor Branding	2016-01-20 09:16:46	2016-01-20 09:16:46
1239	364	5	Sms broadcast with in Greater Banjul Areas	2016-01-20 09:16:46	2016-01-20 09:16:46
1240	364	6	Credits for Communication	2016-01-20 09:16:46	2016-01-20 09:16:46
1242	365	1	Air time at Afri-radio only	2016-01-20 10:33:51	2016-01-20 10:33:51
1243	365	4	Outdoor Branding	2016-01-20 10:33:52	2016-01-20 10:33:52
1244	365	5	Sms broadcast with in Greater Banjul Areas	2016-01-20 10:33:52	2016-01-20 10:33:52
1245	365	6	Credits for Communication	2016-01-20 10:33:52	2016-01-20 10:33:52
1246	365	7	P.A System+Rent+stage+Lights	2016-01-20 10:33:52	2016-01-20 10:33:52
1247	366	1	Air time at Afri-radio only	2016-01-21 15:34:27	2016-01-21 15:34:27
1248	366	4	Outdoor Branding	2016-01-21 15:34:27	2016-01-21 15:34:27
1249	366	5	Sms broadcast with in Greater Banjul Areas	2016-01-21 15:34:27	2016-01-21 15:34:27
1250	364	11	Description	2016-01-26 09:05:47	2016-01-26 09:05:47
1251	367	13	30 minutes Air time on Afri-radio 	2016-01-26 13:07:54	2016-01-26 13:07:54
1252	367	7	P.A System+Lights	2016-01-26 13:07:54	2016-01-26 13:07:54
1253	367	6	Credits for Communication	2016-01-26 13:07:54	2016-01-26 13:07:54
1254	367	5	Sms broadcast with in Greater Banjul Areas	2016-01-26 13:07:54	2016-01-26 13:07:54
1255	367	4	Outdoor Branding	2016-01-26 13:07:54	2016-01-26 13:07:54
1256	367	1	Air time at Afri-radio only	2016-01-26 13:07:54	2016-01-26 13:07:54
1257	368	1	Air time at Afri-radio and other radio stations	2016-01-26 13:15:10	2016-01-26 13:15:10
1258	368	13	30 minutes Air time on Afri-radio 	2016-01-26 13:15:10	2016-01-26 13:15:10
1259	368	7	P.A System+Lights	2016-01-26 13:15:10	2016-01-26 13:15:10
1260	368	6	Credits for Communication	2016-01-26 13:15:10	2016-01-26 13:15:10
1261	368	5	Sms broadcast with in Greater Banjul Areas	2016-01-26 13:15:10	2016-01-26 13:15:10
1262	368	4	Billboard	2016-01-26 13:15:10	2016-01-26 13:15:10
1263	369	13	30 minutes Air time on Afri-radio 	2016-01-26 13:29:25	2016-01-26 13:29:25
1264	369	6	Credits for Communication	2016-01-26 13:29:25	2016-01-26 13:29:25
1265	369	5	Sms broadcast with in Greater Banjul Areas	2016-01-26 13:29:25	2016-01-26 13:29:25
1266	369	4	Outdoor Branding	2016-01-26 13:29:25	2016-01-26 13:29:25
1267	369	1	Air time at Afri-radio and other radio stations	2016-01-26 13:29:25	2016-01-26 13:29:25
1268	370	4	Outdoor Branding	2016-01-26 13:41:46	2016-01-26 13:41:46
1269	370	1	Air time at Afri-radio and other radio stations	2016-01-26 13:41:46	2016-01-26 13:41:46
1270	370	13	30 minutes Air time on Afri-radio 	2016-01-26 13:41:47	2016-01-26 13:41:47
1271	370	6	Credits for Communication	2016-01-26 13:41:47	2016-01-26 13:41:47
1272	370	5	Sms broadcast with in Greater Banjul Areas	2016-01-26 13:41:47	2016-01-26 13:41:47
1273	371	6	Credits for Communication	2016-01-27 12:57:19	2016-01-27 12:57:19
1274	371	4	Outdoor Branding	2016-01-27 12:57:19	2016-01-27 12:57:19
1275	371	1	Air time at Afri-radio only	2016-01-27 12:57:19	2016-01-27 12:57:19
1276	371	13	30 minutes Air time on Afri-radio 	2016-01-27 12:57:19	2016-01-27 12:57:19
1277	372	4	Outdoor Branding	2016-01-27 13:41:24	2016-01-27 13:41:24
1278	372	1	Air time at Afri-radio only	2016-01-27 13:41:24	2016-01-27 13:41:24
1279	372	5	Sms broadcast with in Greater Banjul Areas	2016-01-27 13:41:24	2016-01-27 13:41:24
1280	372	6	Credits for Communication	2016-01-27 13:41:24	2016-01-27 13:41:24
1281	365	11	Description	2016-01-28 13:14:04	2016-01-28 13:14:04
1282	373	1	Air time at Afri-radio only	2016-01-28 13:31:54	2016-01-28 13:31:54
1283	373	2	Newspapers-Observer&Point	2016-01-28 13:31:54	2016-01-28 13:31:54
1284	373	4	Outdoor Branding	2016-01-28 13:31:54	2016-01-28 13:31:54
1285	373	5	Sms broadcast with in Greater Banjul Areas	2016-01-28 13:31:54	2016-01-28 13:31:54
1286	373	6	Credits for Communication	2016-01-28 13:31:54	2016-01-28 13:31:54
1287	373	7	P.A System+Lights	2016-01-28 13:31:54	2016-01-28 13:31:54
1288	373	13	30 minutes Air time on Afri-radio 	2016-01-28 13:31:54	2016-01-28 13:31:54
1289	374	4	Outdoor Branding	2016-01-28 15:30:42	2016-01-28 15:30:42
1290	374	6	Credits for Communication	2016-01-28 15:30:42	2016-01-28 15:30:42
1292	374	9	T-Shits for participants	2016-01-28 15:30:42	2016-01-28 15:30:42
1293	375	1	Air time at Afri-radio and other radio stations	2016-02-01 16:53:16	2016-02-01 16:53:16
1294	375	4	Outdoor Branding	2016-02-01 16:53:16	2016-02-01 16:53:16
1295	375	5	Sms broadcast with in Greater Banjul Areas	2016-02-01 16:53:16	2016-02-01 16:53:16
1296	375	6	Credits for Communication	2016-02-01 16:53:16	2016-02-01 16:53:16
1297	375	13	30 minutes Air time on Afri-radio 	2016-02-01 16:53:16	2016-02-01 16:53:16
1299	377	9	Description	2016-02-03 09:57:36	2016-02-03 09:57:36
1300	377	11	Description	2016-02-03 09:57:36	2016-02-03 09:57:36
1301	378	6	Credit and sim cards for participants	2016-02-03 10:09:19	2016-02-03 10:09:19
1302	379	5	Description	2016-02-03 10:15:23	2016-02-03 10:15:23
1303	379	9	Description	2016-02-03 10:15:23	2016-02-03 10:15:23
1304	380	1	Air time at Afri-radio only	2016-02-04 15:03:38	2016-02-04 15:03:38
1305	380	4	Outdoor Branding	2016-02-04 15:03:38	2016-02-04 15:03:38
1306	380	5	Sms broadcast with in Greater Banjul Areas	2016-02-04 15:03:38	2016-02-04 15:03:38
1307	381	1	Air time at Afri-radio and other radio stations	2016-02-04 16:01:00	2016-02-04 16:01:00
1308	381	4	Outdoor Branding	2016-02-04 16:01:00	2016-02-04 16:01:00
1309	381	5	Sms broadcast with in Greater Banjul Areas	2016-02-04 16:01:00	2016-02-04 16:01:00
1310	381	6	Credits for Communication	2016-02-04 16:01:00	2016-02-04 16:01:00
1311	381	7	Lights	2016-02-04 16:01:00	2016-02-04 16:01:00
1312	381	13	30 minutes Air time on Afri-radio 	2016-02-04 16:01:00	2016-02-04 16:01:00
1313	381	2	Description	2016-02-04 16:04:43	2016-02-04 16:04:43
1314	380	6	Description	2016-02-08 12:50:23	2016-02-08 12:50:23
1317	382	11	Cash for rental opf P.A System and Other Logistics	2016-02-08 15:37:56	2016-02-08 15:37:56
1319	383	5	Sms broadcast with in Greater Banjul Areas	2016-02-11 10:41:40	2016-02-11 10:41:40
1320	384	1	Air time at Afri-radio only	2016-02-17 15:40:58	2016-02-17 15:40:58
1321	384	4	Outdoor Branding	2016-02-17 15:40:58	2016-02-17 15:40:58
1323	384	6	Credits for Communication	2016-02-17 15:40:58	2016-02-17 15:40:58
1324	384	7	P.A System	2016-02-17 15:40:58	2016-02-17 15:40:58
1325	385	1	Air time at Afri-radio and other radio stations	2016-02-17 15:55:23	2016-02-17 15:55:23
1327	385	5	Sms broadcast with in Greater Banjul Areas	2016-02-17 15:55:23	2016-02-17 15:55:23
1328	385	6	Credits for Communication	2016-02-17 15:55:23	2016-02-17 15:55:23
1329	385	13	30 minutes Air time on Afri-radio 	2016-02-17 15:55:23	2016-02-17 15:55:23
1330	386	1	Air time at Afri-radio and other radio stations	2016-02-19 13:28:01	2016-02-19 13:28:01
1331	386	4	Outdoor Branding	2016-02-19 13:28:01	2016-02-19 13:28:01
1332	386	5	Sms broadcast with in Greater Banjul Areas	2016-02-19 13:28:01	2016-02-19 13:28:01
1333	386	6	Credits for Communication	2016-02-19 13:28:01	2016-02-19 13:28:01
1334	386	7	P.A System+Lights	2016-02-19 13:28:01	2016-02-19 13:28:01
1335	386	11	Cash for logistics	2016-02-19 13:28:01	2016-02-19 13:28:01
1336	386	13	30 minutes Air time on Afri-radio 	2016-02-19 13:28:01	2016-02-19 13:28:01
1337	387	7	P.A System & Tents	2016-02-29 14:15:33	2016-02-29 14:15:33
1338	387	5	20000 Subscribers	2016-02-29 14:15:34	2016-02-29 14:15:34
1339	387	4	Backdrop	2016-02-29 14:15:34	2016-02-29 14:15:34
1340	388	1	On Afri-Radio 	2016-02-29 15:01:21	2016-02-29 15:01:21
1341	388	4	Outdoor branding	2016-02-29 15:01:21	2016-02-29 15:01:21
1342	388	6	For Communication	2016-02-29 15:01:21	2016-02-29 15:01:21
1343	389	1	On Afri-Radio 	2016-02-29 16:52:22	2016-02-29 16:52:22
1344	389	4	Outdoor branding	2016-02-29 16:52:22	2016-02-29 16:52:22
1345	389	5	10,000 Subscribers	2016-02-29 16:52:22	2016-02-29 16:52:22
1346	389	6	For Communication	2016-02-29 16:52:22	2016-02-29 16:52:22
1347	390	1	On Afri-Radio 	2016-02-29 17:57:04	2016-02-29 17:57:04
1348	390	4	Outdoor branding	2016-02-29 17:57:05	2016-02-29 17:57:05
1349	390	5	10,000 Subscribers	2016-02-29 17:57:05	2016-02-29 17:57:05
1350	390	6	For Communication	2016-02-29 17:57:05	2016-02-29 17:57:05
1351	390	7	P.A System	2016-02-29 17:57:05	2016-02-29 17:57:05
1352	368	11	Description	2016-03-07 14:03:05	2016-03-07 14:03:05
1353	391	1	Air time at Afri-radio only	2016-03-09 09:42:24	2016-03-09 09:42:24
1355	391	6	Credits for Communication	2016-03-09 09:42:24	2016-03-09 09:42:24
1356	391	7	P.A System	2016-03-09 09:42:25	2016-03-09 09:42:25
1358	391	11	Cash for logistics-Refreshment guest, rental for tents,chairs.	2016-03-09 09:42:25	2016-03-09 09:42:25
1359	392	4	Outdoor branding	2016-03-14 13:17:22	2016-03-14 13:17:22
1360	392	5	30,000 Subscribers	2016-03-14 13:17:22	2016-03-14 13:17:22
1361	392	11	For printing of shirts	2016-03-14 13:17:22	2016-03-14 13:17:22
1362	393	1	On Afri-Radio 	2016-03-14 13:37:13	2016-03-14 13:37:13
1363	393	7	TV Screen for outdoor viewing	2016-03-14 13:37:13	2016-03-14 13:37:13
1364	394	1	On Afri-Radio 	2016-03-14 13:55:19	2016-03-14 13:55:19
1365	394	5	10,000 Subscribers	2016-03-14 13:55:19	2016-03-14 13:55:19
1366	394	6	For Communication	2016-03-14 13:55:19	2016-03-14 13:55:19
1367	395	7	Stage & P.A system	2016-03-14 14:05:20	2016-03-14 14:05:20
1368	396	1	On Afri-Radio 	2016-03-14 14:44:33	2016-03-14 14:44:33
1369	396	6	For Communication	2016-03-14 14:44:33	2016-03-14 14:44:33
1370	396	7	Stage Only	2016-03-14 14:44:33	2016-03-14 14:44:33
1371	397	1	Air time at Afri-radio only	2016-03-15 10:36:46	2016-03-15 10:36:46
1372	397	5	Sms broadcast with in Galloya,Makumbaya,and Kunkujang ketaya	2016-03-15 10:36:46	2016-03-15 10:36:46
1373	397	6	Credits for Communication	2016-03-15 10:36:46	2016-03-15 10:36:46
1374	398	1	On Afri-Radio 	2016-03-16 17:50:36	2016-03-16 17:50:36
1375	398	4	Outdoor branding	2016-03-16 17:50:36	2016-03-16 17:50:36
1376	398	5	10,000 Subscribers	2016-03-16 17:50:36	2016-03-16 17:50:36
1377	398	6	Comunication	2016-03-16 17:50:36	2016-03-16 17:50:36
1378	398	7	P.A System 	2016-03-16 17:50:36	2016-03-16 17:50:36
1379	398	13	On Afri-Radio 	2016-03-16 17:50:36	2016-03-16 17:50:36
1380	399	1	On Afri-Radio 	2016-03-21 13:34:18	2016-03-21 13:34:18
1381	399	5	5000 Subscribers	2016-03-21 13:34:18	2016-03-21 13:34:18
1382	399	6	For communication	2016-03-21 13:34:18	2016-03-21 13:34:18
1383	400	1	On Afri-Radio & Other Radios	2016-03-21 14:39:15	2016-03-21 14:39:15
1384	400	2	3 slots	2016-03-21 14:39:15	2016-03-21 14:39:15
1385	400	4	Outdoor branding	2016-03-21 14:39:16	2016-03-21 14:39:16
1386	400	5	200,000 Subscribers	2016-03-21 14:39:16	2016-03-21 14:39:16
1387	400	6	For Communication	2016-03-21 14:39:16	2016-03-21 14:39:16
1388	400	11	For Poster, Fliers & T-shirts	2016-03-21 14:39:16	2016-03-21 14:39:16
1389	400	13	On Afri-Radio 	2016-03-21 14:39:16	2016-03-21 14:39:16
1390	401	6	School Sim	2016-03-23 15:46:26	2016-03-23 15:46:26
1391	401	11	5000 dalasis	2016-03-23 15:46:26	2016-03-23 15:46:26
1392	402	5	10,000 Subscribers	2016-04-01 16:11:43	2016-04-01 16:11:43
1393	402	1	On Afri-Radio 	2016-04-01 16:11:43	2016-04-01 16:11:43
1394	402	6	For Communication	2016-04-01 16:11:43	2016-04-01 16:11:43
1395	402	13	On Afri-Radio & Other Radios	2016-04-01 16:11:43	2016-04-01 16:11:43
1396	403	1	On Afri-Radio & Other Radios	2016-04-01 16:18:46	2016-04-01 16:18:46
1397	403	2	News Paper Ad	2016-04-01 16:18:46	2016-04-01 16:18:46
1398	403	4	Outdoor branding	2016-04-01 16:18:46	2016-04-01 16:18:46
1399	403	5	20,000 Subscribers	2016-04-01 16:18:46	2016-04-01 16:18:46
1400	403	6	For Communication	2016-04-01 16:18:46	2016-04-01 16:18:46
1401	403	7	P.A System & Lights	2016-04-01 16:18:46	2016-04-01 16:18:46
1402	403	13	On Afri-Radio 	2016-04-01 16:18:46	2016-04-01 16:18:46
1403	404	1	On Afri-Radio 	2016-04-01 16:23:37	2016-04-01 16:23:37
1404	404	7	P.A System & Stage	2016-04-01 16:23:37	2016-04-01 16:23:37
1405	404	13	On Afri-Radio 	2016-04-01 16:23:37	2016-04-01 16:23:37
1406	404	6	Description	2016-04-01 16:24:05	2016-04-01 16:24:05
1407	405	1	On Afri-Radio & Other Radios	2016-04-04 15:09:18	2016-04-04 15:09:18
1408	405	2	News Paper adverts	2016-04-04 15:09:18	2016-04-04 15:09:18
1409	405	5	20,000 Subscribers	2016-04-04 15:09:18	2016-04-04 15:09:18
1410	405	6	For Communication	2016-04-04 15:09:18	2016-04-04 15:09:18
1411	405	7	P.A System 	2016-04-04 15:09:18	2016-04-04 15:09:18
1412	405	11	For Logistics	2016-04-04 15:09:18	2016-04-04 15:09:18
1413	405	13	On Afri-Radio 	2016-04-04 15:09:18	2016-04-04 15:09:18
1414	406	1	On Afri-Radio 	2016-04-04 15:27:05	2016-04-04 15:27:05
1415	406	5	10,000 Subscribers	2016-04-04 15:27:05	2016-04-04 15:27:05
1416	406	6	For Communication	2016-04-04 15:27:05	2016-04-04 15:27:05
1417	403	11	Description	2016-04-04 15:47:02	2016-04-04 15:47:02
1418	407	1	On Afri-Radio & Other Radios	2016-04-12 11:34:28	2016-04-12 11:34:28
1419	407	5	10,000 Subscribers	2016-04-12 11:34:28	2016-04-12 11:34:28
1420	407	6	For Communication	2016-04-12 11:34:28	2016-04-12 11:34:28
1421	407	7	P.A System 	2016-04-12 11:34:28	2016-04-12 11:34:28
1422	407	13	On Afri-Radio 	2016-04-12 11:34:28	2016-04-12 11:34:28
1423	408	1	On Afri-Radio 	2016-04-12 11:52:52	2016-04-12 11:52:52
1424	408	5	10,000 Subscribers	2016-04-12 11:52:52	2016-04-12 11:52:52
1425	408	6	For Communication	2016-04-12 11:52:52	2016-04-12 11:52:52
1426	408	7	P.A System 	2016-04-12 11:52:52	2016-04-12 11:52:52
1427	408	13	On Afri-Radio 	2016-04-12 11:52:52	2016-04-12 11:52:52
1428	409	1	On Afri-Radio 	2016-04-12 12:08:08	2016-04-12 12:08:08
1429	409	4	Outdoor branding	2016-04-12 12:08:08	2016-04-12 12:08:08
1430	409	5	100,000 Subscribers	2016-04-12 12:08:08	2016-04-12 12:08:08
1431	409	6	For Communication	2016-04-12 12:08:08	2016-04-12 12:08:08
1432	409	13	On Afri-Radio 	2016-04-12 12:08:08	2016-04-12 12:08:08
1433	410	1	On Afri-Radio 	2016-04-12 12:17:22	2016-04-12 12:17:22
1434	410	5	10,000 Subscribers	2016-04-12 12:17:22	2016-04-12 12:17:22
1435	410	6	For Communication	2016-04-12 12:17:22	2016-04-12 12:17:22
1436	410	13	On Afri-Radio 	2016-04-12 12:17:22	2016-04-12 12:17:22
1437	411	10	Umbrellas	2016-04-12 12:20:45	2016-04-12 12:20:45
1438	411	11	For Transportation	2016-04-12 12:20:45	2016-04-12 12:20:45
1439	412	1	On Afri-Radio 	2016-04-12 13:33:18	2016-04-12 13:33:18
1440	412	5	10,000 Subscribers	2016-04-12 13:33:18	2016-04-12 13:33:18
1441	412	6	For Communication	2016-04-12 13:33:18	2016-04-12 13:33:18
1442	412	7	Stage 	2016-04-12 13:33:18	2016-04-12 13:33:18
1443	413	4	Back Drop	2016-04-27 11:44:51	2016-04-27 11:44:51
1444	413	7	Stage 	2016-04-27 11:44:51	2016-04-27 11:44:51
1445	413	11	Rental of P.A system	2016-04-27 11:44:51	2016-04-27 11:44:51
1446	414	4	Outdoor branding	2016-04-29 10:16:39	2016-04-29 10:16:39
1447	414	11	For T-shirts	2016-04-29 10:16:39	2016-04-29 10:16:39
1448	415	1	On Afri-Radio & Other Radios	2016-05-03 10:25:29	2016-05-03 10:25:29
1449	415	4	Outdoor branding	2016-05-03 10:25:29	2016-05-03 10:25:29
1450	415	5	10,000 Subscribers	2016-05-03 10:25:29	2016-05-03 10:25:29
1451	415	6	For Communication	2016-05-03 10:25:29	2016-05-03 10:25:29
1452	416	7	P.A System+Tents	2016-05-04 10:36:10	2016-05-04 10:36:10
1453	416	11	Cash greasy poles final winner and cost of pole	2016-05-04 10:36:10	2016-05-04 10:36:10
1454	417	1	Air time at Afri-radio only	2016-05-04 10:54:19	2016-05-04 10:54:19
1455	417	5	Sms broadcast with in Greater Banjul Areas	2016-05-04 10:54:19	2016-05-04 10:54:19
1456	417	10	mobile phone gift	2016-05-04 10:54:19	2016-05-04 10:54:19
1457	418	1	Air time at Afri-radio and other radio stations	2016-05-04 12:50:09	2016-05-04 12:50:09
1458	418	4	Outdoor Branding	2016-05-04 12:50:09	2016-05-04 12:50:09
1459	418	5	Sms broadcast with in Greater Banjul Areas	2016-05-04 12:50:09	2016-05-04 12:50:09
1460	418	6	Credits for Communication	2016-05-04 12:50:09	2016-05-04 12:50:09
1461	418	7	P.A System+Tents	2016-05-04 12:50:09	2016-05-04 12:50:09
1462	418	13	30 minutes Air time on Afri-radio 	2016-05-04 12:50:09	2016-05-04 12:50:09
1463	419	1	Air time at Afri-radio and other radio stations	2016-05-04 12:58:06	2016-05-04 12:58:06
1464	419	4	Outdoor Branding	2016-05-04 12:58:06	2016-05-04 12:58:06
1465	419	5	Sms broadcast with in Greater Banjul Areas	2016-05-04 12:58:07	2016-05-04 12:58:07
1466	419	6	Credits for Communication	2016-05-04 12:58:07	2016-05-04 12:58:07
1468	419	13	30 minutes Air time on Afri-radio 	2016-05-04 12:58:07	2016-05-04 12:58:07
1469	420	1	Description	2016-05-05 09:43:56	2016-05-05 09:43:56
1470	420	5	Description	2016-05-05 09:45:04	2016-05-05 09:45:04
1471	420	4	Description	2016-05-05 09:51:47	2016-05-05 09:51:47
1472	420	7	Description	2016-05-05 09:52:25	2016-05-05 09:52:25
1473	420	6	Description	2016-05-05 09:53:15	2016-05-05 09:53:15
1475	422	11	Description	2016-05-06 09:25:41	2016-05-06 09:25:41
1476	423	11	Description	2016-05-06 09:27:19	2016-05-06 09:27:19
1477	424	6	Credits for Communication	2016-05-06 09:42:10	2016-05-06 09:42:10
1478	424	10	Mobile phones as gift	2016-05-06 09:42:10	2016-05-06 09:42:10
1482	426	1	Air time at Afri-radio and other radio stations	2016-05-06 10:08:21	2016-05-06 10:08:21
1483	426	4	Outdoor Branding	2016-05-06 10:08:21	2016-05-06 10:08:21
1484	426	5	Sms broadcast with in Greater Banjul Areas	2016-05-06 10:08:21	2016-05-06 10:08:21
1485	426	6	Credits for Communication	2016-05-06 10:08:21	2016-05-06 10:08:21
1486	426	13	30 minutes Air time on Afri-radio 	2016-05-06 10:08:21	2016-05-06 10:08:21
1487	427	1	Air time at Afri-radio and other radio stations	2016-05-06 10:56:46	2016-05-06 10:56:46
1488	427	2	Newspaper	2016-05-06 10:56:46	2016-05-06 10:56:46
1489	427	4	Outdoor Branding	2016-05-06 10:56:46	2016-05-06 10:56:46
1490	427	5	Sms broadcast with in Greater Banjul Areas	2016-05-06 10:56:47	2016-05-06 10:56:47
1491	427	6	Credits for Communication	2016-05-06 10:56:47	2016-05-06 10:56:47
1492	427	7	Lights	2016-05-06 10:56:47	2016-05-06 10:56:47
1493	427	13	30 minutes Air time on Afri-radio 	2016-05-06 10:56:47	2016-05-06 10:56:47
1494	427	14	Outdoor Branding	2016-05-06 10:56:47	2016-05-06 10:56:47
1495	428	1	Air time at Afri-radio only	2016-05-06 12:07:05	2016-05-06 12:07:05
1496	428	4	Outdoor Branding	2016-05-06 12:07:05	2016-05-06 12:07:05
1497	428	5	Sms broadcast with in Greater Banjul Areas	2016-05-06 12:07:05	2016-05-06 12:07:05
1504	430	4	Outdoor Branding	2016-05-10 11:39:33	2016-05-10 11:39:33
1505	430	6	Credits for Winners	2016-05-10 11:39:33	2016-05-10 11:39:33
1506	430	7	P.A System	2016-05-10 11:39:33	2016-05-10 11:39:33
1507	431	4	Outdoor Branding	2016-05-10 11:45:35	2016-05-10 11:45:35
1508	431	7	P.A System	2016-05-10 11:45:36	2016-05-10 11:45:36
1509	432	1	Air time at Afri-radio only	2016-05-10 11:53:47	2016-05-10 11:53:47
1510	432	4	Outdoor Branding	2016-05-10 11:53:47	2016-05-10 11:53:47
1511	432	6	Credits for Communication	2016-05-10 11:53:47	2016-05-10 11:53:47
1517	434	1	Air time at Afri-radio only	2016-05-10 12:09:28	2016-05-10 12:09:28
1518	434	4	Outdoor Branding	2016-05-10 12:09:28	2016-05-10 12:09:28
1519	434	5	Sms broadcast with in Greater Banjul Areas	2016-05-10 12:09:28	2016-05-10 12:09:28
1520	435	13	30 minutes Air time on Afri-radio 	2016-05-10 12:19:39	2016-05-10 12:19:39
1521	435	6	Credits for Communication	2016-05-10 12:19:39	2016-05-10 12:19:39
1522	435	5	Sms broadcast with in Greater Banjul Areas	2016-05-10 12:19:39	2016-05-10 12:19:39
1523	435	4	Outdoor Branding	2016-05-10 12:19:39	2016-05-10 12:19:39
1524	435	1	Air time at Afri-radio and other radio stations	2016-05-10 12:19:39	2016-05-10 12:19:39
1525	436	4	Outdoor Branding	2016-05-10 12:26:35	2016-05-10 12:26:35
1526	436	1	Air time at Afri-radio only	2016-05-10 12:26:35	2016-05-10 12:26:35
1527	436	5	Sms broadcast with in Greater Banjul Areas	2016-05-10 12:26:35	2016-05-10 12:26:35
1528	436	6	Credits for Communication	2016-05-10 12:26:35	2016-05-10 12:26:35
1529	436	7	P.A System	2016-05-10 12:26:35	2016-05-10 12:26:35
1530	437	4	Outdoor Branding	2016-05-13 09:59:24	2016-05-13 09:59:24
1531	437	1	Air time at Afri-radio and other radio stations	2016-05-13 09:59:24	2016-05-13 09:59:24
1532	437	6	Credits for Communication	2016-05-13 09:59:24	2016-05-13 09:59:24
1533	438	4	Outdoor Branding	2016-05-13 12:39:29	2016-05-13 12:39:29
1534	439	1	Air time at Afri-radio only	2016-05-13 12:43:53	2016-05-13 12:43:53
1535	439	4	Outdoor Branding	2016-05-13 12:43:53	2016-05-13 12:43:53
1536	440	11	Description	2016-05-18 15:59:55	2016-05-18 15:59:55
1537	440	1	Description	2016-05-18 16:06:47	2016-05-18 16:06:47
1538	440	4	Description	2016-05-18 16:08:36	2016-05-18 16:08:36
1539	440	5	Description	2016-05-18 16:11:21	2016-05-18 16:11:21
1540	440	6	Description	2016-05-18 16:14:03	2016-05-18 16:14:03
1541	441	4	Outdoor branding	2016-05-18 16:22:48	2016-05-18 16:22:48
1542	441	5	20,000 Subscribers	2016-05-18 16:22:48	2016-05-18 16:22:48
1543	441	6	For Communication	2016-05-18 16:22:48	2016-05-18 16:22:48
1544	441	7	TV Screens	2016-05-18 16:22:48	2016-05-18 16:22:48
1545	441	11	D750,000	2016-05-18 16:22:48	2016-05-18 16:22:48
1546	442	7	Tents for congress	2016-05-26 10:49:09	2016-05-26 10:49:09
1547	443	6	Credits for Communication	2016-05-30 10:08:43	2016-05-30 10:08:43
1548	443	5	Sms broadcast with in Greater Banjul Areas	2016-05-30 10:08:43	2016-05-30 10:08:43
1549	443	4	Outdoor Branding	2016-05-30 10:08:43	2016-05-30 10:08:43
1550	443	1	Air time at Afri-radio only	2016-05-30 10:08:43	2016-05-30 10:08:43
1551	444	1	Air time at Afri-radio and other radio stations	2016-06-20 11:25:22	2016-06-20 11:25:22
1552	444	4	Outdoor Branding	2016-06-20 11:25:22	2016-06-20 11:25:22
1553	444	5	Sms broadcast with in Greater Banjul Areas	2016-06-20 11:25:22	2016-06-20 11:25:22
1554	444	6	Credits for Communication	2016-06-20 11:25:22	2016-06-20 11:25:22
1555	444	7	P.A System+stage+Lights	2016-06-20 11:25:22	2016-06-20 11:25:22
1556	444	11	Credits for Communication	2016-06-20 11:25:22	2016-06-20 11:25:22
1557	444	13	30 minutes Air time on Afri-radio 	2016-06-20 11:25:22	2016-06-20 11:25:22
1558	445	4	Outdoor Branding	2016-06-22 13:34:39	2016-06-22 13:34:39
1559	445	5	Sms broadcast with in Greater Banjul Areas	2016-06-22 13:34:39	2016-06-22 13:34:39
1560	445	9	T-Shits for participants	2016-06-22 13:34:39	2016-06-22 13:34:39
1564	447	1	Air time at Afri-radio only	2016-07-05 11:37:42	2016-07-05 11:37:42
1565	447	4	Outdoor Branding	2016-07-05 11:37:42	2016-07-05 11:37:42
1566	444	2	Description	2016-07-11 11:51:16	2016-07-11 11:51:16
1567	448	5	Sms broadcast with in Greater Banjul Areas	2016-07-11 12:42:30	2016-07-11 12:42:30
1568	448	4	Outdoor Branding	2016-07-11 12:42:30	2016-07-11 12:42:30
1569	448	1	Air time at Afri-radio only	2016-07-11 12:42:30	2016-07-11 12:42:30
1570	448	6	Description	2016-07-13 12:59:31	2016-07-13 12:59:31
1571	449	4	Outdoor Branding	2016-07-18 12:38:01	2016-07-18 12:38:01
1572	450	4	Outdoor Branding	2016-07-18 12:42:41	2016-07-18 12:42:41
1573	451	11	Cash for tour&Bus Branding	2016-07-18 12:46:13	2016-07-18 12:46:13
1574	452	4	Outdoor Branding	2016-07-19 10:59:31	2016-07-19 10:59:31
1575	452	6	Credits for Communication	2016-07-19 10:59:31	2016-07-19 10:59:31
1577	7	11	Description	2016-07-19 11:02:23	2016-07-19 11:02:23
1578	452	11	Description	2016-07-19 11:02:43	2016-07-19 11:02:43
1579	453	5	Sms broadcast with in Greater Banjul Areas	2016-07-20 10:54:39	2016-07-20 10:54:39
1580	454	1	Air time at Afri-radio only	2016-07-20 11:04:53	2016-07-20 11:04:53
1581	454	2	Newspaper advert Publicy	2016-07-20 11:04:53	2016-07-20 11:04:53
1582	454	5	Sms broadcast with in Greater Banjul Areas	2016-07-20 11:04:53	2016-07-20 11:04:53
1583	454	6	Credits for Communication	2016-07-20 11:04:53	2016-07-20 11:04:53
1584	455	1	Air time at Afri-radio only	2016-07-20 11:23:10	2016-07-20 11:23:10
1585	455	4	Outdoor Branding	2016-07-20 11:23:10	2016-07-20 11:23:10
1586	455	13	30 minutes Air time on Afri-radio 	2016-07-20 11:23:10	2016-07-20 11:23:10
1587	456	5	Sms broadcast with in Greater Banjul Areas	2016-07-21 15:11:33	2016-07-21 15:11:33
1588	454	4	Description	2016-07-25 13:29:22	2016-07-25 13:29:22
1589	457	4	Outdoor Branding	2016-07-25 14:25:01	2016-07-25 14:25:01
1590	46	6	\N	2016-03-20 00:00:00	2016-03-20 00:00:00
1591	79	1	\N	2016-03-20 00:00:00	2016-03-20 00:00:00
1592	79	4	\N	2016-03-20 00:00:00	2016-03-20 00:00:00
1593	79	5	\N	2016-03-20 00:00:00	2016-03-20 00:00:00
1594	79	6	\N	2016-03-20 00:00:00	2016-03-20 00:00:00
1595	92	1	\N	2016-03-20 00:00:00	2016-03-20 00:00:00
1596	111	5	\N	2016-03-20 00:00:00	2016-03-20 00:00:00
1597	266	7	\N	2016-03-20 00:00:00	2016-03-20 00:00:00
1599	334	4	\N	2016-03-20 00:00:00	2016-03-20 00:00:00
1600	334	5	\N	2016-03-20 00:00:00	2016-03-20 00:00:00
1601	334	6	\N	2016-03-20 00:00:00	2016-03-20 00:00:00
1602	334	11	\N	2016-03-20 00:00:00	2016-03-20 00:00:00
1603	359	1	\N	2016-03-20 00:00:00	2016-03-20 00:00:00
1604	359	4	\N	2016-03-20 00:00:00	2016-03-20 00:00:00
1605	359	5	\N	2016-03-20 00:00:00	2016-03-20 00:00:00
1606	359	6	\N	2016-03-20 00:00:00	2016-03-20 00:00:00
1	1	1	Advert at Afriradio	2017-03-21 21:08:04.282054	2017-03-21 21:08:34.298944
2	1	4	\N	2017-03-21 21:09:00.831469	2017-03-21 21:09:00.831469
\.


--
-- TOC entry 2261 (class 0 OID 0)
-- Dependencies: 190
-- Name: event_item_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('event_item_types_id_seq', 3, true);


--
-- TOC entry 2229 (class 0 OID 16429)
-- Dependencies: 193
-- Data for Name: event_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY event_items (id, event_id, item_id, quantity, days, cost1_per_unit, cost2_per_unit, cost3_per_unit, width, height, created_at, updated_at) FROM stdin;
11	7	16	1	1	500.00	0.00	0.00	3	1	2014-03-18 13:15:46	2014-03-18 13:25:20
9	7	4	10	15	75.00	0.00	0.00	1	1	2014-03-18 13:15:46	2014-03-18 13:25:19
10	7	8	1	1	500.00	0.00	0.00	3	2	2014-03-18 13:15:46	2014-03-18 13:25:19
12	7	9	20000	1	0.50	0.00	0.00	1	1	2014-03-18 13:15:46	2014-03-18 13:25:20
13	7	10	2000	1	1.00	0.00	0.00	1	1	2014-03-18 13:15:46	2014-03-18 13:25:20
14	7	12	1	4	20000.00	0.00	0.00	1	1	2014-03-18 13:15:46	2014-03-18 13:47:09
15	8	11	20	1	10.00	0.00	0.00	1	1	2014-03-18 15:24:19	2014-03-18 15:24:52
16	8	14	10	1	125.00	0.00	0.00	1	1	2014-03-18 15:24:19	2014-03-18 15:24:52
17	8	19	10	1	320.00	0.00	0.00	1	1	2014-03-18 15:33:01	2014-03-18 15:33:01
18	8	20	10	1	200.00	0.00	0.00	1	1	2014-03-18 15:33:18	2014-03-18 15:35:20
19	8	21	5	1	250.00	0.00	0.00	1	1	2014-03-18 15:34:05	2014-03-18 15:34:05
20	9	8	1	1	500.00	0.00	0.00	3	2	2014-03-19 16:04:01	2014-03-19 16:04:49
21	9	10	1000	2	1.00	0.00	0.00	1	1	2014-03-19 16:04:01	2014-03-19 16:05:45
22	9	12	2	1	20000.00	0.00	0.00	1	1	2014-03-19 16:04:01	2014-04-09 15:57:00
23	10	4	10	15	75.00	0.00	0.00	1	1	2014-03-19 16:14:29	2014-03-19 16:18:32
24	10	5	1	2	3750.00	0.00	0.00	1	1	2014-03-19 16:14:29	2014-03-19 16:18:33
25	10	8	1	1	500.00	0.00	0.00	3	2	2014-03-19 16:14:29	2014-03-19 16:18:33
26	10	16	1	1	500.00	0.00	0.00	3	1	2014-03-19 16:14:29	2014-03-19 16:18:33
27	10	9	20000	1	0.50	0.00	0.00	1	1	2014-03-19 16:14:29	2014-03-19 16:18:33
28	10	10	3000	1	1.00	0.00	0.00	1	1	2014-03-19 16:14:29	2014-03-19 16:18:33
29	10	12	1	1	20000.00	0.00	0.00	1	1	2014-03-19 16:14:29	2014-03-19 16:18:33
30	10	13	150	1	500.00	0.00	0.00	0.5	0.25	2014-03-19 16:29:35	2014-03-19 17:18:47
32	11	4	7	10	75.00	0.00	0.00	1	1	2014-03-25 11:00:16	2014-03-25 11:01:54
33	11	8	1	1	500.00	0.00	0.00	3	2	2014-03-25 11:00:16	2014-03-25 11:01:54
34	11	16	1	1	500.00	0.00	0.00	3	1	2014-03-25 11:00:16	2014-03-25 11:01:54
35	11	10	1000	1	1.00	0.00	0.00	1	1	2014-03-25 11:00:16	2014-03-25 11:01:54
36	11	12	1	1	20000.00	0.00	0.00	1	1	2014-03-25 11:00:16	2014-03-25 11:01:54
37	12	4	6	15	75.00	0.00	0.00	1	1	2014-03-25 11:25:48	2014-03-25 11:27:38
38	12	8	1	1	500.00	0.00	0.00	3	2	2014-03-25 11:25:48	2014-03-25 11:27:38
39	12	16	1	1	500.00	0.00	0.00	3	1	2014-03-25 11:25:48	2014-03-25 11:27:38
40	12	10	1000	1	1.00	0.00	0.00	1	1	2014-03-25 11:25:48	2014-03-25 11:27:38
41	13	8	1	1	500.00	0.00	0.00	3	2	2014-03-25 11:42:23	2014-03-25 11:44:10
42	13	16	1	1	500.00	0.00	0.00	3	1	2014-03-25 11:42:23	2014-03-25 11:43:56
43	13	9	1	1	0.50	0.00	0.00	1	1	2014-03-25 11:42:23	2014-03-25 11:43:56
44	13	10	1000	1	1.00	0.00	0.00	1	1	2014-03-25 11:42:24	2014-03-25 11:43:56
45	13	4	8	15	75.00	0.00	0.00	1	1	2014-03-25 11:44:31	2014-03-25 11:44:31
46	14	4	10	15	75.00	0.00	0.00	1	1	2014-03-25 12:18:21	2014-03-25 12:23:41
47	14	8	1	1	500.00	0.00	0.00	3	2	2014-03-25 12:18:21	2014-03-25 12:23:41
48	14	16	2	1	500.00	0.00	0.00	3	1	2014-03-25 12:18:21	2014-03-25 12:23:41
49	14	9	10000	1	0.50	0.00	0.00	1	1	2014-03-25 12:18:21	2014-03-25 12:23:41
50	14	10	2000	1	1.00	0.00	0.00	1	1	2014-03-25 12:18:21	2014-03-25 12:23:41
51	14	11	200	1	10.00	0.00	0.00	1	1	2014-03-25 12:18:21	2014-03-25 12:23:41
52	15	4	6	31	75.00	0.00	0.00	1	1	2014-03-27 17:03:25	2014-03-27 17:05:56
53	7	23	150	1	500.00	0.00	0.00	0.150000006	0.300000012	2014-03-28 13:14:55	2014-03-28 13:14:55
54	7	24	150	1	500.00	0.00	0.00	0.600000024	0.419999987	2014-03-28 13:15:11	2014-03-28 13:15:11
55	16	12	1	1	20000.00	0.00	0.00	1	1	2014-03-28 13:45:21	2014-03-28 13:45:40
56	16	14	20	1	125.00	0.00	0.00	1	1	2014-03-28 13:45:21	2014-03-28 13:45:40
57	17	8	1	1	500.00	0.00	0.00	3	2	2014-03-31 12:41:56	2014-03-31 12:42:53
58	17	16	3	1	500.00	0.00	0.00	3	1	2014-03-31 12:41:56	2014-03-31 12:42:53
59	17	9	10000	1	0.50	0.00	0.00	1	1	2014-03-31 12:41:56	2014-03-31 12:42:53
60	17	10	2000	1	1.00	0.00	0.00	1	1	2014-03-31 12:41:56	2014-03-31 12:42:53
61	18	1	4	15	75.00	0.00	0.00	1	1	2014-04-01 12:37:50	2014-04-01 12:44:49
62	18	4	8	15	75.00	0.00	0.00	1	1	2014-04-01 12:37:50	2014-04-01 12:44:49
63	18	8	1	1	500.00	0.00	0.00	3	2	2014-04-01 12:37:50	2014-04-01 12:44:49
64	18	16	1	1	500.00	0.00	0.00	3	1	2014-04-01 12:37:50	2014-04-01 12:44:49
65	18	9	10000	1	0.50	0.00	0.00	1	1	2014-04-01 12:37:50	2014-04-01 12:44:49
66	18	10	1000	1	1.00	0.00	0.00	1	1	2014-04-01 12:37:50	2014-04-01 12:44:49
67	19	8	1	1	500.00	0.00	0.00	3	2	2014-04-01 15:40:19	2014-04-01 15:41:38
68	19	16	2	1	500.00	0.00	0.00	3	1	2014-04-01 15:40:19	2014-04-01 15:41:38
69	19	10	1000	1	1.00	0.00	0.00	1	1	2014-04-01 15:40:19	2014-04-01 15:41:38
70	19	4	10	15	75.00	0.00	0.00	1	1	2014-04-01 15:42:38	2014-04-01 15:42:38
71	19	25	1	1	10000.00	0.00	0.00	1	1	2014-04-01 15:43:04	2014-04-01 15:43:04
72	20	4	6	4	75.00	0.00	0.00	1	1	2014-04-01 16:34:04	2014-04-01 16:34:35
73	21	4	6	15	75.00	0.00	0.00	1	1	2014-04-01 16:52:13	2014-04-01 16:52:36
74	21	8	1	1	500.00	0.00	0.00	3	2	2014-04-01 16:52:14	2014-04-01 16:52:36
75	21	16	1	1	500.00	0.00	0.00	3	1	2014-04-01 16:52:14	2014-04-01 16:52:36
284	55	5	1	1	3750.00	0.00	0.00	1	1	2014-05-07 15:02:00	2014-05-07 15:03:28
283	55	4	10	15	75.00	0.00	0.00	1	1	2014-05-07 15:02:00	2014-05-07 15:03:28
259	46	10	5000	1	1.00	0.00	0.00	1	1	2014-04-29 15:52:34	2014-04-29 15:52:34
258	51	12	1	1	20000.00	0.00	0.00	1	1	2014-04-29 14:45:45	2014-04-29 14:45:45
257	51	10	2000	1	1.00	0.00	0.00	1	1	2014-04-29 13:44:16	2014-04-29 13:44:16
81	24	1	4	15	75.00	0.00	0.00	1	1	2014-04-04 12:16:14	2014-04-04 12:18:09
82	24	2	4	15	75.00	0.00	0.00	1	1	2014-04-04 12:16:14	2014-04-04 12:18:09
83	24	3	4	15	75.00	0.00	0.00	1	1	2014-04-04 12:16:14	2014-04-04 12:18:09
84	24	4	10	15	75.00	0.00	0.00	1	1	2014-04-04 12:16:15	2014-04-04 12:18:09
85	24	8	1	1	500.00	0.00	0.00	3	2	2014-04-04 12:16:15	2014-04-04 12:18:09
86	24	16	2	1	500.00	0.00	0.00	3	1	2014-04-04 12:16:15	2014-04-04 12:18:09
87	24	9	10000	1	0.50	0.00	0.00	1	1	2014-04-04 12:16:15	2014-04-04 12:18:09
88	24	10	2000	1	1.00	0.00	0.00	1	1	2014-04-04 12:16:15	2014-04-04 12:18:09
89	25	1	4	15	75.00	0.00	0.00	1	1	2014-04-04 15:02:15	2014-04-04 15:04:00
90	25	2	4	15	75.00	0.00	0.00	1	1	2014-04-04 15:02:15	2014-04-04 15:04:00
91	25	3	4	15	75.00	0.00	0.00	1	1	2014-04-04 15:02:15	2014-04-04 15:04:01
92	25	4	8	15	75.00	0.00	0.00	1	1	2014-04-04 15:02:15	2014-04-04 15:04:01
93	25	8	1	1	500.00	0.00	0.00	3	2	2014-04-04 15:02:15	2014-04-04 15:04:01
94	25	16	2	1	500.00	0.00	0.00	3	1	2014-04-04 15:02:15	2014-04-04 15:04:01
95	25	9	20000	1	0.50	0.00	0.00	1	1	2014-04-04 15:02:15	2014-04-04 15:04:01
96	25	10	2000	1	1.00	0.00	0.00	1	1	2014-04-04 15:02:15	2014-04-04 15:04:01
97	25	12	2	1	20000.00	0.00	0.00	1	1	2014-04-04 15:02:16	2014-04-04 15:04:01
98	26	3	4	1	75.00	0.00	0.00	1	1	2014-04-07 13:56:57	2014-04-07 13:57:52
99	26	4	7	1	75.00	0.00	0.00	1	1	2014-04-07 13:56:57	2014-04-07 13:57:52
100	26	8	1	1	500.00	0.00	0.00	3	2	2014-04-07 13:56:57	2014-04-07 13:57:52
101	26	16	1	1	500.00	0.00	0.00	3	1	2014-04-07 13:56:57	2014-04-07 13:57:52
102	26	10	1000	1	1.00	0.00	0.00	1	1	2014-04-07 13:56:57	2014-04-07 13:57:52
103	26	12	1	1	20000.00	0.00	0.00	1	1	2014-04-07 13:56:57	2014-04-07 13:57:52
104	27	4	8	10	75.00	0.00	0.00	1	1	2014-04-07 14:34:45	2014-04-07 14:40:41
105	21	12	1	1	20000.00	0.00	0.00	1	1	2014-04-07 18:07:03	2014-04-07 18:07:03
181	42	2	5	15	75.00	0.00	0.00	1	1	2014-04-14 12:50:41	2014-04-14 12:54:28
161	40	10	2000	1	1.00	0.00	0.00	1	1	2014-04-09 15:27:29	2014-04-09 15:30:02
396	74	4	5	10	75.00	0.00	0.00	1	1	2014-05-28 12:26:43	2014-05-28 12:28:14
146	38	10	1000	1	1.00	0.00	0.00	1	1	2014-04-08 13:51:06	2014-04-08 13:52:49
393	74	1	4	10	75.00	0.00	0.00	1	1	2014-05-28 12:26:43	2014-05-28 12:28:14
394	74	2	4	10	75.00	0.00	0.00	1	1	2014-05-28 12:26:43	2014-05-28 12:28:14
143	38	4	5	10	75.00	0.00	0.00	1	1	2014-04-08 13:51:06	2014-04-08 13:52:49
160	40	9	10000	1	0.50	0.00	0.00	1	1	2014-04-09 15:27:29	2014-04-09 15:30:02
191	40	12	1	2	20000.00	0.00	0.00	1	1	2014-04-15 17:14:40	2014-04-15 18:16:33
158	40	16	2	1	500.00	0.00	0.00	3	1	2014-04-09 15:27:29	2014-04-14 14:14:11
157	40	8	1	1	500.00	0.00	0.00	3	2	2014-04-09 15:27:29	2014-04-09 16:11:46
395	74	3	4	10	75.00	0.00	0.00	1	1	2014-05-28 12:26:43	2014-05-28 12:28:14
156	43	1	4	15	75.00	0.00	0.00	1	1	2014-04-09 15:27:29	2014-04-17 11:02:15
180	42	1	5	15	75.00	0.00	0.00	1	1	2014-04-14 12:50:41	2014-04-14 12:54:28
164	41	1	5	15	75.00	0.00	0.00	1	1	2014-04-09 15:41:57	2014-05-13 12:21:19
165	41	2	5	15	75.00	0.00	0.00	1	1	2014-04-09 15:41:57	2014-05-13 12:21:31
166	41	3	5	15	75.00	0.00	0.00	1	1	2014-04-09 15:41:57	2014-05-13 12:21:41
167	41	4	10	15	75.00	0.00	0.00	1	1	2014-04-09 15:41:57	2014-05-07 13:59:44
168	41	5	2	1	3750.00	0.00	0.00	1	1	2014-04-09 15:41:57	2014-04-09 15:44:41
327	41	8	1	1	500.00	0.00	0.00	3	2	2014-05-13 12:25:53	2014-05-13 12:25:53
328	41	32	10	15	75.00	0.00	0.00	1	1	2014-05-13 15:12:21	2014-05-13 15:12:21
280	55	1	4	15	75.00	0.00	0.00	1	1	2014-05-07 15:02:00	2014-05-07 15:03:28
172	41	9	20000	1	0.50	0.00	0.00	1	1	2014-04-09 15:41:57	2014-04-09 15:53:17
173	41	10	4000	1	1.00	0.00	0.00	1	1	2014-04-09 15:41:57	2014-04-09 15:56:18
174	41	12	1	2	20000.00	0.00	0.00	1	1	2014-04-09 15:41:57	2014-04-09 15:57:21
178	40	1	4	15	75.00	0.00	0.00	1	1	2014-04-09 16:09:45	2014-04-09 16:09:45
177	41	25	1	1	10000.00	0.00	0.00	1	1	2014-04-09 15:57:56	2014-04-09 15:57:56
179	40	2	4	15	75.00	0.00	0.00	1	1	2014-04-09 16:10:08	2014-04-09 16:10:08
182	42	3	5	15	75.00	0.00	0.00	1	1	2014-04-14 12:50:41	2014-04-14 12:54:28
183	42	4	8	15	75.00	0.00	0.00	1	1	2014-04-14 12:50:41	2014-04-14 12:54:28
184	42	5	1	2	3750.00	0.00	0.00	1	1	2014-04-14 12:50:41	2014-04-14 13:36:55
185	42	7	2	1	500.00	0.00	0.00	6	2.9000001	2014-04-14 12:50:41	2014-04-14 12:54:28
186	42	26	2	1	500.00	0.00	0.00	8	5	2014-04-14 12:50:41	2014-04-14 12:54:28
187	42	27	8	1	500.00	0.00	0.00	2.4000001	1.20000005	2014-04-14 12:50:41	2014-04-14 12:54:28
188	42	9	50000	1	0.50	0.00	0.00	1	1	2014-04-14 12:50:41	2014-04-14 12:54:28
189	42	10	1000	5	1.00	0.00	0.00	1	1	2014-04-14 12:50:41	2014-04-14 12:54:28
190	42	11	200	1	10.00	0.00	0.00	1	1	2014-04-14 12:50:41	2014-04-14 12:54:28
192	40	25	1	2	10000.00	0.00	0.00	1	1	2014-04-15 18:17:13	2014-04-15 18:17:13
193	43	1	4	15	75.00	0.00	0.00	1	1	2014-04-15 18:33:23	2014-04-17 11:02:41
194	43	2	4	15	75.00	0.00	0.00	1	1	2014-04-15 18:33:23	2014-04-17 11:02:57
195	43	3	4	15	75.00	0.00	0.00	1	1	2014-04-15 18:33:23	2014-04-17 10:55:35
196	43	4	10	15	75.00	0.00	0.00	1	1	2014-04-15 18:33:23	2014-04-17 11:06:24
197	43	5	1	1	3750.00	0.00	0.00	1	1	2014-04-15 18:33:23	2014-04-15 18:36:22
198	43	8	1	1	500.00	0.00	0.00	3	2	2014-04-15 18:33:24	2014-04-15 18:36:22
199	43	16	5	1	500.00	0.00	0.00	3	1	2014-04-15 18:33:24	2014-04-15 18:36:22
200	43	7	1	1	500.00	0.00	0.00	6	2.9000001	2014-04-15 18:33:24	2014-04-17 11:06:55
201	43	9	20000	1	0.50	0.00	0.00	1	1	2014-04-15 18:33:24	2014-04-17 11:07:22
202	43	10	1000	5	1.00	0.00	0.00	1	1	2014-04-15 18:33:24	2014-04-17 11:09:39
203	43	12	1	5	20000.00	0.00	0.00	1	1	2014-04-15 18:33:24	2014-04-17 11:17:39
226	47	4	7	4	75.00	0.00	0.00	1	1	2014-04-17 16:08:13	2014-04-22 13:13:24
271	53	4	4	120	75.00	0.00	0.00	1	1	2014-05-06 11:41:57	2014-05-06 11:47:05
282	55	3	4	15	75.00	0.00	0.00	1	1	2014-05-07 15:02:00	2014-05-07 15:03:28
281	55	2	4	15	75.00	0.00	0.00	1	1	2014-05-07 15:02:00	2014-05-07 15:03:28
279	54	10	8000	1	1.00	0.00	0.00	1	1	2014-05-07 12:47:25	2014-05-14 13:38:47
278	54	9	100000	1	0.55	0.00	0.00	1	1	2014-05-07 12:47:25	2014-05-13 12:11:12
329	54	8	1	1	500.00	0.00	0.00	3	2	2014-05-14 12:26:24	2014-05-14 12:26:24
276	54	4	10	15	75.00	0.00	0.00	1	1	2014-05-07 12:47:25	2014-05-07 12:48:43
275	54	3	6	15	75.00	0.00	0.00	1	1	2014-05-07 12:47:24	2014-05-13 12:12:28
213	46	1	4	15	75.00	0.00	0.00	1	1	2014-04-16 14:16:51	2014-04-17 11:54:26
214	46	2	4	15	75.00	0.00	0.00	1	1	2014-04-16 14:16:51	2014-04-17 11:54:49
224	47	2	4	4	75.00	0.00	0.00	1	1	2014-04-17 16:08:13	2014-04-22 13:13:51
216	46	4	8	15	75.00	0.00	0.00	1	1	2014-04-16 14:16:52	2014-04-17 11:55:56
217	46	8	1	1	500.00	0.00	0.00	3	2	2014-04-16 14:16:52	2014-04-16 14:19:00
218	46	16	4	1	500.00	0.00	0.00	3	1	2014-04-16 14:16:52	2014-04-25 14:25:06
223	47	1	4	4	75.00	0.00	0.00	1	1	2014-04-17 16:08:13	2014-04-22 13:16:02
220	46	9	20000	1	0.50	0.00	0.00	1	1	2014-04-16 14:16:52	2014-04-17 12:00:07
326	41	22	200	1	500.00	0.00	0.00	0.300000012	0.209999993	2014-05-13 12:23:44	2014-05-13 12:23:44
222	46	12	1	1	20000.00	0.00	0.00	1	1	2014-04-16 14:16:52	2014-04-16 14:19:00
227	47	8	1	1	500.00	0.00	0.00	3	2	2014-04-17 16:08:13	2014-04-17 16:09:23
228	47	16	2	1	500.00	0.00	0.00	3	1	2014-04-17 16:08:13	2014-04-17 16:09:23
273	54	1	6	15	75.00	0.00	0.00	1	1	2014-05-07 12:47:24	2014-05-13 12:12:38
231	49	4	10	11	75.00	0.00	0.00	1	1	2014-04-22 14:16:06	2014-05-06 16:08:59
232	49	2	4	11	75.00	0.00	0.00	1	1	2014-04-22 14:16:06	2014-05-06 16:11:36
233	49	3	4	11	75.00	0.00	0.00	1	1	2014-04-22 14:16:06	2014-05-06 16:11:24
234	49	1	4	11	75.00	0.00	0.00	1	1	2014-04-22 14:16:06	2014-05-06 16:12:50
286	55	10	1000	3	1.00	0.00	0.00	1	1	2014-05-07 15:02:00	2014-05-07 15:03:28
285	55	9	30000	1	0.50	0.00	0.00	1	1	2014-05-07 15:02:00	2014-05-07 15:03:28
287	55	25	1	1	10000.00	0.00	0.00	1	1	2014-05-07 15:02:00	2014-05-07 15:03:28
238	49	10	2000	1	1.00	0.00	0.00	1	1	2014-04-22 14:16:06	2014-04-22 14:20:03
272	49	9	10000	1	0.50	0.00	0.00	1	1	2014-05-06 16:00:16	2014-05-06 16:00:16
240	50	1	4	7	75.00	0.00	0.00	1	1	2014-04-22 14:31:48	2014-04-22 14:33:06
241	50	2	4	7	75.00	0.00	0.00	1	1	2014-04-22 14:31:48	2014-04-22 14:33:06
242	50	3	4	7	75.00	0.00	0.00	1	1	2014-04-22 14:31:48	2014-04-22 14:33:06
243	50	4	5	7	75.00	0.00	0.00	1	1	2014-04-22 14:31:48	2014-04-22 14:33:06
244	50	8	1	1	500.00	0.00	0.00	3	2	2014-04-22 14:31:48	2014-04-22 14:33:06
245	50	16	2	1	500.00	0.00	0.00	3	1	2014-04-22 14:31:48	2014-04-22 14:33:06
246	50	10	1000	1	1.00	0.00	0.00	1	1	2014-04-22 14:31:48	2014-04-22 14:33:06
247	46	18	1	1	500.00	0.00	0.00	4	3	2014-04-25 14:25:27	2014-04-25 14:25:27
248	51	1	5	10	75.00	0.00	0.00	1	1	2014-04-25 15:53:58	2014-04-25 15:55:01
249	51	2	5	10	75.00	0.00	0.00	1	1	2014-04-25 15:53:58	2014-04-25 15:55:01
250	51	3	5	10	75.00	0.00	0.00	1	1	2014-04-25 15:53:58	2014-04-25 15:55:01
251	51	4	10	10	75.00	0.00	0.00	1	1	2014-04-25 15:53:58	2014-04-25 15:55:01
252	51	5	1	1	3750.00	0.00	0.00	1	1	2014-04-25 15:53:58	2014-04-25 15:55:01
253	51	7	1	1	500.00	0.00	0.00	6	2.9000001	2014-04-25 15:53:58	2014-04-25 15:55:01
254	51	18	1	1	500.00	0.00	0.00	4	3	2014-04-25 15:53:58	2014-04-25 15:55:01
255	51	9	20000	1	0.50	0.00	0.00	1	1	2014-04-25 15:53:58	2014-04-25 15:55:01
256	51	29	500000	1	1.00	0.00	0.00	1	1	2014-04-25 15:56:39	2014-04-25 15:56:39
288	55	30	1	1	20000.00	0.00	0.00	1	1	2014-05-07 15:02:00	2014-05-07 15:03:28
406	76	10	3000	1	1.00	0.00	0.00	1	1	2014-06-03 13:35:25	2014-06-03 13:40:31
405	76	9	20	1	0.55	0.00	0.00	1	1	2014-06-03 13:35:25	2014-06-03 13:40:31
317	61	4	10	15	75.00	0.00	0.00	1	1	2014-05-09 11:26:44	2014-05-29 15:28:34
316	61	3	4	15	75.00	0.00	0.00	1	1	2014-05-09 11:26:44	2014-05-09 11:30:27
404	76	24	50	1	500.00	0.00	0.00	0.600000024	0.419999987	2014-06-03 13:35:25	2014-06-03 13:40:31
403	76	7	1	1	500.00	0.00	0.00	6	2.9000001	2014-06-03 13:35:25	2014-06-03 13:40:31
402	75	18	1	1	500.00	0.00	0.00	4	3	2014-05-30 13:33:48	2014-05-30 13:34:12
401	38	32	4	10	75.00	0.00	0.00	1	1	2014-05-29 12:29:02	2014-05-29 12:29:02
315	61	2	4	15	75.00	0.00	0.00	1	1	2014-05-09 11:26:44	2014-05-09 11:30:27
314	61	1	4	15	75.00	0.00	0.00	1	1	2014-05-09 11:26:44	2014-05-09 11:30:27
313	60	9	10000	1	0.55	0.00	0.00	1	1	2014-05-08 17:53:59	2014-05-08 17:53:59
308	60	1	4	15	75.00	0.00	0.00	1	1	2014-05-08 17:05:31	2014-05-08 17:06:58
309	60	2	4	15	75.00	0.00	0.00	1	1	2014-05-08 17:05:31	2014-05-08 17:06:58
310	60	3	4	15	75.00	0.00	0.00	1	1	2014-05-08 17:05:31	2014-05-08 17:06:58
311	60	4	6	15	75.00	0.00	0.00	1	1	2014-05-08 17:05:31	2014-05-13 11:33:47
312	60	10	1000	1	1.00	0.00	0.00	1	1	2014-05-08 17:05:31	2014-05-08 17:06:58
318	61	5	1	1	3750.00	0.00	0.00	1	1	2014-05-09 11:26:45	2014-05-09 11:30:27
319	61	9	10000	1	0.55	0.00	0.00	1	1	2014-05-09 11:26:45	2014-05-09 11:30:27
320	61	10	1000	1	1.00	0.00	0.00	1	1	2014-05-09 11:26:45	2014-05-09 11:30:27
321	61	12	1	1	20000.00	0.00	0.00	1	1	2014-05-09 11:26:45	2014-05-09 11:30:27
322	62	4	5	15	75.00	0.00	0.00	1	1	2014-05-09 11:47:17	2014-05-09 11:48:34
323	62	8	1	1	500.00	0.00	0.00	3	2	2014-05-09 11:47:17	2014-05-09 11:48:34
375	71	10	1000	1	1.00	0.00	0.00	1	1	2014-05-27 13:45:38	2014-05-27 13:47:10
325	62	10	1000	1	1.00	0.00	0.00	1	1	2014-05-09 11:47:17	2014-05-09 11:48:34
330	54	33	1	1	500.00	0.00	0.00	10	3	2014-05-14 12:27:06	2014-05-14 12:27:06
336	64	1	4	15	75.00	0.00	0.00	1	1	2014-05-15 12:29:14	2014-05-15 12:30:39
335	54	34	1	2	5000.00	0.00	0.00	1	1	2014-05-14 16:37:32	2014-05-14 16:37:32
333	54	35	1	3	1437.50	0.00	0.00	1	1	2014-05-14 13:10:18	2014-05-14 13:38:24
337	64	2	4	15	75.00	0.00	0.00	1	1	2014-05-15 12:29:14	2014-05-15 12:30:39
338	64	3	4	15	75.00	0.00	0.00	1	1	2014-05-15 12:29:14	2014-05-15 12:30:39
339	64	4	10	15	75.00	0.00	0.00	1	1	2014-05-15 12:29:14	2014-05-19 11:53:34
376	71	14	20	1	125.00	0.00	0.00	1	1	2014-05-27 13:45:38	2014-05-27 13:47:10
341	64	10	1000	2	1.00	0.00	0.00	1	1	2014-05-15 12:29:14	2014-05-19 11:54:37
373	71	4	5	15	75.00	0.00	0.00	1	1	2014-05-27 13:45:38	2014-05-27 13:47:10
374	71	32	4	15	75.00	0.00	0.00	1	1	2014-05-27 13:45:38	2014-05-27 13:47:10
357	67	4	6	5	75.00	0.00	0.00	1	1	2014-05-15 13:22:07	2014-05-27 13:11:31
372	71	3	4	15	75.00	0.00	0.00	1	1	2014-05-27 13:45:38	2014-05-27 13:47:10
371	71	2	4	15	75.00	0.00	0.00	1	1	2014-05-27 13:45:38	2014-05-27 13:47:10
370	71	1	4	15	75.00	0.00	0.00	1	1	2014-05-27 13:45:38	2014-05-27 13:47:10
348	66	1	4	7	75.00	0.00	0.00	1	1	2014-05-15 12:44:29	2014-05-15 13:05:42
349	66	2	4	7	75.00	0.00	0.00	1	1	2014-05-15 12:44:29	2014-05-15 13:05:42
350	66	3	4	7	75.00	0.00	0.00	1	1	2014-05-15 12:44:29	2014-05-15 13:05:42
351	66	4	4	7	75.00	0.00	0.00	1	1	2014-05-15 12:44:29	2014-05-15 13:05:42
352	66	32	4	7	75.00	0.00	0.00	1	1	2014-05-15 12:44:29	2014-05-15 13:05:42
353	66	5	1	1	3750.00	0.00	0.00	1	1	2014-05-15 12:44:29	2014-05-15 13:05:42
360	67	10	1000	3	1.00	0.00	0.00	1	1	2014-05-15 13:22:07	2014-05-27 15:43:36
474	91	1	4	15	75.00	0.00	0.00	1	1	2014-08-11 18:13:10	2014-08-11 18:15:39
362	69	12	1	1	20000.00	0.00	0.00	1	1	2014-05-16 12:00:07	2014-05-16 12:00:25
473	90	4	5	2	75.00	0.00	0.00	1	1	2014-08-08 11:59:55	2014-08-08 12:00:41
472	89	20	5	1	200.00	0.00	0.00	1	1	2014-08-06 14:52:31	2014-08-06 14:54:50
471	89	14	20	1	125.00	0.00	0.00	1	1	2014-08-06 14:52:31	2014-08-06 14:54:50
470	89	16	2	1	500.00	0.00	0.00	3	1	2014-08-06 14:52:31	2014-08-06 14:54:50
469	88	14	20	1	125.00	0.00	0.00	1	1	2014-08-05 17:30:00	2014-08-08 11:19:30
468	88	10	2000	1	1.00	0.00	0.00	1	1	2014-08-05 17:30:00	2014-08-08 11:19:50
377	72	1	4	10	75.00	0.00	0.00	1	1	2014-05-27 13:55:50	2014-05-27 13:58:22
378	72	2	4	10	75.00	0.00	0.00	1	1	2014-05-27 13:55:50	2014-05-27 13:58:22
379	72	3	4	10	75.00	0.00	0.00	1	1	2014-05-27 13:55:50	2014-05-27 13:58:22
380	72	4	4	10	75.00	0.00	0.00	1	1	2014-05-27 13:55:50	2014-05-27 13:58:22
408	77	4	5	10	75.00	0.00	0.00	1	1	2014-06-12 14:15:47	2014-06-12 14:19:37
382	72	8	1	1	500.00	0.00	0.00	3	2	2014-05-27 13:55:50	2014-05-27 13:58:22
383	72	9	10000	1	0.55	0.00	0.00	1	1	2014-05-27 13:55:50	2014-05-27 13:58:22
384	72	10	1000	1	1.00	0.00	0.00	1	1	2014-05-27 13:55:50	2014-05-27 13:58:22
385	73	1	4	10	75.00	0.00	0.00	1	1	2014-05-27 14:07:10	2014-05-27 14:08:14
386	73	2	4	10	75.00	0.00	0.00	1	1	2014-05-27 14:07:10	2014-05-27 14:08:14
387	73	3	4	10	75.00	0.00	0.00	1	1	2014-05-27 14:07:10	2014-05-27 14:08:14
388	73	4	4	10	75.00	0.00	0.00	1	1	2014-05-27 14:07:10	2014-05-27 14:08:14
389	73	32	4	10	75.00	0.00	0.00	1	1	2014-05-27 14:07:10	2014-05-27 14:08:14
390	73	16	2	1	500.00	0.00	0.00	3	1	2014-05-27 14:07:10	2014-05-27 14:08:14
391	73	22	100	1	500.00	0.00	0.00	0.300000012	0.209999993	2014-05-27 14:07:10	2014-05-27 14:08:14
392	73	10	1000	1	1.00	0.00	0.00	1	1	2014-05-27 14:07:10	2014-05-27 14:08:14
397	74	32	4	10	75.00	0.00	0.00	1	1	2014-05-28 12:26:43	2014-05-28 12:28:15
398	74	8	1	1	500.00	0.00	0.00	3	2	2014-05-28 12:26:43	2014-05-28 12:28:15
399	74	9	10000	1	0.55	0.00	0.00	1	1	2014-05-28 12:26:43	2014-05-28 12:28:15
400	74	10	1000	1	1.00	0.00	0.00	1	1	2014-05-28 12:26:43	2014-05-28 12:28:15
407	76	31	1	1	10000.00	0.00	0.00	1	1	2014-06-03 13:35:25	2014-06-03 13:40:31
409	77	8	1	1	500.00	0.00	0.00	3	2	2014-06-12 14:15:47	2014-06-12 14:19:14
410	77	9	10000	1	0.55	0.00	0.00	1	1	2014-06-12 14:15:47	2014-06-12 14:19:14
411	77	10	1000	1	1.00	0.00	0.00	1	1	2014-06-12 14:15:47	2014-06-12 14:19:14
412	78	4	5	15	75.00	0.00	0.00	1	1	2014-06-18 16:25:07	2014-06-18 16:27:08
413	78	8	1	1	500.00	0.00	0.00	3	2	2014-06-18 16:25:07	2014-06-18 16:27:08
414	78	9	10000	1	0.55	0.00	0.00	1	1	2014-06-18 16:25:07	2014-06-18 16:27:08
415	78	10	1000	1	1.00	0.00	0.00	1	1	2014-06-18 16:25:07	2014-06-18 16:27:08
467	88	9	10000	1	0.55	0.00	0.00	1	1	2014-08-05 17:30:00	2014-08-05 17:34:14
466	88	4	8	15	75.00	0.00	0.00	1	1	2014-08-05 17:30:00	2014-08-08 11:20:09
665	113	2	4	15	75.00	0.00	0.00	1	1	2014-11-04 15:45:39	2014-11-04 15:45:39
419	79	4	10	10	75.00	0.00	0.00	1	1	2014-06-19 16:07:15	2014-06-27 14:04:48
420	79	8	1	1	500.00	0.00	0.00	3	2	2014-06-19 16:07:15	2014-06-19 16:07:15
421	79	16	1	1	500.00	0.00	0.00	3	1	2014-06-19 16:07:15	2014-06-19 16:07:15
422	79	9	10000	1	0.55	0.00	0.00	1	1	2014-06-19 16:07:15	2014-06-19 16:22:29
423	79	10	2000	1	1.00	0.00	0.00	1	1	2014-06-19 16:07:15	2014-06-19 16:23:01
452	84	10	1000	1	1.00	0.00	0.00	1	1	2014-07-21 15:28:27	2014-07-21 15:31:06
451	84	9	10000	1	0.55	0.00	0.00	1	1	2014-07-21 15:28:27	2014-07-23 15:51:26
450	84	4	8	5	75.00	0.00	0.00	1	1	2014-07-21 15:28:27	2014-07-23 15:50:58
449	83	35	1	1	1437.50	0.00	0.00	1	1	2014-07-15 16:47:23	2014-07-15 16:50:38
448	83	31	1	1	10000.00	0.00	0.00	1	1	2014-07-15 16:47:23	2014-07-15 16:50:38
447	83	12	1	1	20000.00	0.00	0.00	1	1	2014-07-15 16:47:23	2014-07-15 16:53:30
446	83	10	1000	1	1.00	0.00	0.00	1	1	2014-07-15 16:47:23	2014-07-15 16:50:38
445	83	9	10000	1	0.55	0.00	0.00	1	1	2014-07-15 16:47:23	2014-07-15 16:50:38
444	83	32	4	15	75.00	0.00	0.00	1	1	2014-07-15 16:47:23	2014-07-15 16:50:38
443	83	4	4	15	75.00	0.00	0.00	1	1	2014-07-15 16:47:23	2014-07-15 16:50:38
442	83	3	4	15	75.00	0.00	0.00	1	1	2014-07-15 16:47:23	2014-07-15 16:50:38
441	83	2	4	15	75.00	0.00	0.00	1	1	2014-07-15 16:47:23	2014-07-15 16:50:38
440	83	1	4	15	75.00	0.00	0.00	1	1	2014-07-15 16:47:23	2014-07-15 16:50:38
453	85	4	4	5	75.00	0.00	0.00	1	1	2014-07-23 11:35:39	2014-07-23 11:36:27
454	86	4	8	15	75.00	0.00	0.00	1	1	2014-07-31 16:30:38	2014-08-13 17:56:15
521	97	32	4	3	75.00	0.00	0.00	1	1	2014-08-19 16:36:13	2014-08-19 16:37:13
520	97	4	8	3	75.00	0.00	0.00	1	1	2014-08-19 16:36:13	2014-08-19 16:37:13
457	86	9	5000	1	0.55	0.00	0.00	1	1	2014-07-31 16:30:38	2014-07-31 16:33:15
458	86	10	1000	1	1.00	0.00	0.00	1	1	2014-07-31 16:30:38	2014-07-31 16:33:15
459	86	12	1	1	20000.00	0.00	0.00	1	1	2014-07-31 16:30:38	2014-07-31 16:33:15
460	87	4	8	6	75.00	0.00	0.00	1	1	2014-07-31 16:43:03	2014-08-25 18:09:10
525	98	9	1000000	5	0.55	0.00	0.00	1	1	2014-09-01 11:52:30	2014-09-01 11:52:30
524	98	36	1	8	2875.00	0.00	0.00	1	1	2014-09-01 11:49:43	2014-09-01 11:51:28
522	98	4	10	60	75.00	0.00	0.00	1	1	2014-09-01 11:49:43	2014-09-01 11:51:28
464	87	10	1000	1	1.00	0.00	0.00	1	1	2014-07-31 16:43:03	2014-07-31 16:44:49
523	98	5	1	4	3750.00	0.00	0.00	1	1	2014-09-01 11:49:43	2014-09-01 11:51:28
475	91	2	4	15	75.00	0.00	0.00	1	1	2014-08-11 18:13:10	2014-08-11 18:15:39
476	91	3	4	15	75.00	0.00	0.00	1	1	2014-08-11 18:13:10	2014-08-11 18:15:39
477	91	4	8	15	75.00	0.00	0.00	1	1	2014-08-11 18:13:10	2014-08-11 18:15:39
478	91	8	1	1	500.00	0.00	0.00	3	2	2014-08-11 18:13:10	2014-08-11 18:15:39
479	91	9	5000	1	0.55	0.00	0.00	1	1	2014-08-11 18:13:10	2014-08-11 18:15:39
480	91	10	5000	1	1.00	0.00	0.00	1	1	2014-08-11 18:13:10	2014-08-11 18:15:39
481	91	35	1	1	1437.50	0.00	0.00	1	1	2014-08-11 18:13:10	2014-08-11 18:15:39
482	92	4	5	10	75.00	0.00	0.00	1	1	2014-08-12 13:31:18	2014-08-12 18:39:35
483	93	4	8	4	75.00	0.00	0.00	1	1	2014-08-12 17:24:57	2014-08-12 17:26:11
484	93	9	5000	1	0.55	0.00	0.00	1	1	2014-08-12 17:24:57	2014-08-12 17:26:11
485	93	10	1000	1	1.00	0.00	0.00	1	1	2014-08-12 17:24:57	2014-08-12 17:26:11
486	92	12	1	1	20000.00	0.00	0.00	1	1	2014-08-12 18:09:09	2014-08-12 18:09:09
563	107	8	1	1	500.00	0.00	0.00	3	2	2014-10-13 12:49:18	2014-10-13 12:57:45
562	107	5	1	1	3750.00	0.00	0.00	1	1	2014-10-13 12:49:18	2014-10-13 12:57:45
561	107	4	10	15	75.00	0.00	0.00	1	1	2014-10-13 12:49:18	2014-10-13 12:57:45
545	101	12	1	1	20000.00	0.00	0.00	1	1	2014-09-23 18:07:55	2014-09-23 18:12:24
544	101	10	1000	1	1.00	0.00	0.00	1	1	2014-09-23 18:07:55	2014-09-23 18:12:24
543	101	9	5000	1	0.55	0.00	0.00	1	1	2014-09-23 18:07:55	2014-09-23 18:12:24
542	101	16	2	1	500.00	0.00	0.00	3	1	2014-09-23 18:07:55	2014-09-23 18:12:24
541	101	8	1	1	500.00	0.00	0.00	3	2	2014-09-23 18:07:55	2014-09-23 18:12:24
540	101	4	4	15	75.00	0.00	0.00	1	1	2014-09-23 18:07:55	2014-09-23 18:12:24
539	100	10	2000	1	1.00	0.00	0.00	1	1	2014-09-23 17:47:41	2014-09-23 17:49:26
538	100	9	5000	1	0.55	0.00	0.00	1	1	2014-09-23 17:47:41	2014-09-23 17:49:26
537	100	16	2	1	500.00	0.00	0.00	3	1	2014-09-23 17:47:41	2014-09-23 17:49:26
536	100	8	1	1	500.00	0.00	0.00	3	2	2014-09-23 17:47:41	2014-09-23 17:49:26
535	100	4	4	15	75.00	0.00	0.00	1	1	2014-09-23 17:47:41	2014-09-23 17:49:26
534	99	39	2	1	500.00	0.00	0.00	4	1.5	2014-09-08 18:32:37	2014-09-08 18:32:37
533	99	38	1	1	500.00	0.00	0.00	6	4	2014-09-08 18:32:16	2014-09-08 18:32:16
532	99	9	1	150000	0.55	0.00	0.00	1	1	2014-09-08 18:30:06	2014-09-08 18:31:48
531	99	7	1	4	500.00	0.00	0.00	6	2.9000001	2014-09-08 18:30:06	2014-09-08 18:31:48
530	99	5	2	1	3750.00	0.00	0.00	1	1	2014-09-08 18:30:05	2014-09-08 18:31:48
529	99	4	10	15	75.00	0.00	0.00	1	1	2014-09-08 18:30:05	2014-09-08 18:31:48
528	99	2	5	15	75.00	0.00	0.00	1	1	2014-09-08 18:30:05	2014-09-08 18:31:48
527	99	1	5	15	75.00	0.00	0.00	1	1	2014-09-08 18:30:05	2014-09-08 18:31:48
509	96	1	6	17	75.00	0.00	0.00	1	1	2014-08-13 14:14:37	2014-08-13 17:27:19
510	96	2	6	17	75.00	0.00	0.00	1	1	2014-08-13 14:14:37	2014-08-13 17:27:33
511	96	4	10	17	75.00	0.00	0.00	1	1	2014-08-13 14:14:37	2014-08-13 17:28:03
512	96	32	6	17	75.00	0.00	0.00	1	1	2014-08-13 14:14:37	2014-08-13 17:27:49
513	96	5	4	1	3750.00	0.00	0.00	1	1	2014-08-13 14:14:37	2014-08-13 14:17:33
526	7	7	4	1	500.00	0.00	0.00	6	2.9000001	2014-09-01 11:54:27	2014-09-01 11:54:27
519	96	37	4	1	3000.00	0.00	0.00	1	1	2014-08-13 17:37:55	2014-08-13 17:37:55
516	96	9	50000	2	0.55	0.00	0.00	1	1	2014-08-13 14:14:37	2014-08-13 14:17:34
517	96	10	5000	2	1.00	0.00	0.00	1	1	2014-08-13 14:14:37	2014-08-13 17:39:05
518	96	11	20	1	10.00	0.00	0.00	1	1	2014-08-13 14:14:37	2014-08-13 14:17:34
560	107	3	5	15	75.00	0.00	0.00	1	1	2014-10-13 12:49:18	2014-10-13 12:57:45
556	104	4	4	10	75.00	0.00	0.00	1	1	2014-09-24 14:45:22	2014-09-24 14:45:46
551	103	4	10	6	75.00	0.00	0.00	1	1	2014-09-24 14:33:11	2014-09-25 14:16:19
559	107	2	5	15	75.00	0.00	0.00	1	1	2014-10-13 12:49:18	2014-10-13 12:57:45
558	106	4	8	5	75.00	0.00	0.00	1	1	2014-09-30 18:18:21	2014-09-30 18:19:21
557	105	4	10	9	75.00	0.00	0.00	1	1	2014-09-30 17:26:33	2014-09-30 17:27:05
555	103	10	1000	2	1.00	0.00	0.00	1	1	2014-09-24 14:33:11	2014-09-25 14:16:32
564	107	9	20000	1	0.55	0.00	0.00	1	1	2014-10-13 12:49:18	2014-10-13 12:57:45
565	107	10	5000	1	1.00	0.00	0.00	1	1	2014-10-13 12:49:18	2014-10-13 12:57:45
566	107	12	1	1	20000.00	0.00	0.00	1	1	2014-10-13 12:49:19	2014-10-13 12:57:45
567	107	29	5000	1	1.00	0.00	0.00	1	1	2014-10-13 12:49:19	2014-10-13 12:57:45
568	108	4	5	10	75.00	0.00	0.00	1	1	2014-10-15 16:57:42	2014-10-15 16:58:18
664	113	1	4	15	75.00	0.00	0.00	1	1	2014-11-04 15:45:16	2014-11-04 15:45:16
589	108	35	1	1	1437.50	0.00	0.00	1	1	2014-10-20 15:06:42	2014-10-20 15:06:42
571	109	4	5	10	75.00	0.00	0.00	1	1	2014-10-15 17:04:27	2014-10-15 17:05:26
572	111	9	10000	1	0.55	0.00	0.00	1	1	2014-10-15 17:04:27	2014-10-20 16:06:39
573	109	10	1000	1	1.00	0.00	0.00	1	1	2014-10-15 17:04:27	2014-10-15 17:05:26
574	110	1	4	10	75.00	0.00	0.00	1	1	2014-10-15 17:11:30	2014-10-15 17:14:22
575	110	2	4	10	75.00	0.00	0.00	1	1	2014-10-15 17:11:30	2014-10-15 17:14:22
623	118	32	4	15	75.00	0.00	0.00	1	1	2014-10-29 12:53:12	2014-10-29 12:54:10
577	110	4	5	10	75.00	0.00	0.00	1	1	2014-10-15 17:11:30	2014-10-15 17:14:22
622	118	4	5	15	75.00	0.00	0.00	1	1	2014-10-29 12:53:12	2014-10-29 12:54:10
621	110	12	1	1	20000.00	0.00	0.00	1	1	2014-10-28 13:13:57	2014-10-28 13:13:57
580	110	9	10000	1	0.55	0.00	0.00	1	1	2014-10-15 17:11:30	2014-10-28 13:09:39
581	110	10	2000	1	1.00	0.00	0.00	1	1	2014-10-15 17:11:30	2014-10-15 17:14:22
582	110	35	1	1	1437.50	0.00	0.00	1	1	2014-10-15 17:11:30	2014-10-15 17:14:22
583	111	4	5	15	75.00	0.00	0.00	1	1	2014-10-17 13:08:02	2014-10-20 16:07:04
590	113	4	5	15	75.00	0.00	0.00	1	1	2014-10-21 12:14:06	2014-10-21 12:16:12
585	111	10	4000	1	1.00	0.00	0.00	1	1	2014-10-17 13:08:02	2014-10-17 13:10:10
586	111	14	30	1	125.00	0.00	0.00	1	1	2014-10-17 13:08:02	2014-10-17 13:10:10
587	112	4	5	6	75.00	0.00	0.00	1	1	2014-10-17 14:32:04	2014-10-20 15:38:01
588	112	10	1000	1	1.00	0.00	0.00	1	1	2014-10-17 14:32:04	2014-10-17 14:32:29
593	113	9	5000	1	0.55	0.00	0.00	1	1	2014-10-21 12:14:06	2014-10-21 12:16:12
594	113	10	1000	1	1.00	0.00	0.00	1	1	2014-10-21 12:14:06	2014-10-21 12:16:12
595	113	35	1	1	1437.50	0.00	0.00	1	1	2014-10-21 12:14:06	2014-10-21 12:16:13
596	114	1	4	10	75.00	0.00	0.00	1	1	2014-10-22 13:07:13	2014-10-22 13:15:39
597	114	2	4	10	75.00	0.00	0.00	1	1	2014-10-22 13:07:13	2014-10-22 13:15:39
598	114	3	4	10	75.00	0.00	0.00	1	1	2014-10-22 13:07:13	2014-10-22 13:15:40
599	114	4	8	15	75.00	0.00	0.00	1	1	2014-10-22 13:07:13	2014-10-22 13:15:40
600	114	8	1	1	500.00	0.00	0.00	3	2	2014-10-22 13:07:13	2014-10-22 13:15:40
601	114	16	1	1	500.00	0.00	0.00	3	1	2014-10-22 13:07:13	2014-10-22 13:15:40
602	114	9	5000	1	0.55	0.00	0.00	1	1	2014-10-22 13:07:13	2014-10-22 13:15:40
603	114	10	1000	1	1.00	0.00	0.00	1	1	2014-10-22 13:07:13	2014-10-22 13:15:40
604	114	25	1	1	10000.00	0.00	0.00	1	1	2014-10-22 13:07:13	2014-10-22 13:15:40
605	114	28	1	1	5000.00	0.00	0.00	1	1	2014-10-22 13:07:13	2014-10-22 13:15:40
606	114	29	50000	1	1.00	0.00	0.00	1	1	2014-10-22 13:07:13	2014-10-22 13:15:40
607	114	35	1	1	1437.50	0.00	0.00	1	1	2014-10-22 13:07:13	2014-10-22 13:15:40
608	115	4	8	3	75.00	0.00	0.00	1	1	2014-10-22 15:56:53	2014-10-22 15:57:35
609	115	36	1	1	2875.00	0.00	0.00	1	1	2014-10-22 15:56:53	2014-10-22 15:57:35
610	116	1	4	15	75.00	0.00	0.00	1	1	2014-10-27 11:02:27	2014-10-27 11:04:37
611	116	2	4	15	75.00	0.00	0.00	1	1	2014-10-27 11:02:27	2014-10-27 11:04:37
612	116	3	4	15	75.00	0.00	0.00	1	1	2014-10-27 11:02:27	2014-10-27 11:04:37
613	116	4	8	15	75.00	0.00	0.00	1	1	2014-10-27 11:02:27	2014-10-27 11:04:37
614	116	10	3000	1	1.00	0.00	0.00	1	1	2014-10-27 11:02:27	2014-10-27 11:04:37
615	116	12	1	2	20000.00	0.00	0.00	1	1	2014-10-27 11:02:27	2014-10-27 11:04:37
616	116	30	1	2	20000.00	0.00	0.00	1	1	2014-10-27 11:02:27	2014-11-25 17:13:32
617	116	35	1	2	1437.50	0.00	0.00	1	1	2014-10-27 11:02:27	2014-10-27 11:04:37
618	117	4	6	10	75.00	0.00	0.00	1	1	2014-10-28 12:46:13	2014-10-28 12:49:23
619	117	12	1	1	20000.00	0.00	0.00	1	1	2014-10-28 12:46:13	2014-10-28 12:49:23
620	117	25	1	1	10000.00	0.00	0.00	1	1	2014-10-28 12:46:13	2014-10-28 12:49:23
706	144	35	1	2	1437.50	0.00	0.00	1	1	2014-11-19 13:19:49	2014-11-19 13:23:33
678	119	10	1000	3	1.00	0.00	0.00	1	1	2014-11-18 15:17:51	2014-11-18 15:17:51
626	118	10	1000	1	1.00	0.00	0.00	1	1	2014-10-29 12:53:12	2014-10-29 12:54:10
627	119	4	5	15	75.00	0.00	0.00	1	1	2014-10-29 13:01:59	2014-10-29 13:03:10
628	119	32	4	15	75.00	0.00	0.00	1	1	2014-10-29 13:01:59	2014-10-29 13:03:10
629	119	12	1	1	20000.00	0.00	0.00	1	1	2014-10-29 13:02:00	2014-10-29 13:03:10
630	120	4	5	2	75.00	0.00	0.00	1	1	2014-10-30 16:18:00	2014-10-30 16:18:22
659	124	32	4	3	75.00	0.00	0.00	1	1	2014-11-04 13:20:28	2014-11-04 14:26:08
658	124	4	8	3	75.00	0.00	0.00	1	1	2014-11-04 13:20:27	2014-11-04 14:26:28
705	144	14	20	1	125.00	0.00	0.00	1	1	2014-11-19 13:19:49	2014-11-19 13:23:33
655	123	10	1000	2	1.00	0.00	0.00	1	1	2014-10-31 13:24:08	2014-11-04 14:10:05
654	123	9	10000	1	0.55	0.00	0.00	1	1	2014-10-31 13:24:08	2014-11-04 14:10:20
662	123	1	4	15	75.00	0.00	0.00	1	1	2014-11-04 14:11:20	2014-11-04 14:11:20
661	123	2	4	15	75.00	0.00	0.00	1	1	2014-11-04 14:10:49	2014-11-04 14:10:49
651	123	4	8	15	75.00	0.00	0.00	1	1	2014-10-31 13:24:07	2014-10-31 13:25:29
704	144	12	1	1	20000.00	0.00	0.00	1	1	2014-11-19 13:19:49	2014-11-19 13:23:33
703	144	10	1000	4	1.00	0.00	0.00	1	1	2014-11-19 13:19:49	2014-11-19 13:23:33
702	144	9	50000	1	0.55	0.00	0.00	1	1	2014-11-19 13:19:49	2014-11-19 13:23:33
701	144	5	1	1	3750.00	0.00	0.00	1	1	2014-11-19 13:19:49	2014-11-19 13:23:33
700	144	4	8	15	75.00	0.00	0.00	1	1	2014-11-19 13:19:49	2014-11-19 13:23:33
699	144	3	5	15	75.00	0.00	0.00	1	1	2014-11-19 13:19:49	2014-11-19 13:23:33
710	146	3	5	15	75.00	0.00	0.00	1	1	2014-11-21 11:09:53	2014-12-02 15:43:41
698	144	2	5	15	75.00	0.00	0.00	1	1	2014-11-19 13:19:49	2014-11-19 13:23:33
709	146	2	5	15	75.00	0.00	0.00	1	1	2014-11-21 11:09:53	2014-12-02 15:43:57
708	146	1	5	15	75.00	0.00	0.00	1	1	2014-11-21 11:09:53	2014-12-02 15:44:11
707	145	4	8	9	75.00	0.00	0.00	1	1	2014-11-20 16:30:09	2014-11-20 16:30:32
697	144	1	5	15	75.00	0.00	0.00	1	1	2014-11-19 13:19:49	2014-11-19 13:23:33
660	124	35	1	1	1437.50	0.00	0.00	1	1	2014-11-04 13:20:28	2014-11-04 13:24:32
663	123	35	1	2	1437.50	0.00	0.00	1	1	2014-11-04 14:11:41	2014-11-04 14:11:41
666	125	1	4	10	75.00	0.00	0.00	1	1	2014-11-05 13:34:11	2014-11-05 13:35:43
667	125	2	4	10	75.00	0.00	0.00	1	1	2014-11-05 13:34:11	2014-11-05 13:35:43
668	125	3	4	10	75.00	0.00	0.00	1	1	2014-11-05 13:34:11	2014-11-05 13:35:43
669	125	4	5	10	75.00	0.00	0.00	1	1	2014-11-05 13:34:11	2014-11-05 13:35:43
670	125	32	4	10	75.00	0.00	0.00	1	1	2014-11-05 13:34:11	2014-11-05 13:35:43
671	125	8	1	1	500.00	0.00	0.00	3	2	2014-11-05 13:34:11	2014-11-05 13:35:43
672	125	16	1	1	500.00	0.00	0.00	3	1	2014-11-05 13:34:11	2014-11-05 13:35:43
673	125	9	5000	1	0.55	0.00	0.00	1	1	2014-11-05 13:34:12	2014-11-05 13:35:43
674	125	10	4000	1	1.00	0.00	0.00	1	1	2014-11-05 13:34:12	2014-11-05 13:35:43
675	125	12	1	1	20000.00	0.00	0.00	1	1	2014-11-05 13:34:12	2014-11-05 13:35:43
676	125	31	1	1	10000.00	0.00	0.00	1	1	2014-11-05 13:34:12	2014-11-05 13:35:43
711	146	4	10	15	75.00	0.00	0.00	1	1	2014-11-21 11:09:53	2014-12-02 15:44:25
712	146	32	5	15	75.00	0.00	0.00	1	1	2014-11-21 11:09:53	2014-12-02 15:47:14
713	146	5	2	1	3750.00	0.00	0.00	1	1	2014-11-21 11:09:53	2014-11-21 11:19:17
714	146	7	4	1	500.00	0.00	0.00	6	2.9000001	2014-11-21 11:09:53	2014-12-02 15:44:43
799	165	8	1	1	500.00	0.00	0.00	3	2	2014-12-04 10:53:44	2014-12-04 10:55:57
795	165	2	4	15	75.00	0.00	0.00	1	1	2014-12-04 10:53:44	2014-12-04 10:55:57
717	146	16	10	1	500.00	0.00	0.00	3	1	2014-11-21 11:09:53	2014-12-02 15:45:41
718	146	9	50000	1	0.55	0.00	0.00	1	1	2014-11-21 11:09:53	2014-12-02 15:46:06
719	146	10	5000	1	1.00	0.00	0.00	1	1	2014-11-21 11:09:53	2014-11-21 11:14:01
793	164	10	1000	1	1.00	0.00	0.00	1	1	2014-12-02 16:54:28	2014-12-02 16:55:31
796	165	3	4	15	75.00	0.00	0.00	1	1	2014-12-04 10:53:44	2014-12-04 10:55:57
797	165	4	8	15	75.00	0.00	0.00	1	1	2014-12-04 10:53:44	2014-12-04 10:55:57
820	168	1	4	10	75.00	0.00	0.00	1	1	2014-12-10 16:36:35	2014-12-10 16:38:52
794	165	1	4	15	75.00	0.00	0.00	1	1	2014-12-04 10:53:44	2014-12-04 10:55:57
725	146	35	1	4	1437.50	0.00	0.00	1	1	2014-11-21 11:09:53	2014-12-02 15:47:44
785	146	18	4	1	500.00	0.00	0.00	4	3	2014-12-02 15:48:47	2014-12-02 15:48:47
727	116	9	50000	1	0.55	0.00	0.00	1	1	2014-11-25 17:10:33	2014-11-25 17:10:33
728	116	8	3	1	500.00	0.00	0.00	3	2	2014-11-25 17:10:58	2014-11-25 17:10:58
729	116	5	1	1	3750.00	0.00	0.00	1	1	2014-11-25 17:11:48	2014-11-25 17:11:48
792	164	9	5000	1	0.55	0.00	0.00	1	1	2014-12-02 16:54:28	2014-12-02 16:55:31
791	164	16	2	1	500.00	0.00	0.00	3	1	2014-12-02 16:54:28	2014-12-02 16:55:31
790	164	8	1	1	500.00	0.00	0.00	3	2	2014-12-02 16:54:28	2014-12-02 16:55:31
789	164	4	8	15	75.00	0.00	0.00	1	1	2014-12-02 16:54:28	2014-12-02 16:55:31
788	164	3	4	15	75.00	0.00	0.00	1	1	2014-12-02 16:54:28	2014-12-02 16:55:31
787	164	2	4	15	75.00	0.00	0.00	1	1	2014-12-02 16:54:28	2014-12-02 16:55:31
786	164	1	4	15	75.00	0.00	0.00	1	1	2014-12-02 16:54:28	2014-12-02 16:55:31
737	148	9	5000	1	0.55	0.00	0.00	1	1	2014-12-02 11:42:27	2014-12-02 11:43:03
738	149	16	2	1	500.00	0.00	0.00	3	1	2014-12-02 12:04:29	2014-12-02 12:05:25
739	149	10	2000	1	1.00	0.00	0.00	1	1	2014-12-02 12:04:29	2014-12-17 12:14:39
740	149	14	20	1	125.00	0.00	0.00	1	1	2014-12-02 12:04:29	2014-12-02 12:05:25
741	150	1	4	15	75.00	0.00	0.00	1	1	2014-12-02 12:42:02	2014-12-02 12:43:07
742	150	4	6	15	75.00	0.00	0.00	1	1	2014-12-02 12:42:02	2014-12-08 12:38:41
808	166	10	1000	2	1.00	0.00	0.00	1	1	2014-12-08 17:25:43	2014-12-08 17:25:43
744	150	8	1	1	500.00	0.00	0.00	3	2	2014-12-02 12:42:03	2014-12-02 12:43:07
745	150	16	3	1	500.00	0.00	0.00	3	1	2014-12-02 12:42:03	2014-12-08 12:38:23
746	150	9	10000	1	0.55	0.00	0.00	1	1	2014-12-02 12:42:03	2014-12-08 12:39:12
747	150	10	2000	1	1.00	0.00	0.00	1	1	2014-12-02 12:42:03	2014-12-02 12:43:07
748	150	12	1	1	20000.00	0.00	0.00	1	1	2014-12-02 12:42:03	2014-12-02 12:43:07
749	151	10	2000	1	1.00	0.00	0.00	1	1	2014-12-02 12:52:52	2014-12-02 12:53:09
750	151	12	1	1	20000.00	0.00	0.00	1	1	2014-12-02 12:52:52	2014-12-02 12:53:09
751	159	1	5	15	75.00	0.00	0.00	1	1	2014-12-02 13:23:01	2014-12-02 13:32:33
752	159	2	5	15	75.00	0.00	0.00	1	1	2014-12-02 13:23:01	2014-12-02 13:32:33
753	159	3	5	15	75.00	0.00	0.00	1	1	2014-12-02 13:23:01	2014-12-02 13:32:33
754	159	4	10	15	75.00	0.00	0.00	1	1	2014-12-02 13:23:01	2014-12-02 13:32:33
755	159	5	1	2	3750.00	0.00	0.00	1	1	2014-12-02 13:23:01	2014-12-02 13:32:33
756	159	7	4	1	500.00	0.00	0.00	6	2.9000001	2014-12-02 13:23:01	2014-12-02 13:32:33
757	159	16	4	1	500.00	0.00	0.00	3	1	2014-12-02 13:23:01	2014-12-02 13:32:33
758	159	18	4	1	500.00	0.00	0.00	4	3	2014-12-02 13:23:01	2014-12-02 13:32:33
759	159	9	50000	1	0.55	0.00	0.00	1	1	2014-12-02 13:23:01	2014-12-02 13:32:33
760	159	10	5000	1	1.00	0.00	0.00	1	1	2014-12-02 13:23:01	2014-12-02 13:32:33
761	159	29	75000	1	1.00	0.00	0.00	1	1	2014-12-02 13:33:12	2014-12-02 13:33:12
762	160	1	5	15	75.00	0.00	0.00	1	1	2014-12-02 14:49:32	2014-12-02 14:55:58
763	160	2	5	15	75.00	0.00	0.00	1	1	2014-12-02 14:49:32	2014-12-02 14:55:58
764	160	3	5	15	75.00	0.00	0.00	1	1	2014-12-02 14:49:32	2014-12-02 14:55:58
765	160	4	10	15	75.00	0.00	0.00	1	1	2014-12-02 14:49:32	2014-12-02 14:55:58
766	160	32	5	15	75.00	0.00	0.00	1	1	2014-12-02 14:49:32	2014-12-02 14:55:58
767	160	5	1	1	3750.00	0.00	0.00	1	1	2014-12-02 14:49:32	2014-12-02 14:55:58
768	160	7	1	1	500.00	0.00	0.00	6	2.9000001	2014-12-02 14:49:32	2014-12-02 14:55:58
769	160	16	5	1	500.00	0.00	0.00	3	1	2014-12-02 14:49:32	2014-12-02 14:55:58
770	160	18	1	1	500.00	0.00	0.00	4	3	2014-12-02 14:49:32	2014-12-02 14:55:58
771	160	9	20000	1	0.55	0.00	0.00	1	1	2014-12-02 14:49:32	2014-12-02 14:55:58
772	160	10	1000	3	1.00	0.00	0.00	1	1	2014-12-02 14:49:32	2014-12-02 14:55:58
773	160	14	20	1	125.00	0.00	0.00	1	1	2014-12-02 14:49:32	2014-12-02 14:55:58
774	160	35	1	2	1437.50	0.00	0.00	1	1	2014-12-02 14:49:32	2014-12-02 14:55:58
775	161	1	6	15	75.00	0.00	0.00	1	1	2014-12-02 15:28:47	2014-12-02 15:34:49
776	161	4	10	15	75.00	0.00	0.00	1	1	2014-12-02 15:28:47	2014-12-02 15:34:49
777	161	5	1	2	3750.00	0.00	0.00	1	1	2014-12-02 15:28:47	2014-12-02 15:34:49
778	161	7	2	1	500.00	0.00	0.00	6	2.9000001	2014-12-02 15:28:47	2014-12-02 15:34:49
779	161	16	5	1	500.00	0.00	0.00	3	1	2014-12-02 15:28:47	2014-12-02 15:34:49
780	161	18	2	1	500.00	0.00	0.00	4	3	2014-12-02 15:28:47	2014-12-02 15:34:49
781	161	9	20000	1	0.55	0.00	0.00	1	1	2014-12-02 15:28:47	2014-12-02 15:34:49
782	161	10	5000	1	1.00	0.00	0.00	1	1	2014-12-02 15:28:47	2014-12-02 15:34:49
783	161	31	1	1	10000.00	0.00	0.00	1	1	2014-12-02 15:28:47	2014-12-02 15:34:49
784	161	35	1	2	1437.50	0.00	0.00	1	1	2014-12-02 15:28:47	2014-12-02 15:34:49
800	165	16	3	1	500.00	0.00	0.00	3	1	2014-12-04 10:53:44	2014-12-04 10:55:57
801	165	9	10000	1	0.55	0.00	0.00	1	1	2014-12-04 10:53:45	2014-12-04 10:55:57
802	165	12	1	1	20000.00	0.00	0.00	1	1	2014-12-04 10:53:45	2014-12-04 10:55:57
803	165	14	20	1	125.00	0.00	0.00	1	1	2014-12-04 10:53:45	2014-12-04 10:55:57
810	167	2	4	15	75.00	0.00	0.00	1	1	2014-12-09 15:04:46	2014-12-09 15:10:09
809	167	1	4	15	75.00	0.00	0.00	1	1	2014-12-09 15:04:46	2014-12-09 15:10:09
806	166	9	10000	1	0.55	0.00	0.00	1	1	2014-12-04 11:11:37	2014-12-08 14:23:14
807	166	12	1	1	20000.00	0.00	0.00	1	1	2014-12-04 11:11:37	2014-12-04 11:12:21
811	167	3	4	15	75.00	0.00	0.00	1	1	2014-12-09 15:04:46	2014-12-09 15:10:09
812	167	4	8	15	75.00	0.00	0.00	1	1	2014-12-09 15:04:46	2014-12-09 15:10:09
813	167	5	1	1	3750.00	0.00	0.00	1	1	2014-12-09 15:04:46	2014-12-09 15:10:09
814	167	8	1	1	500.00	0.00	0.00	3	2	2014-12-09 15:04:46	2014-12-09 15:10:09
815	167	16	4	1	500.00	0.00	0.00	3	1	2014-12-09 15:04:46	2014-12-09 15:10:09
816	167	18	2	1	500.00	0.00	0.00	4	3	2014-12-09 15:04:46	2014-12-09 15:10:09
817	167	9	5000	1	0.55	0.00	0.00	1	1	2014-12-09 15:04:46	2014-12-09 15:10:09
818	167	10	2000	1	1.00	0.00	0.00	1	1	2014-12-09 15:04:46	2014-12-09 15:10:09
819	167	14	20	1	125.00	0.00	0.00	1	1	2014-12-09 15:04:46	2014-12-09 15:10:09
821	168	2	4	10	75.00	0.00	0.00	1	1	2014-12-10 16:36:35	2014-12-10 16:38:52
822	168	3	4	10	75.00	0.00	0.00	1	1	2014-12-10 16:36:35	2014-12-10 16:38:52
823	168	4	8	10	75.00	0.00	0.00	1	1	2014-12-10 16:36:35	2014-12-10 16:38:52
824	168	7	4	1	500.00	0.00	0.00	6	2.9000001	2014-12-10 16:36:35	2014-12-10 16:38:52
825	168	16	3	1	500.00	0.00	0.00	3	1	2014-12-10 16:36:35	2014-12-10 16:38:52
826	168	18	2	1	500.00	0.00	0.00	4	3	2014-12-10 16:36:35	2014-12-10 16:38:52
827	168	9	50000	1	0.55	0.00	0.00	1	1	2014-12-10 16:36:35	2014-12-10 16:38:52
828	168	10	2000	1	1.00	0.00	0.00	1	1	2014-12-10 16:36:35	2014-12-10 16:38:52
829	168	35	1	1	1437.50	0.00	0.00	1	1	2014-12-10 16:36:35	2014-12-10 16:38:52
830	169	14	20	1	125.00	0.00	0.00	1	1	2014-12-16 09:49:34	2014-12-16 09:53:42
840	171	9	5000	1	0.55	0.00	0.00	1	1	2014-12-16 16:55:38	2014-12-16 16:57:18
839	171	16	5	1	500.00	0.00	0.00	3	1	2014-12-16 16:55:38	2014-12-16 16:57:18
838	171	8	1	1	500.00	0.00	0.00	3	2	2014-12-16 16:55:38	2014-12-16 16:57:18
837	171	32	4	10	75.00	0.00	0.00	1	1	2014-12-16 16:55:38	2014-12-16 16:57:18
836	171	4	8	10	75.00	0.00	0.00	1	1	2014-12-16 16:55:38	2014-12-16 16:57:18
841	171	10	2000	1	1.00	0.00	0.00	1	1	2014-12-16 16:55:38	2014-12-16 16:57:18
842	171	35	1	1	1437.50	0.00	0.00	1	1	2014-12-16 16:55:38	2014-12-16 16:57:18
843	172	14	20	1	125.00	0.00	0.00	1	1	2014-12-19 12:07:43	2014-12-19 12:07:56
844	173	4	8	5	75.00	0.00	0.00	1	1	2014-12-22 11:55:33	2014-12-22 11:55:55
845	174	1	4	15	75.00	0.00	0.00	1	1	2015-01-05 12:06:11	2015-01-05 12:07:33
846	174	2	4	15	75.00	0.00	0.00	1	1	2015-01-05 12:06:11	2015-01-05 12:07:33
847	174	3	4	15	75.00	0.00	0.00	1	1	2015-01-05 12:06:11	2015-01-05 12:07:33
848	174	4	8	15	75.00	0.00	0.00	1	1	2015-01-05 12:06:11	2015-01-05 12:07:33
849	174	8	1	1	500.00	0.00	0.00	3	2	2015-01-05 12:06:11	2015-01-05 12:07:33
850	174	16	3	1	500.00	0.00	0.00	3	1	2015-01-05 12:06:11	2015-01-05 12:07:33
851	174	9	5000	1	0.55	0.00	0.00	1	1	2015-01-05 12:06:11	2015-01-05 12:07:33
852	174	10	2000	1	1.00	0.00	0.00	1	1	2015-01-05 12:06:11	2015-01-05 12:07:33
853	174	14	10	1	125.00	0.00	0.00	1	1	2015-01-05 12:06:11	2015-01-05 12:07:33
1594	305	4	10	1	75.00	0.00	0.00	1	1	2015-10-15 12:56:09	2015-10-15 12:59:25
855	176	4	8	10	75.00	0.00	0.00	1	1	2015-01-08 10:41:56	2015-01-08 10:42:52
856	176	8	1	1	500.00	0.00	0.00	3	2	2015-01-08 10:41:56	2015-01-08 10:42:52
857	176	16	2	1	500.00	0.00	0.00	3	1	2015-01-08 10:41:56	2015-01-08 10:42:52
858	176	10	1000	1	1.00	0.00	0.00	1	1	2015-01-08 10:41:56	2015-01-08 10:42:52
859	176	12	1	1	20000.00	0.00	0.00	1	1	2015-01-08 10:41:56	2015-01-08 10:42:52
860	176	25	1	1	10000.00	0.00	0.00	1	1	2015-01-08 10:41:56	2015-01-08 10:42:52
1526	290	10	1000	1	1.00	0.00	0.00	1	1	2015-09-10 15:19:24	2015-09-10 15:20:20
1579	298	1	5	15	75.00	0.00	0.00	1	1	2015-10-06 15:52:53	2015-10-06 15:54:00
1524	290	16	3	1	500.00	0.00	0.00	3	1	2015-09-10 15:19:24	2015-09-10 15:20:20
1523	290	8	1	1	500.00	0.00	0.00	3	2	2015-09-10 15:19:24	2015-09-10 15:20:20
1522	290	4	5	15	75.00	0.00	0.00	1	1	2015-09-10 15:19:24	2015-09-10 15:20:20
1586	298	10	1000	1	1.00	0.00	0.00	1	1	2015-10-06 15:52:53	2015-10-06 15:54:00
1585	298	9	10000	1	0.55	0.00	0.00	1	1	2015-10-06 15:52:53	2015-10-06 15:54:00
868	174	12	1	1	20000.00	0.00	0.00	1	1	2015-01-08 13:59:24	2015-01-08 13:59:24
1584	298	16	4	1	500.00	0.00	0.00	3	1	2015-10-06 15:52:53	2015-10-06 15:54:00
1583	298	8	1	1	500.00	0.00	0.00	3	2	2015-10-06 15:52:53	2015-10-06 15:54:00
1582	298	4	8	15	75.00	0.00	0.00	1	1	2015-10-06 15:52:53	2015-10-06 15:54:00
1515	288	35	1	1	1437.50	0.00	0.00	1	1	2015-09-10 14:57:34	2015-09-10 14:58:35
1545	295	2	5	15	75.00	0.00	0.00	1	1	2015-09-29 16:29:22	2015-09-29 16:31:23
874	179	4	8	10	75.00	0.00	0.00	1	1	2015-01-13 13:31:50	2015-01-13 13:34:15
875	179	5	1	1	3750.00	0.00	0.00	1	1	2015-01-13 13:31:50	2015-01-13 13:34:15
876	179	8	1	1	500.00	0.00	0.00	3	2	2015-01-13 13:31:50	2015-01-13 13:34:15
877	179	16	3	1	500.00	0.00	0.00	3	1	2015-01-13 13:31:50	2015-01-13 13:34:15
878	179	18	2	1	500.00	0.00	0.00	4	3	2015-01-13 13:31:50	2015-01-13 13:34:15
879	179	9	10000	1	0.55	0.00	0.00	1	1	2015-01-13 13:31:50	2015-01-13 13:34:15
880	179	10	4000	1	1.00	0.00	0.00	1	1	2015-01-13 13:31:50	2015-01-13 13:34:15
881	179	12	1	1	20000.00	0.00	0.00	1	1	2015-01-13 13:31:50	2015-01-13 13:34:15
882	179	14	20	1	125.00	0.00	0.00	1	1	2015-01-13 13:31:50	2015-01-13 13:34:15
883	179	35	1	1	1437.50	0.00	0.00	1	1	2015-01-13 13:31:50	2015-01-13 13:34:15
884	180	4	8	10	75.00	0.00	0.00	1	1	2015-01-13 13:45:31	2015-01-13 13:46:30
885	180	8	1	1	500.00	0.00	0.00	3	2	2015-01-13 13:45:31	2015-01-13 13:46:30
886	180	16	2	1	500.00	0.00	0.00	3	1	2015-01-13 13:45:31	2015-01-13 13:46:30
887	180	9	5000	1	0.55	0.00	0.00	1	1	2015-01-13 13:45:31	2015-01-13 13:46:30
888	180	10	2000	1	1.00	0.00	0.00	1	1	2015-01-13 13:45:31	2015-01-13 13:46:30
889	180	12	1	1	20000.00	0.00	0.00	1	1	2015-01-13 13:45:31	2015-01-13 13:46:30
1478	282	4	10	15	75.00	0.00	0.00	1	1	2015-08-24 15:33:16	2015-09-09 11:34:25
891	184	4	8	10	75.00	0.00	0.00	1	1	2015-01-14 12:36:22	2015-01-14 12:37:25
892	184	8	1	1	500.00	0.00	0.00	3	2	2015-01-14 12:36:22	2015-01-14 12:37:25
893	184	16	2	1	500.00	0.00	0.00	3	1	2015-01-14 12:36:22	2015-01-14 12:37:25
894	184	9	5000	1	0.55	0.00	0.00	1	1	2015-01-14 12:36:22	2015-01-14 12:37:25
895	184	10	2000	1	1.00	0.00	0.00	1	1	2015-01-14 12:36:22	2015-01-14 12:37:25
896	184	12	1	1	20000.00	0.00	0.00	1	1	2015-01-14 12:36:22	2015-01-14 12:37:25
897	184	25	1	1	10000.00	0.00	0.00	1	1	2015-01-14 12:36:22	2015-01-14 12:37:25
898	185	4	8	15	75.00	0.00	0.00	1	1	2015-01-14 14:32:25	2015-01-14 14:33:40
899	185	8	1	1	500.00	0.00	0.00	3	2	2015-01-14 14:32:25	2015-01-14 14:33:40
900	185	16	2	1	500.00	0.00	0.00	3	1	2015-01-14 14:32:25	2015-01-14 14:33:40
901	185	9	5000	1	0.55	0.00	0.00	1	1	2015-01-14 14:32:25	2015-01-14 14:33:40
902	185	10	2000	1	1.00	0.00	0.00	1	1	2015-01-14 14:32:25	2015-01-14 14:33:40
903	185	14	10	1	125.00	0.00	0.00	1	1	2015-01-14 14:32:25	2015-01-16 12:30:41
904	186	4	10	13	75.00	0.00	0.00	1	1	2015-01-26 15:28:30	2015-01-27 11:57:55
905	186	8	1	1	500.00	0.00	0.00	3	2	2015-01-26 15:28:30	2015-01-26 15:30:28
906	186	16	4	1	500.00	0.00	0.00	3	1	2015-01-26 15:28:30	2015-01-27 11:42:24
907	186	9	20000	1	0.55	0.00	0.00	1	1	2015-01-26 15:28:30	2015-01-27 11:44:43
908	186	10	2000	1	1.00	0.00	0.00	1	1	2015-01-26 15:28:30	2015-01-26 15:30:28
909	186	12	1	1	20000.00	0.00	0.00	1	1	2015-01-26 15:28:30	2015-01-26 15:30:28
910	186	25	1	1	10000.00	0.00	0.00	1	1	2015-01-26 15:28:30	2015-01-26 15:30:28
911	186	31	1	1	10000.00	0.00	0.00	1	1	2015-01-26 15:28:30	2015-01-26 15:30:28
912	186	29	35000	1	1.00	0.00	0.00	1	1	2015-01-26 15:28:30	2015-01-26 15:30:28
913	186	35	1	1	1437.50	0.00	0.00	1	1	2015-01-26 15:28:30	2015-01-26 15:30:28
925	187	40	1	1	10000.00	0.00	0.00	1	1	2015-01-27 12:37:37	2015-01-27 12:37:37
915	187	5	1	1	3750.00	0.00	0.00	1	1	2015-01-26 16:46:54	2015-01-26 16:49:14
916	187	8	1	1	500.00	0.00	0.00	3	2	2015-01-26 16:46:54	2015-01-26 16:49:14
917	187	16	3	1	500.00	0.00	0.00	3	1	2015-01-26 16:46:54	2015-01-26 16:49:14
918	187	9	10000	1	0.55	0.00	0.00	1	1	2015-01-26 16:46:54	2015-01-26 16:49:14
919	187	10	5000	1	1.00	0.00	0.00	1	1	2015-01-26 16:46:54	2015-01-26 16:49:14
920	187	12	1	1	20000.00	0.00	0.00	1	1	2015-01-26 16:46:54	2015-01-26 16:49:14
921	187	25	1	1	10000.00	0.00	0.00	1	1	2015-01-26 16:46:54	2015-01-26 16:49:14
922	187	28	3	1	5000.00	0.00	0.00	1	1	2015-01-26 16:46:54	2015-01-27 12:33:38
923	187	30	1	1	20000.00	0.00	0.00	1	1	2015-01-26 16:46:54	2015-01-26 16:49:14
924	187	35	1	1	1437.50	0.00	0.00	1	1	2015-01-26 16:46:54	2015-01-26 16:49:14
926	188	1	4	15	75.00	0.00	0.00	1	1	2015-01-27 13:34:35	2015-01-27 13:37:10
927	188	2	4	15	75.00	0.00	0.00	1	1	2015-01-27 13:34:35	2015-01-27 13:37:10
928	188	3	4	15	75.00	0.00	0.00	1	1	2015-01-27 13:34:35	2015-01-27 13:37:10
929	188	4	8	15	75.00	0.00	0.00	1	1	2015-01-27 13:34:35	2015-01-27 13:37:10
930	188	32	4	15	75.00	0.00	0.00	1	1	2015-01-27 13:34:35	2015-01-27 13:37:10
931	188	8	1	1	500.00	0.00	0.00	3	2	2015-01-27 13:34:35	2015-01-27 13:37:10
932	188	16	4	1	500.00	0.00	0.00	3	1	2015-01-27 13:34:35	2015-01-27 13:37:10
933	188	18	2	1	500.00	0.00	0.00	4	3	2015-01-27 13:34:35	2015-01-27 13:37:10
934	188	9	40000	1	0.55	0.00	0.00	1	1	2015-01-27 13:34:35	2015-01-27 15:49:39
935	188	10	3000	1	1.00	0.00	0.00	1	1	2015-01-27 13:34:35	2015-01-27 13:37:10
936	188	12	1	1	20000.00	0.00	0.00	1	1	2015-01-27 13:34:35	2015-01-27 13:37:10
937	188	31	1	1	10000.00	0.00	0.00	1	1	2015-01-27 13:34:35	2015-01-27 13:37:10
938	188	29	100000	1	1.00	0.00	0.00	1	1	2015-01-27 13:34:36	2015-01-27 13:37:10
939	188	35	1	2	1437.50	0.00	0.00	1	1	2015-01-27 13:34:36	2015-01-27 15:49:28
950	189	31	1	1	10000.00	0.00	0.00	1	1	2015-01-27 17:23:46	2015-01-27 17:23:46
941	189	4	10	15	75.00	0.00	0.00	1	1	2015-01-27 13:45:52	2015-01-27 17:22:55
942	189	41	1	1	500.00	0.00	0.00	6	3	2015-01-27 13:45:52	2015-01-27 17:22:48
943	189	16	2	1	500.00	0.00	0.00	3	1	2015-01-27 13:45:52	2015-01-27 13:47:07
944	189	9	30000	1	0.55	0.00	0.00	1	1	2015-01-27 13:45:52	2015-01-27 17:23:08
945	189	10	3000	1	1.00	0.00	0.00	1	1	2015-01-27 13:45:52	2015-01-27 13:47:07
946	189	12	1	1	20000.00	0.00	0.00	1	1	2015-01-27 13:45:52	2015-01-27 13:47:07
947	189	35	1	2	1437.50	0.00	0.00	1	1	2015-01-27 13:45:52	2015-01-27 17:23:55
1510	288	8	1	1	500.00	0.00	0.00	3	2	2015-09-10 14:57:34	2015-09-10 14:58:35
1365	253	4	8	15	75.00	0.00	0.00	1	1	2015-05-11 10:08:24	2015-05-11 10:08:58
1617	307	4	8	15	75.00	0.00	0.00	1	1	2015-10-20 10:19:30	2015-10-20 10:19:46
953	188	7	2	1	500.00	0.00	0.00	6	2.9000001	2015-02-02 11:19:38	2015-02-02 11:19:38
955	192	4	8	14	75.00	0.00	0.00	1	1	2015-02-03 16:33:06	2015-02-03 16:33:35
956	192	9	5000	1	0.55	0.00	0.00	1	1	2015-02-03 16:33:06	2015-02-03 16:33:35
957	193	1	5	15	75.00	0.00	0.00	1	1	2015-02-03 17:36:27	2015-02-03 17:39:39
958	193	2	5	15	75.00	0.00	0.00	1	1	2015-02-03 17:36:27	2015-02-03 17:39:39
959	193	3	5	15	75.00	0.00	0.00	1	1	2015-02-03 17:36:27	2015-02-03 17:39:39
960	193	4	10	15	75.00	0.00	0.00	1	1	2015-02-03 17:36:27	2015-02-03 17:39:39
961	193	32	5	1	75.00	0.00	0.00	1	1	2015-02-03 17:36:27	2015-02-03 17:39:39
962	193	5	1	2	3750.00	0.00	0.00	1	1	2015-02-03 17:36:27	2015-02-03 17:39:39
963	193	6	1	10	1416.00	0.00	0.00	1	1	2015-02-03 17:36:27	2015-02-03 17:39:39
964	193	7	6	1	500.00	0.00	0.00	6	2.9000001	2015-02-03 17:36:27	2015-02-03 17:39:39
965	193	16	10	1	500.00	0.00	0.00	3	1	2015-02-03 17:36:27	2015-02-03 17:39:39
966	193	18	6	1	500.00	0.00	0.00	4	3	2015-02-03 17:36:27	2015-02-03 17:39:39
967	193	41	1	1	500.00	0.00	0.00	6	3	2015-02-03 17:36:27	2015-02-03 17:39:39
968	193	9	25000	2	0.55	0.00	0.00	1	1	2015-02-03 17:36:27	2015-02-03 17:39:39
969	193	10	5000	1	1.00	0.00	0.00	1	1	2015-02-03 17:36:27	2015-02-03 17:39:39
970	193	30	1	1	20000.00	0.00	0.00	1	1	2015-02-03 17:36:27	2015-02-03 17:39:39
971	193	29	100000	1	1.00	0.00	0.00	1	1	2015-02-03 17:36:27	2015-02-03 17:39:39
972	193	35	1	2	1437.50	0.00	0.00	1	1	2015-02-03 17:36:27	2015-02-03 17:39:39
1513	288	10	1000	1	1.00	0.00	0.00	1	1	2015-09-10 14:57:34	2015-09-10 14:58:35
1009	200	8	1	1	500.00	0.00	0.00	3	2	2015-02-10 17:06:06	2015-02-10 17:06:25
1512	288	9	5000	1	0.55	0.00	0.00	1	1	2015-09-10 14:57:34	2015-09-10 14:58:35
976	195	4	10	15	75.00	0.00	0.00	1	1	2015-02-04 10:57:18	2015-02-04 15:32:40
977	195	9	10000	1	0.55	0.00	0.00	1	1	2015-02-04 10:57:18	2015-02-04 15:32:24
978	195	10	2000	1	1.00	0.00	0.00	1	1	2015-02-04 10:57:18	2015-02-04 10:59:06
979	195	12	1	1	20000.00	0.00	0.00	1	1	2015-02-04 10:57:18	2015-02-04 10:59:06
980	195	25	1	1	10000.00	0.00	0.00	1	1	2015-02-04 10:57:18	2015-02-04 10:59:06
981	195	31	1	1	10000.00	0.00	0.00	1	1	2015-02-04 10:57:18	2015-02-04 15:32:53
982	195	14	20	1	125.00	0.00	0.00	1	1	2015-02-04 10:57:18	2015-02-04 15:33:01
983	195	35	1	2	1437.50	0.00	0.00	1	1	2015-02-04 10:57:18	2015-02-04 15:33:45
984	196	4	8	10	75.00	0.00	0.00	1	1	2015-02-04 11:32:35	2015-02-04 11:33:16
985	196	8	1	1	500.00	0.00	0.00	3	2	2015-02-04 11:32:35	2015-02-04 11:33:16
986	196	16	2	1	500.00	0.00	0.00	3	1	2015-02-04 11:32:35	2015-02-04 11:33:16
987	196	9	5000	1	0.55	0.00	0.00	1	1	2015-02-04 11:32:35	2015-02-04 11:33:16
988	196	10	2000	1	1.00	0.00	0.00	1	1	2015-02-04 11:32:35	2015-02-04 11:33:16
989	196	12	1	1	20000.00	0.00	0.00	1	1	2015-02-04 11:32:35	2015-02-04 11:33:16
990	196	25	1	1	10000.00	0.00	0.00	1	1	2015-02-04 11:32:35	2015-02-04 11:33:16
991	196	31	1	1	10000.00	0.00	0.00	1	1	2015-02-04 11:32:35	2015-02-04 11:33:16
1038	204	16	3	1	500.00	0.00	0.00	3	1	2015-03-02 12:21:11	2015-03-02 15:41:34
1037	204	8	1	1	500.00	0.00	0.00	3	2	2015-03-02 12:21:11	2015-03-02 12:22:18
1036	204	4	8	15	75.00	0.00	0.00	1	1	2015-03-02 12:21:11	2015-03-02 12:22:18
995	197	4	8	15	75.00	0.00	0.00	1	1	2015-02-09 17:07:45	2015-02-09 17:10:12
996	197	8	1	1	500.00	0.00	0.00	3	2	2015-02-09 17:07:45	2015-02-09 17:10:12
997	197	16	2	1	500.00	0.00	0.00	3	1	2015-02-09 17:07:45	2015-02-09 17:10:12
998	197	9	5000	1	0.55	0.00	0.00	1	1	2015-02-09 17:07:45	2015-02-09 17:10:12
999	197	10	2000	1	1.00	0.00	0.00	1	1	2015-02-09 17:07:45	2015-02-09 17:10:12
1000	197	14	20	1	125.00	0.00	0.00	1	1	2015-02-09 17:07:45	2015-02-09 17:10:12
1001	197	35	1	1	1437.50	0.00	0.00	1	1	2015-02-09 17:07:45	2015-02-09 17:10:12
1495	283	31	1	1	10000.00	0.00	0.00	1	1	2015-08-24 16:14:43	2015-08-24 16:17:36
1003	199	4	10	10	75.00	0.00	0.00	1	1	2015-02-10 16:35:43	2015-02-10 16:51:40
1004	199	9	10000	1	0.55	0.00	0.00	1	1	2015-02-10 16:35:43	2015-02-10 16:36:20
1005	199	10	2000	1	1.00	0.00	0.00	1	1	2015-02-10 16:35:43	2015-02-10 16:36:20
1010	200	12	1	2	20000.00	0.00	0.00	1	1	2015-02-10 17:06:06	2015-02-10 17:08:16
1511	288	16	2	1	500.00	0.00	0.00	3	1	2015-09-10 14:57:34	2015-09-10 14:58:35
1011	200	25	1	2	10000.00	0.00	0.00	1	1	2015-02-10 17:06:06	2015-02-10 17:08:23
1494	283	12	1	1	20000.00	0.00	0.00	1	1	2015-08-24 16:14:43	2015-08-24 16:17:36
1096	214	12	1	1	20000.00	0.00	0.00	1	1	2015-03-12 10:48:32	2015-03-12 10:48:42
1076	210	10	2000	1	1.00	0.00	0.00	1	1	2015-03-04 12:34:14	2015-03-04 12:35:24
1075	210	9	10000	1	0.55	0.00	0.00	1	1	2015-03-04 12:34:14	2015-03-04 12:35:24
1074	210	16	4	1	500.00	0.00	0.00	3	1	2015-03-04 12:34:14	2015-03-09 15:27:55
1071	209	35	1	1	1437.50	0.00	0.00	1	1	2015-03-03 13:24:29	2015-03-03 13:26:18
1070	209	14	10	1	125.00	0.00	0.00	1	1	2015-03-03 13:24:29	2015-03-03 13:26:18
1069	209	10	2000	1	1.00	0.00	0.00	1	1	2015-03-03 13:24:29	2015-03-03 13:26:18
1068	209	9	10000	1	0.55	0.00	0.00	1	1	2015-03-03 13:24:29	2015-03-03 13:26:18
1067	209	16	4	1	500.00	0.00	0.00	3	1	2015-03-03 13:24:29	2015-03-03 13:40:52
1066	209	8	1	1	500.00	0.00	0.00	3	2	2015-03-03 13:24:29	2015-03-03 13:26:18
1065	209	4	10	15	75.00	0.00	0.00	1	1	2015-03-03 13:24:29	2015-03-03 13:41:06
1087	212	8	1	1	500.00	0.00	0.00	3	2	2015-03-10 15:38:20	2015-03-10 15:38:55
1086	212	4	8	15	75.00	0.00	0.00	1	1	2015-03-10 15:38:20	2015-03-10 15:38:55
1085	211	22	50	1	500.00	0.00	0.00	0.300000012	0.209999993	2015-03-10 15:36:26	2015-03-10 15:36:26
1027	203	4	8	15	75.00	0.00	0.00	1	1	2015-02-16 12:33:30	2015-02-16 12:35:24
1028	203	8	1	1	500.00	0.00	0.00	3	2	2015-02-16 12:33:30	2015-02-16 12:35:24
1029	203	16	2	1	500.00	0.00	0.00	3	1	2015-02-16 12:33:30	2015-02-16 12:35:24
1030	203	9	5000	1	0.55	0.00	0.00	1	1	2015-02-16 12:33:30	2015-02-16 12:35:24
1031	203	10	2000	1	1.00	0.00	0.00	1	1	2015-02-16 12:33:30	2015-02-16 12:35:24
1032	203	12	1	1	20000.00	0.00	0.00	1	1	2015-02-16 12:33:30	2015-02-16 12:35:24
1089	212	10	2000	1	1.00	0.00	0.00	1	1	2015-03-10 15:38:20	2015-03-10 15:38:55
1088	212	16	4	1	500.00	0.00	0.00	3	1	2015-03-10 15:38:20	2015-03-10 15:38:55
1035	203	35	1	1	1437.50	0.00	0.00	1	1	2015-02-16 12:33:30	2015-02-16 12:35:24
1039	204	9	10000	1	0.55	0.00	0.00	1	1	2015-03-02 12:21:11	2015-03-02 12:22:18
1040	204	12	1	1	20000.00	0.00	0.00	1	1	2015-03-02 12:21:11	2015-03-02 12:22:18
1041	205	4	8	10	75.00	0.00	0.00	1	1	2015-03-02 16:06:20	2015-03-02 16:07:21
1042	205	8	1	1	500.00	0.00	0.00	3	2	2015-03-02 16:06:20	2015-03-02 16:07:21
1043	205	16	2	1	500.00	0.00	0.00	3	1	2015-03-02 16:06:20	2015-03-02 16:07:21
1044	205	9	5000	1	0.55	0.00	0.00	1	1	2015-03-02 16:06:20	2015-03-02 16:07:21
1045	205	10	1000	1	1.00	0.00	0.00	1	1	2015-03-02 16:06:20	2015-03-02 16:07:21
1509	288	4	8	15	75.00	0.00	0.00	1	1	2015-09-10 14:57:34	2015-09-10 14:58:35
1606	306	2	5	15	75.00	0.00	0.00	1	1	2015-10-15 13:08:06	2015-10-15 13:09:47
1505	285	12	1	1	20000.00	0.00	0.00	1	1	2015-09-01 11:30:05	2015-09-01 11:31:10
1050	207	4	8	15	75.00	0.00	0.00	1	1	2015-03-02 16:45:42	2015-03-02 16:46:57
1051	207	8	1	1	500.00	0.00	0.00	3	2	2015-03-02 16:45:42	2015-03-02 16:46:57
1052	207	16	4	1	500.00	0.00	0.00	3	1	2015-03-02 16:45:42	2015-03-10 16:34:58
1053	207	9	10000	1	0.55	0.00	0.00	1	1	2015-03-02 16:45:42	2015-03-02 16:46:57
1054	207	10	2000	1	1.00	0.00	0.00	1	1	2015-03-02 16:45:42	2015-03-02 16:46:57
1055	207	12	1	1	20000.00	0.00	0.00	1	1	2015-03-02 16:45:42	2015-03-02 16:46:57
1056	207	35	1	1	1437.50	0.00	0.00	1	1	2015-03-02 16:45:42	2015-03-02 16:46:57
1057	208	4	8	10	75.00	0.00	0.00	1	1	2015-03-03 11:18:57	2015-03-03 11:20:39
1058	208	8	1	1	500.00	0.00	0.00	3	2	2015-03-03 11:18:57	2015-03-03 11:20:39
1059	208	16	3	1	500.00	0.00	0.00	3	1	2015-03-03 11:18:57	2015-03-03 11:20:39
1060	208	9	5000	1	0.55	0.00	0.00	1	1	2015-03-03 11:18:57	2015-03-03 11:20:39
1061	208	10	2000	1	1.00	0.00	0.00	1	1	2015-03-03 11:18:57	2015-03-03 11:20:39
1062	208	12	1	1	20000.00	0.00	0.00	1	1	2015-03-03 11:18:57	2015-03-03 11:20:39
1073	210	8	1	1	500.00	0.00	0.00	3	2	2015-03-04 12:34:14	2015-03-04 12:35:24
1072	210	4	10	15	75.00	0.00	0.00	1	1	2015-03-04 12:34:14	2015-03-09 15:28:07
1078	210	35	1	1	1437.50	0.00	0.00	1	1	2015-03-04 12:34:14	2015-03-04 12:35:24
1079	211	4	8	15	75.00	0.00	0.00	1	1	2015-03-04 12:44:06	2015-03-04 12:45:03
1080	211	8	2	1	500.00	0.00	0.00	3	2	2015-03-04 12:44:06	2015-03-10 15:34:33
1081	211	16	5	1	500.00	0.00	0.00	3	1	2015-03-04 12:44:06	2015-03-10 15:35:51
1082	211	9	10000	1	0.55	0.00	0.00	1	1	2015-03-04 12:44:06	2015-03-04 12:45:03
1083	211	10	2000	1	1.00	0.00	0.00	1	1	2015-03-04 12:44:06	2015-03-04 12:45:03
1084	211	35	1	1	1437.50	0.00	0.00	1	1	2015-03-04 12:44:06	2015-03-04 12:45:03
1090	212	14	10	1	125.00	0.00	0.00	1	1	2015-03-10 15:38:20	2015-03-10 15:38:55
1209	229	12	1	1	20000.00	0.00	0.00	1	1	2015-04-08 10:31:09	2015-04-08 10:32:03
1201	227	4	6	15	75.00	0.00	0.00	1	1	2015-03-25 12:52:12	2015-03-25 12:52:12
1200	227	10	1000	1	1.00	0.00	0.00	1	1	2015-03-25 11:18:33	2015-03-25 11:18:33
1199	227	16	4	1	500.00	0.00	0.00	3	1	2015-03-25 10:32:28	2015-03-25 12:51:29
1198	226	12	1	1	20000.00	0.00	0.00	1	1	2015-03-25 10:13:53	2015-03-25 10:14:02
1344	250	10	1000	1	1.00	0.00	0.00	1	1	2015-05-07 15:48:29	2015-05-07 15:50:01
1343	250	9	20000	1	0.55	0.00	0.00	1	1	2015-05-07 15:48:29	2015-05-07 15:50:01
1246	236	12	1	1	20000.00	0.00	0.00	1	1	2015-04-17 13:06:12	2015-04-17 13:06:18
1100	215	4	10	15	75.00	0.00	0.00	1	1	2015-03-12 10:54:55	2015-04-17 12:17:30
1245	215	12	1	1	20000.00	0.00	0.00	1	1	2015-04-17 12:16:10	2015-04-17 12:16:10
1102	215	8	1	1	500.00	0.00	0.00	3	2	2015-03-12 10:54:56	2015-03-12 10:57:31
1103	215	16	4	1	500.00	0.00	0.00	3	1	2015-03-12 10:54:56	2015-04-17 12:15:04
1104	215	9	10000	1	0.55	0.00	0.00	1	1	2015-03-12 10:54:56	2015-03-12 10:57:31
1105	215	10	1000	1	1.00	0.00	0.00	1	1	2015-03-12 10:54:56	2015-04-17 12:15:23
1106	215	35	1	1	1437.50	0.00	0.00	1	1	2015-03-12 10:54:56	2015-03-12 10:57:31
1107	216	4	8	15	75.00	0.00	0.00	1	1	2015-03-12 13:08:09	2015-03-12 13:09:32
1108	216	8	1	1	500.00	0.00	0.00	3	2	2015-03-12 13:08:09	2015-03-12 13:09:32
1109	216	16	4	1	500.00	0.00	0.00	3	1	2015-03-12 13:08:09	2015-03-16 16:40:06
1110	216	9	10000	1	0.55	0.00	0.00	1	1	2015-03-12 13:08:09	2015-03-12 13:09:32
1111	216	10	2000	1	1.00	0.00	0.00	1	1	2015-03-12 13:08:09	2015-03-12 13:09:32
1154	221	8	1	1	500.00	0.00	0.00	3	2	2015-03-17 12:20:01	2015-03-17 12:21:12
1113	216	35	1	1	1437.50	0.00	0.00	1	1	2015-03-12 13:08:09	2015-03-12 13:09:32
1208	229	10	1000	1	1.00	0.00	0.00	1	1	2015-04-08 10:31:09	2015-04-08 13:12:59
1207	229	8	1	1	500.00	0.00	0.00	3	2	2015-04-08 10:31:09	2015-04-08 12:56:07
1206	220	7	1	1	500.00	0.00	0.00	6	2.9000001	2015-04-01 13:43:17	2015-04-01 13:43:17
1205	228	9	10000	1	0.55	0.00	0.00	1	1	2015-03-27 14:58:57	2015-03-27 14:59:30
1204	228	16	3	1	500.00	0.00	0.00	3	1	2015-03-27 14:58:57	2015-03-27 14:59:30
1203	228	8	1	1	500.00	0.00	0.00	3	2	2015-03-27 14:58:57	2015-03-27 14:59:30
1202	228	4	8	5	75.00	0.00	0.00	1	1	2015-03-27 14:58:57	2015-03-27 14:59:30
1121	218	4	10	15	75.00	0.00	0.00	1	1	2015-03-12 13:26:13	2015-03-16 16:53:50
1122	218	8	1	1	500.00	0.00	0.00	3	2	2015-03-12 13:26:13	2015-03-12 13:27:54
1123	218	16	5	1	500.00	0.00	0.00	3	1	2015-03-12 13:26:13	2015-03-16 16:53:33
1124	218	9	20000	1	0.55	0.00	0.00	1	1	2015-03-12 13:26:13	2015-03-16 16:54:11
1125	218	10	2000	1	1.00	0.00	0.00	1	1	2015-03-12 13:26:13	2015-03-12 13:27:54
1153	221	4	10	15	75.00	0.00	0.00	1	1	2015-03-17 12:20:01	2015-03-17 14:33:52
1152	218	13	100	1	500.00	0.00	0.00	0.150000006	0.209999993	2015-03-16 16:55:43	2015-03-16 16:55:43
1128	218	35	1	1	1437.50	0.00	0.00	1	1	2015-03-12 13:26:13	2015-03-12 13:27:54
1129	219	4	10	15	75.00	0.00	0.00	1	1	2015-03-16 11:57:24	2015-03-24 10:31:40
1130	219	5	1	1	3750.00	0.00	0.00	1	1	2015-03-16 11:57:24	2015-03-16 11:59:59
1131	219	7	2	1	500.00	0.00	0.00	6	2.9000001	2015-03-16 11:57:24	2015-03-16 11:59:59
1132	219	8	1	1	500.00	0.00	0.00	3	2	2015-03-16 11:57:24	2015-03-16 11:59:59
1133	219	16	4	1	500.00	0.00	0.00	3	1	2015-03-16 11:57:24	2015-03-16 11:59:59
1134	219	18	2	1	500.00	0.00	0.00	4	3	2015-03-16 11:57:24	2015-03-16 11:59:59
1135	219	9	10000	1	0.55	0.00	0.00	1	1	2015-03-16 11:57:24	2015-03-16 11:59:59
1136	219	10	3000	1	1.00	0.00	0.00	1	1	2015-03-16 11:57:24	2015-03-25 11:12:19
1137	219	12	1	1	20000.00	0.00	0.00	1	1	2015-03-16 11:57:24	2015-03-16 12:00:00
1138	219	29	75000	1	1.00	0.00	0.00	1	1	2015-03-16 11:57:24	2015-03-25 10:45:50
1139	219	35	1	1	1437.50	0.00	0.00	1	1	2015-03-16 11:57:24	2015-03-16 12:00:00
1140	220	4	10	15	75.00	0.00	0.00	1	1	2015-03-16 13:31:55	2015-03-24 10:29:57
1141	220	8	1	1	500.00	0.00	0.00	3	2	2015-03-16 13:31:56	2015-03-16 13:33:17
1142	220	16	5	1	500.00	0.00	0.00	3	1	2015-03-16 13:31:56	2015-03-24 10:29:44
1143	220	9	10000	1	0.55	0.00	0.00	1	1	2015-03-16 13:31:56	2015-03-16 13:33:17
1144	220	10	2000	1	1.00	0.00	0.00	1	1	2015-03-16 13:31:56	2015-03-16 13:33:17
1145	220	12	1	1	20000.00	0.00	0.00	1	1	2015-03-16 13:31:56	2015-03-16 13:33:17
1146	220	30	1	1	20000.00	0.00	0.00	1	1	2015-03-16 13:31:56	2015-03-16 13:33:17
1191	225	4	8	15	75.00	0.00	0.00	1	1	2015-03-24 11:40:00	2015-03-24 11:43:02
1148	220	14	12	1	125.00	0.00	0.00	1	1	2015-03-16 13:31:56	2015-03-24 10:30:34
1149	220	35	1	1	1437.50	0.00	0.00	1	1	2015-03-16 13:31:56	2015-03-16 13:33:17
1150	214	10	1000	5	1.00	0.00	0.00	1	1	2015-03-16 16:20:55	2015-03-16 16:20:55
1151	214	25	1	1	10000.00	0.00	0.00	1	1	2015-03-16 16:25:41	2015-03-16 16:25:41
1155	221	16	6	1	500.00	0.00	0.00	3	1	2015-03-17 12:20:01	2015-03-17 14:34:53
1156	221	9	20000	1	0.55	0.00	0.00	1	1	2015-03-17 12:20:01	2015-03-17 14:34:02
1157	221	10	3000	1	1.00	0.00	0.00	1	1	2015-03-17 12:20:01	2015-03-17 14:34:12
1158	221	12	1	1	20000.00	0.00	0.00	1	1	2015-03-17 12:20:01	2015-03-17 12:21:12
1159	221	25	1	1	10000.00	0.00	0.00	1	1	2015-03-17 12:20:01	2015-03-17 12:21:12
1160	221	14	20	1	125.00	0.00	0.00	1	1	2015-03-17 12:20:01	2015-03-17 14:34:22
1161	221	35	1	1	1437.50	0.00	0.00	1	1	2015-03-17 12:20:01	2015-03-17 12:21:12
1162	221	5	1	2	3750.00	0.00	0.00	1	1	2015-03-17 12:27:42	2015-03-17 14:34:33
1163	221	18	2	1	500.00	0.00	0.00	4	3	2015-03-17 12:28:47	2015-03-18 10:53:17
1164	222	4	10	15	75.00	0.00	0.00	1	1	2015-03-19 11:18:51	2015-03-19 11:24:02
1165	222	5	1	1	3750.00	0.00	0.00	1	1	2015-03-19 11:18:51	2015-03-19 11:24:02
1166	222	8	1	1	500.00	0.00	0.00	3	2	2015-03-19 11:18:51	2015-03-19 11:24:02
1167	222	16	4	1	500.00	0.00	0.00	3	1	2015-03-19 11:18:51	2015-03-19 11:24:02
1185	224	4	8	15	75.00	0.00	0.00	1	1	2015-03-23 16:35:21	2015-03-23 16:36:37
1169	222	9	10000	1	0.55	0.00	0.00	1	1	2015-03-19 11:18:51	2015-03-19 11:24:02
1170	222	10	2000	1	1.00	0.00	0.00	1	1	2015-03-19 11:18:51	2015-03-19 11:24:02
1171	222	12	1	1	20000.00	0.00	0.00	1	1	2015-03-19 11:18:51	2015-03-19 11:24:02
1172	222	31	1	1	10000.00	0.00	0.00	1	1	2015-03-19 11:18:51	2015-03-19 11:24:02
1173	222	14	20	1	125.00	0.00	0.00	1	1	2015-03-19 11:18:51	2015-03-20 12:54:21
1174	222	35	1	1	1437.50	0.00	0.00	1	1	2015-03-19 11:18:51	2015-03-19 11:24:02
1175	223	4	10	15	75.00	0.00	0.00	1	1	2015-03-19 12:13:37	2015-03-19 12:14:59
1176	223	8	1	1	500.00	0.00	0.00	3	2	2015-03-19 12:13:37	2015-03-19 12:14:59
1177	223	16	4	1	500.00	0.00	0.00	3	1	2015-03-19 12:13:38	2015-03-19 12:14:59
1178	223	18	2	1	500.00	0.00	0.00	4	3	2015-03-19 12:13:38	2015-03-19 12:14:59
1179	223	9	10000	1	0.55	0.00	0.00	1	1	2015-03-19 12:13:38	2015-03-19 12:14:59
1180	223	10	1000	1	1.00	0.00	0.00	1	1	2015-03-19 12:13:38	2015-03-19 12:14:59
1181	223	12	1	1	20000.00	0.00	0.00	1	1	2015-03-19 12:13:38	2015-03-19 12:14:59
1182	223	25	1	1	10000.00	0.00	0.00	1	1	2015-03-19 12:13:38	2015-03-19 12:14:59
1183	223	31	1	1	10000.00	0.00	0.00	1	1	2015-03-19 12:13:38	2015-03-19 12:14:59
1184	223	35	1	1	1437.50	0.00	0.00	1	1	2015-03-19 12:13:38	2015-03-19 12:14:59
1186	224	8	1	1	500.00	0.00	0.00	3	2	2015-03-23 16:35:21	2015-03-23 16:36:37
1187	224	16	3	1	500.00	0.00	0.00	3	1	2015-03-23 16:35:21	2015-03-23 16:36:37
1188	224	9	5000	1	0.55	0.00	0.00	1	1	2015-03-23 16:35:21	2015-03-23 16:36:37
1189	224	10	1000	1	1.00	0.00	0.00	1	1	2015-03-23 16:35:21	2015-03-23 16:36:37
1190	224	35	1	1	1437.50	0.00	0.00	1	1	2015-03-23 16:35:21	2015-03-23 16:36:37
1192	225	8	1	1	500.00	0.00	0.00	3	2	2015-03-24 11:40:00	2015-03-24 11:41:05
1193	225	16	4	1	500.00	0.00	0.00	3	1	2015-03-24 11:40:00	2015-03-24 11:41:05
1194	225	9	10000	1	0.55	0.00	0.00	1	1	2015-03-24 11:40:00	2015-03-24 11:41:05
1195	225	10	2000	1	1.00	0.00	0.00	1	1	2015-03-24 11:40:00	2015-03-24 11:41:05
1196	225	12	1	1	20000.00	0.00	0.00	1	1	2015-03-24 11:40:00	2015-03-24 11:41:05
1197	225	35	1	1	1437.50	0.00	0.00	1	1	2015-03-24 11:40:00	2015-03-24 11:41:05
1210	230	4	8	15	75.00	0.00	0.00	1	1	2015-04-08 10:41:19	2015-04-08 10:42:32
1211	230	8	1	1	500.00	0.00	0.00	3	2	2015-04-08 10:41:19	2015-04-08 10:42:32
1212	230	16	4	1	500.00	0.00	0.00	3	1	2015-04-08 10:41:19	2015-04-08 10:42:32
1213	230	9	10000	1	0.55	0.00	0.00	1	1	2015-04-08 10:41:19	2015-04-08 10:42:32
1214	230	10	2000	1	1.00	0.00	0.00	1	1	2015-04-08 10:41:19	2015-04-08 10:42:32
1215	230	35	1	1	1437.50	0.00	0.00	1	1	2015-04-08 10:41:19	2015-04-08 10:42:32
1219	229	16	2	1	500.00	0.00	0.00	3	1	2015-04-08 12:56:26	2015-04-08 12:56:26
1217	231	12	1	1	20000.00	0.00	0.00	1	1	2015-04-08 11:14:46	2015-04-08 11:15:03
1218	231	28	1	1	5000.00	0.00	0.00	1	1	2015-04-08 11:14:46	2015-04-08 11:15:03
1220	232	4	8	15	75.00	0.00	0.00	1	1	2015-04-08 13:13:03	2015-04-08 13:14:20
1221	232	8	1	1	500.00	0.00	0.00	3	2	2015-04-08 13:13:03	2015-04-08 13:14:20
1222	232	16	4	1	500.00	0.00	0.00	3	1	2015-04-08 13:13:03	2015-04-08 13:14:20
1223	232	9	10000	1	0.55	0.00	0.00	1	1	2015-04-08 13:13:03	2015-04-08 13:14:20
1224	232	10	1000	1	1.00	0.00	0.00	1	1	2015-04-08 13:13:03	2015-04-08 18:00:44
1225	232	35	1	1	1437.50	0.00	0.00	1	1	2015-04-08 13:13:03	2015-04-08 13:14:20
1226	233	4	8	15	75.00	0.00	0.00	1	1	2015-04-08 17:45:07	2015-04-08 17:46:31
1227	233	8	1	1	500.00	0.00	0.00	3	2	2015-04-08 17:45:07	2015-04-08 17:46:31
1228	233	16	2	1	500.00	0.00	0.00	3	1	2015-04-08 17:45:07	2015-04-08 17:46:31
1229	233	9	10000	1	0.55	0.00	0.00	1	1	2015-04-08 17:45:07	2015-04-08 17:46:31
1230	233	10	1000	1	1.00	0.00	0.00	1	1	2015-04-08 17:45:07	2015-04-08 17:46:31
1231	233	35	1	1	1437.50	0.00	0.00	1	1	2015-04-08 17:45:07	2015-04-08 17:46:31
1232	234	4	8	15	75.00	0.00	0.00	1	1	2015-04-09 12:50:30	2015-04-09 12:52:04
1233	234	8	1	1	500.00	0.00	0.00	3	2	2015-04-09 12:50:30	2015-04-09 12:52:04
1234	234	16	2	1	500.00	0.00	0.00	3	1	2015-04-09 12:50:30	2015-04-09 12:52:04
1235	234	9	10000	1	0.55	0.00	0.00	1	1	2015-04-09 12:50:30	2015-04-09 12:52:04
1236	234	10	1000	1	1.00	0.00	0.00	1	1	2015-04-09 12:50:30	2015-04-09 12:52:04
1237	234	42	1	1	1500.00	0.00	0.00	1	1	2015-04-09 12:50:30	2015-04-09 12:52:04
1238	234	35	1	1	1437.50	0.00	0.00	1	1	2015-04-09 12:50:30	2015-04-09 12:52:04
1493	283	10	2000	1	1.00	0.00	0.00	1	1	2015-08-24 16:14:43	2015-08-24 16:17:36
1492	283	9	20000	1	0.55	0.00	0.00	1	1	2015-08-24 16:14:43	2015-08-24 16:17:36
1491	283	18	4	1	500.00	0.00	0.00	4	3	2015-08-24 16:14:43	2015-08-24 16:17:36
1490	283	16	10	1	500.00	0.00	0.00	3	1	2015-08-24 16:14:43	2015-08-24 16:17:36
1489	283	8	1	1	500.00	0.00	0.00	3	2	2015-08-24 16:14:43	2015-08-24 16:17:36
1488	283	7	2	1	500.00	0.00	0.00	6	2.9000001	2015-08-24 16:14:43	2015-08-24 16:17:36
1342	250	16	4	1	500.00	0.00	0.00	3	1	2015-05-07 15:48:29	2015-05-07 15:50:01
1341	250	8	1	1	500.00	0.00	0.00	3	2	2015-05-07 15:48:29	2015-05-07 15:50:01
1340	250	4	10	15	75.00	0.00	0.00	1	1	2015-05-07 15:48:29	2015-05-07 15:50:01
1339	250	1	4	15	75.00	0.00	0.00	1	1	2015-05-07 15:48:29	2015-05-07 15:50:01
1253	238	4	8	15	75.00	0.00	0.00	1	1	2015-04-21 11:22:15	2015-04-21 11:22:26
1275	241	29	7000	1	1.00	0.00	0.00	1	1	2015-04-21 11:39:39	2015-04-21 11:42:10
1274	241	9	5000	1	0.55	0.00	0.00	1	1	2015-04-21 11:39:39	2015-04-21 11:40:41
1273	241	22	50	1	500.00	0.00	0.00	0.300000012	0.209999993	2015-04-21 11:39:39	2015-04-21 11:40:41
1272	241	18	1	1	500.00	0.00	0.00	4	3	2015-04-21 11:39:39	2015-04-21 11:40:41
1271	241	16	4	1	500.00	0.00	0.00	3	1	2015-04-21 11:39:39	2015-04-21 11:40:41
1270	241	8	1	1	500.00	0.00	0.00	3	2	2015-04-21 11:39:39	2015-04-21 11:40:41
1269	241	4	8	15	75.00	0.00	0.00	1	1	2015-04-21 11:39:39	2015-04-21 11:40:41
1354	251	18	2	1	500.00	0.00	0.00	4	3	2015-05-08 14:52:47	2015-05-08 14:55:10
1353	251	16	5	1	500.00	0.00	0.00	3	1	2015-05-08 14:52:47	2015-05-08 14:55:10
1352	251	7	4	1	500.00	0.00	0.00	6	2.9000001	2015-05-08 14:52:47	2015-05-08 14:55:10
1280	242	10	1000	1	1.00	0.00	0.00	1	1	2015-04-27 11:44:35	2015-04-27 11:45:19
1279	242	9	10000	1	0.55	0.00	0.00	1	1	2015-04-27 11:44:35	2015-04-27 11:45:19
1278	242	16	2	1	500.00	0.00	0.00	3	1	2015-04-27 11:44:35	2015-04-28 12:45:58
1487	283	4	8	15	75.00	0.00	0.00	1	1	2015-08-24 16:14:43	2015-08-26 16:08:09
1276	242	4	8	15	75.00	0.00	0.00	1	1	2015-04-27 11:44:35	2015-04-27 11:45:19
1351	251	32	4	15	75.00	0.00	0.00	1	1	2015-05-08 14:52:47	2015-05-08 14:55:10
1350	251	4	10	15	75.00	0.00	0.00	1	1	2015-05-08 14:52:47	2015-05-08 14:55:10
1349	251	2	5	15	75.00	0.00	0.00	1	1	2015-05-08 14:52:47	2015-05-08 14:55:10
1348	251	1	5	15	75.00	0.00	0.00	1	1	2015-05-08 14:52:47	2015-05-08 14:55:10
1486	283	3	5	15	75.00	0.00	0.00	1	1	2015-08-24 16:14:43	2015-08-26 16:08:20
1485	283	2	5	15	75.00	0.00	0.00	1	1	2015-08-24 16:14:43	2015-08-26 16:08:27
1484	283	1	5	15	75.00	0.00	0.00	1	1	2015-08-24 16:14:42	2015-08-26 16:08:35
1506	286	4	8	15	75.00	0.00	0.00	1	1	2015-09-09 16:16:20	2015-09-09 16:16:36
1482	282	9	10000	10	0.55	0.00	0.00	1	1	2015-08-24 15:33:16	2015-09-09 11:39:17
1481	282	18	5	1	500.00	0.00	0.00	4	3	2015-08-24 15:33:16	2015-09-09 11:35:01
1507	287	4	8	15	75.00	0.00	0.00	1	1	2015-09-09 16:20:29	2015-09-09 16:20:41
1479	282	5	3	1	3750.00	0.00	0.00	1	1	2015-08-24 15:33:16	2015-09-09 11:35:11
1297	245	4	8	15	75.00	0.00	0.00	1	1	2015-04-28 16:18:32	2015-04-28 16:19:34
1298	245	8	1	1	500.00	0.00	0.00	3	2	2015-04-28 16:18:32	2015-04-28 16:19:34
1299	245	16	3	1	500.00	0.00	0.00	3	1	2015-04-28 16:18:32	2015-04-28 16:19:34
1300	245	9	10000	1	0.55	0.00	0.00	1	1	2015-04-28 16:18:32	2015-04-28 16:19:34
1301	245	10	1000	1	1.00	0.00	0.00	1	1	2015-04-28 16:18:32	2015-04-28 16:19:34
1302	245	35	1	1	1437.50	0.00	0.00	1	1	2015-04-28 16:18:32	2015-04-28 16:19:34
1477	281	29	31740	1	1.00	0.00	0.00	1	1	2015-08-21 13:19:56	2015-08-21 13:37:45
1309	247	3	5	15	75.00	0.00	0.00	1	1	2015-05-05 12:09:19	2015-05-05 12:13:29
1307	247	1	5	15	75.00	0.00	0.00	1	1	2015-05-05 12:09:19	2015-05-05 12:13:29
1308	247	2	5	15	75.00	0.00	0.00	1	1	2015-05-05 12:09:19	2015-05-05 12:13:29
1310	247	4	10	15	75.00	0.00	0.00	1	1	2015-05-05 12:09:19	2015-05-05 12:13:29
1311	247	5	1	2	3750.00	0.00	0.00	1	1	2015-05-05 12:09:19	2015-05-05 12:13:29
1312	247	7	3	1	500.00	0.00	0.00	6	2.9000001	2015-05-05 12:09:19	2015-05-05 12:13:29
1313	247	16	6	1	500.00	0.00	0.00	3	1	2015-05-05 12:09:19	2015-05-05 12:13:29
1314	247	18	3	1	500.00	0.00	0.00	4	3	2015-05-05 12:09:19	2015-05-05 12:13:29
1315	247	9	10000	1	0.55	0.00	0.00	1	1	2015-05-05 12:09:19	2015-05-05 12:13:29
1316	247	10	5000	1	1.00	0.00	0.00	1	1	2015-05-05 12:09:19	2015-05-05 12:13:29
1317	247	31	1	1	10000.00	0.00	0.00	1	1	2015-05-05 12:09:19	2015-05-05 12:13:29
1318	247	35	1	2	1437.50	0.00	0.00	1	1	2015-05-05 12:09:19	2015-05-05 12:13:29
1319	247	43	50	1	500.00	0.00	0.00	0.400000006	0.300000012	2015-05-06 16:00:49	2015-05-06 16:00:49
1504	285	10	1000	1	1.00	0.00	0.00	1	1	2015-09-01 11:30:05	2015-09-01 11:31:09
1503	285	9	10000	1	0.55	0.00	0.00	1	1	2015-09-01 11:30:05	2015-09-16 16:41:45
1502	285	16	2	1	500.00	0.00	0.00	3	1	2015-09-01 11:30:05	2015-09-01 11:31:09
1501	285	8	1	1	500.00	0.00	0.00	3	2	2015-09-01 11:30:05	2015-09-16 16:42:25
1500	285	4	8	7	75.00	0.00	0.00	1	1	2015-09-01 11:30:05	2015-09-16 16:41:27
1475	280	12	1	1	20000.00	0.00	0.00	1	1	2015-08-19 16:09:36	2015-08-19 16:10:17
1474	280	10	1000	1	1.00	0.00	0.00	1	1	2015-08-19 16:09:36	2015-08-19 16:10:17
1473	280	8	1	1	500.00	0.00	0.00	3	2	2015-08-19 16:09:36	2015-08-19 16:10:17
1601	305	9	50000	1	0.55	0.00	0.00	1	1	2015-10-15 12:56:09	2015-10-15 12:59:25
1498	284	8	2	1	500.00	0.00	0.00	3	2	2015-08-31 15:24:43	2015-09-02 10:14:51
1497	283	35	1	1	1437.50	0.00	0.00	1	1	2015-08-24 16:14:43	2015-08-24 16:17:36
1496	283	29	6500	1	1.00	0.00	0.00	1	1	2015-08-24 16:14:43	2015-08-24 16:17:36
1468	278	35	1	1	1437.50	0.00	0.00	1	1	2015-08-19 15:51:39	2015-08-19 15:52:56
1627	278	30	1	1	20000.00	0.00	0.00	1	1	2015-10-26 14:16:40	2015-10-26 14:16:40
1619	308	42	3	1	1500.00	0.00	0.00	1	1	2015-10-22 10:31:28	2015-10-22 10:31:41
1335	249	4	8	15	75.00	0.00	0.00	1	1	2015-05-06 16:35:27	2015-05-06 16:36:08
1336	249	8	1	1	500.00	0.00	0.00	3	2	2015-05-06 16:35:27	2015-05-06 16:36:08
1337	249	16	2	1	500.00	0.00	0.00	3	1	2015-05-06 16:35:27	2015-05-06 16:36:08
1338	249	31	1	1	10000.00	0.00	0.00	1	1	2015-05-06 16:36:23	2015-05-06 16:36:23
1345	250	12	1	1	20000.00	0.00	0.00	1	1	2015-05-07 15:48:30	2015-05-07 15:50:01
1355	251	41	1	1	500.00	0.00	0.00	6	3	2015-05-08 14:52:47	2015-05-08 14:55:10
1356	251	9	30000	1	0.55	0.00	0.00	1	1	2015-05-08 14:52:47	2015-05-08 14:55:10
1357	251	10	2000	1	1.00	0.00	0.00	1	1	2015-05-08 14:52:47	2015-05-08 14:55:10
1358	251	12	1	2	20000.00	0.00	0.00	1	1	2015-05-08 14:52:47	2015-05-08 14:55:10
1359	251	25	1	1	10000.00	0.00	0.00	1	1	2015-05-08 14:52:47	2015-05-08 14:55:10
1360	251	31	1	2	10000.00	0.00	0.00	1	1	2015-05-08 14:52:47	2015-05-08 14:55:10
1361	251	35	1	2	1437.50	0.00	0.00	1	1	2015-05-08 14:52:47	2015-05-08 14:55:10
1362	252	4	10	15	75.00	0.00	0.00	1	1	2015-05-08 15:13:30	2015-05-08 15:13:49
1363	252	8	1	1	500.00	0.00	0.00	3	2	2015-05-08 15:13:30	2015-05-08 15:13:49
1364	252	16	3	1	500.00	0.00	0.00	3	1	2015-05-08 15:13:30	2015-05-08 15:13:49
1366	253	16	3	1	500.00	0.00	0.00	3	1	2015-05-11 10:08:24	2015-05-11 10:08:58
1367	253	9	10000	1	0.55	0.00	0.00	1	1	2015-05-11 10:08:24	2015-05-11 10:08:58
1368	254	4	8	15	75.00	0.00	0.00	1	1	2015-05-11 11:44:54	2015-05-11 11:45:46
1369	254	9	5000	1	0.55	0.00	0.00	1	1	2015-05-11 11:44:54	2015-05-11 11:45:46
1370	254	10	1000	1	1.00	0.00	0.00	1	1	2015-05-11 11:44:54	2015-05-11 11:45:46
1371	254	35	1	1	1437.50	0.00	0.00	1	1	2015-05-11 11:44:54	2015-05-11 11:45:46
1372	247	28	2	1	5000.00	0.00	0.00	1	1	2015-05-12 11:28:57	2015-05-12 11:28:57
1597	305	7	4	1	500.00	0.00	0.00	6	2.9000001	2015-10-15 12:56:09	2015-10-15 12:59:25
1596	305	5	2	1	3750.00	0.00	0.00	1	1	2015-10-15 12:56:09	2015-10-15 12:59:25
1595	305	32	5	1	75.00	0.00	0.00	1	1	2015-10-15 12:56:09	2015-10-15 12:59:25
1376	256	4	8	15	75.00	0.00	0.00	1	1	2015-05-18 11:25:23	2015-05-18 11:25:58
1377	256	16	2	1	500.00	0.00	0.00	3	1	2015-05-18 11:25:23	2015-05-20 16:16:39
1378	256	10	1000	1	1.00	0.00	0.00	1	1	2015-05-18 11:25:23	2015-05-18 11:25:58
1379	256	12	1	1	20000.00	0.00	0.00	1	1	2015-05-18 11:25:23	2015-05-18 11:25:58
1380	257	4	8	15	75.00	0.00	0.00	1	1	2015-05-18 14:39:00	2015-05-18 14:39:19
1399	256	8	1	1	500.00	0.00	0.00	3	2	2015-05-20 16:16:15	2015-05-20 16:16:15
1398	256	42	1	1	1500.00	0.00	0.00	1	1	2015-05-20 16:15:40	2015-05-20 16:15:40
1383	258	4	8	15	75.00	0.00	0.00	1	1	2015-05-19 12:39:23	2015-05-19 12:40:18
1384	258	8	1	1	500.00	0.00	0.00	3	2	2015-05-19 12:39:23	2015-05-19 12:40:18
1385	258	16	2	1	500.00	0.00	0.00	3	1	2015-05-19 12:39:23	2015-05-19 12:40:18
1386	258	10	1000	1	1.00	0.00	0.00	1	1	2015-05-19 12:39:23	2015-05-19 12:40:18
1402	261	12	1	1	20000.00	0.00	0.00	1	1	2015-05-20 16:29:42	2015-05-20 16:30:13
1401	261	8	1	1	500.00	0.00	0.00	3	2	2015-05-20 16:29:42	2015-05-20 16:30:13
1389	259	4	8	15	75.00	0.00	0.00	1	1	2015-05-19 12:52:19	2015-06-09 16:11:00
1390	259	8	1	1	500.00	0.00	0.00	3	2	2015-05-19 12:52:19	2015-05-19 12:53:42
1391	259	16	3	1	500.00	0.00	0.00	3	1	2015-05-19 12:52:19	2015-05-19 12:53:42
1392	259	9	10000	1	0.55	0.00	0.00	1	1	2015-05-19 12:52:19	2015-05-19 12:53:42
1393	259	10	1000	1	1.00	0.00	0.00	1	1	2015-05-19 12:52:19	2015-05-19 12:53:42
1400	261	4	8	15	75.00	0.00	0.00	1	1	2015-05-20 16:29:42	2015-05-20 16:30:13
1395	259	35	1	1	1437.50	0.00	0.00	1	1	2015-05-19 12:52:19	2015-05-19 12:53:42
1396	260	8	1	1	500.00	0.00	0.00	3	2	2015-05-20 14:33:30	2015-05-20 14:33:47
1397	260	16	2	1	500.00	0.00	0.00	3	1	2015-05-20 14:33:30	2015-05-20 14:33:47
1403	262	16	2	1	500.00	0.00	0.00	3	1	2015-05-20 17:24:41	2015-05-20 17:25:17
1404	262	10	500	2	1.00	0.00	0.00	1	1	2015-05-20 17:24:41	2015-05-20 17:25:17
1405	262	35	1	1	1437.50	0.00	0.00	1	1	2015-05-20 17:24:41	2015-05-20 17:25:17
1406	262	4	6	10	75.00	0.00	0.00	1	1	2015-05-20 17:25:36	2015-05-20 17:25:36
1407	263	4	10	15	75.00	0.00	0.00	1	1	2015-05-21 11:59:01	2015-05-21 12:00:38
1408	263	5	1	1	3750.00	0.00	0.00	1	1	2015-05-21 11:59:01	2015-05-21 12:00:38
1409	263	8	1	1	500.00	0.00	0.00	3	2	2015-05-21 11:59:01	2015-05-21 12:00:38
1410	263	16	5	1	500.00	0.00	0.00	3	1	2015-05-21 11:59:01	2015-05-21 12:00:38
1411	263	18	3	1	500.00	0.00	0.00	4	3	2015-05-21 11:59:01	2015-05-21 12:00:38
1412	263	9	50000	1	0.55	0.00	0.00	1	1	2015-05-21 11:59:01	2015-05-21 12:00:38
1413	263	12	1	1	20000.00	0.00	0.00	1	1	2015-05-21 11:59:01	2015-05-21 12:00:38
1414	263	35	1	1	1437.50	0.00	0.00	1	1	2015-05-21 11:59:01	2015-05-21 12:00:38
1415	264	9	10000	1	0.55	0.00	0.00	1	1	2015-05-27 10:26:10	2015-05-27 10:26:41
1416	265	4	8	15	75.00	0.00	0.00	1	1	2015-05-28 16:22:27	2015-05-28 16:23:57
1417	265	8	1	1	500.00	0.00	0.00	3	2	2015-05-28 16:22:27	2015-05-28 16:23:57
1418	265	16	3	1	500.00	0.00	0.00	3	1	2015-05-28 16:22:27	2015-05-28 16:23:57
1419	265	9	5000	1	0.55	0.00	0.00	1	1	2015-05-28 16:22:27	2015-05-28 16:23:57
1420	265	10	1000	1	1.00	0.00	0.00	1	1	2015-05-28 16:22:27	2015-05-28 16:23:57
1421	254	8	1	1	500.00	0.00	0.00	3	2	2015-06-09 12:45:27	2015-06-09 12:45:27
1422	254	16	1	1	500.00	0.00	0.00	3	1	2015-06-09 12:46:04	2015-06-09 12:46:04
1435	269	8	1	1	500.00	0.00	0.00	3	2	2015-07-07 14:01:31	2015-07-07 14:02:00
1424	266	12	1	1	20000.00	0.00	0.00	1	1	2015-07-01 13:20:40	2015-07-01 13:20:40
1428	268	4	8	15	75.00	0.00	0.00	1	1	2015-07-01 14:50:48	2015-07-01 14:52:20
1427	268	1	5	15	75.00	0.00	0.00	1	1	2015-07-01 14:50:48	2015-07-01 14:52:20
1429	268	8	1	1	500.00	0.00	0.00	3	2	2015-07-01 14:50:48	2015-07-01 14:52:20
1430	268	16	4	1	500.00	0.00	0.00	3	1	2015-07-01 14:50:48	2015-07-01 14:52:20
1431	268	9	10000	1	0.55	0.00	0.00	1	1	2015-07-01 14:50:48	2015-07-01 14:52:20
1432	268	10	1000	1	1.00	0.00	0.00	1	1	2015-07-01 14:50:48	2015-07-01 14:52:20
1439	270	10	5000	1	1.00	0.00	0.00	1	1	2015-07-20 14:38:29	2015-07-20 14:39:26
1434	268	35	1	1	1437.50	0.00	0.00	1	1	2015-07-01 14:50:48	2015-07-01 14:52:20
1436	269	16	3	1	500.00	0.00	0.00	3	1	2015-07-07 14:01:31	2015-07-07 14:02:00
1438	269	10	1000	1	1.00	0.00	0.00	1	1	2015-07-08 14:17:06	2015-07-08 14:17:06
1440	270	44	2	1	2475.00	0.00	0.00	1	1	2015-07-20 14:38:29	2015-07-20 14:39:26
1465	278	12	1	1	20000.00	0.00	0.00	1	1	2015-08-19 15:51:39	2015-08-19 15:52:55
1464	278	10	1000	1	1.00	0.00	0.00	1	1	2015-08-19 15:51:39	2015-08-19 15:52:55
1463	278	9	10000	1	0.55	0.00	0.00	1	1	2015-08-19 15:51:39	2015-08-19 15:52:55
1444	272	8	1	1	500.00	0.00	0.00	3	2	2015-07-20 16:34:02	2015-07-20 16:34:26
1445	272	25	1	1	10000.00	0.00	0.00	1	1	2015-07-20 16:34:02	2015-07-20 16:34:26
1462	278	16	6	1	500.00	0.00	0.00	3	1	2015-08-19 15:51:39	2015-10-26 13:40:25
1447	273	16	2	1	500.00	0.00	0.00	3	1	2015-07-29 10:38:15	2015-07-29 10:38:34
1448	274	12	1	1	20000.00	0.00	0.00	1	1	2015-08-03 12:16:45	2015-08-03 12:17:13
1449	274	14	20	1	125.00	0.00	0.00	1	1	2015-08-03 12:16:45	2015-08-03 12:17:13
1461	278	8	2	1	500.00	0.00	0.00	3	2	2015-08-19 15:51:39	2015-10-26 13:40:45
1460	278	4	8	1	75.00	0.00	0.00	1	1	2015-08-19 15:51:39	2015-08-19 15:52:55
1459	278	2	5	1	75.00	0.00	0.00	1	1	2015-08-19 15:51:39	2015-08-19 15:52:55
1458	278	1	5	1	75.00	0.00	0.00	1	1	2015-08-19 15:51:39	2015-08-19 15:52:55
1454	276	12	1	1	20000.00	0.00	0.00	1	1	2015-08-04 14:38:13	2015-08-04 14:38:41
1455	276	25	1	1	10000.00	0.00	0.00	1	1	2015-08-04 14:38:13	2015-08-04 14:38:41
1456	276	28	2	1	5000.00	0.00	0.00	1	1	2015-08-07 10:02:53	2015-08-07 10:02:53
1457	277	16	2	1	500.00	0.00	0.00	3	1	2015-08-10 17:42:28	2015-08-10 17:42:40
1593	305	2	5	15	75.00	0.00	0.00	1	1	2015-10-15 12:56:09	2015-10-15 12:59:25
1592	305	1	5	15	75.00	0.00	0.00	1	1	2015-10-15 12:56:09	2015-10-15 12:59:25
1971	370	8	1	1	500.00	0.00	0.00	3	2	2016-01-26 13:41:05	2016-01-26 13:41:47
1580	298	2	5	15	75.00	0.00	0.00	1	1	2015-10-06 15:52:53	2015-10-06 15:54:00
1600	305	18	4	1	500.00	0.00	0.00	4	3	2015-10-15 12:56:09	2015-10-15 12:59:25
1618	308	12	1	1	20000.00	0.00	0.00	1	1	2015-10-22 10:31:28	2015-10-22 10:31:41
1537	293	8	1	1	500.00	0.00	0.00	3	2	2015-09-17 16:30:12	2015-09-17 16:30:33
1538	293	16	2	1	500.00	0.00	0.00	3	1	2015-09-17 16:30:12	2015-09-17 16:30:33
1547	295	4	8	15	75.00	0.00	0.00	1	1	2015-09-29 16:29:22	2015-09-29 16:31:23
1540	293	42	3	1	1500.00	0.00	0.00	1	1	2015-09-17 16:30:12	2015-09-29 14:59:31
1599	305	16	10	1	500.00	0.00	0.00	3	1	2015-10-15 12:56:09	2015-10-15 12:59:25
1598	305	8	1	1	500.00	0.00	0.00	3	2	2015-10-15 12:56:09	2015-10-15 12:59:25
1587	298	35	1	1	1437.50	0.00	0.00	1	1	2015-10-06 15:52:53	2015-10-06 15:54:00
1548	295	8	1	1	500.00	0.00	0.00	3	2	2015-09-29 16:29:22	2015-09-29 16:31:23
1549	295	16	4	1	500.00	0.00	0.00	3	1	2015-09-29 16:29:22	2015-09-29 16:31:23
1607	306	4	8	15	75.00	0.00	0.00	1	1	2015-10-15 13:08:06	2015-10-15 13:09:47
1551	295	9	5000	1	0.55	0.00	0.00	1	1	2015-09-29 16:29:22	2015-09-29 16:31:23
1552	295	10	1000	1	1.00	0.00	0.00	1	1	2015-09-29 16:29:22	2015-09-29 16:31:23
1553	295	12	1	1	20000.00	0.00	0.00	1	1	2015-09-29 16:29:22	2015-09-29 16:31:23
1554	295	31	1	1	10000.00	0.00	0.00	1	1	2015-09-29 16:29:22	2015-09-29 16:31:23
1608	306	32	5	15	75.00	0.00	0.00	1	1	2015-10-15 13:08:06	2015-10-15 13:09:47
1556	295	35	1	1	1437.50	0.00	0.00	1	1	2015-09-29 16:29:22	2015-09-29 16:31:23
1557	296	1	5	15	75.00	0.00	0.00	1	1	2015-09-29 16:42:14	2015-09-29 16:43:36
1970	370	4	8	15	75.00	0.00	0.00	1	1	2016-01-26 13:41:05	2016-01-26 13:41:47
1969	370	1	5	15	75.00	0.00	0.00	1	1	2016-01-26 13:41:05	2016-01-26 13:41:47
1560	296	4	8	15	75.00	0.00	0.00	1	1	2015-09-29 16:42:14	2015-09-29 16:43:36
1561	296	8	1	1	500.00	0.00	0.00	3	2	2015-09-29 16:42:14	2015-09-29 16:43:36
1562	296	16	3	1	500.00	0.00	0.00	3	1	2015-09-29 16:42:14	2015-09-29 16:43:36
1563	296	9	10000	1	0.55	0.00	0.00	1	1	2015-09-29 16:42:14	2015-09-29 16:43:36
1564	296	10	1000	1	1.00	0.00	0.00	1	1	2015-09-29 16:42:14	2015-09-29 16:43:36
1968	369	35	1	1	1437.50	0.00	0.00	1	1	2016-01-26 13:28:18	2016-01-26 13:29:25
1566	296	35	1	1	1437.50	0.00	0.00	1	1	2015-09-29 16:42:15	2015-09-29 16:43:36
1567	297	1	5	15	75.00	0.00	0.00	1	1	2015-09-29 16:55:54	2015-09-29 16:57:14
1605	306	1	5	15	75.00	0.00	0.00	1	1	2015-10-15 13:08:06	2015-10-15 13:09:47
1603	305	35	1	1	1437.50	0.00	0.00	1	1	2015-10-15 12:56:09	2015-10-15 12:59:25
1570	297	4	8	15	75.00	0.00	0.00	1	1	2015-09-29 16:55:54	2015-09-29 16:57:14
1571	297	8	1	1	500.00	0.00	0.00	3	2	2015-09-29 16:55:54	2015-09-29 16:57:14
1572	297	16	4	1	500.00	0.00	0.00	3	1	2015-09-29 16:55:54	2015-10-01 14:16:20
1573	297	9	10000	1	0.55	0.00	0.00	1	1	2015-09-29 16:55:54	2015-09-29 16:57:14
1574	297	10	1000	1	1.00	0.00	0.00	1	1	2015-09-29 16:55:54	2015-09-29 16:57:14
1575	297	12	1	1	20000.00	0.00	0.00	1	1	2015-09-29 16:55:54	2015-09-29 16:57:14
1576	297	31	1	1	10000.00	0.00	0.00	1	1	2015-09-29 16:55:54	2015-10-01 14:16:59
1602	305	10	5000	1	1.00	0.00	0.00	1	1	2015-10-15 12:56:09	2015-10-15 12:59:25
1578	297	35	1	1	1437.50	0.00	0.00	1	1	2015-09-29 16:55:54	2015-09-29 16:57:14
1609	306	8	1	1	500.00	0.00	0.00	3	2	2015-10-15 13:08:06	2015-10-15 13:09:47
1610	306	16	4	1	500.00	0.00	0.00	3	1	2015-10-15 13:08:06	2015-10-15 13:09:47
1611	306	9	10000	1	0.55	0.00	0.00	1	1	2015-10-15 13:08:06	2015-10-15 13:09:47
1612	306	10	1000	1	1.00	0.00	0.00	1	1	2015-10-15 13:08:06	2015-10-15 13:09:47
1613	306	12	1	1	20000.00	0.00	0.00	1	1	2015-10-15 13:08:06	2015-10-15 13:09:47
1629	306	31	1	1	10000.00	0.00	0.00	1	1	2015-10-26 14:50:18	2015-10-26 14:50:18
1615	306	29	50000	1	1.00	0.00	0.00	1	1	2015-10-15 13:08:06	2015-10-26 14:48:51
1616	306	35	1	1	1437.50	0.00	0.00	1	1	2015-10-15 13:08:06	2015-10-15 13:09:47
1620	309	4	8	15	75.00	0.00	0.00	1	1	2015-10-23 11:59:54	2015-10-23 12:00:24
1621	309	9	5000	1	0.55	0.00	0.00	1	1	2015-10-23 11:59:54	2015-10-23 12:00:24
1622	309	12	1	1	20000.00	0.00	0.00	1	1	2015-10-23 11:59:54	2015-10-23 12:00:24
1623	310	4	8	15	75.00	0.00	0.00	1	1	2015-10-23 12:04:35	2015-10-23 12:05:03
1624	310	9	5000	1	0.55	0.00	0.00	1	1	2015-10-23 12:04:35	2015-10-23 12:05:03
1625	310	10	1000	1	1.00	0.00	0.00	1	1	2015-10-23 12:04:35	2015-10-23 12:05:03
1626	278	25	1	1	10000.00	0.00	0.00	1	1	2015-10-26 14:16:09	2015-10-26 14:16:09
1628	309	35	1	1	1437.50	0.00	0.00	1	1	2015-10-26 14:26:56	2015-10-26 14:26:56
1630	306	18	2	1	500.00	0.00	0.00	4	3	2015-10-26 16:06:57	2015-10-26 16:06:57
1631	306	7	2	1	500.00	0.00	0.00	6	2.9000001	2015-10-26 16:07:24	2015-10-26 16:07:24
1632	311	4	8	15	75.00	0.00	0.00	1	1	2015-10-27 10:34:00	2015-10-27 10:35:00
1633	311	32	5	15	75.00	0.00	0.00	1	1	2015-10-27 10:34:00	2015-10-27 10:35:00
1634	311	8	1	1	500.00	0.00	0.00	3	2	2015-10-27 10:34:00	2015-10-27 10:35:00
1635	311	16	3	1	500.00	0.00	0.00	3	1	2015-10-27 10:34:00	2015-10-27 10:35:00
1636	311	9	5000	1	0.55	0.00	0.00	1	1	2015-10-27 10:34:00	2015-10-27 10:35:00
1637	311	10	1000	1	1.00	0.00	0.00	1	1	2015-10-27 10:34:00	2015-10-27 10:35:00
1638	311	12	1	1	20000.00	0.00	0.00	1	1	2015-10-27 10:34:00	2015-10-27 10:35:00
1639	311	35	1	1	1437.50	0.00	0.00	1	1	2015-10-27 10:34:00	2015-10-27 10:35:00
1693	321	4	8	15	75.00	0.00	0.00	1	1	2015-11-06 11:49:17	2015-11-06 11:50:02
1694	321	8	1	1	500.00	0.00	0.00	3	2	2015-11-06 11:49:17	2015-11-06 11:50:02
1731	329	4	8	15	75.00	0.00	0.00	1	1	2015-11-18 16:37:56	2015-11-18 16:38:42
1730	328	10	1000	1	1.00	0.00	0.00	1	1	2015-11-18 16:29:38	2015-11-18 16:30:26
1729	328	9	5000	1	0.55	0.00	0.00	1	1	2015-11-18 16:29:38	2015-11-18 16:30:26
1728	328	16	3	1	500.00	0.00	0.00	3	1	2015-11-18 16:29:38	2015-11-18 16:30:26
1727	328	8	1	1	500.00	0.00	0.00	3	2	2015-11-18 16:29:38	2015-11-18 16:30:26
1726	328	4	8	15	75.00	0.00	0.00	1	1	2015-11-18 16:29:38	2015-11-18 16:30:26
1648	313	4	10	5	75.00	0.00	0.00	1	1	2015-11-02 13:14:45	2015-11-02 13:19:42
1649	313	9	10000	1	0.55	0.00	0.00	1	1	2015-11-02 13:14:45	2015-11-02 16:57:25
1650	313	12	1	1	20000.00	0.00	0.00	1	1	2015-11-02 13:14:45	2015-11-02 13:19:42
1651	313	31	1	1	10000.00	0.00	0.00	1	1	2015-11-02 13:14:45	2015-11-02 13:19:42
1952	368	1	5	15	75.00	0.00	0.00	1	1	2016-01-26 13:13:39	2016-01-26 13:15:10
1951	367	35	1	1	1437.50	0.00	0.00	1	1	2016-01-26 13:06:54	2016-01-26 13:07:54
1950	367	31	1	1	10000.00	0.00	0.00	1	1	2016-01-26 13:06:54	2016-01-26 13:07:54
2040	384	4	5	15	75.00	0.00	0.00	1	1	2016-02-17 15:39:50	2016-02-17 15:40:59
1948	367	10	1000	1	1.00	0.00	0.00	1	1	2016-01-26 13:06:54	2016-01-26 13:07:54
1947	367	9	10000	1	0.55	0.00	0.00	1	1	2016-01-26 13:06:54	2016-01-26 13:07:54
1946	367	16	4	1	500.00	0.00	0.00	3	1	2016-01-26 13:06:54	2016-01-26 13:07:54
1945	367	8	1	1	500.00	0.00	0.00	3	2	2016-01-26 13:06:54	2016-01-26 13:07:54
1663	313	29	5000	1	1.00	0.00	0.00	1	1	2015-11-02 17:07:10	2015-11-02 17:07:10
1662	313	10	2000	1	1.00	0.00	0.00	1	1	2015-11-02 16:55:41	2015-11-02 16:55:41
1664	315	4	8	15	75.00	0.00	0.00	1	1	2015-11-03 15:52:14	2015-11-03 16:06:34
1665	315	8	1	1	500.00	0.00	0.00	3	2	2015-11-03 15:52:14	2015-11-03 16:06:34
1666	315	12	1	1	20000.00	0.00	0.00	1	1	2015-11-03 15:52:14	2015-11-03 16:06:34
1667	315	35	1	1	1437.50	0.00	0.00	1	1	2015-11-03 15:52:14	2015-11-03 16:06:34
1668	316	4	8	15	75.00	0.00	0.00	1	1	2015-11-04 10:41:10	2015-11-04 10:42:04
1669	316	8	1	1	500.00	0.00	0.00	3	2	2015-11-04 10:41:10	2015-11-04 10:42:04
1670	316	16	3	1	500.00	0.00	0.00	3	1	2015-11-04 10:41:10	2015-11-04 10:42:04
1671	316	9	10000	1	0.55	0.00	0.00	1	1	2015-11-04 10:41:10	2015-11-04 10:42:04
1672	316	10	1000	1	1.00	0.00	0.00	1	1	2015-11-04 10:41:10	2015-11-04 10:42:04
1676	317	4	8	15	75.00	0.00	0.00	1	1	2015-11-04 11:53:09	2015-11-04 11:54:25
1677	317	8	1	1	500.00	0.00	0.00	3	2	2015-11-04 11:53:09	2015-11-04 11:54:25
1675	316	35	1	1	1437.50	0.00	0.00	1	1	2015-11-04 10:41:10	2015-11-04 10:42:04
1678	317	16	3	1	500.00	0.00	0.00	3	1	2015-11-04 11:53:09	2015-11-04 11:54:25
1679	317	9	5000	1	0.55	0.00	0.00	1	1	2015-11-04 11:53:09	2015-11-04 11:54:25
1680	317	10	1000	1	1.00	0.00	0.00	1	1	2015-11-04 11:53:09	2015-11-04 11:54:25
1681	317	12	1	1	20000.00	0.00	0.00	1	1	2015-11-04 11:53:09	2015-11-04 11:54:25
1682	318	4	8	15	75.00	0.00	0.00	1	1	2015-11-04 12:23:20	2015-11-04 12:23:50
1683	319	4	8	15	75.00	0.00	0.00	1	1	2015-11-04 12:48:37	2015-11-04 12:49:06
1684	319	8	1	1	500.00	0.00	0.00	3	2	2015-11-04 12:48:37	2015-11-04 12:49:07
1685	319	16	3	1	500.00	0.00	0.00	3	1	2015-11-04 12:48:37	2015-11-04 12:49:07
1686	319	10	1000	1	1.00	0.00	0.00	1	1	2015-11-04 12:48:37	2015-11-04 12:49:07
1687	320	4	8	15	75.00	0.00	0.00	1	1	2015-11-04 13:09:07	2015-11-04 13:09:55
1688	320	8	1	1	500.00	0.00	0.00	3	2	2015-11-04 13:09:07	2015-11-04 13:09:55
1689	320	16	3	1	500.00	0.00	0.00	3	1	2015-11-04 13:09:07	2015-11-04 13:09:55
1690	320	9	5000	1	0.55	0.00	0.00	1	1	2015-11-04 13:09:07	2015-11-04 13:09:55
1691	320	10	1000	1	1.00	0.00	0.00	1	1	2015-11-04 13:09:07	2015-11-04 13:09:55
1692	320	35	1	1	1437.50	0.00	0.00	1	1	2015-11-04 13:09:07	2015-11-04 13:09:55
1695	321	16	3	1	500.00	0.00	0.00	3	1	2015-11-06 11:49:17	2015-11-06 11:50:02
1696	321	9	5000	1	0.55	0.00	0.00	1	1	2015-11-06 11:49:17	2015-11-06 11:50:02
1697	321	10	1000	1	1.00	0.00	0.00	1	1	2015-11-06 11:49:17	2015-11-06 11:50:02
1979	371	10	1000	1	1.00	0.00	0.00	1	1	2016-01-27 12:56:48	2016-01-27 12:57:19
1978	371	16	3	1	500.00	0.00	0.00	3	1	2016-01-27 12:56:48	2016-01-27 12:57:19
1977	371	8	1	1	500.00	0.00	0.00	3	2	2016-01-27 12:56:48	2016-01-27 12:57:19
1976	371	4	8	1	75.00	0.00	0.00	1	1	2016-01-27 12:56:48	2016-01-27 12:57:19
1975	370	35	1	1	1437.50	0.00	0.00	1	1	2016-01-26 13:41:05	2016-01-26 13:41:47
1974	370	10	1000	1	1.00	0.00	0.00	1	1	2016-01-26 13:41:05	2016-01-26 13:41:47
1704	323	8	1	1	500.00	0.00	0.00	3	2	2015-11-07 14:46:28	2015-11-07 14:46:40
1705	323	16	3	1	500.00	0.00	0.00	3	1	2015-11-07 14:46:28	2015-11-07 17:32:25
1706	324	4	10	1	75.00	0.00	0.00	1	1	2015-11-07 15:05:43	2015-11-07 15:07:00
1707	324	8	1	1	500.00	0.00	0.00	3	2	2015-11-07 15:05:43	2015-11-07 15:07:00
1708	324	16	5	1	500.00	0.00	0.00	3	1	2015-11-07 15:05:43	2015-11-07 15:07:00
1709	324	9	10000	1	0.55	0.00	0.00	1	1	2015-11-07 15:05:43	2015-11-07 15:07:00
1710	324	12	1	1	20000.00	0.00	0.00	1	1	2015-11-07 15:05:43	2015-11-07 15:07:00
1711	324	35	1	1	1437.50	0.00	0.00	1	1	2015-11-07 15:05:43	2015-11-07 15:07:00
1712	325	4	6	15	75.00	0.00	0.00	1	1	2015-11-07 16:37:19	2015-11-07 16:38:12
1713	325	8	1	1	500.00	0.00	0.00	3	2	2015-11-07 16:37:19	2015-11-07 16:38:12
1714	325	16	4	1	500.00	0.00	0.00	3	1	2015-11-07 16:37:19	2015-11-07 16:38:12
1715	325	9	5000	1	0.55	0.00	0.00	1	1	2015-11-07 16:37:19	2015-11-07 16:38:12
1716	325	10	1000	1	1.00	0.00	0.00	1	1	2015-11-07 16:37:19	2015-11-07 16:38:12
1717	325	25	1	1	10000.00	0.00	0.00	1	1	2015-11-07 16:37:19	2015-11-07 16:38:12
1718	326	12	1	1	20000.00	0.00	0.00	1	1	2015-11-16 11:10:36	2015-11-16 11:11:11
1719	326	14	40	1	125.00	0.00	0.00	1	1	2015-11-16 11:10:36	2015-11-16 11:11:11
1720	327	8	1	1	500.00	0.00	0.00	3	2	2015-11-16 11:35:36	2015-11-16 11:37:02
1721	327	16	3	1	500.00	0.00	0.00	3	1	2015-11-16 11:35:36	2015-11-16 11:37:02
1722	327	10	1000	1	1.00	0.00	0.00	1	1	2015-11-16 11:35:36	2015-11-16 11:37:02
1723	327	29	11250	1	1.00	0.00	0.00	1	1	2015-11-16 11:35:36	2015-11-16 11:37:02
1724	325	12	1	1	20000.00	0.00	0.00	1	1	2015-11-18 15:37:40	2015-11-18 15:37:40
1725	325	25	1	1	10000.00	0.00	0.00	1	1	2015-11-18 15:38:08	2015-11-18 15:38:08
1732	329	8	1	1	500.00	0.00	0.00	3	2	2015-11-18 16:37:56	2015-11-18 16:38:42
1733	329	16	4	1	500.00	0.00	0.00	3	1	2015-11-18 16:37:56	2015-11-19 10:44:50
1734	329	9	10000	1	0.55	0.00	0.00	1	1	2015-11-18 16:37:56	2015-11-18 16:38:42
1735	329	10	1000	1	1.00	0.00	0.00	1	1	2015-11-18 16:37:56	2015-11-18 16:38:42
1736	329	25	1	1	10000.00	0.00	0.00	1	1	2015-11-18 16:37:56	2015-11-18 16:38:42
1737	330	12	1	1	20000.00	0.00	0.00	1	1	2015-11-19 08:46:46	2015-11-19 08:47:00
1967	369	10	1000	1	1.00	0.00	0.00	1	1	2016-01-26 13:28:18	2016-01-26 13:29:25
1966	369	9	10000	1	0.55	0.00	0.00	1	1	2016-01-26 13:28:18	2016-01-26 13:29:25
1965	369	16	4	1	500.00	0.00	0.00	3	1	2016-01-26 13:28:18	2016-01-26 13:29:25
1964	369	8	1	1	500.00	0.00	0.00	3	2	2016-01-26 13:28:18	2016-01-26 13:29:25
1746	332	4	10	10	75.00	0.00	0.00	1	1	2015-11-24 11:50:56	2015-11-24 11:52:22
1747	332	5	1	1	3750.00	0.00	0.00	1	1	2015-11-24 11:50:56	2015-11-24 11:52:22
1748	332	8	1	1	500.00	0.00	0.00	3	2	2015-11-24 11:50:56	2015-11-24 11:52:22
1749	332	16	5	1	500.00	0.00	0.00	3	1	2015-11-24 11:50:56	2015-11-24 11:52:22
1750	332	9	5000	1	0.55	0.00	0.00	1	1	2015-11-24 11:50:56	2015-11-24 11:52:22
1751	332	10	1000	1	1.00	0.00	0.00	1	1	2015-11-24 11:50:56	2015-11-24 11:52:22
1752	332	30	1	1	20000.00	0.00	0.00	1	1	2015-11-24 11:50:56	2015-11-24 11:52:22
1753	332	18	2	1	500.00	0.00	0.00	4	3	2015-11-24 11:56:41	2015-11-24 11:56:41
1754	333	8	2	1	500.00	0.00	0.00	3	2	2015-11-26 15:02:52	2015-11-26 15:04:04
1755	333	16	2	1	500.00	0.00	0.00	3	1	2015-11-26 15:02:52	2015-11-26 15:04:04
1756	333	29	70000	1	1.00	0.00	0.00	1	1	2015-11-26 15:05:00	2015-11-26 15:05:00
1757	334	16	1	1	500.00	0.00	0.00	3	1	2015-11-26 15:36:02	2015-11-26 15:36:02
1758	334	9	1	1	0.55	0.00	0.00	1	1	2015-11-26 15:36:02	2015-11-26 15:36:02
1759	334	10	1	1	1.00	0.00	0.00	1	1	2015-11-26 15:36:02	2015-11-26 15:36:02
1760	334	29	1	1	1.00	0.00	0.00	1	1	2015-11-26 15:36:02	2015-11-26 15:36:02
1963	369	4	8	15	75.00	0.00	0.00	1	1	2016-01-26 13:28:18	2016-01-26 13:29:25
2002	375	1	5	15	75.00	0.00	0.00	1	1	2016-02-01 16:52:26	2016-02-01 16:53:17
1961	368	35	1	1	1437.50	0.00	0.00	1	1	2016-01-26 13:13:40	2016-01-26 13:15:10
1960	368	31	1	1	10000.00	0.00	0.00	1	1	2016-01-26 13:13:40	2016-01-26 13:15:10
1973	370	9	10000	1	0.55	0.00	0.00	1	1	2016-01-26 13:41:05	2016-01-26 13:41:47
1972	370	16	4	1	500.00	0.00	0.00	3	1	2016-01-26 13:41:05	2016-01-26 13:41:47
1767	337	4	10	15	75.00	0.00	0.00	1	1	2015-12-03 13:01:46	2015-12-03 13:02:28
1768	337	8	1	1	500.00	0.00	0.00	3	2	2015-12-03 13:01:46	2015-12-03 13:02:28
1769	337	16	4	1	500.00	0.00	0.00	3	1	2015-12-03 13:01:46	2015-12-03 13:02:28
1770	337	10	1000	1	1.00	0.00	0.00	1	1	2015-12-03 13:01:46	2015-12-03 13:02:28
1771	337	12	1	1	20000.00	0.00	0.00	1	1	2015-12-03 13:01:46	2015-12-03 13:02:28
1772	338	4	10	15	75.00	0.00	0.00	1	1	2015-12-03 13:10:24	2015-12-03 13:11:11
1773	338	8	1	1	500.00	0.00	0.00	3	2	2015-12-03 13:10:24	2015-12-03 13:11:12
1774	338	16	5	1	500.00	0.00	0.00	3	1	2015-12-03 13:10:24	2015-12-03 13:11:12
1775	338	9	10000	1	0.55	0.00	0.00	1	1	2015-12-03 13:10:24	2015-12-03 13:11:12
1776	338	10	1000	1	1.00	0.00	0.00	1	1	2015-12-03 13:10:24	2015-12-03 13:11:12
1959	368	12	1	2	20000.00	0.00	0.00	1	1	2016-01-26 13:13:40	2016-03-07 16:21:33
1958	368	10	1000	1	1.00	0.00	0.00	1	1	2016-01-26 13:13:40	2016-01-26 13:15:10
1957	368	9	20000	1	0.55	0.00	0.00	1	1	2016-01-26 13:13:40	2016-03-14 15:21:19
2108	397	4	8	15	75.00	0.00	0.00	1	1	2016-03-15 10:35:27	2016-03-15 10:36:46
1955	368	16	5	1	500.00	0.00	0.00	3	1	2016-01-26 13:13:40	2016-01-26 13:15:10
1954	368	8	1	1	500.00	0.00	0.00	3	2	2016-01-26 13:13:40	2016-03-14 15:20:38
2085	368	32	5	15	75.00	0.00	0.00	1	1	2016-03-07 16:00:04	2016-03-14 15:21:53
1784	340	8	1	1	500.00	0.00	0.00	3	2	2015-12-03 14:12:35	2015-12-03 14:14:10
1785	340	16	2	1	500.00	0.00	0.00	3	1	2015-12-03 14:12:35	2015-12-03 14:14:10
1786	340	10	1000	1	1.00	0.00	0.00	1	1	2015-12-03 14:12:35	2015-12-03 14:14:10
1787	340	29	10000	1	1.00	0.00	0.00	1	1	2015-12-03 14:12:35	2015-12-03 16:23:48
1788	341	5	1	2	3750.00	0.00	0.00	1	1	2015-12-03 14:18:18	2015-12-03 14:19:32
1789	341	7	3	1	500.00	0.00	0.00	6	2.9000001	2015-12-03 14:18:18	2015-12-03 14:19:32
1790	341	8	1	1	500.00	0.00	0.00	3	2	2015-12-03 14:18:18	2015-12-03 14:19:32
1791	341	16	6	1	500.00	0.00	0.00	3	1	2015-12-03 14:18:18	2015-12-03 14:19:32
1792	341	18	3	1	500.00	0.00	0.00	4	3	2015-12-03 14:18:18	2015-12-03 14:19:32
1793	341	43	50	1	500.00	0.00	0.00	0.400000006	0.300000012	2015-12-03 14:18:18	2015-12-03 14:19:32
1794	341	9	10000	1	0.55	0.00	0.00	1	1	2015-12-03 14:18:18	2015-12-03 14:19:32
1795	341	10	5000	1	1.00	0.00	0.00	1	1	2015-12-03 14:18:18	2015-12-03 14:19:32
1796	341	31	1	1	10000.00	0.00	0.00	1	1	2015-12-03 14:18:18	2015-12-03 14:19:32
1797	342	4	10	15	75.00	0.00	0.00	1	1	2015-12-03 15:34:13	2015-12-03 15:35:18
1798	342	8	1	1	500.00	0.00	0.00	3	2	2015-12-03 15:34:13	2015-12-03 15:35:18
1799	342	16	5	1	500.00	0.00	0.00	3	1	2015-12-03 15:34:13	2015-12-03 15:35:18
1800	342	9	20000	1	0.55	0.00	0.00	1	1	2015-12-03 15:34:13	2015-12-03 15:35:18
1801	342	10	1000	1	1.00	0.00	0.00	1	1	2015-12-03 15:34:13	2015-12-03 15:35:18
1802	343	4	6	15	75.00	0.00	0.00	1	1	2015-12-03 15:47:03	2015-12-03 15:48:19
1803	343	8	1	1	500.00	0.00	0.00	3	2	2015-12-03 15:47:03	2015-12-03 15:48:19
1804	343	16	4	1	500.00	0.00	0.00	3	1	2015-12-03 15:47:03	2015-12-03 15:48:19
1805	344	4	5	5	75.00	0.00	0.00	1	1	2015-12-14 13:57:23	2015-12-14 13:58:18
1806	344	16	2	1	500.00	0.00	0.00	3	1	2015-12-14 13:57:24	2015-12-14 13:58:18
1807	344	9	10000	1	0.55	0.00	0.00	1	1	2015-12-14 13:57:24	2015-12-14 13:58:18
1808	344	25	1	1	10000.00	0.00	0.00	1	1	2015-12-14 13:57:24	2015-12-14 13:58:18
1809	344	42	4	1	1500.00	0.00	0.00	1	1	2015-12-14 13:57:24	2015-12-14 13:58:18
1810	345	16	4	1	500.00	0.00	0.00	3	1	2015-12-14 15:43:50	2015-12-14 15:54:24
1811	345	41	1	1	500.00	0.00	0.00	6	3	2015-12-14 15:43:50	2015-12-14 15:54:24
1812	345	9	10000	1	0.55	0.00	0.00	1	1	2015-12-14 15:43:51	2015-12-14 15:54:24
1813	345	25	1	1	10000.00	0.00	0.00	1	1	2015-12-14 15:43:51	2015-12-14 15:54:25
1814	346	4	8	15	75.00	0.00	0.00	1	1	2015-12-21 14:14:28	2015-12-21 14:15:06
1815	346	8	1	1	500.00	0.00	0.00	3	2	2015-12-21 14:14:28	2015-12-21 14:15:06
1816	346	16	3	1	500.00	0.00	0.00	3	1	2015-12-21 14:14:28	2015-12-21 14:15:06
1817	346	9	10000	1	0.55	0.00	0.00	1	1	2015-12-21 14:14:28	2015-12-21 14:15:06
1818	346	12	1	1	20000.00	0.00	0.00	1	1	2015-12-21 14:14:28	2015-12-21 14:15:06
1819	347	4	8	15	75.00	0.00	0.00	1	1	2015-12-21 15:46:15	2015-12-21 15:46:28
1820	348	1	5	15	75.00	0.00	0.00	1	1	2015-12-29 10:20:48	2015-12-29 10:24:39
1821	348	2	5	15	75.00	0.00	0.00	1	1	2015-12-29 10:20:48	2015-12-29 10:24:39
1822	348	4	12	15	75.00	0.00	0.00	1	1	2015-12-29 10:20:48	2015-12-29 10:24:39
1823	348	32	5	15	75.00	0.00	0.00	1	1	2015-12-29 10:20:48	2015-12-29 10:24:39
1824	348	5	1	6	3750.00	0.00	0.00	1	1	2015-12-29 10:20:48	2015-12-29 10:24:39
1825	348	6	2	10	1416.00	0.00	0.00	1	1	2015-12-29 10:20:48	2015-12-29 10:24:39
1826	348	7	6	1	500.00	0.00	0.00	6	2.9000001	2015-12-29 10:20:48	2015-12-29 10:24:39
1827	348	16	10	1	500.00	0.00	0.00	3	1	2015-12-29 10:20:48	2015-12-29 10:24:39
1828	348	18	6	1	500.00	0.00	0.00	4	3	2015-12-29 10:20:48	2015-12-29 10:24:39
1829	348	41	4	1	500.00	0.00	0.00	6	3	2015-12-29 10:20:48	2015-12-29 10:24:39
1830	348	9	50000	1	0.55	0.00	0.00	1	1	2015-12-29 10:20:48	2015-12-29 10:24:39
1831	348	10	10000	1	1.00	0.00	0.00	1	1	2015-12-29 10:20:48	2015-12-29 10:24:39
1832	348	30	1	1	20000.00	0.00	0.00	1	1	2015-12-29 10:20:48	2015-12-29 10:24:39
1833	348	29	1	1	1.00	0.00	0.00	1	1	2015-12-29 10:20:48	2015-12-29 10:24:39
1834	348	35	1	4	1437.50	0.00	0.00	1	1	2015-12-29 10:20:48	2015-12-29 10:24:39
1835	349	4	10	15	75.00	0.00	0.00	1	1	2015-12-29 10:32:42	2015-12-29 10:33:31
1836	349	8	1	1	500.00	0.00	0.00	3	2	2015-12-29 10:32:42	2015-12-29 10:33:31
1837	349	16	2	1	500.00	0.00	0.00	3	1	2015-12-29 10:32:42	2015-12-29 10:33:31
1838	349	18	4	1	500.00	0.00	0.00	4	3	2015-12-29 10:32:42	2015-12-29 10:33:31
1839	349	9	10000	1	0.55	0.00	0.00	1	1	2015-12-29 10:32:42	2015-12-29 10:33:31
1840	345	10	1000	1	1.00	0.00	0.00	1	1	2015-12-30 12:48:25	2015-12-30 12:48:25
1841	350	4	8	15	75.00	0.00	0.00	1	1	2016-01-04 12:21:01	2016-01-04 12:21:44
1842	350	8	1	1	500.00	0.00	0.00	3	2	2016-01-04 12:21:01	2016-01-04 12:21:44
1843	350	16	3	1	500.00	0.00	0.00	3	1	2016-01-04 12:21:01	2016-01-04 12:21:44
1844	350	9	5000	1	0.55	0.00	0.00	1	1	2016-01-04 12:21:01	2016-01-04 12:21:44
1845	350	10	1000	1	1.00	0.00	0.00	1	1	2016-01-04 12:21:01	2016-01-04 12:21:44
1846	350	12	1	1	20000.00	0.00	0.00	1	1	2016-01-04 12:21:01	2016-01-04 12:21:44
1847	351	4	8	1	75.00	0.00	0.00	1	1	2016-01-04 13:18:34	2016-01-04 13:20:31
1848	351	8	1	1	500.00	0.00	0.00	3	2	2016-01-04 13:18:35	2016-01-04 13:20:31
1849	351	16	5	1	500.00	0.00	0.00	3	1	2016-01-04 13:18:35	2016-01-04 13:20:32
1850	351	18	3	1	500.00	0.00	0.00	4	3	2016-01-04 13:18:35	2016-01-04 13:20:32
1851	351	9	10000	1	0.55	0.00	0.00	1	1	2016-01-04 13:18:35	2016-01-04 13:20:32
1852	351	10	1000	1	1.00	0.00	0.00	1	1	2016-01-04 13:18:35	2016-01-04 13:20:32
1853	351	12	1	1	20000.00	0.00	0.00	1	1	2016-01-04 13:18:35	2016-01-04 13:20:32
1854	351	25	1	1	10000.00	0.00	0.00	1	1	2016-01-04 13:18:35	2016-01-04 13:20:32
1855	351	31	1	1	10000.00	0.00	0.00	1	1	2016-01-04 13:18:35	2016-01-04 13:20:32
1856	351	35	1	1	1437.50	0.00	0.00	1	1	2016-01-04 13:18:35	2016-01-04 13:20:32
1857	352	4	8	15	75.00	0.00	0.00	1	1	2016-01-05 12:06:05	2016-01-05 12:06:23
1858	353	4	8	15	75.00	0.00	0.00	1	1	2016-01-05 15:35:38	2016-01-05 15:36:30
1859	353	8	1	1	500.00	0.00	0.00	3	2	2016-01-05 15:35:38	2016-01-05 15:36:30
1860	353	16	3	1	500.00	0.00	0.00	3	1	2016-01-05 15:35:38	2016-01-05 15:36:30
1861	353	9	5000	1	0.55	0.00	0.00	1	1	2016-01-05 15:35:38	2016-01-05 15:36:30
1862	353	10	1000	1	1.00	0.00	0.00	1	1	2016-01-05 15:35:38	2016-01-05 15:36:30
1863	353	12	1	1	20000.00	0.00	0.00	1	1	2016-01-05 15:35:38	2016-01-05 15:36:30
1864	354	4	8	15	75.00	0.00	0.00	1	1	2016-01-07 11:00:11	2016-01-07 11:00:51
1865	354	8	1	1	500.00	0.00	0.00	3	2	2016-01-07 11:00:11	2016-01-07 11:00:51
1866	354	16	3	1	500.00	0.00	0.00	3	1	2016-01-07 11:00:11	2016-01-07 11:00:51
1867	354	9	5000	1	0.55	0.00	0.00	1	1	2016-01-07 11:00:11	2016-01-07 11:00:51
1868	354	10	1000	1	1.00	0.00	0.00	1	1	2016-01-07 11:00:11	2016-01-07 11:00:51
1869	354	35	1	1	1437.50	0.00	0.00	1	1	2016-01-07 11:00:11	2016-01-07 11:00:51
1870	355	4	8	15	75.00	0.00	0.00	1	1	2016-01-12 11:13:19	2016-01-12 11:14:28
1871	355	8	1	1	500.00	0.00	0.00	3	2	2016-01-12 11:13:19	2016-01-12 11:14:28
1872	355	16	4	1	500.00	0.00	0.00	3	1	2016-01-12 11:13:19	2016-01-12 11:14:28
1873	355	9	5000	1	0.55	0.00	0.00	1	1	2016-01-12 11:13:19	2016-01-12 11:14:28
1874	355	10	1000	1	1.00	0.00	0.00	1	1	2016-01-12 11:13:19	2016-01-12 11:14:28
1875	355	25	1	1	10000.00	0.00	0.00	1	1	2016-01-12 11:13:19	2016-01-12 11:14:28
1876	355	31	1	1	10000.00	0.00	0.00	1	1	2016-01-12 11:13:19	2016-01-12 11:14:28
1877	355	35	1	1	1437.50	0.00	0.00	1	1	2016-01-12 11:13:19	2016-01-12 11:14:28
1878	356	4	10	15	75.00	0.00	0.00	1	1	2016-01-14 11:04:10	2016-01-14 11:05:58
1879	356	32	5	1	75.00	0.00	0.00	1	1	2016-01-14 11:04:10	2016-01-14 11:05:58
1880	356	8	1	1	500.00	0.00	0.00	3	2	2016-01-14 11:04:10	2016-01-14 11:05:58
1881	356	16	5	1	500.00	0.00	0.00	3	1	2016-01-14 11:04:10	2016-01-14 11:05:58
1882	356	18	2	1	500.00	0.00	0.00	4	3	2016-01-14 11:04:10	2016-01-14 11:05:58
1883	356	9	10000	1	0.55	0.00	0.00	1	1	2016-01-14 11:04:10	2016-01-14 11:05:58
1884	356	10	1000	1	1.00	0.00	0.00	1	1	2016-01-14 11:04:10	2016-01-14 11:05:58
1885	356	12	1	1	20000.00	0.00	0.00	1	1	2016-01-14 11:04:10	2016-01-14 11:05:58
1886	356	25	1	1	10000.00	0.00	0.00	1	1	2016-01-14 11:04:10	2016-01-14 11:05:58
1887	356	31	1	1	10000.00	0.00	0.00	1	1	2016-01-14 11:04:10	2016-01-14 11:05:58
1888	356	35	1	1	1437.50	0.00	0.00	1	1	2016-01-14 11:04:10	2016-01-14 11:05:58
1889	356	37	2	1	3000.00	0.00	0.00	1	1	2016-01-14 11:04:10	2016-01-14 11:05:58
1890	357	4	8	1	75.00	0.00	0.00	1	1	2016-01-14 11:11:15	2016-01-14 11:12:14
1891	357	8	1	1	500.00	0.00	0.00	3	2	2016-01-14 11:11:16	2016-01-14 11:12:14
1892	357	16	3	1	500.00	0.00	0.00	3	1	2016-01-14 11:11:16	2016-01-14 11:12:14
1893	357	9	5000	1	0.55	0.00	0.00	1	1	2016-01-14 11:11:16	2016-01-14 11:12:14
1894	357	10	1000	1	1.00	0.00	0.00	1	1	2016-01-14 11:11:16	2016-01-14 11:12:14
1895	357	12	1	1	20000.00	0.00	0.00	1	1	2016-01-14 11:11:16	2016-01-14 11:12:14
1896	357	31	1	1	10000.00	0.00	0.00	1	1	2016-01-14 11:11:16	2016-01-14 11:12:14
1897	358	4	10	15	75.00	0.00	0.00	1	1	2016-01-15 08:25:25	2016-01-15 10:36:56
1898	358	8	1	1	500.00	0.00	0.00	3	2	2016-01-15 08:25:25	2016-01-15 08:26:16
1899	358	16	3	1	500.00	0.00	0.00	3	1	2016-01-15 08:25:25	2016-01-15 08:26:16
1900	358	9	5000	1	0.55	0.00	0.00	1	1	2016-01-15 08:25:25	2016-01-15 08:26:16
1901	358	10	1000	1	1.00	0.00	0.00	1	1	2016-01-15 08:25:25	2016-01-15 08:26:16
1902	358	12	1	1	20000.00	0.00	0.00	1	1	2016-01-15 08:25:25	2016-01-15 08:26:16
1903	358	31	1	1	10000.00	0.00	0.00	1	1	2016-01-15 08:25:25	2016-01-15 08:26:16
1904	359	4	5	14	75.00	0.00	0.00	1	1	2016-01-18 11:53:14	2016-01-27 12:01:27
1905	359	8	1	1	500.00	0.00	0.00	3	2	2016-01-18 11:53:14	2016-01-18 11:53:14
1906	359	16	3	1	500.00	0.00	0.00	3	1	2016-01-18 11:53:14	2016-01-20 13:54:23
1907	359	9	5000	1	0.55	0.00	0.00	1	1	2016-01-18 11:53:14	2016-01-27 17:30:20
1908	359	10	500	1	1.00	0.00	0.00	1	1	2016-01-18 11:53:14	2016-01-27 17:29:23
1918	362	31	1	1	10000.00	0.00	0.00	1	1	2016-01-19 10:47:39	2016-01-19 10:48:00
1917	362	25	1	1	10000.00	0.00	0.00	1	1	2016-01-19 10:47:39	2016-01-19 10:48:00
1916	362	12	1	1	20000.00	0.00	0.00	1	1	2016-01-19 10:47:39	2016-01-19 10:48:00
1915	361	35	1	1	1437.50	0.00	0.00	1	1	2016-01-18 15:53:53	2016-01-18 15:54:14
1914	361	4	5	6	75.00	0.00	0.00	1	1	2016-01-18 15:53:53	2016-02-01 11:49:28
1919	363	4	8	15	75.00	0.00	0.00	1	1	2016-01-19 16:41:35	2016-01-19 16:42:05
1930	365	4	8	15	75.00	0.00	0.00	1	1	2016-01-20 10:32:32	2016-01-20 10:33:52
1921	363	16	3	1	500.00	0.00	0.00	3	1	2016-01-19 16:41:35	2016-01-19 16:42:05
1922	363	12	1	1	20000.00	0.00	0.00	1	1	2016-01-19 16:41:35	2016-01-19 16:42:05
1923	364	4	8	15	75.00	0.00	0.00	1	1	2016-01-20 09:15:55	2016-01-20 09:16:46
1924	364	8	1	1	500.00	0.00	0.00	3	2	2016-01-20 09:15:55	2016-01-20 09:16:46
1925	364	16	3	1	500.00	0.00	0.00	3	1	2016-01-20 09:15:55	2016-01-20 09:16:46
1926	364	9	5000	1	0.55	0.00	0.00	1	1	2016-01-20 09:15:55	2016-01-20 09:16:46
1927	364	10	1000	1	1.00	0.00	0.00	1	1	2016-01-20 09:15:55	2016-01-20 09:16:46
1982	372	8	1	1	500.00	0.00	0.00	3	2	2016-01-27 13:39:43	2016-01-27 13:41:24
1981	372	4	8	15	75.00	0.00	0.00	1	1	2016-01-27 13:39:43	2016-01-27 13:41:24
1931	365	8	1	1	500.00	0.00	0.00	3	2	2016-01-20 10:32:32	2016-01-20 10:33:52
1932	365	16	3	1	500.00	0.00	0.00	3	1	2016-01-20 10:32:32	2016-01-20 10:33:52
1933	365	9	5000	1	0.55	0.00	0.00	1	1	2016-01-20 10:32:32	2016-01-20 10:33:52
1934	365	10	1000	1	1.00	0.00	0.00	1	1	2016-01-20 10:32:32	2016-01-20 10:33:52
1935	365	12	1	1	20000.00	0.00	0.00	1	1	2016-01-20 10:32:32	2016-01-20 10:33:52
1944	367	4	8	15	75.00	0.00	0.00	1	1	2016-01-26 13:06:54	2016-01-26 13:07:54
1937	365	31	1	1	10000.00	0.00	0.00	1	1	2016-01-20 10:32:32	2016-01-20 10:33:52
1938	365	42	1	1	1500.00	0.00	0.00	1	1	2016-01-20 10:32:32	2016-01-20 10:33:52
1939	366	4	8	15	75.00	0.00	0.00	1	1	2016-01-21 15:33:49	2016-01-21 15:34:27
1940	366	8	1	1	500.00	0.00	0.00	3	2	2016-01-21 15:33:49	2016-01-21 15:34:27
1941	366	16	3	1	500.00	0.00	0.00	3	1	2016-01-21 15:33:49	2016-01-21 15:34:27
1942	366	9	5000	1	0.55	0.00	0.00	1	1	2016-01-21 15:33:49	2016-01-21 15:34:27
1943	364	29	10000	1	1.00	0.00	0.00	1	1	2016-01-26 09:05:47	2016-01-26 09:05:47
1980	371	35	1	1	1437.50	0.00	0.00	1	1	2016-01-27 12:56:48	2016-01-27 12:57:19
1983	372	16	3	1	500.00	0.00	0.00	3	1	2016-01-27 13:39:43	2016-01-27 13:41:24
1984	372	9	5000	1	0.55	0.00	0.00	1	1	2016-01-27 13:39:43	2016-02-01 11:35:49
1985	372	10	1000	1	1.00	0.00	0.00	1	1	2016-01-27 13:39:43	2016-01-27 13:41:24
1986	365	29	20000	1	1.00	0.00	0.00	1	1	2016-01-28 13:14:04	2016-01-28 13:14:04
1987	373	4	8	15	75.00	0.00	0.00	1	1	2016-01-28 13:30:05	2016-01-28 13:31:54
1988	373	5	2	1	3750.00	0.00	0.00	1	1	2016-01-28 13:30:06	2016-01-28 13:31:54
1989	373	8	1	1	500.00	0.00	0.00	3	2	2016-01-28 13:30:06	2016-01-28 13:31:54
1990	373	16	4	1	500.00	0.00	0.00	3	1	2016-01-28 13:30:06	2016-01-28 13:31:54
1991	373	18	4	1	500.00	0.00	0.00	4	3	2016-01-28 13:30:07	2016-01-28 13:31:54
1992	373	9	20000	1	0.55	0.00	0.00	1	1	2016-01-28 13:30:07	2016-01-28 13:31:54
1993	373	10	4000	1	1.00	0.00	0.00	1	1	2016-01-28 13:30:07	2016-01-28 13:31:54
1994	373	12	1	1	20000.00	0.00	0.00	1	1	2016-01-28 13:30:07	2016-01-28 13:31:54
1995	373	31	1	1	10000.00	0.00	0.00	1	1	2016-01-28 13:30:07	2016-01-28 13:31:54
1996	373	35	1	1	1437.50	0.00	0.00	1	1	2016-01-28 13:30:07	2016-01-28 13:31:54
1997	374	8	1	1	500.00	0.00	0.00	3	2	2016-01-28 15:29:53	2016-01-28 15:30:42
1998	374	16	2	1	500.00	0.00	0.00	3	1	2016-01-28 15:29:53	2016-01-28 15:30:42
1999	374	10	1000	1	1.00	0.00	0.00	1	1	2016-01-28 15:29:53	2016-02-01 12:10:09
2003	375	4	8	15	75.00	0.00	0.00	1	1	2016-02-01 16:52:26	2016-02-01 16:53:17
2001	374	14	30	1	125.00	0.00	0.00	1	1	2016-01-28 15:29:53	2016-01-28 15:30:42
2004	375	8	1	1	500.00	0.00	0.00	3	2	2016-02-01 16:52:26	2016-02-01 16:53:17
2005	375	16	5	1	500.00	0.00	0.00	3	1	2016-02-01 16:52:26	2016-02-01 16:53:17
2006	375	9	10000	1	0.55	0.00	0.00	1	1	2016-02-01 16:52:26	2016-02-01 16:53:17
2007	375	10	1000	1	1.00	0.00	0.00	1	1	2016-02-01 16:52:26	2016-02-01 16:53:17
2008	375	35	1	1	1437.50	0.00	0.00	1	1	2016-02-01 16:52:26	2016-02-01 16:53:17
2012	378	10	500	15	1.00	0.00	0.00	1	1	2016-02-03 10:08:44	2016-02-03 10:09:19
2010	377	14	24	1	125.00	0.00	0.00	1	1	2016-02-03 09:57:18	2016-02-03 09:58:04
2011	377	29	17000	1	1.00	0.00	0.00	1	1	2016-02-03 09:57:18	2016-02-03 09:58:05
2013	378	11	150	1	10.00	0.00	0.00	1	1	2016-02-03 10:08:44	2016-02-03 10:09:19
2014	379	9	20000	1	0.55	0.00	0.00	1	1	2016-02-03 10:14:05	2016-02-03 10:16:12
2015	379	14	100	250	125.00	0.00	0.00	1	1	2016-02-03 10:14:05	2016-02-03 10:16:12
2016	380	4	5	15	75.00	0.00	0.00	1	1	2016-02-04 15:03:01	2016-02-04 15:03:38
2017	380	8	1	1	500.00	0.00	0.00	3	2	2016-02-04 15:03:01	2016-02-04 15:03:38
2018	380	16	3	1	500.00	0.00	0.00	3	1	2016-02-04 15:03:01	2016-02-04 15:03:38
2019	380	9	5000	1	0.55	0.00	0.00	1	1	2016-02-04 15:03:01	2016-02-04 15:03:38
2020	381	1	5	15	75.00	0.00	0.00	1	1	2016-02-04 15:59:26	2016-02-04 16:01:00
2021	381	4	8	15	75.00	0.00	0.00	1	1	2016-02-04 15:59:26	2016-02-04 16:01:00
2022	381	7	2	1	500.00	0.00	0.00	6	2.9000001	2016-02-04 15:59:26	2016-02-04 16:01:00
2023	381	8	1	1	500.00	0.00	0.00	3	2	2016-02-04 15:59:26	2016-02-04 16:01:00
2024	381	16	5	1	500.00	0.00	0.00	3	1	2016-02-04 15:59:26	2016-02-04 16:01:00
2025	381	18	2	1	500.00	0.00	0.00	4	3	2016-02-04 15:59:26	2016-02-04 16:01:00
2026	381	9	20000	1	0.55	0.00	0.00	1	1	2016-02-04 15:59:26	2016-02-04 16:01:00
2027	381	10	2000	1	1.00	0.00	0.00	1	1	2016-02-04 15:59:26	2016-02-04 16:01:00
2028	381	31	1	1	10000.00	0.00	0.00	1	1	2016-02-04 15:59:26	2016-02-04 16:01:00
2029	381	35	1	1	1437.50	0.00	0.00	1	1	2016-02-04 15:59:26	2016-02-04 16:01:00
2039	383	9	20000	1	0.55	0.00	0.00	1	1	2016-02-11 10:41:10	2016-02-11 10:41:41
2031	381	5	2	1	3750.00	0.00	0.00	1	1	2016-02-04 16:04:43	2016-02-04 16:04:43
2032	381	40	1	1	10000.00	0.00	0.00	1	1	2016-02-04 16:05:29	2016-02-04 16:05:29
2033	380	10	1000	1	1.00	0.00	0.00	1	1	2016-02-08 12:50:23	2016-02-08 12:50:23
2067	387	42	4	1	1500.00	0.00	0.00	1	1	2016-02-29 14:14:17	2016-02-29 14:15:34
2066	387	12	1	1	20000.00	0.00	0.00	1	1	2016-02-29 14:14:17	2016-02-29 14:15:34
2065	387	9	20000	1	0.55	0.00	0.00	1	1	2016-02-29 14:14:17	2016-02-29 14:15:34
2037	382	29	14250	1	1.00	0.00	0.00	1	1	2016-02-08 15:36:50	2016-02-08 15:37:56
2064	387	8	1	1	500.00	0.00	0.00	3	2	2016-02-29 14:14:17	2016-02-29 14:15:34
2041	384	8	1	1	500.00	0.00	0.00	3	2	2016-02-17 15:39:50	2016-02-17 15:40:59
2042	384	16	3	1	500.00	0.00	0.00	3	1	2016-02-17 15:39:50	2016-02-17 15:40:59
2133	401	10	1000	1	1.00	0.00	0.00	1	1	2016-03-23 15:45:44	2016-03-23 15:46:26
2044	384	10	1000	1	1.00	0.00	0.00	1	1	2016-02-17 15:39:50	2016-02-17 15:40:59
2045	384	12	1	1	20000.00	0.00	0.00	1	1	2016-02-17 15:39:50	2016-02-17 15:40:59
2046	384	31	1	1	10000.00	0.00	0.00	1	1	2016-02-17 15:39:50	2016-02-17 15:40:59
2048	385	4	10	15	75.00	0.00	0.00	1	1	2016-02-17 15:53:09	2016-03-21 16:22:35
2135	401	29	5000	1	1.00	0.00	0.00	1	1	2016-03-23 15:45:44	2016-03-23 15:46:26
2134	401	11	300	1	10.00	0.00	0.00	1	1	2016-03-23 15:45:44	2016-03-23 15:46:26
2051	385	9	10000	1	0.55	0.00	0.00	1	1	2016-02-17 15:53:09	2016-02-17 15:55:24
2052	385	10	1000	1	1.00	0.00	0.00	1	1	2016-02-17 15:53:09	2016-02-17 15:55:24
2053	385	35	1	1	1437.50	0.00	0.00	1	1	2016-02-17 15:53:09	2016-02-17 15:55:24
2054	386	1	4	15	75.00	0.00	0.00	1	1	2016-02-19 13:26:30	2016-02-19 13:28:01
2055	386	4	8	15	75.00	0.00	0.00	1	1	2016-02-19 13:26:30	2016-02-19 13:28:01
2056	386	8	1	1	500.00	0.00	0.00	3	2	2016-02-19 13:26:30	2016-02-19 13:28:01
2057	386	16	5	1	500.00	0.00	0.00	3	1	2016-02-19 13:26:30	2016-02-24 13:33:24
2058	386	9	10000	1	0.55	0.00	0.00	1	1	2016-02-19 13:26:30	2016-02-24 13:33:38
2059	386	10	1000	1	1.00	0.00	0.00	1	1	2016-02-19 13:26:30	2016-02-19 13:28:01
2060	386	12	1	1	20000.00	0.00	0.00	1	1	2016-02-19 13:26:30	2016-02-19 13:28:01
2061	386	31	1	1	10000.00	0.00	0.00	1	1	2016-02-19 13:26:30	2016-02-19 13:28:01
2062	386	29	20000	1	1.00	0.00	0.00	1	1	2016-02-19 13:26:30	2016-02-19 13:28:01
2063	386	35	1	1	1437.50	0.00	0.00	1	1	2016-02-19 13:26:30	2016-02-19 13:28:01
2068	388	4	6	15	75.00	0.00	0.00	1	1	2016-02-29 15:00:10	2016-02-29 15:01:21
2069	388	8	2	1	500.00	0.00	0.00	3	2	2016-02-29 15:00:10	2016-02-29 15:01:21
2070	388	10	1000	1	1.00	0.00	0.00	1	1	2016-02-29 15:00:10	2016-02-29 15:01:21
2071	389	4	8	10	75.00	0.00	0.00	1	1	2016-02-29 16:51:24	2016-02-29 16:52:22
2072	389	8	1	1	500.00	0.00	0.00	3	2	2016-02-29 16:51:24	2016-02-29 16:52:22
2073	389	16	4	1	500.00	0.00	0.00	3	1	2016-02-29 16:51:24	2016-02-29 16:52:22
2074	389	9	10000	1	0.55	0.00	0.00	1	1	2016-02-29 16:51:24	2016-02-29 16:52:22
2075	389	10	1000	1	1.00	0.00	0.00	1	1	2016-02-29 16:51:24	2016-02-29 16:52:22
2076	390	4	6	15	75.00	0.00	0.00	1	1	2016-02-29 17:54:08	2016-02-29 17:57:05
2077	390	8	1	1	500.00	0.00	0.00	3	2	2016-02-29 17:54:08	2016-02-29 17:57:05
2078	390	16	3	1	500.00	0.00	0.00	3	1	2016-02-29 17:54:08	2016-02-29 17:57:05
2079	390	9	10000	1	0.55	0.00	0.00	1	1	2016-02-29 17:54:08	2016-02-29 17:57:05
2080	390	10	1000	1	1.00	0.00	0.00	1	1	2016-02-29 17:54:09	2016-02-29 17:57:05
2081	390	12	1	1	20000.00	0.00	0.00	1	1	2016-02-29 17:54:09	2016-02-29 17:57:05
2082	368	4	10	15	75.00	0.00	0.00	1	1	2016-03-07 14:02:14	2016-03-07 14:02:14
2083	368	29	25000	1	1.00	0.00	0.00	1	1	2016-03-07 14:03:05	2016-03-14 15:20:01
2109	397	9	5000	1	0.55	0.00	0.00	1	1	2016-03-15 10:35:27	2016-03-15 10:36:46
2086	391	4	8	15	75.00	0.00	0.00	1	1	2016-03-09 09:37:20	2016-03-09 09:42:25
2137	402	9	10000	1	0.55	0.00	0.00	1	1	2016-04-01 16:10:45	2016-04-01 16:11:43
2136	402	4	10	15	75.00	0.00	0.00	1	1	2016-04-01 16:10:45	2016-04-01 16:11:43
2089	391	10	1000	1	1.00	0.00	0.00	1	1	2016-03-09 09:37:20	2016-03-09 09:42:25
2090	391	12	1	1	20000.00	0.00	0.00	1	1	2016-03-09 09:37:20	2016-03-09 09:42:25
2091	391	31	1	1	10000.00	0.00	0.00	1	1	2016-03-09 09:37:20	2016-03-09 09:42:25
2138	402	10	1000	2	1.00	0.00	0.00	1	1	2016-04-01 16:10:45	2016-04-01 16:11:43
2093	391	29	25000	1	1.00	0.00	0.00	1	1	2016-03-09 09:37:20	2016-03-29 14:09:40
2094	392	16	4	1	500.00	0.00	0.00	3	1	2016-03-14 13:16:33	2016-03-14 13:17:22
2095	392	9	30000	1	0.55	0.00	0.00	1	1	2016-03-14 13:16:34	2016-03-14 13:17:22
2096	392	29	25500	1	1.00	0.00	0.00	1	1	2016-03-14 13:16:34	2016-03-14 13:17:22
2097	393	4	8	15	75.00	0.00	0.00	1	1	2016-03-14 13:36:31	2016-03-14 13:37:13
2098	393	12	1	1	20000.00	0.00	0.00	1	1	2016-03-14 13:36:31	2016-03-14 13:37:13
2099	393	28	2	1	5000.00	0.00	0.00	1	1	2016-03-14 13:36:31	2016-03-14 13:37:13
2100	394	4	10	15	75.00	0.00	0.00	1	1	2016-03-14 13:54:24	2016-03-14 13:55:19
2101	394	9	10000	1	0.55	0.00	0.00	1	1	2016-03-14 13:54:24	2016-03-14 13:55:19
2102	394	10	1000	1	1.00	0.00	0.00	1	1	2016-03-14 13:54:24	2016-03-14 13:55:19
2103	395	12	1	1	20000.00	0.00	0.00	1	1	2016-03-14 14:04:58	2016-03-14 14:05:20
2104	395	25	1	1	10000.00	0.00	0.00	1	1	2016-03-14 14:04:58	2016-03-14 14:05:20
2105	396	4	8	15	75.00	0.00	0.00	1	1	2016-03-14 14:43:40	2016-03-14 14:44:33
2106	396	10	1000	1	1.00	0.00	0.00	1	1	2016-03-14 14:43:40	2016-03-14 14:44:33
2107	396	25	1	1	10000.00	0.00	0.00	1	1	2016-03-14 14:43:40	2016-03-14 14:44:33
2110	397	10	1000	1	1.00	0.00	0.00	1	1	2016-03-15 10:35:27	2016-03-15 10:36:46
2111	398	4	8	15	75.00	0.00	0.00	1	1	2016-03-16 17:48:53	2016-03-16 17:50:36
2112	398	8	1	1	500.00	0.00	0.00	3	2	2016-03-16 17:48:53	2016-03-16 17:50:36
2113	398	16	4	1	500.00	0.00	0.00	3	1	2016-03-16 17:48:53	2016-03-16 17:50:36
2114	398	9	10000	1	0.55	0.00	0.00	1	1	2016-03-16 17:48:53	2016-03-16 17:50:36
2115	398	10	1000	1	1.00	0.00	0.00	1	1	2016-03-16 17:48:53	2016-03-16 17:50:36
2116	398	12	1	1	20000.00	0.00	0.00	1	1	2016-03-16 17:48:53	2016-03-16 17:50:36
2117	398	35	1	1	1437.50	0.00	0.00	1	1	2016-03-16 17:48:53	2016-03-16 17:50:36
2118	399	4	7	7	75.00	0.00	0.00	1	1	2016-03-21 13:33:38	2016-03-21 13:34:18
2119	399	9	5000	1	0.55	0.00	0.00	1	1	2016-03-21 13:33:38	2016-03-21 13:34:18
2120	399	10	1000	1	1.00	0.00	0.00	1	1	2016-03-21 13:33:38	2016-03-21 13:34:18
2121	400	1	5	15	75.00	0.00	0.00	1	1	2016-03-21 14:34:31	2016-03-21 14:39:16
2122	400	4	10	15	75.00	0.00	0.00	1	1	2016-03-21 14:34:31	2016-03-21 14:39:16
2123	400	5	3	1	3750.00	0.00	0.00	1	1	2016-03-21 14:34:31	2016-03-21 14:39:16
2124	400	7	6	1	500.00	0.00	0.00	6	2.9000001	2016-03-21 14:34:31	2016-03-21 14:39:16
2125	400	18	4	1	500.00	0.00	0.00	4	3	2016-03-21 14:34:31	2016-03-21 14:39:16
2126	400	41	4	1	500.00	0.00	0.00	6	3	2016-03-21 14:34:31	2016-03-21 14:39:16
2127	400	9	200000	1	0.55	0.00	0.00	1	1	2016-03-21 14:34:31	2016-03-21 14:39:16
2128	400	10	5000	1	1.00	0.00	0.00	1	1	2016-03-21 14:34:31	2016-03-21 14:39:16
2129	400	11	250	1	10.00	0.00	0.00	1	1	2016-03-21 14:34:31	2016-03-21 14:39:16
2130	400	29	120000	1	1.00	0.00	0.00	1	1	2016-03-21 14:34:31	2016-03-21 14:39:16
2131	400	35	2	1	1437.50	0.00	0.00	1	1	2016-03-21 14:34:31	2016-03-21 14:39:17
2132	400	16	15	1	500.00	0.00	0.00	3	1	2016-03-21 14:40:31	2016-03-21 14:40:31
2139	402	35	1	1	1437.50	0.00	0.00	1	1	2016-04-01 16:10:45	2016-04-01 16:11:43
2140	403	1	5	15	75.00	0.00	0.00	1	1	2016-04-01 16:16:54	2016-04-01 16:18:47
2141	403	4	10	15	75.00	0.00	0.00	1	1	2016-04-01 16:16:54	2016-04-01 16:18:47
2142	403	5	1	1	3750.00	0.00	0.00	1	1	2016-04-01 16:16:54	2016-04-01 16:18:47
2143	403	7	2	1	500.00	0.00	0.00	6	2.9000001	2016-04-01 16:16:54	2016-04-01 16:18:47
2144	403	16	4	1	500.00	0.00	0.00	3	1	2016-04-01 16:16:54	2016-04-01 16:18:47
2145	403	18	4	1	500.00	0.00	0.00	4	3	2016-04-01 16:16:54	2016-04-01 16:18:47
2146	403	41	1	1	500.00	0.00	0.00	6	3	2016-04-01 16:16:54	2016-04-01 16:18:47
2147	403	9	20000	1	0.55	0.00	0.00	1	1	2016-04-01 16:16:54	2016-04-01 16:18:47
2148	403	10	1000	2	1.00	0.00	0.00	1	1	2016-04-01 16:16:54	2016-04-01 16:18:47
2149	403	12	1	1	20000.00	0.00	0.00	1	1	2016-04-01 16:16:54	2016-04-01 16:18:47
2150	403	31	1	1	10000.00	0.00	0.00	1	1	2016-04-01 16:16:54	2016-04-01 16:18:47
2151	403	35	1	1	1437.50	0.00	0.00	1	1	2016-04-01 16:16:54	2016-04-01 16:18:47
2152	404	4	6	15	75.00	0.00	0.00	1	1	2016-04-01 16:22:57	2016-04-01 16:23:37
2153	404	12	1	1	20000.00	0.00	0.00	1	1	2016-04-01 16:22:57	2016-04-01 16:23:37
2154	404	25	1	1	10000.00	0.00	0.00	1	1	2016-04-01 16:22:57	2016-04-01 16:23:37
2155	404	35	1	1	1437.50	0.00	0.00	1	1	2016-04-01 16:22:57	2016-04-01 16:23:37
2156	404	10	1000	1	1.00	0.00	0.00	1	1	2016-04-01 16:24:04	2016-04-01 16:24:04
2157	405	1	5	15	75.00	0.00	0.00	1	1	2016-04-04 15:05:47	2016-04-04 15:09:19
2158	405	4	10	1	75.00	0.00	0.00	1	1	2016-04-04 15:05:47	2016-04-04 15:09:19
2159	405	5	1	1	3750.00	0.00	0.00	1	1	2016-04-04 15:05:47	2016-04-04 15:09:19
2160	405	9	20000	1	0.55	0.00	0.00	1	1	2016-04-04 15:05:47	2016-04-04 15:09:19
2161	405	10	2000	1	1.00	0.00	0.00	1	1	2016-04-04 15:05:47	2016-04-04 15:09:19
2162	405	12	1	1	20000.00	0.00	0.00	1	1	2016-04-04 15:05:47	2016-04-04 15:09:19
2163	405	29	20000	1	1.00	0.00	0.00	1	1	2016-04-04 15:05:47	2016-04-04 15:09:19
2164	405	35	1	1	1437.50	0.00	0.00	1	1	2016-04-04 15:05:47	2016-04-04 15:09:19
2165	406	4	8	15	75.00	0.00	0.00	1	1	2016-04-04 15:26:30	2016-04-04 15:27:05
2166	406	9	10000	1	0.55	0.00	0.00	1	1	2016-04-04 15:26:30	2016-04-04 15:27:05
2167	406	10	1000	1	1.00	0.00	0.00	1	1	2016-04-04 15:26:30	2016-04-04 15:27:05
2168	403	29	25000	1	1.00	0.00	0.00	1	1	2016-04-04 15:47:02	2016-04-04 15:47:02
2169	407	1	5	15	75.00	0.00	0.00	1	1	2016-04-12 11:33:33	2016-04-12 11:34:28
2170	407	4	10	15	75.00	0.00	0.00	1	1	2016-04-12 11:33:33	2016-04-12 11:34:28
2171	407	9	10000	1	0.55	0.00	0.00	1	1	2016-04-12 11:33:33	2016-04-12 11:34:28
2172	407	10	1000	2	1.00	0.00	0.00	1	1	2016-04-12 11:33:33	2016-04-12 11:34:28
2173	407	12	1	1	20000.00	0.00	0.00	1	1	2016-04-12 11:33:33	2016-04-12 11:34:28
2174	407	35	1	1	1437.50	0.00	0.00	1	1	2016-04-12 11:33:33	2016-04-12 11:34:28
2175	408	4	8	15	75.00	0.00	0.00	1	1	2016-04-12 11:50:01	2016-04-12 11:52:52
2176	408	9	10000	1	0.55	0.00	0.00	1	1	2016-04-12 11:50:01	2016-04-12 11:52:52
2177	408	10	1000	1	1.00	0.00	0.00	1	1	2016-04-12 11:50:01	2016-04-12 11:52:52
2178	408	12	1	1	20000.00	0.00	0.00	1	1	2016-04-12 11:50:01	2016-04-12 11:52:52
2179	408	35	1	1	1437.50	0.00	0.00	1	1	2016-04-12 11:50:01	2016-04-12 11:52:52
2180	409	4	8	15	75.00	0.00	0.00	1	1	2016-04-12 12:07:03	2016-04-12 12:08:09
2181	409	7	2	1	500.00	0.00	0.00	6	2.9000001	2016-04-12 12:07:03	2016-04-12 12:08:09
2182	409	18	2	1	500.00	0.00	0.00	4	3	2016-04-12 12:07:03	2016-04-12 12:08:09
2183	409	43	100	1	500.00	0.00	0.00	0.400000006	0.300000012	2016-04-12 12:07:03	2016-04-12 13:53:04
2184	409	9	100000	1	0.55	0.00	0.00	1	1	2016-04-12 12:07:03	2016-04-12 12:08:09
2185	409	10	2000	1	1.00	0.00	0.00	1	1	2016-04-12 12:07:03	2016-04-12 12:08:09
2186	409	35	1	1	1437.50	0.00	0.00	1	1	2016-04-12 12:07:03	2016-04-12 12:08:09
2187	410	4	7	10	75.00	0.00	0.00	1	1	2016-04-12 12:16:47	2016-04-12 12:17:22
2188	410	9	10000	1	0.55	0.00	0.00	1	1	2016-04-12 12:16:47	2016-04-12 12:17:22
2189	410	10	1000	1	1.00	0.00	0.00	1	1	2016-04-12 12:16:47	2016-04-12 12:17:22
2190	410	35	1	1	1437.50	0.00	0.00	1	1	2016-04-12 12:16:47	2016-04-12 12:17:22
2191	411	19	10	1	320.00	0.00	0.00	1	1	2016-04-12 12:20:17	2016-04-12 12:20:45
2192	411	29	10000	1	1.00	0.00	0.00	1	1	2016-04-12 12:20:17	2016-04-12 12:20:45
2193	412	4	7	10	75.00	0.00	0.00	1	1	2016-04-12 13:32:43	2016-04-12 13:33:18
2194	412	9	10000	1	0.55	0.00	0.00	1	1	2016-04-12 13:32:43	2016-04-12 13:33:18
2195	412	10	1000	1	1.00	0.00	0.00	1	1	2016-04-12 13:32:43	2016-04-12 13:33:18
2196	412	25	1	1	10000.00	0.00	0.00	1	1	2016-04-12 13:32:43	2016-04-12 13:33:18
2197	409	16	4	1	500.00	0.00	0.00	3	1	2016-04-12 13:58:57	2016-04-12 13:58:57
2198	409	41	1	1	500.00	0.00	0.00	6	3	2016-04-12 13:59:28	2016-04-12 13:59:28
2199	413	8	1	1	500.00	0.00	0.00	3	2	2016-04-27 11:44:14	2016-04-27 11:44:51
2200	413	41	1	1	500.00	0.00	0.00	6	3	2016-04-27 11:44:14	2016-04-27 11:44:51
2201	413	25	1	1	10000.00	0.00	0.00	1	1	2016-04-27 11:44:14	2016-04-27 11:44:52
2202	413	29	10000	1	1.00	0.00	0.00	1	1	2016-04-27 11:44:14	2016-04-27 11:44:52
2203	414	16	2	1	500.00	0.00	0.00	3	1	2016-04-29 10:16:16	2016-04-29 10:16:40
2204	414	29	8750	1	1.00	0.00	0.00	1	1	2016-04-29 10:16:16	2016-04-29 10:16:40
2205	415	4	10	15	75.00	0.00	0.00	1	1	2016-05-03 10:24:35	2016-05-03 10:25:29
2206	415	32	5	15	75.00	0.00	0.00	1	1	2016-05-03 10:24:35	2016-05-03 10:25:29
2207	415	8	1	1	500.00	0.00	0.00	3	2	2016-05-03 10:24:35	2016-05-03 10:25:29
2208	415	16	5	1	500.00	0.00	0.00	3	1	2016-05-03 10:24:35	2016-05-03 10:25:29
2209	415	9	10000	1	0.55	0.00	0.00	1	1	2016-05-03 10:24:35	2016-05-03 10:25:29
2210	415	10	1000	1	1.00	0.00	0.00	1	1	2016-05-03 10:24:35	2016-05-03 10:25:30
2211	416	12	1	1	20000.00	0.00	0.00	1	1	2016-05-04 10:34:23	2016-05-04 10:36:10
2212	416	42	5	1	1500.00	0.00	0.00	1	1	2016-05-04 10:34:23	2016-05-04 10:36:10
2213	416	29	25000	1	1.00	0.00	0.00	1	1	2016-05-04 10:34:23	2016-05-04 10:36:10
2214	417	4	8	15	75.00	0.00	0.00	1	1	2016-05-04 10:53:10	2016-05-04 10:54:19
2215	417	9	5000	1	0.55	0.00	0.00	1	1	2016-05-04 10:53:10	2016-05-04 10:54:19
2216	417	45	5	1	400.00	0.00	0.00	1	1	2016-05-04 10:53:10	2016-05-11 11:33:22
2217	418	1	8	15	75.00	0.00	0.00	1	1	2016-05-04 12:48:48	2016-05-04 12:50:10
2218	418	4	8	15	75.00	0.00	0.00	1	1	2016-05-04 12:48:48	2016-05-04 12:50:10
2219	418	8	1	1	500.00	0.00	0.00	3	2	2016-05-04 12:48:48	2016-05-04 12:50:10
2220	418	16	4	1	500.00	0.00	0.00	3	1	2016-05-04 12:48:48	2016-05-04 12:50:10
2221	418	9	10000	1	0.55	0.00	0.00	1	1	2016-05-04 12:48:48	2016-05-04 12:50:10
2222	418	10	1000	1	1.00	0.00	0.00	1	1	2016-05-04 12:48:48	2016-05-04 12:50:10
2223	418	12	1	1	20000.00	0.00	0.00	1	1	2016-05-04 12:48:48	2016-05-04 12:50:10
2224	418	31	1	1	10000.00	0.00	0.00	1	1	2016-05-04 12:48:48	2016-05-04 12:50:10
2225	418	42	4	1	1500.00	0.00	0.00	1	1	2016-05-04 12:48:48	2016-05-04 12:50:10
2226	418	35	1	1	1437.50	0.00	0.00	1	1	2016-05-04 12:48:48	2016-05-04 12:50:10
2330	437	16	3	1	500.00	0.00	0.00	3	1	2016-05-13 09:58:51	2016-05-13 09:59:24
2228	419	4	8	15	75.00	0.00	0.00	1	1	2016-05-04 12:56:36	2016-05-04 12:58:07
2229	419	8	1	1	500.00	0.00	0.00	3	2	2016-05-04 12:56:36	2016-05-04 12:58:07
2230	419	16	4	1	500.00	0.00	0.00	3	1	2016-05-04 12:56:36	2016-05-04 12:58:07
2231	419	9	10000	1	0.55	0.00	0.00	1	1	2016-05-04 12:56:36	2016-05-04 12:58:07
2232	419	10	1000	1	1.00	0.00	0.00	1	1	2016-05-04 12:56:36	2016-05-04 12:58:07
2326	431	16	3	1	500.00	0.00	0.00	3	1	2016-05-10 13:56:10	2016-05-10 13:56:10
2234	419	35	1	1	1437.50	0.00	0.00	1	1	2016-05-04 12:56:36	2016-05-04 12:58:07
2235	420	32	5	15	75.00	0.00	0.00	1	1	2016-05-05 09:43:56	2016-05-10 13:38:22
2236	420	4	10	15	75.00	0.00	0.00	1	1	2016-05-05 09:44:23	2016-05-10 13:35:20
2237	420	9	30000	1	0.55	0.00	0.00	1	1	2016-05-05 09:45:04	2016-05-10 13:35:48
2238	420	16	6	1	500.00	0.00	0.00	3	1	2016-05-05 09:51:47	2016-05-10 13:36:01
2239	420	8	1	1	500.00	0.00	0.00	3	2	2016-05-05 09:52:09	2016-05-05 09:52:09
2240	420	12	1	2	20000.00	0.00	0.00	1	1	2016-05-05 09:52:25	2016-05-10 13:40:34
2241	420	10	2000	1	1.00	0.00	0.00	1	1	2016-05-05 09:53:15	2016-05-05 09:53:15
2242	420	43	100	1	500.00	0.00	0.00	0.400000006	0.300000012	2016-05-05 09:54:24	2016-05-05 09:54:24
2243	420	31	1	1	10000.00	0.00	0.00	1	1	2016-05-05 09:55:01	2016-05-05 09:55:01
2244	420	18	3	1	500.00	0.00	0.00	4	3	2016-05-05 09:55:39	2016-05-10 13:38:53
2245	420	25	1	1	10000.00	0.00	0.00	1	1	2016-05-05 09:56:28	2016-05-05 09:56:28
2246	420	7	2	1	500.00	0.00	0.00	6	2.9000001	2016-05-05 09:57:29	2016-05-10 13:39:22
2325	430	42	6	1	1500.00	0.00	0.00	1	1	2016-05-10 13:47:12	2016-05-10 13:47:12
2248	418	25	1	1	10000.00	0.00	0.00	1	1	2016-05-05 10:53:56	2016-05-05 10:53:56
2250	422	29	25500	1	1.00	0.00	0.00	1	1	2016-05-06 09:25:40	2016-05-06 09:25:40
2251	423	29	25500	1	1.00	0.00	0.00	1	1	2016-05-06 09:27:19	2016-05-06 09:27:19
2252	424	10	500	1	1.00	0.00	0.00	1	1	2016-05-06 09:41:27	2016-05-06 09:42:10
2253	424	44	400	3	2475.00	0.00	0.00	1	1	2016-05-06 09:41:27	2016-05-06 09:42:10
2329	437	8	1	1	500.00	0.00	0.00	3	2	2016-05-13 09:58:51	2016-05-13 09:59:24
2328	437	32	5	15	75.00	0.00	0.00	1	1	2016-05-13 09:58:51	2016-05-13 09:59:24
2327	437	4	8	15	75.00	0.00	0.00	1	1	2016-05-13 09:58:51	2016-05-13 09:59:24
2257	426	2	5	15	75.00	0.00	0.00	1	1	2016-05-06 10:07:35	2016-05-10 13:44:07
2258	426	4	8	15	75.00	0.00	0.00	1	1	2016-05-06 10:07:35	2016-05-06 10:08:22
2259	426	8	1	1	500.00	0.00	0.00	3	2	2016-05-06 10:07:35	2016-05-06 10:08:22
2260	426	16	5	1	500.00	0.00	0.00	3	1	2016-05-06 10:07:35	2016-05-10 13:44:27
2261	426	9	10000	1	0.55	0.00	0.00	1	1	2016-05-06 10:07:35	2016-05-06 10:08:22
2262	426	10	1000	1	1.00	0.00	0.00	1	1	2016-05-06 10:07:35	2016-05-06 10:08:22
2263	426	35	1	1	1437.50	0.00	0.00	1	1	2016-05-06 10:07:35	2016-05-06 10:08:22
2264	427	1	5	15	75.00	0.00	0.00	1	1	2016-05-06 10:51:54	2016-05-06 10:56:47
2265	427	4	8	15	75.00	0.00	0.00	1	1	2016-05-06 10:51:54	2016-05-06 10:56:47
2266	427	32	5	15	75.00	0.00	0.00	1	1	2016-05-06 10:51:54	2016-05-06 10:56:47
2267	427	5	2	1	3750.00	0.00	0.00	1	1	2016-05-06 10:51:54	2016-05-06 10:56:47
2268	427	8	1	1	500.00	0.00	0.00	3	2	2016-05-06 10:51:54	2016-05-06 10:56:47
2269	427	16	6	1	500.00	0.00	0.00	3	1	2016-05-06 10:51:54	2016-05-06 10:56:47
2270	427	18	3	1	500.00	0.00	0.00	4	3	2016-05-06 10:51:54	2016-05-06 10:56:47
2271	427	38	3	1	500.00	0.00	0.00	6	4	2016-05-06 10:51:54	2016-05-06 10:56:47
2272	427	9	10000	1	0.55	0.00	0.00	1	1	2016-05-06 10:51:54	2016-05-06 10:56:47
2273	427	10	1000	1	1.00	0.00	0.00	1	1	2016-05-06 10:51:54	2016-05-06 10:56:47
2274	427	31	1	1	10000.00	0.00	0.00	1	1	2016-05-06 10:51:54	2016-05-06 10:56:47
2275	427	40	1	1	10000.00	0.00	0.00	1	1	2016-05-06 10:51:54	2016-05-06 10:56:47
2276	427	35	1	1	1437.50	0.00	0.00	1	1	2016-05-06 10:51:54	2016-05-06 10:56:47
2277	427	37	1	1	3000.00	0.00	0.00	1	1	2016-05-06 10:51:54	2016-05-06 10:56:47
2278	428	4	8	1	75.00	0.00	0.00	1	1	2016-05-06 11:59:00	2016-05-06 12:07:05
2279	428	8	1	1	500.00	0.00	0.00	3	2	2016-05-06 11:59:00	2016-05-06 12:07:05
2280	428	16	4	1	500.00	0.00	0.00	3	1	2016-05-06 11:59:00	2016-05-06 12:07:05
2281	428	9	10000	1	0.55	0.00	0.00	1	1	2016-05-06 11:59:00	2016-05-06 12:07:05
2319	436	16	4	1	500.00	0.00	0.00	3	1	2016-05-10 12:25:49	2016-05-10 12:26:35
2318	436	8	1	1	500.00	0.00	0.00	3	2	2016-05-10 12:25:49	2016-05-10 12:26:35
2317	436	4	8	15	75.00	0.00	0.00	1	1	2016-05-10 12:25:49	2016-05-10 12:26:35
2316	435	35	1	1	1437.50	0.00	0.00	1	1	2016-05-10 12:18:26	2016-05-10 12:19:39
2315	435	10	1000	1	1.00	0.00	0.00	1	1	2016-05-10 12:18:26	2016-05-10 12:19:39
2314	435	9	30000	1	0.55	0.00	0.00	1	1	2016-05-10 12:18:26	2016-05-10 13:50:42
2313	435	41	1	1	500.00	0.00	0.00	6	3	2016-05-10 12:18:26	2016-05-10 12:19:39
2312	435	4	8	15	75.00	0.00	0.00	1	1	2016-05-10 12:18:26	2016-05-10 12:19:39
2311	435	2	5	15	75.00	0.00	0.00	1	1	2016-05-10 12:18:26	2016-05-10 13:50:29
2291	430	8	1	1	500.00	0.00	0.00	3	2	2016-05-10 11:38:52	2016-05-10 11:39:33
2292	430	10	5000	1	1.00	0.00	0.00	1	1	2016-05-10 11:38:52	2016-05-10 11:39:33
2293	430	12	1	1	20000.00	0.00	0.00	1	1	2016-05-10 11:38:52	2016-05-10 11:39:33
2294	431	8	1	1	500.00	0.00	0.00	3	2	2016-05-10 11:45:22	2016-05-10 11:45:36
2295	431	12	1	1	20000.00	0.00	0.00	1	1	2016-05-10 11:45:22	2016-05-10 11:45:36
2296	432	4	8	15	75.00	0.00	0.00	1	1	2016-05-10 11:53:19	2016-05-10 11:53:47
2297	432	8	1	1	500.00	0.00	0.00	3	2	2016-05-10 11:53:19	2016-05-10 11:53:47
2298	432	16	3	1	500.00	0.00	0.00	3	1	2016-05-10 11:53:19	2016-05-10 11:53:47
2299	432	10	1000	1	1.00	0.00	0.00	1	1	2016-05-10 11:53:19	2016-05-10 11:53:47
2356	444	4	10	15	75.00	0.00	0.00	1	1	2016-06-20 11:22:43	2016-07-04 13:20:19
2355	444	1	5	15	75.00	0.00	0.00	1	1	2016-06-20 11:22:43	2016-06-20 11:25:22
2354	443	10	3000	1	1.00	0.00	0.00	1	1	2016-05-30 10:07:26	2016-05-30 10:08:43
2353	443	9	30000	1	0.55	0.00	0.00	1	1	2016-05-30 10:07:26	2016-05-30 10:08:43
2352	443	18	4	1	500.00	0.00	0.00	4	3	2016-05-30 10:07:26	2016-05-30 10:08:43
2351	443	4	8	15	75.00	0.00	0.00	1	1	2016-05-30 10:07:26	2016-05-30 10:08:43
2350	442	42	6	1	1500.00	0.00	0.00	1	1	2016-05-26 10:48:34	2016-05-26 10:49:09
2307	434	4	8	15	75.00	0.00	0.00	1	1	2016-05-10 12:09:00	2016-05-10 12:09:28
2308	434	8	1	1	500.00	0.00	0.00	3	2	2016-05-10 12:09:00	2016-05-10 12:09:28
2309	434	16	2	1	500.00	0.00	0.00	3	1	2016-05-10 12:09:00	2016-05-10 12:09:28
2310	434	9	10000	1	0.55	0.00	0.00	1	1	2016-05-10 12:09:00	2016-05-10 12:09:28
2320	436	9	5000	1	0.55	0.00	0.00	1	1	2016-05-10 12:25:49	2016-05-10 12:26:35
2321	436	10	10	1	1.00	0.00	0.00	1	1	2016-05-10 12:25:49	2016-05-10 12:26:35
2322	436	12	1	1	20000.00	0.00	0.00	1	1	2016-05-10 12:25:49	2016-05-10 12:26:35
2323	436	25	1	1	10000.00	0.00	0.00	1	1	2016-05-10 12:25:49	2016-05-10 12:26:35
2324	436	31	1	1	10000.00	0.00	0.00	1	1	2016-05-10 12:25:49	2016-05-10 12:26:35
2331	437	10	1000	1	1.00	0.00	0.00	1	1	2016-05-13 09:58:51	2016-05-13 09:59:24
2332	438	8	1	1	500.00	0.00	0.00	3	2	2016-05-13 12:39:17	2016-05-13 12:39:29
2333	438	16	3	1	500.00	0.00	0.00	3	1	2016-05-13 12:39:17	2016-05-13 12:39:29
2334	439	4	8	15	75.00	0.00	0.00	1	1	2016-05-13 12:43:28	2016-05-13 12:43:53
2335	439	8	1	1	500.00	0.00	0.00	3	2	2016-05-13 12:43:28	2016-05-13 12:43:53
2336	439	16	3	1	500.00	0.00	0.00	3	1	2016-05-13 12:43:28	2016-05-13 12:43:53
2337	440	29	1500000	1	1.00	0.00	0.00	1	1	2016-05-18 15:59:36	2016-05-18 15:59:55
2338	440	1	5	15	75.00	0.00	0.00	1	1	2016-05-18 16:06:47	2016-05-18 16:06:47
2339	440	4	10	15	75.00	0.00	0.00	1	1	2016-05-18 16:07:22	2016-05-18 16:07:22
2340	440	7	4	1	500.00	0.00	0.00	6	2.9000001	2016-05-18 16:08:36	2016-05-18 16:08:36
2341	440	9	20000	2	0.55	0.00	0.00	1	1	2016-05-18 16:11:21	2016-05-18 16:11:21
2342	440	18	6	1	500.00	0.00	0.00	4	3	2016-05-18 16:13:36	2016-05-18 16:13:36
2343	440	10	5000	1	1.00	0.00	0.00	1	1	2016-05-18 16:14:03	2016-05-18 16:14:03
2344	441	7	4	1	500.00	0.00	0.00	6	2.9000001	2016-05-18 16:20:23	2016-05-18 16:22:48
2345	441	18	6	1	500.00	0.00	0.00	4	3	2016-05-18 16:20:23	2016-05-18 16:22:48
2346	441	9	20000	1	0.55	0.00	0.00	1	1	2016-05-18 16:20:23	2016-05-18 16:22:48
2347	441	10	5000	1	1.00	0.00	0.00	1	1	2016-05-18 16:20:23	2016-05-18 16:22:48
2348	441	28	6	1	5000.00	0.00	0.00	1	1	2016-05-18 16:20:23	2016-05-18 16:22:48
2349	441	29	750000	1	1.00	0.00	0.00	1	1	2016-05-18 16:20:23	2016-05-18 16:22:48
2357	444	16	6	1	500.00	0.00	0.00	3	1	2016-06-20 11:22:43	2016-07-04 13:20:32
2358	444	18	4	1	500.00	0.00	0.00	4	3	2016-06-20 11:22:43	2016-06-20 11:25:22
2359	444	9	20000	1	0.55	0.00	0.00	1	1	2016-06-20 11:22:43	2016-07-04 13:20:50
2360	444	10	1000	1	1.00	0.00	0.00	1	1	2016-06-20 11:22:43	2016-06-20 11:25:22
2375	444	5	1	1	3750.00	0.00	0.00	1	1	2016-07-11 11:51:16	2016-07-11 11:51:16
2362	444	31	1	1	10000.00	0.00	0.00	1	1	2016-06-20 11:22:43	2016-07-11 12:10:18
2363	444	29	100000	1	1.00	0.00	0.00	1	1	2016-06-20 11:22:43	2016-07-11 11:49:23
2364	444	35	1	2	1437.50	0.00	0.00	1	1	2016-06-20 11:22:43	2016-07-11 11:49:43
2365	445	16	3	1	500.00	0.00	0.00	3	1	2016-06-22 13:33:55	2016-06-22 13:34:39
2366	445	9	10000	1	0.55	0.00	0.00	1	1	2016-06-22 13:33:55	2016-06-22 13:34:39
2367	445	14	10	1	125.00	0.00	0.00	1	1	2016-06-22 13:33:55	2016-06-22 13:34:39
2379	448	9	10000	1	0.55	0.00	0.00	1	1	2016-07-11 12:41:55	2016-07-11 12:42:30
2378	448	16	5	1	500.00	0.00	0.00	3	1	2016-07-11 12:41:55	2016-07-11 12:42:30
2377	448	8	1	1	500.00	0.00	0.00	3	2	2016-07-11 12:41:55	2016-07-11 12:42:30
2376	448	4	8	15	75.00	0.00	0.00	1	1	2016-07-11 12:41:55	2016-07-11 12:42:30
2372	447	4	8	15	75.00	0.00	0.00	1	1	2016-07-05 11:37:14	2016-07-05 11:37:43
2373	447	8	1	1	500.00	0.00	0.00	3	2	2016-07-05 11:37:14	2016-07-05 11:37:43
2374	447	16	3	1	500.00	0.00	0.00	3	1	2016-07-05 11:37:14	2016-07-05 11:37:43
2380	448	10	1000	1	1.00	0.00	0.00	1	1	2016-07-13 12:59:31	2016-07-13 12:59:31
2381	449	26	10	1	500.00	0.00	0.00	8	5	2016-07-18 12:37:41	2016-07-18 12:38:01
2382	449	41	12	1	500.00	0.00	0.00	6	3	2016-07-18 12:37:41	2016-07-18 12:38:01
2383	450	18	4	1	500.00	0.00	0.00	4	3	2016-07-18 12:42:24	2016-07-18 12:42:41
2384	450	26	2	1	500.00	0.00	0.00	8	5	2016-07-18 12:42:24	2016-07-18 12:42:41
2385	451	29	25000	1	1.00	0.00	0.00	1	1	2016-07-18 12:45:43	2016-07-18 12:46:13
2386	452	16	2	1	500.00	0.00	0.00	3	1	2016-07-19 10:56:22	2016-07-19 10:59:31
2387	452	10	1000	1	1.00	0.00	0.00	1	1	2016-07-19 10:56:22	2016-07-19 10:59:31
2391	453	9	10000	1	0.55	0.00	0.00	1	1	2016-07-20 10:54:22	2016-07-20 10:54:39
2389	7	29	8500	1	1.00	0.00	0.00	1	1	2016-07-19 11:02:23	2016-07-19 11:02:23
2390	452	29	8500	1	1.00	0.00	0.00	1	1	2016-07-19 11:02:43	2016-07-19 11:02:43
2392	454	4	8	15	75.00	0.00	0.00	1	1	2016-07-20 11:02:36	2016-07-20 11:04:53
2393	454	5	1	1	3750.00	0.00	0.00	1	1	2016-07-20 11:02:36	2016-07-20 11:04:53
2394	454	9	10000	1	0.55	0.00	0.00	1	1	2016-07-20 11:02:36	2016-07-20 11:04:53
2395	454	10	1000	1	1.00	0.00	0.00	1	1	2016-07-20 11:02:36	2016-07-20 11:04:53
2396	455	4	8	15	75.00	0.00	0.00	1	1	2016-07-20 11:22:26	2016-07-20 11:23:10
2397	455	7	2	1	500.00	0.00	0.00	6	2.9000001	2016-07-20 11:22:26	2016-07-20 11:23:10
2398	455	18	4	1	500.00	0.00	0.00	4	3	2016-07-20 11:22:26	2016-07-20 11:23:10
2399	455	38	1	1	500.00	0.00	0.00	6	4	2016-07-20 11:22:26	2016-07-20 11:23:10
2400	455	35	30	1	1437.50	0.00	0.00	1	1	2016-07-20 11:22:26	2016-07-20 11:23:10
2401	456	9	50000	1	0.55	0.00	0.00	1	1	2016-07-21 15:10:57	2016-07-21 15:11:33
2402	454	16	4	1	500.00	0.00	0.00	3	1	2016-07-25 13:29:22	2016-07-25 13:29:22
2403	457	8	1	1	500.00	0.00	0.00	3	2	2016-07-25 14:24:46	2016-07-25 14:25:01
2404	457	16	2	1	500.00	0.00	0.00	3	1	2016-07-25 14:24:46	2016-07-25 14:25:01
1	1	1	1	1	75.00	0.00	0.00	1	1	2017-03-21 21:08:04.111434	2017-03-21 21:08:09.299375
2	1	7	1	1	500.00	0.00	0.00	6	2.9000001	2017-03-21 21:09:00.804928	2017-03-21 21:09:00.812934
\.


--
-- TOC entry 2262 (class 0 OID 0)
-- Dependencies: 192
-- Name: event_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('event_items_id_seq', 3, true);


--
-- TOC entry 2231 (class 0 OID 16441)
-- Dependencies: 195
-- Data for Name: event_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY event_types (id, event_type_name, created_at, updated_at) FROM stdin;
1	Music Show	2016-03-20 00:00:00	2016-03-20 00:00:00
2	Fashion Show	2016-03-20 00:00:00	2016-03-20 00:00:00
4	Movie Training	2016-03-20 00:00:00	2016-03-20 00:00:00
5	Others	2014-02-16 14:44:17	2014-02-16 14:44:17
\.


--
-- TOC entry 2263 (class 0 OID 0)
-- Dependencies: 194
-- Name: event_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('event_types_id_seq', 1, false);


--
-- TOC entry 2233 (class 0 OID 16449)
-- Dependencies: 197
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: -
--

COPY events (id, date_requested, event_name, organizers, location, requested_by, perceived_benefits, goodwill, event_type_id, created_at, updated_at) FROM stdin;
8	2014-03-04	Mother's day & Child's day party	Gambia Lebanese International School	Pipeline	Husein Shamseddin	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Africell has in the past sponsored events organised by the Gambia Lebanese International School and they have always been successful<br/>  I believe this is going to be a successful event	5	2014-03-18 15:24:19	2014-03-25 10:47:51
9	2014-02-26	Sheikh DVD Wrestling Competition	Sheikh DVD	Serrekunda west Mini Stadium	Tijan Barrow	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	The first Wrestling Competition was very successful and the turn out was great. the event was sponsored by africell. Based on the turn out of the first competition I believe we should support this second one.	5	2014-03-19 16:04:01	2014-03-19 16:04:01
10	2014-02-17	Sunu Musico 4th year anniversary	Sunu Musico	Pencha Mi Hall & Brikama	T-Smallz	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is Sunu Musico's 4th year Anniversary.  It has always been successful and Africell has always supported T-Smallz. This is an event worth Supporting.	1	2014-03-19 16:14:29	2014-03-19 16:14:29
11	2014-02-10	2 Sides of Beauty 2014	GMB Promotions	Brikama Jokor	Chris Black	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC\\r\\nAfricell to be the only GSM partner\\r\\nVenue to be branded by africell\\r\\nVIP tickets to be provided for Africell Staff	This will be the first time we will be working with GMB promotions.  They approached us last year for the first edition of this event due to time we couldn't sponsor. I think its a program worth sponsoring in Brikama	2	2014-03-25 11:00:15	2014-03-25 11:00:15
13	2014-02-17	Balabo Album Launch	MLC	Alliance Francaise	Modou Lamin Ceesay	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC\\r\\nAfricell to be the only GSM partner\\r\\nVenue to be branded by africell\\r\\nVIP tickets to be provided for Africell Staff	MLC as an artist has always worked with Africell, he is a hard musician from Bakau. He went with Africell up country during the Xtreme tour. The event is expected to be successful.	1	2014-03-25 11:42:23	2014-03-25 11:42:23
14	2014-02-26	Soninkara Music Award 	M.S Promotion & B Master Production	Alliance Francaise	Muhammed Saho (Afri-Radio)	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC\\r\\nAfricell to be the only GSM partner\\r\\nVenue to be branded by africell\\r\\nVIP tickets to be provided for Africell Staff	This is the first time africell will be sponsoring this event. it's an award ceremony for all the sarahule musicians in The Gambia. This event is expected to be successful.	1	2014-03-25 12:18:21	2014-03-25 12:18:21
15	2014-03-17	Contagious Bovine Pleuropnemonia	ActionAid The Gambia	Afri Radio	Jainaba Nyang	Cooperate Social Responsibility	Africell shall help Action Aid broadcast messages in the fight against Contagious Bovine Pleuropnemia. This is a deadly disease killing Cattle in the CRR. I believe its a cause worth supporting.	1	2014-03-27 17:03:25	2014-03-27 17:03:25
16	2014-03-28	3rd Division GFA Football League	Gambia Football Association	SK East Mini-Stadium	GFA	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC\\r\\nAfricell to be the only GSM partner\\r\\nVenue to be branded by africell\\r\\nVIP tickets to be provided for Africell Staff	Africell in Support of Sports.	5	2014-03-28 13:45:20	2014-03-28 13:45:20
17	2014-03-27	Alliance Francaise (Killa Ace)	Killa Ace	Alliance Francaise	Martin (Director Alliance)	Annual Contract	Annual Contract	1	2014-03-31 12:41:55	2014-03-31 12:41:55
18	2014-03-19	Fund Raising Concert for Malla Manneh	Matty Jobe Manka	Alliance Francaise	Matty Jobe Manka	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is a fund raising concert for Malla Manneh. Malla is a 19 year old girl suffering from Dermatofibrosarcoma on her face. I believe this is a cause worth supporting.	1	2014-04-01 12:37:50	2014-04-01 12:37:50
19	2014-03-19	Aling Domo	ST the Gambian Dream	Brikama Mini Stadium	Sanna Singhateh	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	ST is one the Most Popular artists in the Gambia.  He is a resident of Brikama. He is organising his annual show at the Brikama Box Bar Mini Stadium.  this show is expected to be very successful. I believe it is worth supporting	1	2014-04-01 15:40:18	2014-04-08 12:58:13
20	2014-03-31	Wrestling in Farafenni 	Jallow Kossom Promotion	Farafenni Mini Stadium	Musa Bah	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>	This is a big time wrestling promoter in Farafenni.  this will be the first time we will be working with him. I believe its an event worth sponsoring in farafenni (Up Country)	1	2014-04-01 16:34:04	2014-04-01 16:34:04
12	2014-02-25	Born Free Album Launch	Omid  Wisdom	Alliance Francaise	Omid Wisdom	Africell to be mentioned in all adverts\r\nAfricell's logo to be placed on all printed materials\r\nAfricell to mentioned during the program by the MC\r\nAfricell to be the only GSM partner\r\nVenue to be branded by africell\r\nVIP tickets to be provided for Africell Staff	Omid Wisdom is one of Gambia's finest hip hop artist, he as well runs a charitable organisation called "Learned Nation". He is a child and youth activist. He is Launching his album on the 29th and I believe it is worth sponsoring	1	2014-03-25 11:25:48	2017-03-21 21:33:15.110971
21	2014-03-10	Easter Fiesta	Dream Team Entertainment	Joint Officers Mess	DJ Nurudeen	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	DJ Nurudeen is a famous Sierra Leonean DJ in The Gambia. He works at Afri-Radio, Him and his team are organising an Easter Fiesta on the day after Easter. I believe it is important to support the Sierra Leonean Community in the Gambia.	5	2014-04-01 16:52:13	2014-04-01 16:52:13
54	2014-04-30	GRTS Fund Raising Gala Dinner	GRTS	Pencha Mi Hall 	Momodou Njie	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC\\r\\nAfricell to be the only GSM partner\\r\\nVenue to be branded by africell\\r\\nVIP tickets to be provided for Africell Staff	GRTS is the only Television station based in the Gambia and its the national broadcaster, they are bringing in Titi, a renowned Senegalese musician. I believe its an event worth supporting.	1	2014-05-07 12:47:24	2014-05-07 12:47:24
53	2014-04-29	Single Window Business Registery	WAX MEDIA	MDI Road	Ebou Waggeh CEO Wax media	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials'\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	We have been in patrnership before,and they are well recognise good company in media.They can be supported.	5	2014-05-06 11:41:56	2014-05-07 11:48:29
55	2014-05-01	Jah Vinci	DJ Bobo Fayah & Fire House Crew	Independence Stadium	DJ Bobo Fayah	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC\\r\\nAfricell to be the only GSM partner\\r\\nVenue to be branded by africell\\r\\nVIP tickets to be provided for Africell Staff	DJ Fire Man, Artical Slice and DJ Bobo Fayah are house-whole names in Gambia when it comes to reggea music and dancehall. they have organised a lot of successful shows in the Gambia. Jah Vinci is a very popular Jamaican artist and he has a huge fan base in The Gambia. I believe its a show worth Supporting.	1	2014-05-07 15:01:59	2014-05-07 15:01:59
24	2014-02-21	Poetic X - Mix tape Album Launch	Poetic X	Alliance Francaise	Sanna Kanteh	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	We have always supported Poetic X, they are one of Gambia's best hip hop group. they will be launching their album on the 26th of April. the program is expected to be well attended.	1	2014-04-04 12:16:14	2014-04-04 12:16:14
25	2014-03-25	Code White	Big Boyz Ent	Jokor Brikama & Sinatras Bakau	Singateh & G Faal	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Singateh and G Faal have always worked with Africell and they have been really been successful at what they do. they have two shows coming up in brikama and bakau and they are worth supporting.	1	2014-04-04 15:02:15	2014-04-04 15:02:15
26	2014-03-06	Kapsin Wrestling Competition	Kapsin Promotions	Serrekunda west Mini Stadium	Muhammed Kabirr Mboob	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Muhammed Kabirr has been organising wrestling competitions for a long time now. his events have always been successful. I think its an event worth supporting.	5	2014-04-07 13:56:56	2014-04-07 13:56:56
27	2014-04-01	Simplest Easter Tour	DJ Simplest	Balalarr, Albreda, Kunkujang & Tanji	Mighty Simplest	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Dj Simplest works for afri-radio and he is a very popular Raggea Dj, Very Popular among the reggea loving community. its a show worth supporting.	1	2014-04-07 14:34:45	2014-04-07 14:34:45
38	2014-03-23	Wilson Wrestling Competition	Wilson Promotion	Brikama Mini Stadium	Wuyeh Ceesay	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is a big event at a highly populated region,Brikama Mini Stadium.We can support it, although this is the first partnership.	5	2014-04-08 13:51:06	2014-05-28 17:17:24
40	2014-04-07	Golden Jubilee 50th Anniversary Oussou Njie-SENOR	Super Eagles Band	Nationwide Banjul-Basse	Ismaila Oussou Njie-SENOR	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Super eagles are a well known Band both national and international. They are worth supporting and they have very big fan base in the gambia. Oussou Njie-Senor is a legend in the music industry.	1	2014-04-09 15:27:29	2014-04-09 15:33:01
41	2014-04-03	5th Anniversary Fiila Tv Show  	Black Lynx	Jakarlo&Brikama Mini Stadium	Abdou KW Faye	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Fiila Tv Show has been a successful event for past years.We have been in partnership before.I believe it is worth supporting.	1	2014-04-09 15:41:57	2014-04-09 15:55:36
42	2014-04-01	International Roots Festival	Ministry of Tourism	Kanilai, Independence Stadium, etc	Hon. Fatou Mass Jobe	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is the eleventh edition of the international roots festival. the roots festival brings together africans in the diaspora who share the same common objective, origin and heritage. the festival always have a lot of media coverage and I believe its worth supporting	1	2014-04-14 12:50:40	2014-04-14 12:50:40
99	2014-09-08	International Tourism Investment Forum 2014	Ministry of Tourism	Kairaba Beach Hotel	Ministry of Tourism	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC\\r\\nAfricell to be the only GSM partner\\r\\nVenue to be branded by africell	This is expected to be a very successful forum.  partnering with the ministry of Tourism has always been successful.	5	2014-09-08 18:30:05	2014-09-08 18:30:05
43	2014-04-07	Centenary Celebration	Cathderal of Banjul	Banjul	James FP Gomez	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Roman Catholic Mission (RCM)has contributed a lot in the edecation,service and health services sector in the Gambia,and are well known by community.They really need support.	5	2014-04-15 18:33:22	2014-04-15 18:33:22
75	2014-05-26	Islamic Programme	Wa Keur Bethio Thioune-Touba Gambie	Seeda Club Opposite Africell	Jawring Ebrima Ndong	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This an Islamic program,organized by Sering salieu Mbacke Touba Gambie.It is a religious event and worth supporting.	5	2014-05-30 13:33:48	2014-05-30 13:33:48
62	2014-05-08	World Blood Donor Day 2014	Ministry of Health and Social Welfare	Basse (Upper River Region)	Mariama Jammeh(Program Manager)	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is an event celebrated world wide,to donate blood,and is been organized by Ministry of health.Its worth supporting.	5	2014-05-09 11:47:17	2014-06-02 15:38:04
46	2014-03-27	Sarata Movie Premier & Screening	Manding Morry Entertainment (MANFOPA)	Pencha Mi Hall ,Paradise Suites Hotel	Ibrahim Ceesay Executive Director(MANFOPA)	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is a well known organization in the areas of music,movie production and participation in the performing arts.This will be the first partnership I belive they can be supported.	4	2014-04-16 14:16:50	2014-04-17 12:02:26
47	2014-04-09	FAWEGAM Annual Gala Dinner&Dance	FAWEGAM	Paradise Suites Hotel	FAWEGAM	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	We have been in patrnership before,and they are well recognise good institutions, well know in spporting girls and young women in the education sector.They can be supported.	1	2014-04-17 16:08:12	2014-04-17 16:08:12
76	2014-05-26	Rhythmic Vibrations	Blaque Magique Poets	Kairaba Beach Hotel	Ronald Senghore	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Africell has always partnered with the Blaque Magique Poets on their events. Their events have always been successful. I believe its an event worth Supporting.	1	2014-06-03 13:35:24	2014-06-03 13:35:24
49	2014-04-15	Silky Criss	Silky Criss Managemnet	Willies at Lamin 	Mam Malen Njie(Manager)	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Silky Criss is a well known and popular artist in The Gambia,and has a big fans base in the music industry. He can be supported and we have been in partnership before.	1	2014-04-22 14:16:06	2014-05-06 16:00:52
50	2014-04-02	Jekke Promotion 1st Anniversary	DJ Oulaye Jaw,DJ Prince,Abou Bah,DJ Zecka &Amadou Sall	Alliance Francaise	DJ Prince (The President)	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is a cultural event to be showcase by different DJ's that are well known in the music industry,especially on radio stations in Gambia.We can support them.	1	2014-04-22 14:31:48	2014-04-22 14:31:48
51	2014-04-22	GCCI Award Dinner	GCCI	Kairaba Beach Hotel	GCCI	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC\\r\\nAfricell to be the only GSM partner\\r\\n5 Minute video of Africell to be aired during the event\\r\\nHigh Table seat for one of Africell's representative\\r\\nVenue to be branded by africell\\r\\nFull page advert to be given to Africell\\r\\nVIP tickets to be provided for Africell Staff	The GCCI Award night is a night dedicated to awarding and rewarding deserving companies.  The Award is usually attended by the President and top Government officials.	5	2014-04-25 15:53:57	2014-04-30 13:13:30
61	2014-05-08	Modou Kara Gaye	Modou Kara Gaye Artist	Pencha mi Hall 	Modou Kara Gaye Artist	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Dj Modou Kara Gaye Artist works for afri-radio and he is a very popular in ''mbalax'' music industry, its a show worth supporting.	1	2014-05-09 11:26:44	2014-05-27 12:17:00
60	2014-03-27	Join Hands Together Mix tape Launching SANTA AK NGUM	Join Hands Together	Alliance Francaise	Join Hands Together	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Join Hands Together are upcoming artists in the Gambia.They are ready to launch thier mix tape at the alliance francaise. This show is expected to be very successful. I believe it is worth supporting	1	2014-05-08 17:05:31	2014-05-08 17:52:56
64	2014-05-05	St.Lazarus Musical Concert	St.Lazarus Of Bethany Choral Group	Jama Hall Kairaba Beach Hotel	Neneh Gomez Jones(Vice President)	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is a youth workforce,including students.They want to organize this event to raise funds to buy materials/Instruments for their church.Its worth supporting.	1	2014-05-15 12:29:13	2014-05-15 12:32:46
67	2014-04-21	Annual Miss,Master and Miming Competition	The Gambia Red Cross Society	Alliance Francasie	Modou Touray(Branch Officer KM)	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	The red cross society is well known in the gambia in the area of first aid and disaster management.This is the first time we partnering with them on this kind of event.	2	2014-05-15 13:22:06	2014-05-15 13:22:06
66	2014-05-08	President's 49th Birthday Anniversary	Kanifing Municipal Council (KMC)	West Mini Stadium	Lord Mayor Yankuba Colley-Kmc/Aprc National Mobilizer	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	The President's 49th Birthday is celebrated on May 25th every year.Its worth supporting.	5	2014-05-15 12:44:29	2014-05-15 12:44:29
69	2014-05-12	Jarama Production President 49th Birthday Anniversary 	JARAMA PRODUCTION	Senegambia Beach Hotel	Ramatoulai Jallow	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	The President's 49th Birthday is celebrated on May 25th every year.Its worth supporting.	5	2014-05-16 12:00:06	2014-05-16 12:00:06
88	2014-08-04	Peace Corps-2014 Malaria Prevention Campaign	Peace Corps The Gambia	Bansang Youth Center-CRR	Daniella Choi/Jarri Jallow	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Peace Corps The Gambia are well known in the gambia and this event will help communities in CRR and surrounding villages in upcountry to know how to prevent malaria and importance of using bed nets.Malaria is the most debilitating diseases affecting Gambians.	5	2014-08-05 17:29:59	2014-08-05 17:29:59
71	2014-04-20	St Charles Lwanga Forthcoming Concert	Saint Charles Lwanga Senior Chior Fajikunda  Parish	Kairaba Beach Hotel	Jean Paul Ndure/ChiorMaster/President	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Saint Charles Lwanga Senior Chior Fajikunda Parish are well known in the Gambia,especially in  chrtistinity religion.We have been in patrnership before,It's worth supporting.	5	2014-05-27 13:45:37	2014-05-27 13:45:37
72	2014-05-12	Launching of Beyond Events&Marketing 	Beyond Events&Marketing 	Relax Sahel	Jainaba Jallow MD	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Launching of Beyond Events&Marketing is a good iniatives and will benefit those service providers in the areas of sales and marketing,corporate,Etc.This is the first partnership.We can support this event.	1	2014-05-27 13:55:50	2014-05-27 13:55:50
73	2014-05-14	Youth for Promise Glory Baptist TheCultural Show	Youth for Promise Glory Baptist 	Glory Baptist International School(Opposite GRTS,MDI Road)	Alice Senghore/Secretary	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Youth for Promise Glory Baptist event will showcase different talents in the area of arts and culture.This will be the first partnership.Its worth supporting.	1	2014-05-27 14:07:09	2014-05-27 14:07:09
74	2014-05-12	Pape Diouf Fans CLub-Face Of Brikama	Pape Diouf Fans Club	Jokor Brikama	Mbasey Manneh/Secretary	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is a beauty pagent,Face of Brikama organized by Papa Diouf fans club in Brikama,They have very big fan base.We have been in patrnership before.They worth supporting.	2	2014-05-28 12:26:42	2014-05-28 12:33:21
77	2014-06-11	T-smallz Suso Major Event Celebrations	T-smallz Suso	Lamin Village	Ebrima Suso(T-smalls Suso)	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Ebrima Suso(T-smalls Suso)is a well known artist in the Gambia especially in the music industry,He have organized very successful events before in the Gambia.We have been in partnership before.Its worth supporting.	1	2014-06-12 14:15:47	2014-06-12 14:20:47
78	2014-06-04	NDEA World Drug Day	National Drug Enforcement Agency(NDEA)	West Coast Region	Demba Ceesay	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is an event commorated by National Drug Enforcement Agency NDEA in gambia.It is an International Day against Drug Abuse and illicit Drug trafficking,commonly known as WORLD DRUGS DAY.Its worth supporting.	5	2014-06-18 16:25:07	2014-06-18 16:25:07
79	2014-06-10	Absolute Entertainment P'tit Bal and P'tit Galle 2014	Absolute Entertainment	Duplex	Ms Haddy Faye(CEO)Absolute Entertainment	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is an event that was held last year 2013 in senegal,and auditioning of Gambian contestants took place in the Gambia.Africell sponsored the auditioned and voting system for Awa Gambie last year contestant P'tit Galle 2013.Its worth supporting.	1	2014-06-19 16:07:14	2014-06-19 16:17:13
84	2014-07-09	Daddy Boston-LAUNCHING OF 001 TV SHOW	Daddy Boston &Group	Joint Officers Mess-Kotu	Daddy Boston-Artist	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Daddy Boston is a Gambian artist well known in music industry.We have been in partnership before.Its Worth Supporting.	1	2014-07-21 15:28:27	2014-07-21 15:36:59
113	2014-09-05	Og Log Music Concert	Manna Oz aka Og Log	Alliance Francaise	Secretary General, Manna Oz Fans Club	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	These young family group formed by young talented Gambian musicians.We have been in parthnership before, its worth supporting	1	2014-10-21 12:14:05	2014-10-21 12:14:05
114	2014-10-14	2nd Annual Cypher Street Rap Battle Competition 	Killa ACE Str8 from Jupiter Entertainment	Westfield Monument.	Killa ACE Afri radio 	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Killa Ace is one of Gambia's best Hip Hop artist\\r\\nHe successfully launched his in 2013 and he have successfully organized Rap Battle last year sponsored by Africell.This year 2014 2nd Annual Cypher Street Rap Battle Competition its an event worth supporting.	1	2014-10-22 13:07:13	2014-10-22 13:07:13
83	2014-07-12	Dr. Olugander-Welcome Back Home Show 2014	Ganders Production	Serekunda East Mini-Stadium	D.r Olugander & Ganders Production Management	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Dr Olugander is a well known Reggae artist in the Gambia and beyond.We have been in partnership before.Its worth supporting.	1	2014-07-15 16:47:22	2014-07-21 16:02:07
85	2014-07-21	Simplest Koriteh Tour	Yagana world sound	Soma&Bansang	Mighty simplest	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Dj Simplest works for afri-radio and he is a very popular Raggea Dj, Very Popular among the reggea loving community. its a show worth supporting	1	2014-07-23 11:35:39	2014-07-23 11:35:39
86	2014-05-26	1st Edition CCLK INTERNATIONAL CONFERENCE&CULRURAL 	CCLK COMMUNITY	Joint Officers Mess	Rev.Fr.Ndecky-Parist Priest&Peter Sait Mendy-Community Coordinator	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Christian community of latrikunda(CCLK)is a community based organization operating at latrikunda.They embarked on assisting poor students in funding their education,community works irrespective of ethnic or religion.They worth supporting.	1	2014-07-31 16:30:37	2014-08-13 14:00:16
87	2014-07-31	Accord Prayer-Mega Musical Concert	Accord Prayer Tower Ministry	Ebujan Theatre	Joseph Laryea	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Accord Prayer Tower Ministry are encouraging youths in development and they seeking for support to make their mega concert a success.This is the first partnership.Its worth supporting.	1	2014-07-31 16:43:03	2014-07-31 16:45:38
89	2014-08-05	Ajax Nawettan Season 2014	Ajax Football Club	Banjul	Momodou John-President	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Ajax football club is well known football team in Banjul.They were crown champions for FA Cup last year 2013.We have been in partnership before last year 2013 Nawettan Season.	5	2014-08-06 14:52:31	2014-08-06 14:59:55
90	2014-07-25	Junction Bi-Show	Junction Bi Street	Junction B22 Garden	Ebrima Jahumpha	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Junction Bi,lemon tree entertainment want to organise a music show,and seeking assistance from Africell to make this event a success.This will be the first partnership.Its worth supporting.	1	2014-08-08 11:59:54	2014-08-08 11:59:54
91	2014-08-04	MISS AIUWA 2014 BEAUTY PAGEANT 1st Edition	American International University Students Union	Paradise Suites Hotel	AIUWA Students Union	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is a non-political and non religious organization aim at bringing all the students of the American International University Students Union under one umbrella.This will be 1st Edition beauty pageant 2014.This will be the first partnership.Its worth supporting.	2	2014-08-11 18:13:09	2014-10-20 12:37:21
92	2014-08-08	GFF FA CUP FINAL FOOTBALL MATCH 2014	GFF	Independence Stadium Bakau	Bakary B.Baldeh	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	The Gambia Football federation FA Cup football final is held every year.Africell have been in supports of sports,and supporting this final football match will be a worthy cause.We have been in parthnership before.	5	2014-08-12 13:31:18	2014-08-12 13:50:32
93	2014-08-03	Women's Health Conference 2014	Mamasa Camara-Women health	Paradise Suites Hotel	Mamasa Camara-	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC\\r\\nAfricell to be the only GSM partner\\r\\nVenue to be branded by africell\\r\\nVIP tickets to be provided for Africell Staff	This is a women's health conference with the intent to bridge diasporain gambains in collaboration with government with ministry of health.Its worth supporting.This will be the partnershinp.	5	2014-08-12 17:24:56	2014-08-12 17:24:56
98	2014-08-22	Ebola Campaign	Ministry of Health & Social Welfare	Nation wide Campaign	Modou Njai	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nVenues to be branded by africell	This is a national campaign in the fight against ebola. Ebola is a deadly virus that kills and spreads fast.  I believe its a cause worth supporting. #EbolafreeGambia	5	2014-09-01 11:49:43	2014-09-01 11:49:43
97	2014-08-18	Brikama Super Cup Final Football Match 2014	Brikama Youths&Sports Committee	Brikama Mini Stadium 	Alahgie S. Darboe	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is an FA Cup football final to be held in Brikama.Africell have been in supports of sports,and supporting this final football match will be a worthy cause.This will be the first parthnership.	5	2014-08-19 16:36:12	2014-08-19 16:39:00
96	2014-08-13	Expo Egy international Exibition	Expo Egy-Mohamed El-Mohamedy	Paradise Suites Hotel	Mohamed El-Mohamedy-General Manager	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This event will be an international exibition to encourage trade relations between arab and african countries.This will be the first partnership.Its a worthy cause.	5	2014-08-13 14:14:37	2014-08-19 12:56:23
100	2014-09-04	Ker Gi Family Mix tape launching	Ker gi Family	alliance francaise	Manager-Ker gi Family	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\n\\r\\nVIP tickets to be provided for Africell Staff	These young family group formed by young talented Gambian musicians.We have been in parthnership before, its worth supporting.	1	2014-09-23 17:47:41	2014-09-24 14:40:04
101	2014-09-22	ST VS G Faal	ST and G Faal Gambian Artist	Willy's Night Club	Manager Sticky Bee Promotions	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC\\r\\nAfricell to be the only GSM partner\\r\\nVenue to be branded by africell\\r\\nVIP tickets to be provided for Africell Staff	These are young talented Gambian musicians.We have been in parthnership before, its worth supporting.	1	2014-09-23 18:07:55	2014-09-23 18:07:55
104	2014-09-17	Magnificent Joe Music Show after Tobaski	Magnificent Joe-Holy Family Band	Joint Offiers Mess	Magnificent Joe	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	He is a Gambian artist well known in music industry.Its worth supporting and this will be the first partnership.	1	2014-09-24 14:45:22	2014-09-24 14:45:22
103	2014-09-04	Nigerian 54th Independence Day Celebration	Nigerians In The Gambia	Joint Offiers Mess	Kingsley Eze	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Nigerian communities are well known in The Gambia,and its their 54th independence day celebration,Its worth supporting.	1	2014-09-24 14:33:11	2014-09-24 14:35:50
105	2014-09-10	Silky Crissâ€™s Tobaski Tour	Silky Crissâ€™s& VolKanu Movement and Black Lynx 	Up Country	Realm Silky 	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	These are Gambian artists well known in the music industry.We have been in parthnership before.Its worth supporting.	1	2014-09-30 17:26:33	2014-09-30 17:32:10
106	2014-09-29	Mighty Simplest Tobaski Show	Yagana Movement	Tanji- Pirang	Mighty Simplest	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Dj Simplest works for afri-radio and he is a very popular Raggea Dj, Very Popular among the reggea loving community. its a show worth supportin	1	2014-09-30 18:18:21	2014-10-07 12:19:11
107	2014-10-07	St. Kizito's Parish Choral & Cultural Evening	St. Kizito's Catholic Church	Pencha Mi Hall 	Peter Gomez	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC\\r\\nAfricell to be the only GSM partner\\r\\nVenue to be branded by africell\\r\\nVIP tickets to be provided for Africell Staff	This is event that was sponsored before and it was very successful. the parish of st. kizito has a lot of parishioners and they always turn out in their numbers to support the church.  I believe it is an event worth supporting.	1	2014-10-13 12:49:18	2014-10-13 12:49:18
108	2014-10-05	Dro Kylah-Music Concert	Dro Kylah Group	alliance francaise	Mr Girbril Baldeh	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is a well known group in muscic industry in The Gambia.We have been in parthnership before,and we used their song ''RABA RABA on Africell Fun ring.They worth supporting.	1	2014-10-15 16:57:41	2014-10-15 16:57:41
109	2014-09-21	M.S promotion-Sora Man Sissoho Mali Bamako	m.s promotion	alliance francaise	Muhammed Saho-Afri Radio Staff	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Dj Muhammed Saho works for afri-radio and he is a very popular in ''sarahule'' music industry, its a show worth supporting.	1	2014-10-15 17:04:26	2014-10-15 17:06:25
110	2014-10-01	Miss Nawettaan Bakau 2014	STANFEST PROMOTION	Friendship Hostel	CEO Laming Marong	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This will be the first time we will be working with STANFEST promotions. They approached us last year for the first edition of this event due to time we couldn't sponsor. I think its a program worth sponsoring in Bakau.	2	2014-10-15 17:11:29	2014-10-15 17:11:29
145	2014-11-18	Dj Blazerâ€™s birthday bash Party warm up 2014	VERSATILE ENTERTAINMENT DJ BLAZER 	Duplex	DJ BLAZER of Afri Radio	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Dj Blazer works for afri-radio and he is a very popular Dj.its a show worth supporting	1	2014-11-20 16:30:09	2014-11-20 16:30:09
111	2014-10-16	Peace Corps-2014 HIV/AIDS Bike Trek Up Country	Peace Corps The Gambia	West Coast Region(WCR)	Christine Muraguri PCV Health-Bantunding	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Peace Corps The Gambia HIV/AIDS Bike Trek event have been a success in previous years.This year's event will help students and schools in WCR,on skills and knowldege that they need in order for them to protect themselves and their love ones from HIV/AIDS. We have been in parthnership before it's worth supporting.	5	2014-10-17 13:08:02	2014-10-17 13:13:32
112	2014-10-10	Miss Nawettaan Serekunda 2014	Emids Promotions	alliance francaise	Lamin Emid Nyang	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	We have been in parthnership before with Emid's promotions and sponsored his previous show which was successful.I think its a program worth sponsoring.	2	2014-10-17 14:32:04	2014-10-17 14:32:04
115	2014-10-21	UN Day	UNDP	Afri Radio	Lamin Camara	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	The UN day is celebrated world wide, UNDP have chosen to partner with africell to celebrate this day by having a quiz on afri-radio. I believe it's worth supporting	1	2014-10-22 15:56:52	2014-10-22 15:56:52
116	2014-10-17	Fashion Weekend Gambia	Lena Grey Johnson	Kairaba Beach Hotel	Lena Grey Johnson	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC\\r\\nAfricell to be the only GSM partner\\r\\nVenue to be branded by africell\\r\\nVIP tickets to be provided for Africell Staff	This will be the third time we will be partnering with the fashion weekend Gambia team.  it has always been a successful event and I believe its worth Supporting	1	2014-10-27 11:02:26	2014-10-27 11:02:26
117	2014-10-17	2nd Annual Cypher Street Rap Battle	Jupiter Entertainment	West Field	Killa Ace	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	The first edition of this show was sponsored by Africell. it is a free show held in the streets and it always attracts a lot of people, I think its a show worth supporting.	1	2014-10-28 12:46:12	2014-10-28 12:46:12
118	2014-10-28	Fiila Crew-2nd Edition Miss Fans Club Beauty Pageant 2014	Fiila Crew Brikama	Brikama Jokor Graden Club	Big Sam-Secretary General	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	We have been in parthnership before with Fiila Crew Brikama and sponsored previous show fiila show which was successful.I think its a program worth sponsoring.	2	2014-10-29 12:53:12	2014-10-29 12:55:31
119	2014-10-28	Brikama Keep Fit Gym-Weight Lifting Competition	Keep Fit Gym Center	Brikama Jokor Graden Club	Big Sam-Secretary General	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is a big event,wight lifting at a highly populated region,Brikama.We can support it, although this is the first partnership.	5	2014-10-29 13:01:59	2014-10-29 13:01:59
120	2014-10-30	T-Smallz Welcome Back Party	T small suso-Katatoo	Club 22	T small suso	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Ebrima Suso(T-smalls Suso)is a well known artist in the Gambia especially in the music industry,He have organized very successful events before in the Gambia.We have been in partnership before.Its worth supporting.	1	2014-10-30 16:17:59	2014-10-30 16:17:59
123	2014-06-02	ARTENOLAâ€™S ALBUM LAUNCHING	Suwaibou Bondi-Artist	Alliance Francaise	Bakary Jatta&Suwaibou Bondi Artenola	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Suwaibou Bondi Artenola is one of Gambia's best Hip Hop artist in The Gambia.He successfully gained popularity on song â€˜â€™ Mbe nyo Konoâ€™â€™.This will be first parthnership.Its an event worth supporting.	1	2014-10-31 13:24:06	2014-10-31 13:24:06
144	2014-11-06	Emerson's Concert	Keneke's Promotion	Jaama Hall	Keneke	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Emerson is an international artist from Sierra Leone. He has been to the Gambia on a number of occasions and Africell has always sponsored his shows. he has a large following in The Gambia and I believe its a show worth supporting	1	2014-11-19 13:19:49	2014-11-19 13:19:49
124	2014-11-04	PUBUKA Fund Raising Program	PUKUKA BUGANATAK IN THE GAMBIA	Brikama Jokor Graden Club	Mr Sang Mendy-President	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is a fund raising concert for PUKUKA BUGANATAK IN THE GAMBIA.Its worth supporting.	1	2014-11-04 13:20:27	2014-11-04 13:20:27
125	2014-11-05	2nd Annual Cypher Street Rap Battle Competition	Killa ACE Str8 from Jupiter Entertainment	Westfield Monument.	Killa ACE Afri radio 	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Killa Ace is one of Gambia's best Hip Hop artist He successfully launched his in 2013 and he have successfully organized Rap Battle last year sponsored by Africell.This year 2014 2nd Annual Cypher Street Rap Battle Competition its an event worth supporting.	1	2014-11-05 13:34:11	2014-11-05 13:34:11
146	2014-10-29	7th Annual Open Mic Festival-The Gambia	Black Lynx Entertainment	Independence Stadium Bakau	Abdou Karim Waagan Fye	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	We have partnered with Black Lynx on numberous occasions and they have successful event.Its Worth supporting.	1	2014-11-21 11:09:53	2014-11-21 11:09:53
148	2014-12-01	Ebujan Theatre 3rd Anniversary Celebration 2014	Ebujan Performing Arts Association 	Ebujan Theatre Opposite GFF House-Kanifing	Janet Badjan -Young	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Ebujan Theatre 3rd Anniverssary is a fundraising gala dinner,mainly to help peoples especially with performing arts skills.Its worth supporing.	5	2014-12-02 11:42:27	2014-12-02 16:39:46
149	2014-11-27	Gamo Medina Baye Nyass	United Association Of Muhammed Nasir Ebrahim Nyass	Medina Baye Nyass-Kaolack Senegal	Al Hassan Cham -President	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Gamo Medina Baye Nyass is an annual Islamic event to celebrate the birthday of the prophet Muhammed(S.A.W)worldwide,particularly in Medina Baye Nyass-Kaolack Senegal.Its worth supporting.	5	2014-12-02 12:04:29	2014-12-02 12:04:29
150	2014-11-20	Santa Maria Vous Christmas Eve Grand Dance	Santa Maria Vous 	Reform Club	Andre Manga	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Santa Maria Vous Christmas Eve Grand Dance has been a successful evnt.We have been in partnership before,Its worth supporting.	1	2014-12-02 12:42:02	2014-12-02 12:42:02
151	2014-11-27	The Gambia Catholic Annual Pilgrimage Kunkujang Mariama 2014	The Gambia Catholic Shrine Committee	Kunkujang Mariama	Pierre L.M Sarr Chairman Gambia Catholic Shirne Committee	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is christian/Catholic religious Annual Pilgrimage to be held in Kunkujang Mariama.Its worth supporting.	5	2014-12-02 12:52:52	2014-12-02 12:54:34
152	2014-11-28	Music Show With Born Africans Artist	Yagana Movement	Willy's Night Club	Mighty Simplest	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Dj Simplest works for afri-radio and he is a very popular Raggea Dj, Very Popular among the reggea loving community. its a show worth supportin	1	2014-12-02 13:18:16	2014-12-02 13:18:16
169	2014-12-16	Ebilleh Hunting Society 4th Year Anniverssary	Ebilleh Hunting Society	Old Jeshwang	Chidi Atuegwu	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Ebilleh Hunting Society is a group of youngsters that celebrate christmas every year.Its worth supporting.	5	2014-12-16 09:49:34	2014-12-16 09:49:34
164	2014-12-02	Dj Blazerâ€™s birthday bash Party 2014	VERSATILE ENTERTAINMENT DJ BLAZER 	Crystal Club	DJ BLAZER of Afri Radio	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Dj Blazer works for afri-radio and he is a very popular Dj.its a show worth supporting	1	2014-12-02 16:54:28	2014-12-02 16:54:28
165	2014-11-05	M&B Promotions-Wrestling	M&B Wrestling Promotions	Independence Stadium Bakau	Mr Matarr Sosseh Promoter	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is a big time wrestling promoter in Greater Banul. This will be the first time we will be working with him. I believe its an event worth sponsoring.	5	2014-12-04 10:53:44	2014-12-08 10:09:00
166	2014-11-28	Michelle Jarra Post-Book Launch Party 	Michelle Jarra	Relax Sahel, Kololi	Michelle Jarra Secretary Organizing Committee	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is a week-long celebration of the life and times of a renowned Gambian politician, priest, educationist, sportsman, father and grand-father, the Very Reverend J. C. Faye, who passed on almost three decades ago.Its Worth Supporting.	5	2014-12-04 11:11:37	2014-12-04 11:13:58
167	2014-10-06	EFSTH-Pape Dioup Gala&Dance	EFSTH Management&Staff-Government	Paradise Suites Hotel	Mr Momodou Lamin Jammeh Public Relations Officer	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	THE (EFSTH)Edward Francis Small Teaching Hospital grand fundraising gala and dance aim is to support the activities of hospital in improving patient care and hospital management.Its worth supporting.	1	2014-12-09 15:04:46	2015-01-05 16:00:01
168	2014-12-03	Manding Morry Album Launching''DOKUWOLOM''	Manding Empire&Joluv Arts Entertainment 	Jama Hall Kairaba Beach Hotel	Soulayman Sowe-Joluv Arts	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Manding Morry,as an artist has big fan base, he is a good musician from Bakau. The event is expected to be successful.Its worth supporting.	1	2014-12-10 16:36:35	2014-12-10 16:36:35
159	2014-11-26	Sen P'tit Galle	Absolute Entertainment	Independence Stadium 	Haddy Faye	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is the second edition of Sen Petit Galle in the Gambia, the first was very successful and the turn out was splendid. This event will be covered by international media. I believe its a show worth supporting.	1	2014-12-02 13:23:01	2014-12-02 13:23:01
160	2014-11-20	Wally Balago Seck	Mame-Diarra Production	Pencha mi Hall & Brikama Box Bar	Pa Sallah Bah	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is the Second edition of this show, Wally Seck was in Gambia last year and all his concerts were packed. Africell was a proud sponsor last year and I believe we should support this year again.	1	2014-12-02 14:49:32	2014-12-02 14:49:32
161	2014-11-26	Blaque Magique	Smart Sync	Kairaba Beach Hotel	Ronald Senghore	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is the 4th Edition of Blaque Maqique, Its an event that always have/had a sold out crowd. We have supported this event over the years and I believe its worth supporting once more	1	2014-12-02 15:28:47	2014-12-02 15:28:47
171	2014-12-08	Brikama Area Council-Tax Sensitization Song	Brikama Area Council 	Brikama Box Bar Mini Stadium 	Mr Yusupha FM Manneh(Chief Executive Officer)	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is an official launching of new song by Jaliba Kyateh&Kumareh Band,organize by Brikama Area Council to sensitize general public on timely and regular payment of tax.Its an event worth supporting.	1	2014-12-16 16:55:38	2014-12-16 16:55:38
172	2014-12-11	Ghetto Production (GP)Carnival-Dj Busy Yanx	Ghetto Production (GP)	Mosque Road And Perseverance St  Junction Banjul 	Dj Busy Yanx	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Its christmas december carnival period and Dj Busy Yanx Has a big fan base the Gambia.Its worth supporting.	1	2014-12-19 12:07:43	2014-12-19 12:07:43
173	2014-12-16	Dj Kanu-Xmas Bruck Out Party	Dj Kanu Volkanu Movement	Club 22-Senegambia	Lamin DJ Kanu Camara-Afri Radio 107.6	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Dj Kanu works for afri-radio and he is a very popular Dj.its a show worth supporting.	1	2014-12-22 11:55:33	2014-12-22 11:55:33
174	2014-12-04	Nasir Promotions Wrestling Competition	Nasir Promotions 	Serekunda West Mini Stadium	Momodou Jah-Vice President	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Nasir Promotion has been organising wrestling competitions for a long time now. His events have always been successful. I think its an event worth supporting.	5	2015-01-05 12:06:11	2015-01-05 12:10:11
293	2015-09-07	International Week Of The Deaf 2015	Gambia Association Of The Deaf and Hard Of Hearing	School For The Deaf Hall Kanifing	Dodou Loum Executive Director GADHOH	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC\\r\\nAfricell to be the only GSM partner\\r\\nVenue to be branded by africell\\r\\nVIP tickets to be provided for Africell Staff	Gambia Association Of The Deaf and Hard Of Hearing will be organizing an Ineternational Week Of The Deaf 2015.The 3 days event celerations is held annually by Deaf communities to advocate effectively for human rights of the deaf people.Its worth supporting.	5	2015-09-17 16:30:12	2015-09-29 12:56:50
176	2014-12-22	Carnival Road Festival-Daddy Bostin	Daddy Bostin	Pipeline-Elton Junction	M.Touray	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Daddy Bostin is a Gambian Artist well known in music industry.We have been in partnership before on Africell promotions GRTS Tv.Its worth Supporting.	1	2015-01-08 10:41:56	2015-01-08 10:41:56
371	2016-01-20	Fatou Movie Premier	Hopeful Youths Advocacy Foundation	Ebujan Theatre Opposite GFF House-Kanifing	Manager-Hopeful Youths Advocacy Foundation	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Hopeful Youths Advocacy Foundation will be oraganizing a movie premier''Fatou''.This will be our first partnership.I think its worth supporting.	1	2016-01-27 12:56:47	2016-01-27 12:56:47
332	2015-11-02	Fashion Weekend Gambia 2015	Lena Grey-Johnson	Ocean Bay Hotel	Lena Grey-Johnson	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This will be the fourth time we will be partnering with the fashion weekend Gambia team.  it has always been a successful event and I believe its worth Supporting	1	2015-11-24 11:50:56	2015-11-24 11:50:56
298	2015-10-06	Kerr Gi Family Debut EP Launching	Kerr Gi Family Group	Alliance Francaise	Manager-Ker gi Family	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	These are young family group formed by young talented Gambian musicians.They recorded and published many promotional track singles namely â€˜â€™Bai-malamine Daraâ€™â€™, â€˜Music ,teranga ,and many more which gives them popularity and recognition. We have been in parthnership before, its worth supporting.	1	2015-10-06 15:52:53	2015-10-06 15:52:53
290	2015-08-15	Royal Messenjah''SARGAL YAYE TOUR''2015	Royal Messenjah Sargal Yaye Foundation	Up Country	Royal Messenjah Artist	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Royal Messenger Sargal Yaye Foundation is a well known Gambian artist,he wants to embark on a tour to up country to promote his album ''Mama.Its worth supporting.	1	2015-09-10 15:19:24	2015-09-10 15:19:24
179	2014-09-04	GTB-Food&Beverage Festival 2015	Gambia Tourist Board(GTB)	Green Mamba Gardens/Jakarlo Bar &Restaurant	Benjamin A.Roberts-Director General	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Gambia Tourist Board(GTB) food&Beverage Festival is a very big event and have been successful past years.We have been in partneship before.It worth supporting.	1	2015-01-13 13:31:50	2015-01-13 13:34:45
180	2015-01-03	T-Smallz Al Bullo Tour Show-Busumballa	T small suso-Katatoo Entertainment	Busumballa	Ebrima Suso Aka Trobul Smallz-Presenter&Producer	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Ebrima Suso(T-smalls Suso)is a well known artist in the Gambia especially in the music industry,He have organized very successful events before in the Gambia.We have been in partnership before.Its worth supporting.	1	2015-01-13 13:45:31	2015-01-22 10:05:28
185	2015-01-12	Manding Empire 2nd Year Anniversary 2015	Manding Empire&Joluv Arts Entertainment 	Alliance Francaise	Muhammed L.Baldeh	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Manding Morry,as an artist has big fan base, he is a good musician from Bakau. The event is expected to be successful.Its worth supporting	1	2015-01-14 14:32:25	2015-01-14 14:32:25
184	2015-01-03	T-Smallz Al Bullo Tour Show	T small suso-Katatoo Entertainment	Willy's Night Club	Ebrima Suso Aka Trobul Smallz-Presenter&Producer	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Ebrima Suso(T-smalls Suso)is a well known Gambain artist in the Gambia especially in the music industry,He have organized very successful events before in the Gambia.We have been in partnership before.Its worth supporting.	1	2015-01-14 12:36:22	2015-01-23 11:50:36
281	2015-08-10	Interior Female Football Team 	Interior Female Football	Banjul 	B.Ceesay(ASP)Officer Commanding(Sports)	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Interior Female Football Team are organizing a camping with female team of Bissau before international game.Its worth supporting.	5	2015-08-21 13:19:56	2015-08-21 13:19:56
186	2015-01-06	Final&Semi Finals The Annual Cypher Street Rap Battle 2015	Killa ACE Str8 from Jupiter Entertainment	Independence Stadium Hand Ball Cort Bakau	Killa ACE Afri radio 	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	The first edition of this show was sponsored by Africell.Now is the Semi&Finals Edition,it is a free show held in the streets and it always attracts a lot of people, I think its a show worth supporting.	1	2015-01-26 15:28:30	2015-01-26 15:28:30
187	2015-01-26	Blaque Magique's Special Independence'Word Of Mouth'	Blaque Magique	University Of The Gambia(MDI)	Louise Amina Drammeh	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	The Blaque Maqique is an event that always have/had a sold out crowd. We have supported this event over the years and I believe its worth supporting once more.	5	2015-01-26 16:46:54	2015-01-26 16:46:54
188	2015-01-26	T-Smallz Album Launch ft I-Octane	T -Smallaz Ebrima Suso-Katatoo Entertainment	Independence Stadium Bakau	T -Smallaz Ebrima Suso	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Ebrima Suso(T-smalls Suso)is a well known Gambain artist in the Gambia especially in the music industry,He have organized very successful events before in the Gambia.We have been in partnership before.Its worth supporting.	1	2015-01-27 13:34:35	2015-01-27 15:47:56
189	2015-01-26	Joluv Arts Anniversary&50th Independence Celebration	Joluv Arts Entertainment	Pencha Mi Hall-Paradise Suites Hotel	Soulayman Sowe-Joluv Arts	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Joluv Arts Entertainment is a music production,promotion and a well known label in the Gambia.We have been in partnership before.Its Worth supporting.	1	2015-01-27 13:45:52	2015-01-27 13:45:52
305	2015-10-12	8th Annual Open Mic Festival-The Gambia	Black Lynx Entertainment	Independence Stadium Bakau	Abdou Karim Fye(Waagan)	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	We have partnered with Black Lynx on numberous occasions and they have successful event.Its Worth supporting.	1	2015-10-15 12:56:09	2015-10-15 12:56:09
253	2015-04-20	Civil Aviation Authority Fund raising Gala	Civil Aviation Authority	Relax Sahel, Kololi	Ebrima Bojang Secretary General	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Civil Aviation Authority staff association(CAASA)are organizing fund raising gala dinner with the theme''Our Food,Our Health''.Funds raise will be donated to Bansang Hospital.Its worth supporting.	1	2015-05-11 10:08:24	2015-05-11 10:08:24
192	2015-01-21	Coconut residence Valentine Love Nest	Coconut residence Hotel	Coconut residence-Senegambia	Brenda Ubani-Uzoechi-Director of Operations	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Coconut residence hotel is wel known hotel in the Gambia.This event is organized on valentive day.Its worth supporting.	5	2015-02-03 16:33:06	2015-02-03 16:33:06
193	2015-02-02	Wizkid Live Concert	Absolute Entertainment	Independence Stadium Bakau	Haddy Faye	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This will be the first time Wizkid will be performing in the Gambia, He is one best artist from Nigeria and is known world wide. Wizkid has a lot of following in the Gambia and I believe its an event worth supporting	1	2015-02-03 17:36:27	2015-02-03 17:36:27
195	2015-01-24	The Block -Annual Independence Music Festival The Gambia	The Block Entertainment	Serekunda West Mini Stadium	The Block Entertainment Music Group	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	The Block Entertainment Music Group are well known in music industry in The Gambia.They are organizing this event to celebrate Gambia's 50th Independence Anniversary.Its worth supporting.	1	2015-02-04 10:57:18	2015-02-04 15:42:23
196	2015-01-03	T-Smallz Al Bullo Tour Show-Brufut	T small suso-Katatoo Entertainment	Brufut	Ebrima Suso Aka Trobul Smallz-Presenter&Producer	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Ebrima Suso(T-smalls Suso)is a well known Gambain artist in the Gambia especially in the music industry,He have organized very successful events before in the Gambia.We have been in partnership before.Its worth supporting.	1	2015-02-04 11:32:35	2015-02-04 11:33:44
197	2015-01-29	TBS&Wally Seck Fans Club Fund Raising Show	Thione Ballago Seck&Wally Seck Fans Club	Alliance Francaise	Oumie Mbye-President Fans Club	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This organization have been supporting youths and development and its has been in existing for (7)seven years and they have oragnized successful show before.Its worth supporting.	1	2015-02-09 17:07:45	2015-02-09 17:14:05
286	2015-08-24	Simplest Yagana Movement Tour	Yagana Movement	Pirang,Farafenni	Dj Simplest Afri Radio	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Dj Simplest works for afri-radio and he is a very popular Raggea Dj, Very Popular among the reggea loving community. its a show worth supporting	1	2015-09-09 16:16:20	2015-09-09 16:16:20
199	2015-02-05	Yusupha Ngum-Joloffman Album LAUNCHING GOLDEN JUBILEE 	Yusupha Ngum-Joloffman 	Galaxy Entertainment	Yusupha Ngum-Joloffman 	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Yusupha Ngum a.k.a Joloffman, son of Senegambiaâ€™s most renounced musical icon Bala Musa Affia Ngum â€œthe only renounce Senegambia musical icon.We have not been in partnership before,Its worth supporting.	1	2015-02-10 16:35:43	2015-02-10 16:35:43
200	2015-02-10	Masta Lion Promotion Concert(Peetah&Gramps Morgan)	Masta Lion Promotion 	Brikama Mini Stadium &Sk West Mini Stadium	Lamin Touray CEO Masta Lion Promotion 	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Masta Lion Promotion is a charity organization in Gambia and finland.They are partnering with The morgan gheritage family to make this event a success in independence celebration.Its worth supporting.	1	2015-02-10 17:06:06	2015-02-10 17:06:06
285	2015-08-06	Gambia Methodist Academy 20 Years Anniversary	Gambia Methodist Academy School	Campus Bakau	Hannah Harding-Principal	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Gambia Methodist Academy will be celebrating their 20 Years of excellent quality education in The Gambia,at both the Upper Basic and Senior Secondary School levels.I think its worth supporting.	5	2015-09-01 11:30:05	2015-09-29 08:14:50
203	2015-02-10	Flames Squad 1 Years Anniversary	Flames Squad-Artist	Atlanctic Hotel Banjul	Haji Tunkara-Manager	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Flames Squad Artist are well known and popular artist in The Gambia.Especially in Mbalax music industry.We have been in partnership before with one of artist name,Dave Ndow during Sing With Africell promotion.Its worth supporting.	1	2015-02-16 12:33:30	2015-03-03 11:24:49
209	2014-12-29	Join Hands Together celebrating 10 year anniversary 	Join Hands Together 	Serekunda West Mini Stadium	Assan Faal Manager	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC\\r\\nAfricell to be the only GSM partner\\r\\nVenue to be branded by africell\\r\\nVIP tickets to be provided for Africell Staff	Join Hands Together are upcoming artists in the Gambia.They already launched thier mix tape at the alliance francaise last year may 2014 sponsored by africell. Thier show was successful. I believe it is worth supporting.	1	2015-03-03 13:24:29	2015-03-03 13:24:29
215	2015-03-11	Silky Criss Live Show	Silky Criss Management	Alliance Francaise&Willy Night Club	Mam Malen Njie Manager	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Silky Criss is a well known and popular artist in The Gambia,and has a big fans base in the music industry. He can be supported and we have been in partnership before.	1	2015-03-12 10:54:55	2015-03-12 10:54:55
204	2015-02-20	Association of the Gambia Albinos (AGA)Gala Dinner	Association of the Gambia Albinos (AGA)	Parasie Suites Hotel	Abdou Karim-President	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	The Association of the Gambia Albinos (AGA) aimed at raising funds to empower persons with Albinism and disability through advocacy and providing them with skills training to meet the employment criteria. This will be the first partnership.Its worth supporting.	1	2015-03-02 12:21:11	2015-03-02 12:21:11
205	2015-02-14	Mystic MC 20 Years Anniversary	Mustapha Coker-Mystic Mc 'BLACK NATURE	Galaxy Entertainment Park-Senegambia	Mustapha Coker-Mystic Mc 'BLACK NATURE	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Mystic MC is a Gambian Danish living in Denmark from the musical group '' BLACK NATURE '' The first Rap musical group in The Gambia to release an album in 1996. International reggae and dancehall artist playing shows in countries like: UK,USA,Jamaica,Belgium and many more.Its worth supporting.	1	2015-03-02 16:06:20	2015-03-02 16:06:20
288	2015-08-26	Dj Indiana Production Concert	Indiana Production	Jakarlo Center Stage	Abdou Joof Coordinator	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Dj Indiana Production is well known in promoting Indian Music and Gambian music also.He will be organizing a big concert with Gambian Artists.Its worth supporting.	1	2015-09-10 14:57:34	2015-09-10 14:57:34
207	2015-01-22	Hero Stars Movie Premier	Hero Stars Movie Production	Badala Park Hotel	Adam Singhateh Secretary&Mustapha S.Kamara CEO	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is a well known organization in the areas of music,movie production and participation in the performing arts.They have relaesed to movie within a year''DEVIL ON THRONE&ADAMU THE VIRUS IN THE VILLAGE.The new movie to be premier is name as Broken Trust.This will be the first partnership I belive they can be supported.	4	2015-03-02 16:45:42	2015-03-02 16:45:42
208	2015-02-20	Zaidi English Movie Premier	Zaidi Entertainment Production	B.O.Samega Janneh Hall	Cherno Bubacarr Zaidi Jallow	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is a well known organization in the areas movie production and participation in the performing arts.The new English movie to be premier is name LOVE CONFUSION.This will be the first partnership I belive they can be supported.	4	2015-03-03 11:18:56	2015-03-03 11:18:56
210	2015-03-04	Keneke Promotion-Starboyz Album Launching	Keneke Promotion&Chief Hamid Entertainment	Alliance Francaise	Keneke Promotion	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Starboyz are Sierra Leonian artists based in The Gambia.They have a large fans base and followers in The Gambia, and I believe its a show worth supporting thier fist album launching.	1	2015-03-04 12:34:14	2015-03-04 12:34:14
211	2015-02-25	Squad Vypa 2nd Year Anniversary	Squad Vypa	Alliance Francaise	Amadou Secka-VYPA	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Amadou Secka A.K.A VYPA is one the Most Popular artists in the Gambia. He is a resident of Bakau. He is organising his annual 2nd Year Anniversary show at the Alliance Francaise.This show is expected to be very successful. I believe it is worth supporting.	1	2015-03-04 12:44:06	2015-03-04 12:44:06
212	2015-01-07	Mam Amata Foundation Easter Monday Picnic	Mam Amata Foundation	Banjul at former radio Syd	Joe Senghore Executive Director	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	The purpose of this event is to celebrate the resurrection of Jesus Christ and to promote health,joyous season,happy environment and unity among Gambians.We have been in partnership last year 2014.Its worth supporting.	5	2015-03-10 15:38:20	2015-03-10 15:38:20
226	2015-03-23	GFF Gambia VS Mauritania Friendly International Football Game	GFF	Independence Stadium Bakau	Abdou Salam Jammeh	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Africell is always in Support of Sports GFF are organizing an international football match Gambia VS Mauritania Friendly Game.Its worth supporting.	5	2015-03-25 10:13:52	2015-03-25 10:13:52
227	2015-03-10	Don Dancing Competition	Don Entertainment&Jokor Monument	Jokor monument westfield	Don Manager	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Don Entertainment&Jokor Monument are organizing final dancing competition.Its worth supporting.	1	2015-03-25 10:32:28	2015-03-25 11:24:05
214	2015-03-09	CMS 11th edition of kite flying	Cathedral Men's Solidarity CMS	Banjul at former radio Syd	Rev.Father Antione Sambou Spiritual Director	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	The 11th edition of kite flying is an annual event in The Gambia.It is a tradition and aims to promote kite flying,bringing christians,youths,and elders as one family.We have been in partnership before.Its worth supporting.	1	2015-03-12 10:48:32	2015-03-12 10:48:32
216	2015-03-09	Biddy's Promotion Awards Night	Biddy's Promotion	Paradise Suites Hotel-Pencha mi Hall	Ida Bidwell Coordinator	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Biddy's Promotion will be organising an GAM awards night to show case the talent of Gambian artists in different categories.Its worth supporting.	1	2015-03-12 13:08:09	2015-03-12 13:08:09
228	2015-03-23	Galaxy Entertainment Park Easter Family Outing Kids Party	Galaxy Entertainment	Galaxy Entertainment Park-Senegambia	Farmang Max Mane	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Galaxy Entertainment Park Easter Family Outing Kids Party to celebrate easter.Its worth supporting.	1	2015-03-27 14:58:56	2015-03-27 14:58:56
218	2015-02-02	The Scorz Hip Hop Festival 2015	The Scorz Hip Hop Artist	Alliance Francaise	Sheikh Tijan Jallow	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Sheikh Tijan Jallow AKA Tuju Brain of peppa house are pioneers of Hip Hop in The Gambia.We have been in partnership before.Its worth supporting.	1	2015-03-12 13:26:13	2015-03-12 13:26:13
219	2015-03-08	SJAG 6th National Sports Awards 2015	Sports Journalist Association Of The Gambia	Ocean Bay 5 Star Hotel Cape Point	Musa Sise-Chairman Award Committee	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	SJAG 6th National Sports Awards 2015 is held every year geared towards honoring individuals,althletes,sports personalities for their achievements and contribution towards Gambian sports.We have been in partnership.Its worth supporting.	5	2015-03-16 11:57:24	2015-03-16 11:57:24
220	2015-02-11	Queen Of Companies 2015	Glamorous Models Africa modelling agency 	Paradise Suites Hotel	GMA Administration-Williams Brown	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Queen Of Companies(QOC) is held every year,The beauty pageant competition includes different companies in The Gambia / Africa to help expose their business life, it intends to attract stunning young scholar ladies between the ages of 18 - 24 with normal average glance. It is the 5th of Edition and we have been in partnership before.Its worth Supporting.	2	2015-03-16 13:31:55	2015-03-16 13:31:55
221	2015-03-05	BENJAHMINâ€™S ALBUM LAUNCHING	Mandingmorry Foundation for Performing Arts (MANFOPA)	Brikama Mini Stadium 	Ibrahim Ceesay Executive Director Mandingmorry Entertainment	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	BENJAHMIN who is one of the finest Gambian Reggae Artists in The Gambia.He is dedicated,committed and he have several followers and fans,son of Brikama and a pioneer of the Front line Crew.Its worth supporting.	1	2015-03-17 12:20:01	2015-03-17 12:20:01
222	2015-03-14	EASTER SUNDAY GOSPEL MUSIC FIESTA	Mercy and Grace Gospel Music The Gambia	Paradise Suits Hotel 	B-Master staff of Afri radio	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	The Mercy and Grace Gospel Music Show on Afri-radio 107.6fm have a big fan base and lot of listners hosted by B-Master staff of Afri radio.Its worth supporting.	1	2015-03-19 11:18:51	2015-03-19 11:18:51
223	2015-02-10	Sunu Musico's 5th year Anniversary	T -Smallaz Ebrima Suso-Katatoo Entertainment	Serekunda West Mini Stadium	Ebrima Suso Aka Trobul Smallz-Presenter&Producer	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is Sunu Musico's 5th year Anniversary. It has always been successful and Africell has always supported T-Smallz. This is an event worth Supporting.	1	2015-03-19 12:13:37	2015-03-19 12:13:37
224	2015-02-12	Daddy Bostin Mix Tape Launching ''Ruff Days	Daddy Boston Under The Management of Minka Entertainment	Alliance Francaise	Sulayman Jammeh A.K.A.Daddy Boston	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Daddy Boston is a Gambian artist well known in music industry.We have been in partnership before.Its Worth Supporting.	1	2015-03-23 16:35:21	2015-03-23 16:35:21
225	2015-03-18	Akuntu Jalex 2 Singles Launching	Akuntu Acoustic Band	Sinatara's Hall Bakau	Jalex AKUNTU	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Jalex AKUNTU is a Gambian artist well known in music industry.We have been in partnership before.Its Worth Supporting.	1	2015-03-24 11:39:59	2015-03-24 11:39:59
229	2015-03-17	Annual Gamo&Siyareh of Nema Nasir	Nema Nasir Islamic Development Association	Nema Nasir Near Mosque	Mbye Drammeh President	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Annual Gamo and Siyareh of Nema Nasir is an Islamic event,it has biggest turnout in The Gambia.Its worth supporting.	5	2015-04-08 10:31:09	2015-04-08 10:31:09
230	2015-03-30	Egliterain Alliance Francaise	Alliance Francasie	Alliance Francaise	Salim Soumare	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Egalitarian is a Gambian he is well known in the music industry,both national and international.He is Launching his album.Its worth supporting.	1	2015-04-08 10:41:18	2015-04-13 16:09:39
231	2015-02-25	2015 National Divine Mercy Celebrations	Diocesan Committee Of The Divine Mercy	Catheral Church Banjul	Rev.Fr,John Mendy	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC\\r\\nAfricell to be the only GSM partner\\r\\nVenue to be branded by africell\\r\\nVIP tickets to be provided for Africell Staff	This is event that was sponsored before and it was very successful.The National Divine Mercy Celebrations has a lot of parishioners and they always turn out in their numbers to support the church. I believe it is an event worth supporting.	5	2015-04-08 11:14:46	2015-04-08 11:14:46
232	2015-03-20	Keneke Promotion Celebrating Sierra leone Independence Day	Keneke Promotion&Chief Hamid Entertainment	Jama Hall	Keneke Promotion	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Keneke Promotion celebrating Sierra leone Independence Day in The Gambia with international artist,comedian <br/><br/>SARA D GREAT'' from Sierraleone.He is well know in The Gambia, and I believe its a show worth supporting.	1	2015-04-08 13:13:03	2015-04-08 13:13:03
233	2015-03-30	Aliance Francaise Dream Bolly Wood Show	Alliance Francasie	Alliance Francaise	Salim Soumare pro-Graphis Designer	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC\\r\\nAfricell to be the only GSM partner\\r\\nVenue to be branded by africell\\r\\nVIP tickets to be provided for Africell Staff	Egalitarian is a Gambian he is well known in the music industry,both national and international.He is Launching his album.Its worth supporting	1	2015-04-08 17:45:06	2015-04-08 17:47:26
234	2015-03-27	Lend A Hand Society 20 years Anniversary	Lend A Hand Society	Opposite Zenith Preparatory School	Naffie Sissoho The National Coordinator	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Lend A Hand Society has raised awareness for young people and helping them realise their potentials,attitude building and cultural appreciation. The society has lot of members.Its worth supporting.	5	2015-04-09 12:50:30	2015-04-09 12:53:12
236	2015-04-02	May Day Sports 2015	National Sports Council	Maccarthy Square Banjul	Ebrima Secka-For Executive Director	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partne<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is an annual event,organized by national sports council under the ministry of youths and sports.We have been in parnership before.Its worth supporting.	1	2015-04-17 13:06:11	2015-04-21 11:08:02
250	2015-05-07	Brain Krackers 2nd year Anniversary	Bai Babou	Jakarlo	Bai Babou	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Bai Babou AKA Brain Kracker is one of the most popular Young artist in The Gambia. He has a lot of following and is well loved. I believe it will be a successful event.	1	2015-05-07 15:48:29	2015-05-07 15:51:27
238	2015-04-01	DJ PACO Music show farafenni	DJ PACO	Farafenni	DJ PACO	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	DJ paco is well know as dico joker at unique fm.He will be oraganizing a big music wiht Dj's in The Gambia in farafenni.Its worth supporting.	1	2015-04-21 11:22:15	2015-04-21 11:22:15
241	2015-02-16	Gunjur Cultural Festival	Gunjur Village&Committee	Gunjur(8th&9th May)	Buba Bojang(Mbaye)Secretary General	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Gunjur Cultural Festival is an annual event and attracts lot peoples in Gunjur and surrounding villages.Its is cultural,traditional,festival.Its worth supporting.	1	2015-04-21 11:39:39	2015-04-21 11:44:42
242	2015-04-20	Lama Production	Lama Production	Jokor monument westfield	Modou Faal A.K.A Lama 	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Modou Faal A.K.A lama is well known as DJ and comdeian in the Gambia.We have been in partnership before during Africell's major promotions.Its worth supporting.	1	2015-04-27 11:44:35	2015-05-11 09:41:39
251	2015-04-15	Fiila 6th Year Anniversary	Black Lynx	SK East mini stadium & Brikama Box bar	Black lynx	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Black lynx are the force behind Gambian music.  Fiila is the most popular show on GRTS promoting Gambian music. this is their 6th anniversary and we've always supported them. I believe its going to be a successful show	1	2015-05-08 14:52:47	2015-05-08 14:52:47
284	2015-08-20	IYF World Camp Gambia 2015	International Youth Fellowship(IYF)	Gambia Tourism &Hospitality Institute(G.T.H.I)	Wook Jim(IYF)	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	International Youth Fellowship(IYF) is a global youth organization they are currrently giving free language classes in french and korean as well as bible studies in Gambia.The world camp will be the first of it kind in the Gambia.Its worth supporting.	1	2015-08-31 15:24:42	2015-08-31 15:24:42
245	2015-04-15	Flames Squad Video Launching	Flames Squad-Artist&Joluv Arts	Atlanctic Hotel Banjul	Soulayman Sowe-Joluv Arts	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Flames Squad Artist are well known and popular artist in The Gambia.Especially in Mbalax music industry.We have been in partnership before with one of artist name,Dave Ndow during Sing With Africell promotion.Its worth supporting.	1	2015-04-28 16:18:32	2015-04-28 16:18:32
282	2015-08-10	International Football Gambia VS Cameroon	GFF	Independence Stadium Bakau	GFF	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	International Football game between Gambia VS Cameroon,qualifiers i think will have a big turn out.Its worth supporting.	5	2015-08-24 15:33:16	2015-09-02 15:57:19
283	2015-08-11	The Humanity Starz 11th Years Anniversary	The Humanity Starz Group	Jaama Hall-Kairaba Beach Hotel	Mbye Bittaye-Manager The Humanity Starz	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	The Humanity Starz will be organizing their 11th Years Anniversary in music industry on Tobaski Day.They are the youngest live Band Group in The Gambia,making a big name in the music industry.We have been in partnership before.Its worth supporting.	1	2015-08-24 16:14:42	2015-08-24 16:14:42
247	2015-05-04	Rhythmic Vibrations	Blaque Magique	Kairaba Beach Hotel	Ronald Senghore	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Africell has always partnered with the Blaque Magique Poets on their events. Their events have always been successful. I believe its an event worth Supporting.	1	2015-05-05 12:09:19	2015-05-05 12:09:19
249	2015-05-21	Winners Gospel Concert	Winners Chapel	WInners Chapel	Elijah Tawiah-Brown	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Winners Chapel is one of the biggest churches in the Gambia. The concert they are staging will include gosple singers from other churches. The event is expected to be successful	1	2015-05-06 16:35:27	2015-05-14 09:11:02
252	2015-04-29	Pain Perception MixTape Launching	Izzy T	Alliance Francaise	Izzy T	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Izzy T is a well known musician residing in Ebo-Town. He is one of the best Hip hop artist in the Gambia. He is well loved by his peers and I believe he is worth supporting.	1	2015-05-08 15:13:30	2015-05-08 15:13:30
254	2015-04-27	Diha's Awards Celebration With Fans	Diha and Fans	Alliance Francaise	Diha Artist	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Diha's is Celebrating Awards With Fans, as best female artist in the Gambia.She is well know in the music indusrty''mandinka''songs.Its worth supporting.	1	2015-05-11 11:44:54	2015-05-11 11:44:54
306	2015-10-15	Silky Crissâ€™s Debut Album Launching	Silky Criss Management	Jaama Hall(Kairaba Beach Hotel)	Mam Malen Njie-Manager Silky Criss 	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Silky Criss is a well known and popular artist in The Gambia,and has a big fans base in the music industry. He can be supported and we have been in partnership before.	1	2015-10-15 13:08:06	2015-11-19 11:47:53
256	2015-03-24	World Blood Donor Day 2015	Ministry Of Health&Social Welfare	Brikama Governor Residence	Dr Makie Taal Permanent Secretary	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is an event celebrated world wide,to donate blood,and is been organized by Ministry of health.Its worth supporting.	5	2015-05-18 11:25:23	2015-10-22 13:13:41
257	2015-04-30	Wrestling Revival Gourp 	Wrestling Revival Gourp 	Farafenni	Wrestling Revival Gourp 	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	The Wrestling Revival Gourp are organizing this event to bring unity between radio presenters& journalist in the Gambia,Its worth supporting.	5	2015-05-18 14:39:00	2015-05-18 14:39:00
258	2015-05-04	Afrinity Production London Manga Movie Premier	Afrinity Production	Paradise Suites Hotel	Wlfred Adams Afrinity Production	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Afrinity Production are organizing a movie premier title ''London Manga Movie''.Together lets say no to back way.Its worth supporting.	4	2015-05-19 12:39:23	2015-05-19 12:39:23
259	2015-04-27	Ms Promotions Soninkara Music Award Night 2015	Ms Promotions in collaboration with B-Master Production	Alliance Francaise	Muhammed Saho-Afri Radio Staff	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Dj Muhammed Saho works for afri-radio and he is a very popular in ''sarahule'' music industry.The Soninkara Music Award Night 2015 is one the biggest event organized by sarahule community. It's a show worth supporting.	1	2015-05-19 12:52:19	2015-05-28 16:42:57
260	2015-05-05	Catholic Diocesan Youth Night Glory	Catholic Diocesan Youth 	Reform Club MDI Road	Rev.Fr John Mendy(Youth Chaplain)	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC\\r\\nAfricell to be the only GSM partner\\r\\nVenue to be branded by africell\\r\\nVIP tickets to be provided for Africell Staff	Catholic Diocesan Youth group.This is a youth workforce,including old peoples.The event is  geared to showcase youths in singing,dancing,(Choreography)and skill work.Its worth supporting	5	2015-05-20 14:33:30	2015-05-20 14:33:30
261	2015-05-20	5th Annual Murid Gamo''Chanta''Serigne Saliou Mbacke	Murid's Gambia Serigne Saliou Mbacke	Opposite Garage At Africell	Ebrima Ndong Jawrin	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	The 5th Annual Murid Gamo''Chanta''Serigne Saliou Mbacke is an Islamic event.organized by Murids living in the Gambia.Its is big event held annually.Its worth supporting.	5	2015-05-20 16:29:42	2015-05-20 16:29:42
262	2015-05-14	FAWEGAM Week	Fawegam	FAWEGAM	Mrs. Yadicon Njie Eribo	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Africell has always supported the empowerment of women and girls. FAWEGAM and africell have partnered on a number of occasions and they have been successful. Based on a fruitful history, I believe its an event worth supporting	1	2015-05-20 17:24:41	2015-05-20 17:24:41
263	2015-04-30	Hand of Fate DVD Launching &Screening of Sarata Movie	Mandingmorry Foundation for Performing Arts (MANFOPA)	Pencha Mi Hall	Ibrahim Ceesay Executive Director Mandingmorry Entertainment	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is a well known organization in the areas of music,movie production and participation in the performing arts.Hand of Fate DVD Launching &Screening of Sarata Movie.We have been in partnership before. I belive they can be supported.	4	2015-05-21 11:59:01	2015-06-01 10:42:06
264	2015-05-21	Free Eye Treatment Africa Muslim Agency	Africa Muslim Agency Gambia	Farafenni	Ouazzani Abdellah-Country Director	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Africa Muslim Agency will be oraganizing a Free Eye Treatment in farafenni to help peoples with eye problems in Farafenni and surrounding villages.Its worth supporting.	5	2015-05-27 10:26:10	2015-05-27 10:26:10
265	2015-05-28	The Gambia Red Cross 12th Annual Miss,Master 2015	The Gambia Red Cross Society	Alliance Francaise	Momodou Fofana-Branch Officer KMC	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	The Gambia Red Cross society 12th Annual Miss,Master Miming competition 2015 is a big event organized by red cross links and societies.Its can be supported.	2	2015-05-28 16:22:27	2015-05-28 16:25:36
266	2015-06-29	GFF Football Match 2nd Leg CHAN 2015-Gambia VS Senegal 	GFF	Independence Stadium Bakau	Abdou Salam Jammeh 	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	The Gambia Football federation are organizing an international football match 2nd leg CHAN 2015,Gambia VS Senegal at Independence Stadium Bakau.Africell have been in supports of sports.We have been in parthnership before.Its worth supporting.	5	2015-07-01 13:20:40	2015-07-01 13:34:34
268	2015-06-29	GFE In Collaboration with LXG Sierra leone	Good Friends Entertainment The Gambia	Paradise Suites Hotel	Simeon Adu-Kay	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Good Friends Entertainment(GFE)will be organizing music show with hottest group LXG crew of sierraleone live in the gambia in collaboration with Sierraleone high commission.Its worth supporting.	1	2015-07-01 14:50:48	2015-07-01 14:50:48
269	2015-06-03	CCLK Fund raising &Cultural Night	Christina Community of Latrikunda	Father farell Hall,Kanifing	James Macauley General Secretary	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC\\r\\nAfricell to be the only GSM partner\\r\\nVenue to be branded by africell\\r\\nVIP tickets to be provided for Africell Staff	Christian community of latrikunda(CCLK)is a community based organization operating at latrikunda.They embarked on assisting poor students in funding their education,community works irrespective of ethnic or religion.They worth supporting.	5	2015-07-07 14:01:31	2015-07-07 14:01:31
270	2015-07-20	Muslim Senior Secondary Inetr Schools Quiz&Debate Competition	Muslim Senior Secondary Computer Club	Muslim School Hall	Lala Sambou-Secretary Computer Club MSSS	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Muslim Senior Secondary Inetr Schools Quiz&Debate Competition involving IT clubs from six Senior Secondary Schools.The quiz competitions will create awareness in the Information Technology for students in Gambia.Its worth supporting.	5	2015-07-20 14:38:29	2015-07-20 14:38:29
287	2015-09-01	Simplest Yagana Movement Tobaski Tour	Yagana Movement	Sibanor,Pirang and Faraba	Dj Simplest Staff Of Afri Radio	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Dj Simplest works for afri-radio and he is a very popular Raggea Dj, Very Popular among the reggea loving community. Its a show worth supporting	1	2015-09-09 16:20:29	2015-09-09 16:20:29
280	2015-07-20	Awake Youth Fellowship Fund Raising Show	Awake Youth Fellowship Committee	Ndows Hall Kanifing Estate	Bintou Dibbasey	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	The Awake Youth Fellowship Committee are young christians and non christians in the Gambia to motivates youths as members of''Ark of Change''.Its worth supporting.	1	2015-08-19 16:09:36	2015-08-19 16:09:36
321	2015-10-22	Sophia's Mixtape Launching	Movement Sophia	Alliance Francaise	Mustapha Jallow	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Sophia is one of Gambia's most popular female dancehall artist.She will be Launching her Mixtape.Its worth supporting.	1	2015-11-06 11:49:17	2015-11-06 11:49:17
272	2015-06-29	NA TANGA MUSIC ARMY(NTMA)	NA TANGA MUSIC ARMY(NTMA)	Churchillstown	Pope Manager	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	NA TANGA MUSIC ARMY(NTMA)will be organizing a free music show to help up coming artists in Gambia.We have not been in partnership before.Its worth supporting.	1	2015-07-20 16:34:02	2015-07-20 16:34:02
273	2015-07-28	World Hepatitis Day 	World Health Organization	MRC	Modou Njie	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	World Hepatitis Day is commemorated every year,in order to raise awareness about hepatitis and its dangers,one of the world's killer diseases.Its worth supporting.	5	2015-07-29 10:38:15	2015-07-29 10:38:15
274	2015-08-23	Brikama Sports Committee Super Cup Final	Brikama Sports Committee 	Brikama Mini Stadium 	Karamo Jarju Secretary General	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Brikama Sports Committee are organizing a Super Cup Final,which  is held every year at Brikama Mini Stadium.We have been in partnership before.Its worth supporting.	5	2015-08-03 12:16:45	2015-08-03 12:16:45
278	2015-08-10	The On Gambia Fashion Movement	Tara Designs	Kairaba Beach Hotel	Fatou Drammeh	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	The On Gambia Fashion Movement show is organized by Fatou Camara of Tara Designs,we have been in partnership before.Its worth supporting.	2	2015-08-19 15:51:39	2015-10-26 13:47:24
276	2015-08-02	Catholic Community Banjul 'Sang Marie' 2015	Catholic Community Banjul 	Banjul 	Mrs Mary Roberts Parish Council Chairperson	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Catholic Community Banjul will be celebrating annual feast commonly known as 'Sang Marie' this year 2015.We have been in partnership before.Its worth Supporting.	5	2015-08-04 14:38:13	2015-08-04 14:38:13
277	2015-08-01	Sang Marie 2015 Fajut Mbour	Club 7 Palmarin	Fajut Mbour Senegal	Ronald Senghore	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC\\r\\nAfricell to be the only GSM partner	Club 7 Palmarin is a group of young christian youths that join other youths from Senegal for the Celebration of the Assumption of Mary, a feast Celebrated worldwide. This event is always well attended. I believe its worth supporting	1	2015-08-10 17:42:28	2015-08-18 16:21:09
307	2015-10-19	Mighty Simplest Tour 2015	Yagana Movement	Sibanor,Bwiam and Faraba	Mighty Simplest Afri radio	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Dj Simplest works for afri-radio and he is a very popular Raggea Dj, Very Popular among the reggea loving community. its a show worth supporting	1	2015-10-20 10:19:30	2015-10-20 10:21:28
295	2015-09-29	Miss Nawettaan Bakau 2015	STANFEST PROMOTION	Friendship Hostel Bakau	Stanfest Promotion CEO Laming Marong	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is 3rd Edition Of Miss Nawettan Bakau, and we have been in partnership before with STANFEST Promotions.The turn out is always good.I think its a program worth sponsoring in Bakau.	1	2015-09-29 16:29:22	2015-10-13 13:00:30
296	2015-09-14	Launching Of Ms Promotions Soninkara Namansanou	M.s Promotions in collaboration with(G.S.N)Gambia Soninkara Namansanou	Alliance Francaise	Muhammed Saho-Afri Radio Staff	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	M.S Promotion have been in partnership with Africell before.They have organized very success event before''Soninkara Music Awards' for all the sarahule musicians in The Gambia. This event is expected to be successful.Its worth supporting	1	2015-09-29 16:42:14	2015-09-29 16:42:14
297	2015-09-08	MR&MISS AIUWA 2015 BEAUTY PAGEANT 2nd Edition	American International University Students Union	Kairaba Beach Hotel	Promise Okereke AIUWASU President	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is a non-political and non religious organization aim at bringing all the students of the American International University Students Union under one umbrella.This will be 2nd Edition beauty pageant 2015.This will be the second partnership.Its worth supporting.	2	2015-09-29 16:55:54	2015-10-20 10:20:31
308	2015-10-05	Brikama Knockout Final Football Match 	Brikama Youths&Sports Committee	Brikama Mini Stadium 	Karamo Jarju Secretary General	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Brikama Sports Committee are organizing a Nawettaan Final,which is held every year at Brikama Mini Stadium.We have been in partnership before.Its worth supporting	5	2015-10-22 10:31:28	2015-10-22 10:32:35
309	2015-10-21	Top Link Launching Of the Book 'Who is Who In The Gambia	Top Link 	Joint Offiers Mess	Richardson O'Brian -Coker	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Top Link will be Launching Book 'Who is Who In The Gambia.Its worth supporting.	5	2015-10-23 11:59:54	2015-10-23 11:59:54
310	2015-10-09	Farafenni Artist Association Musical Jamboree	Farafenni Artist Association	Farafenni	Pa Boy Sanneh	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Farafenni Artist Association will be organizing a Musical Jamboree to encourage upcoing artist in their ragion.Its worth supporting.	1	2015-10-23 12:04:35	2015-10-23 12:04:35
311	2015-10-20	Fiila Crew 3rd Edition Miss Beauty Pageant 2015	Fiila Crew Brikama	Brikama Jokor Graden Club	Big Sam-Secretary General	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	We have been in parthnership before with Fiila Crew Brikama and sponsored previous show fiila which was successful.I think its a program worth sponsoring	2	2015-10-27 10:34:00	2015-10-27 10:34:00
328	2015-11-05	Sparkln Black Launching Song Of The Year	Trustars Production	Paradise Suites Hotel	Manager Trustars Production	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Trustars Production &Sparkln Black artist are well konwn in the Gambian music industry.They want to launch hit song of the year.Its worth supporting.	1	2015-11-18 16:29:38	2015-11-18 16:29:38
329	2015-09-11	Launching Of Street Hustlers to Nobles	Street Hustlers/Nobles Group	Sk East Mini Stadium	Manager-Street Hustlers-Nobles	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Street Hustlers/Nobles will be launching their new name to bring together young people of the society under one umbrella.Funds generated will be for the development of their community.Its Worth supporting.	1	2015-11-18 16:37:56	2015-11-18 16:39:32
313	2015-10-27	St. Kizito's Annual Concert	St. Kizito's Parish	Pencha mi Hall	Peter Gomez	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC\\r\\nAfricell to be the only GSM partner\\r\\n5 Minute video of Africell to be aired during the event\\r\\nHigh Table seat for one of Africell's representative\\r\\nVenue to be branded by africell\\r\\nFull page advert to be given to Africell\\r\\nVIP tickets to be provided for Africell Staff	This is an event that was sponsored before and it was very successful. the parish of st. kizito has a lot of parishioners and they always turn out in their numbers to support the church.  I believe it is an event worth supporting.	1	2015-11-02 13:14:45	2015-11-02 13:14:45
367	2016-01-13	ST Duniya Beh Kibaro Show	ST Brikama Boyo	Jakarlo Center Stage	Dembo Jorbateh Manager/Promoter ST	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	ST is a very big name in Brikama and Kombo areas.He previous show were all successful.We have been in partnership before. I believe its worth supporting	1	2016-01-26 13:06:54	2016-01-26 13:06:54
315	2015-10-30	Launching of Song - The Gambia 	Sona Jobarteh	Pencha mi Hall	Saihou Kanuteh	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Sona is a very talented female kora player. she is well known it europe and has been on a lot of tours.  She recently released a new song titled "The Gambia". She is launching this song.	1	2015-11-03 15:52:14	2015-11-03 15:52:14
316	2015-10-27	Bena Kotu Carnival 1st Edition	Kotu Youth Development Association	Kotu	Cherno Badjie Secretary General(KYDA)	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Kotu Youth Development Association will be organizing carnival,funds generated will be given back to communities.Its worth supporting.	1	2015-11-04 10:41:10	2015-11-04 10:41:10
317	2015-10-21	YETES-World Diabetes Day 2015	Youth Employment Through Education&Sport(YETES)	Independence Stadium Bakau	Mohamodou Musa Njie Executive Director YESTES	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Youth Employment Through Education&Sport(YETES)will be organizing a campaign to sensitize community on Diabetes and to commorate World Diabetes Day.Its worth supporting.	1	2015-11-04 11:53:09	2015-11-04 11:53:09
318	2015-11-10	Simplest Yagana Show	Yagana Movement	Busumballa	Dj Simplest Staff Of Afri Radio	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC\\r\\nAfricell to be the only GSM partner\\r\\nVenue to be branded by africell\\r\\nVIP tickets to be provided for Africell Staff	Dj Simplest works for afri-radio and he is a very popular Raggea Dj, Very Popular among the reggea loving community. its a show worth supporting	1	2015-11-04 12:23:20	2015-11-04 12:23:20
319	2015-11-01	Ngongon Youth Association Fundraising Show	Ngongon Youth Association	Ngongon Village	Mr Ndong Sulayman	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Ngongon Youth Association will be oragnizing a Fundraising Show for their quarter final football match.Its worth supporting.	1	2015-11-04 12:48:36	2015-11-04 12:48:36
320	2015-10-30	Elite Movement Rydim Launching	Elite Movement Music Group	Atlanctic Hotel Banjul	Elite Movement-Manager	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Elite Movement Music Group will be launching Rydim show to supporty the Gambian Artists in Banjul and surrounding.Its worth supporting.	1	2015-11-04 13:09:06	2015-11-04 13:09:06
372	2016-01-14	KARTONG FESTIVAL 2016	KARTONG	KARTONG	 Lamin M. Manneh  (Modou)  (Admin Secretary)	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC\\r\\nAfricell to be the only GSM partner\\r\\nVenue to be branded by africell\\r\\nVIP tickets to be provided for Africell Staff	The 11th Edition of Kartong International Festival will be held in the West coast Region.This is an annual event which attracts lot people.This is will our first partnership.I think itts worth supporting.	1	2016-01-27 13:39:43	2016-01-27 13:39:43
323	2015-11-03	Red Cross Annual Youth Gathering	Red Cross Banjul Branch	Gambia High School Hall	Omar Ndow	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Red cross Volunteers have been known for their humanitarian services in the world. this is an event that brings youth from all over the country together. I believe its worth supporting	1	2015-11-07 14:46:28	2015-11-07 17:32:03
324	2015-11-04	Klint The Drunk in The Gambia	All Stars Production	Paradise Suites Hotel	Elizabeth Sambou Efenaro	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Klint the drunk is a very talented and well known Nigerian Comedian and Actor. He will be performing in the Gambia and I believe its an event worth supporting	1	2015-11-07 15:05:42	2015-11-07 15:05:42
325	2015-11-03	Farato Peace Festival	Karmic Angels	Farato Football Field	Bakary Touray	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Karmic Angels is an international Charity in the UK and The Gambia. The proposed concert organised by Karmic Angels in Farato is meant to raise funds to support community projects.	1	2015-11-07 16:37:19	2015-11-07 16:37:19
326	2015-11-11	Brikama Nawettan League Final	Brikama Youths&Sports Committee	Brikama Mini Stadium 	Karamo Jarju Secretary General	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Brikama Sports Committee are organizing a Nawettan League Final,which is held every year at Brikama Mini Stadium.We have been in partnership before.Its worth supporting.	1	2015-11-16 11:10:36	2015-11-17 11:47:26
327	2015-11-12	Gamo Medina Baye Nyass-Senegal	United Association Of Muhammed Nasir Ebrahim Nyass	Medina Baye Nyass-Kaolack Senegal	Ousainou&Assan Nasir Ibrahim Nyass	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Gamo Medina Baye Nyass is an annual Islamic event to celebrate the birthday of the prophet Muhammed(S.A.W)worldwide,particularly in Medina Baye Nyass-Kaolack Senegal.Its worth supporting.	5	2015-11-16 11:35:36	2015-11-16 11:35:36
330	2015-11-11	Catholic Church Feast	Catholic Community Banjul 	Banjul 	Bruno Toupan	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Catholic Community of Banjul Catholic Church want to organized a Feast and harvest Festival.Its worth supporting.	5	2015-11-19 08:46:46	2015-11-19 08:46:46
333	2015-11-11	Magal Touba	Federation of Diara Murite in The Gambia	Touba Senegal	Modou Kara Gaye	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>	This is the second time we'll be supporting this trip to senegal, its the largest gathering of muslims in Gambia and Senegal. I believe its worth supporting	1	2015-11-26 15:02:52	2015-11-26 15:02:52
334	2015-11-11	Burr Westling Competition	Burr Wrestling Promotion	Wellingara Football Field	Omar Burr Touray	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is a grand wrestling Competition comprising of 48 wrestlers from across the country. its worth supporting.	1	2015-11-26 15:36:02	2015-11-26 15:36:02
369	2016-01-18	Manding Empire 3rd Year Anniversary 2016	Manding Morry&Fans	Alliance Francaise	Manding Morry	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Manding Morry,as an artist has big fan base, he is a good musician from Bakau. The event is expected to be successful.Its worth supporting	1	2016-01-26 13:28:18	2016-01-26 13:28:18
370	2016-01-13	3rd Edition Miss Fulbeh 2016	Teddoungal Promotion	Alliance Francaise	Abdoulie Korka Jallow	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This will be the first time we will be working with Teddoungal Promotion. They approached us last year for the second edition of this event due to time we couldn't sponsor. I think its a program worth sponsoring.	2	2016-01-26 13:41:05	2016-01-26 13:41:05
337	2015-12-01	Santa Maria Christmas Dance	Santa Maria	Reform Club	Andre Manga	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is the second edition that will be sponsored by Africell. the previous edition was successful and I believe this year's is worth supporting	1	2015-12-03 13:01:46	2015-12-03 13:01:46
338	2015-12-01	Bro K's Album Launching	Bro K	Brikama Jokor & Alliance Francaise	Sulayman Singhateh	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Bro K is one of the best Afro Manding artist in the Gambia. He has released a lot of songs that are really popular and liked. He is releasing his album and I believe its worth supporting.	1	2015-12-03 13:10:24	2015-12-03 13:10:24
368	2016-01-18	Sunu Musico 6th Year Anniversary 2016	T small suso-Katatoo Entertainment	Jakarlo Center Stage	Ebrima Suso Aka Trobul Smallz-Presenter&Producer	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is Sunu Musico's 6th year Anniversary. It has always been successful and Africell has always supported T-Smallz. This is an event worth Supporting.	1	2016-01-26 13:13:39	2016-01-26 13:16:14
340	2015-12-01	University of The Gambia Student Week	University of The Gambia	Farafenni Campus	Fatou Njie	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	The UTG has always been a partner with Africell, we always support their programs.This year they will be having their student week in Farafenni, they have written for support and I believe they should be supported	1	2015-12-03 14:12:35	2015-12-03 14:12:35
341	2015-12-01	Blaque Magique 5.0	Blaque Magique	Kairaba Beach Hotel	Ronald Senghore	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This partnership has been successful over the past years. Africell has always supported Blaque Magique during their events and they have all been successful. this are having their annual dinner show dis year and I believe it is worth supporting	1	2015-12-03 14:18:18	2015-12-03 14:18:18
342	2015-12-03	Nda-Mariam Jagne Charity Football Game	Nda-Mariam Jagne Family Foundation	SK East mini stadium 	Ndey Mariam Jagne	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Pa Modou Jagne is a Gambian professional footballer playing in Switzerland. His charity organisation was established by him and his wife with the aim of improving maternal health services for women in The Gambia. He has a charity match involving Gambian professionals and I believe it is worth supporting.	1	2015-12-03 15:34:13	2015-12-03 15:34:13
343	2015-12-03	Don Entertainment Dancing Competition	Don Entertainment	Jokor Westfield	Kingsley Eze	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Don Entertainment organizes a dancing competition every year and the turnout is usually great. a lot of people follow it and I believe its worth supporting.	1	2015-12-03 15:47:03	2015-12-03 15:47:03
344	2015-12-09	Launching of Sukuta Nema Nyodema Kafo	Sukuta Nema Kafo	Sukuta Birmida Bilingual School	Saffiatou Darboe	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This Sukuta Kafoo that consists of women from Sukuta and they are setting a credit union for all the women in sukuta and neighbouring villages. They have applied for our CUG and its been processed. I believe its worth supporting	1	2015-12-14 13:57:23	2015-12-14 13:57:23
345	2015-12-09	ST Brikama Boyo New Years Show	ST	Brikama Jokor 	Dembo Jobarteh	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	ST is a very big name in Brikama and he is hosting his Show on New Years eve and its expected to be packed because its the biggest show in brikama on that day. I believe its worth supporting	1	2015-12-14 15:43:50	2015-12-14 15:43:50
346	2015-10-19	Epm Kids Christmas Party	Events Planning&Management(EPM)	Relax Sahel, Kololi	Sira Baldeh	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	EPM)Events Planning&Management want to organize kids christmas party.The aim is to bring kids together under one umbrella on christmas feast.Its worth supporting.	1	2015-12-21 14:14:28	2015-12-21 14:14:28
347	2015-12-10	Simplest Yagana Movement Christmas Tour	Yagana Movement	Pirang,Sifoe,Gunjur,Faraba	DJ Simplest Of Afri radio	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Dj Simplest works for afri-radio and he is a very popular Raggea Dj, Very Popular among the reggea loving community. Its a show worth supporting	1	2015-12-21 15:46:15	2015-12-21 15:46:15
348	2015-12-06	Davido Live In The Gambia	Absolute Entertainment	Independence Stadium Bakau	Ms Haddy Faye CEO Absolute Entertainment	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This will be the first time Davido will be performing in the Gambia, He is one best artist from Nigeria and is known world wide.Davido has a lot of following in the Gambia and I believe its an event worth supporting	1	2015-12-29 10:20:48	2015-12-29 10:20:48
349	2015-12-07	TITI Gala Dinner&Dance	Champion Sounds	Paradise Suites Hotel	Dj Lamin Cham-Champion Sounds	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Dj Lamin Cham of Champion Sounds will be organizing music show with famous senegalese star TITI, Gala Dinner&Dance.Titi has lots of fans in Gambia,its worth supporting.	1	2015-12-29 10:32:42	2015-12-29 10:32:42
350	2015-12-17	St Anthony's Choir Concert 2016	St Anthony's Parish Kololi	Kairaba Beach Hotel	Mr Charles Gome/Mr Thibaut Sambou	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is a youth workforce,young choir,parish.They want to organize this event to raise funds to buy materials/Instruments for their church.Its worth supporting.	5	2016-01-04 12:21:01	2016-01-04 12:21:01
351	2015-12-04	3rd Edition Reggae Kunda Music Festival	Mandingmorry Foundation for Performing Arts (MANFOPA)	Sk West Mini Stadium	Ibrahim Ceesay Executive Director Mandingmorry Foundation For Performing Arts	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Mandingmorry Foundation for Performing Arts (MANFOPA) will be oragnizing their 3rd Edition Reggae Kunda Music Festival.We have been in partnership with Ibrahim Ceesay Executive Director MANFOPA.Its worth supporting.	1	2016-01-04 13:18:34	2016-01-04 13:18:34
352	2015-12-23	Gamo Serekunda	Santa Yalla Mosque Committee	Opposite Plaza Cinema Serekunda	Alhagie Malick Gaye	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Gamo is an annual Islamic event to celebrate the birthday of the prophet Muhammed(S.A.W)worldwide.Its worth supporting.	5	2016-01-05 12:06:05	2016-01-05 12:06:05
353	2015-12-23	Pap Joof Fans&Humanity Starz	Pap Joof Fans Club	Brikama Jokor	Mbassey Manneh	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is a beauty pagent,Face of Brikama organized by Papa Diouf fans club in Brikama,They have very big fan base.We have been in patrnership before.They worth supporting.	1	2016-01-05 15:35:38	2016-02-02 10:13:26
354	2015-10-15	Mc Mbye Album Launching''Gambia Sikanam''	Mc Mbye Artist	Alliance Francaise	Mc Mbye	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Mc Mbye is launching is Brand New Album Launching name''Vision Gambia Sikanam'.He has a big fans base in music industry and he is well known Gambian ''Mbalax''artist.Its Worth supporting.	1	2016-01-07 11:00:11	2016-01-07 11:00:11
355	2015-11-26	MLC 10 Years Anniversary In Music	Mlc Emeloo&Fans	Bakau School Ground	Modou Lamin Ceesay	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	MLC as an artist has always worked with Africell, he is a hard musician from Bakau and he will be celebrating his 10 years in Music. He went with Africell up country during the Xtreme tour 2011. The event is expected to be successful.	1	2016-01-12 11:13:19	2016-01-12 11:13:19
356	2015-12-23	Brixton Open Mic Jam-Fiila Crew Brikama	Fiila Crew Brikama	Brikama Mini Stadium 	Big Sam-Secretary General	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	We have been in parthnership before with Fiila Crew Brikama and sponsored previous show fiila show which was successful.This is the 1st Edition Brixton Open Mic Jam I think its a program worth sponsoring.	1	2016-01-14 11:04:10	2016-01-15 10:28:25
357	2015-11-23	Kanifing East Youths Blood Donation&Carnival	Kanifing East Youths&Sports Development Committee	KMC HALL	Mutarr Trinn Customer Care	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC\\r\\nAfricell to be the only GSM partner\\r\\nVenue to be branded by africell\\r\\nVIP tickets to be provided for Africell Staff	Kanifing East Youths&Sports Development Committee will be organizing a free Blood Donor day,and carnival support with estate communites.I think its worth supporting.	1	2016-01-14 11:11:15	2016-01-27 17:34:31
358	2016-01-13	Tam 50 Album Launching	Ndonngol Entertainment Music Label as the General Manager	Jakarlo Center Stage	Ousainou Mboob.	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Tamsir Samba alias Tam 50 Silky is a well known and popular artist in The Gambia,and has a big fans base in the music industry. He can be supported for his Debut Album launching.	1	2016-01-15 08:25:25	2016-01-15 08:25:25
359	2016-01-11	Dj Njags Junior Valentines EVE special musical jamboree	Njaggs junior in collaboration with solid vibes sound 	Fass Njagga Choi Hall	Njagga Sowe Staff Afri Media	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Dj Njaggs junior works for afri-radio and he is a very popular Djlove by community. its a show worth supporting.	1	2016-01-18 11:53:14	2016-01-28 11:05:00
361	2016-01-15	Annual Conference Nema Nasir	United Association Of Sheikh Muhammed Nasir Ibrahim Nyass Association	Nema Nasir Near Mosque	Sheika Hassan&Ousainou Jobe Nyass	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	United Association Of Sheikh Muhammed Nasir Ibrahim Nyass Association will be organizing their 1st Annual Conference to be held at Nema Nasir.Its worth supporting.	1	2016-01-18 15:53:53	2016-01-18 15:53:53
362	2016-01-19	Black Lynxs Monthly Open Mic Tabokoto	Black Lynx Entertainment	Opposite Elton	Waagan Fye	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	We have partnered with Black Lynx on numberous occasions and they have successful event.Its Worth supporting.	1	2016-01-19 10:47:39	2016-01-28 13:17:59
363	2015-12-31	Ablo Promotion Launching&Women Kafo	Ablo Promotion 	Kandiba School Ground	Alhagie Abdoulie Bojang	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Alhagie Abdoulie Bojang commonly know as will be Launching Ablo Promotion with New Jeshwang Women Kafo at jeshwang.I think it worth supporting.	1	2016-01-19 16:41:35	2016-01-20 12:17:16
364	2016-01-13	Parish Diocese Commercial Dance	St Therese	Fr Farell Memorial Hall	Mrs Therese Nancy Carrous-President	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	St Therese's Parish Diocese Of Banjul are well known in the Gambia,especially in chrtistinity religion.This is the fisrt patrnership.It's worth supporting.	1	2016-01-20 09:15:55	2016-02-05 11:42:50
365	2016-01-07	E-Nyassi Free Show	E-Nyassi Artist&Fans	Palma Rima Beach	Abubacarr Tarawally-Manager	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	E-Nyassi is a well known and popular artist R N B NDAGA in The Gambia,and has a big fans base in the music industry. He can be supported and this is our first partnership.	1	2016-01-20 10:32:32	2016-01-20 13:25:14
366	2016-01-13	Sanyang Festival 2016	Sanyang&Community	Sanyang	Secretary General	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Sanyang&Community will be organizing Festival is a very big event and have been successful past years.This will be the first partneship.It worth supporting.	1	2016-01-21 15:33:48	2016-01-21 15:33:48
373	2016-01-11	4th Edition Food&Beverage Festival 2016	Gambia Tourist Board(GTB)	Green Mamba Gardens/Jakarlo Bar &Restaurant	Adama Njie/Director	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Gambia Tourist Board(GTB) food&Beverage Festival is a very big event and have been successful past years.We have been in partneship before.It worth supporting.	1	2016-01-28 13:30:05	2016-01-28 13:30:05
374	2016-01-21	YOMEF Valentines Day Celebration	Youth Moral Education Foundation International(YOMEF) 	Schools-GB&Upcountry	Augustine Onyinye Ugbana	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Youth Moral Education Foundation International(YOMEF) will be celebrating valentive day to true love and to correct its negative social misconception mostly propagated by media.Its worth supporting.	1	2016-01-28 15:29:53	2016-02-01 12:08:54
375	2016-01-13	Royal Messenjah Debut Album 2016	Royal Messenjah Sargal Yaye Foundation	Alliance Francaise	Royal Messenjah Artist	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Royal Messenger Sargal Yaye Foundation is a well known Gambian artist,he wants to launch his Debut album.Its worth supporting.	1	2016-02-01 16:52:26	2016-02-01 16:52:26
378	2016-01-28	Bike For Africa	Brussels Airline	Senegambia Beach	Kevin Constant	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Bike For Africa is organize by Brussels Airline.	1	2016-02-03 10:08:44	2016-02-03 10:08:44
377	2016-01-28	School Sports Lang Tombong Tamba	Lang Tombong Tamba	Schools	Lang Tombong Tamba	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	In support of sports	5	2016-02-03 09:57:18	2016-02-03 10:01:16
379	2016-01-29	Cancer walk 2016	First Lady Madam Zeinab Jammeh 	New National Assembly Building Banjul	Office of the First Lady	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	First Lady Madam Zeinab Jammeh is organizing a Cancer walk 2016 to raise awareness on cancer to general public.Its worth supporting.	5	2016-02-03 10:14:05	2016-02-03 10:14:05
380	2016-01-27	Valentine Couples Connect Afrinity Production	Afrinity Production	Joint Offiers Mess	Adams Afrinity Production	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Afrinity Production are organizing a Valentine day celebration.Its worth supporting.	1	2016-02-04 15:03:01	2016-02-04 15:03:01
381	2016-02-04	Jah Law Promotions Turbulence Concert	ah Law Promotions	Independence Stadium Bakau	Tina Jones CEO MBE Consulting Inc.	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Tina Jones CEO MBE Consulting Inc with a  organizing Black consciouseness tour with Turbulence jamican artist.Its worth supporting.	1	2016-02-04 15:59:26	2016-02-04 16:02:31
382	2016-02-08	Gamo Kerr Cherno Baba Village	Kerr Cherno Baba Village	Kerr Cherno Baba Village	Oustass Imam  Abdoulie Drammeh	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This annual Gamoo is organize by the Kalifa Alhagie Bun Omar Jallow and the entire Tarihatul Tijaniya family it is an event that gather the Muslim ummar	1	2016-02-08 15:36:50	2016-02-08 15:36:50
383	2016-02-09	OPES (GPA)Gala Dinner With Pap Diouf 	Gambia Ports Authority	Kairaba Beach Hotel	Ousman M.Jorbateh	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Gambia Ports Authority will be organizing music show with famous senegalese star Pap Diouf , Gala Dinner&Dance.Pap Diouf has a lots of fans in Gambia,its worth supporting.	1	2016-02-11 10:41:10	2016-02-11 11:07:13
384	2016-02-17	Gamo Dairatul Fith-Yanou Sidihin 	Dairatul Fith-Yanou Sidihin 	Sinchu Alhagie	Kebba J.Marong Account	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This annual Gamoo is organize by Dairatul Fith-Yanou Sidihin the  entire Tarihatul Tijaniya family it is an event that gather the Muslim ummah.Its Worth supporting.	5	2016-02-17 15:39:50	2016-02-17 15:39:50
385	2016-02-03	Vypa Skinny Boyfly)3rd Year Anniversary	Amadou Squad Vypa Fans 	Alliance Francaise	Amadou Secka-VYPA	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Amadou Secka A.K.A Vypa Skinny Boyfly)will be organizing 3rd Anniversary with fans.We have been in parthnership before its worth supporting.	1	2016-02-17 15:53:09	2016-02-17 15:53:09
386	2016-02-11	Tunko Sanneh fund raising show with Jaliba Kuyateh	Tunko Sanneh	Semega Janneh Hall	Tunko Sanneh	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Tunko Sanneh works for afri-radio and he is a very popular mandinka Dj Jamano Kachaa, Very Popular among the Manding community. its a show worth supporting.	1	2016-02-19 13:26:30	2016-03-12 16:09:32
387	2016-02-25	National Prayer Day	Gambia Christian Council	Independence Stadium Bakau	John Charles Njie	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	The Gambian Christian Council, will be organising a national day of Prayer at the independence stadium. I believe its a good event to sponsor because it covers the entire christian community.	1	2016-02-29 14:14:17	2016-02-29 14:14:17
388	2016-02-16	Farafenni Fiesta	Foresight Promotion	Farafenni Mini Stadium	Edi Jamanka	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This event is an annual event, this is the second year running. The first edition was a success.	1	2016-02-29 15:00:10	2016-02-29 15:00:10
389	2016-02-25	Launching of Sae2yi	New Era	Alliance Francaise	Marcel Ceesay (Mass 187)	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	New era is a very popular group among the youth of the country. The launching of sae2yi is expected to bring together music loving youths to the event. I believe its worth supporting.	1	2016-02-29 16:51:24	2016-02-29 18:59:24
390	2016-02-05	Tata Dingding Jobarteh Fund Raising Show	Voice of Gambian Talents	Sukuta Cinema Hall	Kumba Jallow	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Tatadingding is a household name when it comes to afro-manding songs in the Gambia. He has a strong following among the mandinka tribe. I believe its a show worth supporting	1	2016-02-29 17:54:08	2016-02-29 19:00:22
391	2016-03-07	Annual Gamo&Siyareh of Nema Nasir 2016	Nema Nasir Islamic Development Association	Nema Nasir Near Mosque	Mr Mbye Drammeh President	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	The Annual Gamo and Siyareh 2016,of Nema Nasir is an Islamic event,it has biggest turnout in The Gambia about 15,000 fifteen thousand people come to attend the gamo,from countires like,Senegal,Mauritania,Ghana,Niger,Sirealeone and Nigeria.We have been in partnership before,for the past 3 three years.The fear is there are other network that want to partner with them and take the attention of the gamo.Its worth supporting.	5	2016-03-09 09:37:20	2016-04-08 08:26:31
392	2016-03-10	World Consumer Rights Day 2016	GCCPC	Pipeline	Amadou Ceesay	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC\\r\\nAfricell to be the only GSM partner\\r\\nVenue to be branded by africell	The Gambia Competition and Consumer Protection Commission are celebrating world consumer rights day.  They are focusing on the abuse of Antibiotics.  I believe its worth supporting	1	2016-03-14 13:16:33	2016-03-14 13:16:33
393	2016-02-02	National Divine Mercy Celebrations	Catholic Diocese of Banjul 	Holy Family Church (Fajara)	Fr. John Mendy	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>	The Catholic Diocese of Banjul are celebrating the national divine mercy day.  This is an annual event and a day of prayer that has always been successful. I believe its worth supporting.	1	2016-03-14 13:36:31	2016-03-14 13:36:31
394	2016-02-10	Banjul Paddle	BCC	Banjul	Lamin	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Easter Monday is usually celebrated big in Banjul. The turn out is usually great. I believe its worth supporting.	1	2016-03-14 13:54:24	2016-03-14 13:54:24
395	2016-02-26	Dramatiized Passion 	Diocese of Banjul	St. Therese's Lower Basic School	Fr. Peter Lopez	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is an annual event organised by the catholic community in the Gambia. The Turn out is usually great and well attended.	1	2016-03-14 14:04:58	2016-03-14 14:04:58
396	2016-03-08	Old Jeswang Primary School Fund Raising	Wax Media	Old Jeswang Primary School	Pa Abdou Waggeh	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This is a great initiative put up by wax media to support Old Jeswang Lower Basic School. I believe its a worthy cause and its worth supporting.	1	2016-03-14 14:43:40	2016-03-14 14:43:40
397	2016-02-11	Fund raising Show Jokere Endam 	Jokere Endam Fula Development Association	Galloya Village	Lamin Jallow PRO	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Jokere Endam Fula Development Association is a big fula association with three 3 villages,makumba ya,Galloya and Kunkujang Gattaya.Its worth supporting.	1	2016-03-15 10:35:27	2016-03-15 10:37:46
398	2016-03-15	BIG Street Battle	Krystal Klear Entertainment	Banjul	Lati Forster	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Krystal Klear are organising a street to street dancing competition.  this event is bound to bring together from all over urban Gambia. The event is expected to be successful, I believe its worth supporting.	1	2016-03-16 17:48:52	2016-03-16 17:48:52
399	2016-03-15	Easter Special	DJ Ken	Joint Officer's Mess	DJ Ken	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	DJ Ken is a very popular Afro-Beats DJ on Afri-Radio.... He is organising an Easter show. I believe its worth supporting.	1	2016-03-21 13:33:37	2016-03-21 13:33:37
400	2016-03-21	Roots Home Coming Festival	Ministry of Tourism	Nationwide 	Hon. Benjamin A. Roberts	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	We have always partnered with the organisers of The Roots International Festival.  This is a national festival and it gets a lot of coverage. I believe its worth supporting.	1	2016-03-21 14:34:31	2016-03-21 14:34:31
401	2016-03-01	Stratford College Student Week	Stratford College of Management	Ndow's Hall Kanifing Estate	Hagie Drammeh	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	The Straford College will be having a week long student week ending with a graduation ceremony on Saturday. I believe its worth supporting.	1	2016-03-23 15:45:44	2016-03-23 15:45:44
402	2016-03-01	Man of the year concert	Jizzle & Artenola	Alliance Francaise	Jizzle	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Jizzle and Artenola are are two young talented artists.  They have a large following and are well loved by both young and old. I believe its worth supporting	1	2016-04-01 16:10:45	2016-04-01 16:10:45
403	2016-04-01	Humanity Starz Album Launching	Humanity Starz	Kairaba Beach Hotel	Mbye Bittaye	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Humanity Starz are one of the best bands in The Gambia. Africell have sponsored the recording of their album "After Taste".  They are about to launch the album and requested help.  I believe its worth supporting	1	2016-04-01 16:16:54	2016-04-01 16:16:54
404	2016-03-23	Apachaki Free Show	Nyancho Kunda	Bakau	Amie Manneh Nyang	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Nyancho is one of the best Afro-Manding artists in The Gambia.  He is a very good entertainer and is well loved. I believe its worth supporting.	1	2016-04-01 16:22:57	2016-04-01 16:22:57
405	2016-03-15	Wah Sa Halat Music Awards	World Vibe Entertainment	Djembe Hotel	Ya Sally Njie Colley	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Wah Sah Halat is one of the most successful Radio Shows in The Gambia.  Its a show that covers Gambian Music and entertainment.  They are coming up with a music Awards and I believe its worth supporting	1	2016-04-04 15:05:47	2016-04-04 15:05:47
406	2016-03-15	Run For Malaria	YATES	SK Hospital	Papa Njie	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This run is organised by YATES and it's for the fight against Malaria. I believe its for a worthy cause and its worth supporting	1	2016-04-04 15:26:30	2016-04-04 15:26:30
407	2016-03-31	Mysterious Wedding Planner Movie Launch	Princess Promotion	Pencha mi Hall	Princess Shyngle	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Princess Shyngle is a famous Gambia Actress.  She is making waves Nigeria and Ghana. She is premiering her movie in The Gambia and I believe its going to be a success based on the followership on social media. I believe its worth supporting.	1	2016-04-12 11:33:33	2016-04-12 11:33:33
408	2016-04-01	FAMOUS Concert	Keneke's Promotion	Galaxy Entertainment Park	Keneke Komba	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Keneke from over the years has been the biggest promoter of Sierra Leonean Music in The Gambia.  He has promoted a lot of artists from sierra leone and brought them to The Gambia. In celebration of their independence, they are bringing in an artist from Sierra Leone to celebrate. I believe its worth supporting.	1	2016-04-12 11:50:01	2016-04-12 11:50:01
438	2016-05-02	Magal Basse Korba Kunda	Serigne Ebrima Nyingne Nurulai	Basse	Modou Kara Gaye Afri radio	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Serigne Ebrima Nyingne Nurulai will be organizing an annual magal in Basse korba kunda with mourids community in Basse.Its worth supporting.	5	2016-05-13 12:39:17	2016-05-13 12:39:17
409	2016-04-08	SANRA Fund Raising Gala & Dance	SANDRA	Paradise Suites Hotel	Bai Bittaye	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	We have partnered with Staff Association of The National Roads Authority before and it has been a fruitful relationship.  They are putting together a fundraising show and have written to Africell for sponsorship. I believe their show is worth supporting.	1	2016-04-12 12:07:03	2016-04-25 11:59:24
410	2016-03-29	A2's Concert	A2 the Fulani King	Lamin Willys	Gibriel Janko	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	A2 is a very popular Dancellhall Artist and he is both loved by young and old. He sings in Fula and English. He was recently on Afri-radio during the easter promotion and had a lot of good reviews	1	2016-04-12 12:16:47	2016-04-12 12:16:47
411	2016-03-21	Gamo Touba Njassan	Touba Njassan	Cassamance	Mammy Njie	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Mammy Njie works at afri-radio and every year they organise a Gamo in celebration of the birth of the prophet Muhammad SWT.	1	2016-04-12 12:20:17	2016-04-12 12:20:17
412	2016-03-19	Hip Hop The Monthly Concert	Smart Move Entertainment	West Field	Sanna Kanteh	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This group Have been doing this show for a while now and they always use africell billboards as a back drop. they have written to us for assistance and I believe its worth supporting.	1	2016-04-12 13:32:43	2016-04-12 13:32:43
413	2016-04-18	National Children's Day of Broadcasting	GRTS	GRTS	Fatou Sanneh	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	This day was celebrated internationally in the past.  GRTS has decided to continue the celebrations nationally. On this day Children take over the airwaves. I believe its worth supporting.	1	2016-04-27 11:44:13	2016-04-27 11:44:13
414	2016-04-12	East to West Coast Marathon Run	Peace Corps	Nationwide 	Paige	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	We have partnered with the peace corps on a lot of their community base events.  I believe this nationwide marathon in support of Youth empowerment and education is worth supporting	1	2016-04-29 10:16:16	2016-04-29 10:16:16
415	2016-04-20	Jamba Sangsang Fan Base Launching	Baddibunka	Alliance Francaise	Annette A Camara	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Baddibunka is a household name in The Gambia Music Scene.  He is one of the best Afro-Manding Artist in the country.  He is launching his fan base and I believe its worth supporting.	1	2016-05-03 10:24:35	2016-05-03 10:24:35
416	2016-04-27	May Day Sports 2016	National Sports Council	Independence Stadium Bakau	Musa Sise	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	May Day Sports is organized every year by National Sports Council.Different companies participate on this event.Turnout is good its worth supporting.	1	2016-05-04 10:34:23	2016-05-04 10:34:23
417	2016-04-25	Yaws Creations African Print Party	Yaws Creations	The Palace Night Club Senegambia	Awa Conateh	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Yaws Creations will be organizing African Print Party for the upcoming roots homecoming festival.We have been in partnership before.Its worth supporting.	1	2016-05-04 10:53:10	2016-05-04 10:53:10
418	2016-04-21	Nasiru Promotions Wrestling Competition	Nasiru Promotions 	Sk West Mini Stadium	Ebrima Drammeh	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Nasiru Promotions will be organizing a Wrestling Competition with Gambian wrestlers,famous Amma Baldeh from senegal will attend the event as invited guest.We have been in partnership before.Its worth supporting.	5	2016-05-04 12:48:48	2016-05-18 15:39:44
419	2016-04-21	MS-PROMOTION GSN-Music Awards 2016	MS-PROMOTION	Alliance Francaise	Muhammed Saho-Afri Radio Staff	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Muhammed Saho-Afri Radio Staff and CEO MS-PROMOTION will be organizing an Musical award show with sarahule artists in Gambia.We have been in partnership before.Its Worth supporting.	1	2016-05-04 12:56:36	2016-05-04 12:56:36
420	2016-03-16	7th FIILAVERSARY 2016	Black Lynx Management	Willy's &Brikama Mini Stadium	Abdou K Waagan Faye	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Fiila Tv Show has been a successful event for past years.We have been in partnership before.I believe it is worth supporting	1	2016-05-05 09:35:49	2016-05-05 09:35:49
422	2016-04-26	Gunjur Cultural Festival 2016	Gunjur Community	Gunjur Village 	Buba Bojang	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials'<br/> Africell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Gunjur Cultural Festival is an annual event and attracts lot of peoples in Gunjur and surrounding villages.Its is cultural,traditional,festival.Its worth supporting	1	2016-05-05 10:14:03	2016-05-05 10:14:03
423	2016-04-18	Gunjur Cultural Festival 2016	Gunjur Community	Gunjur Village 	Buba Bojang Secretary General	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Gunjur Cultural Festival is an annual event and attracts lot peoples in Gunjur and surrounding villages.Its is cultural,traditional,festival.Its worth supporti	1	2016-05-05 10:18:09	2016-05-18 10:04:58
424	2016-04-25	Anglican Diocese Of The Gambia Mothers Union	Anglican Diocese-Mothers Union	Ndows Hall Kanifing Estate	mrs mary o'riley	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Anglican Diocese Of The Gambia Mothers Union will be organizing a  gala dinner&dance to raise funds for mother's union pre-school.Its worth supporting.	1	2016-05-06 09:41:27	2016-05-06 09:41:27
437	2016-04-30	Brixton Carnival 2016	Mustic Promotion	Brikama Jokor	Sulayman Badjie	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Mustic Promotion will be organizing Brixton Carnival 2016.This is the 2nd Edition held in Brikama and is a highly populated town.They approached us last year,but we could not sponsor due to lot of engagement.I think it worth supporting.	1	2016-05-13 09:58:51	2016-05-13 09:58:51
426	2016-05-03	Kerr Gi Family CLASSIC GESTU DAEMBA	Ker gi Family Artist	Alliance Francaise	Manager-Kerr Gi Family	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	These young family group formed by young talented Gambian musicians.We have been in parthnership before, its worth supporting.	1	2016-05-06 10:07:35	2016-05-09 16:49:41
427	2016-04-18	Alkaline Concert In Gambia 2016	DJ FAAL	Independence Stadium Bakau	Gibril Faal	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Gibril Faal is a well kwown DJ in the music industry in The Gambia and beyound.We have been in parthnership before, its worth supporting.	1	2016-05-06 10:51:54	2016-05-06 11:34:26
428	2016-04-11	Bob Marley Reggae Roots Festival	Rave About Africa 	Sand Beach Holiday Resort Kotu	Velma Wright Moven	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Rave About Africa will be organizing a Bob Marley Reggae Roots Festival at Sand Beach Holiday Resort Kotu.	1	2016-05-06 11:59:00	2016-05-06 11:59:00
435	2016-05-09	Brain Krackers 3RD Year Anniversary	Brain Krackers&Joluv Arts	Jakarlo Center Stage	Bai Babou	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Bai Babou AKA Brain Kracker is one of the most popular Young artist in The Gambia. He has a lot of following and is well loved. I believe it will be a successful event	1	2016-05-10 12:18:26	2016-05-10 12:18:26
430	2016-05-03	St Peter's Graduation Ceremony 	St Peter's School	St Peter's School Ground	Vice Principal-Mr Francis M.Gomez	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	St Peter's School will be organizing a Graduation,speech and prize giving Ceremony.We have been in partnership before during school sim promotion.Its worth supporting	1	2016-05-10 11:38:52	2016-05-10 11:38:52
431	2016-05-03	Tobacco Road Carnival 	Tobacco Road Youth&Community	Banjul 	Alhagie Sillah	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Tobacco Road Youth and community will be organizing a road Carnival in Banjul capital city,highly populated area.I think its worth supporting.	1	2016-05-10 11:45:22	2016-05-10 11:45:22
432	2016-04-25	Mustik Concert 2016	Mustik Artist	Pipeline	Mustapha Loum	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Mustik Artist will be organizing a concert at pipeline.We have been in partnership before.I think its worth supporting.	1	2016-05-10 11:53:19	2016-05-10 11:53:19
442	2016-05-26	MRCG Annual AGM	Medical Research Council (MRC)	MRC Complex Fajara	Abdoulie Cham-Chairperson 	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Medical Research Council The Gambia (MRCG)will be organizing 10th edition annual general meeting(AGM).Its worth supporting.	5	2016-05-26 10:48:34	2016-05-26 10:48:34
434	2016-05-06	FAWEGAM Gala Dinner	FAWEGAM	Djembe Beach Resort 	Mrs Yadicon Njie Eribo	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	FAWEGAM WEEK will be organizing a gala dinner to empower women and girls education in The Gambia.We have been in partnership before.Its Worth supporting.	5	2016-05-10 12:08:59	2016-05-10 12:21:34
436	2016-04-26	Daddy Bostin Concert	Daddy Boston Entertainment	Latrikunda German Garage	Sulayman Jammeh A.K.A.Daddy Boston	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Daddy Boston is a Gambian artist well known in music industry.We have been in partnership before.Its Worth Supporting.	1	2016-05-10 12:25:49	2016-05-10 12:25:49
439	2016-05-02	Magal Ahlul Hitma Darrai 	Magal Ahlul Hitma Darrai Serigne Omar	Ebo town	Modou Kara Gaye Afri radio	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Ahlul Hitma Darrai Serigne Omar will be organizing an annual Magal wtih mourids community in Ebotown.Its worth supporting.	5	2016-05-13 12:43:28	2016-05-13 12:43:28
440	2015-11-02	Jammeh Foundation for Peace Gala Dinner	JFP	Kairaba Beach Hotel	Giri Njie	Publicity	Goodwill	1	2016-05-18 15:59:36	2016-05-18 15:59:36
441	2015-04-29	GCCI Awards	GCCi	Ocean Bay Hotel	Sarata	Publicity	Partners	1	2016-05-18 16:20:23	2016-05-18 16:20:23
443	2016-06-01	GCCI Award Dinner 	GCCI	Djembe Beach Resort 	GCCI	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	GCCI Award Dinner	1	2016-05-30 10:07:26	2016-05-30 10:09:48
444	2016-06-16	Gee The Come Back	Gee &Team Gee	Pencha Mi Hall	Gee Artist	Africell to be mentioned in all adverts\\r\\nAfricell's logo to be placed on all printed materials\\r\\nAfricell to mentioned during the program by the MC\\r\\nAfricell to be the only GSM partner\\r\\nVenue to be branded by africell\\r\\nVIP tickets to be provided for Africell Staff	Gee will organizing a music show called The Come Back,after been away for few years.He have lot of fan base in Gambia and beyound.We have been in patrnership before.Is worth supporting.	1	2016-06-20 11:22:43	2016-06-20 11:22:43
445	2016-06-14	World Drug Day 2016	Drug Law Enforcement Agency The Gambia	Sibanor foni Bintang	Sheriff Sanyang	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Drug Law Enforcement Agency The Gambia will be commemorating world drug day in westcoast region.Its worth supporting.	5	2016-06-22 13:33:55	2016-06-22 13:33:55
448	2016-07-11	Launching G-Tech Mega Football Hunt 2016	G-Tech Football Academy	SK,BJL,Barra,Brikama and Bansang	Enakeno Arausi Managing Director	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	G-Tech Mega Football will be organizng a major football Hunt 2016,in five major districts in The Gambia,Serekunda,Banjul,Bansang,Brikama and Barra.This will be the first partnership.I think its woth supporting.	5	2016-07-11 12:41:55	2016-07-11 12:41:55
447	2016-07-20	Kartong Slow Food Luncheon Sale	SANDELE FOUNDATION	Eco Retreat Learning center	Gilbert Jassey	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	SANDELE FOUNDATION will be organizing a Slow Food Luncheon Sale to encourage local chefs and women for the future.I think its worth supporting.	1	2016-07-05 11:37:14	2016-07-05 11:53:20
449	2016-06-01	Billboards 22nd Anniversary July 22nd Clebration 2016	Office Of The President	Nationwide	Mrs Rohie Bittaye Darboe-Secretary General	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Africell will be fixing 22 Billboards for 22nd Anniversary July 22nd Clebration 2016.We have been in partnership before.	1	2016-07-18 12:37:41	2016-07-18 12:38:51
450	2016-07-18	Operation Save The Children	Jammeh Foundation	Nationwide	Office of the First Lady	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Operation Save The Children foundation are organizing a campaign against child marriage, by Office of the First Lady.	5	2016-07-18 12:42:24	2016-07-18 12:42:24
451	2016-07-12	Bus Branding GRTS Tour 22nd Anniversary 2016	GRTS TV	Nationwide tour	Alhagie Abubakar Darboe GRTS	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Bus Branding GRTS, 22nd Anniversary 2016.We have been in partnership before.	5	2016-07-18 12:45:43	2016-07-19 08:59:20
452	2016-07-11	MDI Student' Union Tour-Senegal 	MDI Student' Union	Senegal 	Tom Bundu Seceretary General 	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	MDI Student' Union Tour will be organizing a sutdy  tour from Gambia to republic of Senegal to interact and network with peers in institutions with in sub regions.Its worth supporting.	5	2016-07-19 10:56:22	2016-07-19 10:56:22
453	2016-07-19	Gospel Business Men Fellowship	Gospel Business Men	Pencha Mi Hall	Femi Olayanju	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Gospel Business Men Fellowship international will be organizing a  program with over 600 delegates from Nigeria,Ghana including Gambia.Its worth supporting.	5	2016-07-20 10:54:22	2016-07-20 10:54:22
454	2016-06-27	Ebujan Theatre Troupe 2016	Artistic Director Ebujan Theatre Troupe	Ebujan Theatre Opposite GFF House-Kanifing	Christopher Tijan Smith	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Artistic Director Ebujan Theatre Troupe will be organizing a production of play with the theme''Breaking the Culture of Silence''.Its worth supporting.	1	2016-07-20 11:02:36	2016-07-20 11:02:36
455	2016-07-14	GIEPA Launching Of New Country Brand For Gambia	GIEPA 	Nationwide	Sadibou Jammeh GIEPA 	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	GIEPA will be Launching New Country Brand For Gambia during the 22nd July Anniversary 2016.We have been in partnership before.Its Worth supporting	5	2016-07-20 11:22:26	2016-07-21 15:14:40
456	2016-07-19	July 22nd Marathon competition 	Ministry of Defence	Banjul 	Yaya Drammeh -for Chief OF Defence	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Ministry of Defence will be organizing a July 22nd Marathon competition.We have been in partnership before its worth supporting.	5	2016-07-21 15:10:56	2016-07-21 15:10:56
457	2016-07-20	CET Movie Premier&Launhing	Correct Entertainment Troupe CET	Pencha Mi Hall	Laten Boye	Africell to be mentioned in all adverts<br/>\\r\\nAfricell's logo to be placed on all printed materials<br/>\\r\\nAfricell to mentioned during the program by the MC<br/>\\r\\nAfricell to be the only GSM partner<br/>\\r\\nVenue to be branded by africell<br/>\\r\\nVIP tickets to be provided for Africell Staff	Correct Entertainment Troupe CET will be doing a movie Movie Premier&Launhing title ''RED CARD''.I think its worth supporting.	1	2016-07-25 14:24:46	2016-07-25 14:24:46
1	2017-03-21	test	test	test test	test	Africell to be mentioned in all adverts\r\nAfricell's logo to be placed on all printed materials\r\nAfricell to mentioned during the program by the MC\r\nAfricell to be the only GSM partner\r\nVenue to be branded by africell\r\nVIP tickets to be provided for Africell Staff	test\r\ntest	1	2017-03-21 21:08:03.998353	2017-03-21 21:08:03.998353
7	2014-02-20	A.C.E The Tour	Killa Ace	Manjie, Wellingara, Banjul, Lamin, Tallinding, Basse, Bakau, Alliance, Barra & Fajikunda	Killa Ace	Africell to be mentioned in all adverts\r\nAfricell's logo to be placed on all printed materials\r\nAfricell to mentioned during the program by the MC\r\nAfricell to be the only GSM partner\r\nVenue to be branded by africell\r\nVIP tickets to be provided for Africell Staff	Killa Ace is one of Gambia's best Hip Hop artist\r\nHe successfully launched his in 2013 and now his is on a promotional tour for the album\r\nWe have worked on several occasions and its an event worth supporting	1	2014-03-18 13:15:46	2017-03-21 21:14:54.293536
\.


--
-- TOC entry 2264 (class 0 OID 0)
-- Dependencies: 196
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('events_id_seq', 2, true);


--
-- TOC entry 2235 (class 0 OID 16460)
-- Dependencies: 199
-- Data for Name: item_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY item_types (id, item_type_name, created_at, updated_at, description, has_dimensions) FROM stdin;
1	Radio Advert	2016-03-20 00:00:00	2016-03-20 00:00:00	\N	f
2	Newspaper Advert	2016-03-20 00:00:00	2016-03-20 00:00:00	\N	f
3	TV Advert	2016-03-20 00:00:00	2016-03-20 00:00:00	\N	f
4	Billboards/Banners	2016-03-20 00:00:00	2016-03-20 00:00:00	\N	t
5	SMS Broadcast	2016-03-20 00:00:00	2016-03-20 00:00:00	\N	f
6	Credit/SIMs	2016-03-20 00:00:00	2016-03-20 00:00:00	\N	f
7	Equipment	2016-03-20 00:00:00	2016-03-20 00:00:00	\N	f
9	T-Shirts	2014-02-16 15:02:38	2015-10-02 14:23:14	\N	f
10	Promotional Material	2014-03-18 15:25:35	2014-03-18 15:25:35	\N	f
11	Cash	2014-04-24 14:10:14	2014-04-24 14:10:14	\N	f
12	Road Show	2014-05-14 12:50:05	2014-05-14 12:50:05	\N	f
13	Talk Show	2014-05-14 13:07:37	2014-05-14 13:07:37	\N	f
14	Out Door Branding	2014-08-13 17:32:25	2014-08-13 17:32:25	\N	f
\.


--
-- TOC entry 2265 (class 0 OID 0)
-- Dependencies: 198
-- Name: item_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('item_types_id_seq', 1, false);


--
-- TOC entry 2237 (class 0 OID 16469)
-- Dependencies: 201
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY items (id, item_name, cost1_per_unit, cost2_per_unit, cost3_per_unit, item_type_id, width, height, created_at, updated_at) FROM stdin;
1	West Coast	75.00	0.00	0.00	1	1	1	2016-03-20 00:00:00	2014-03-13 13:37:00
2	Unique FM	75.00	0.00	0.00	1	1	1	2016-03-20 00:00:00	2016-03-20 00:00:00
3	Vibes FM	75.00	0.00	0.00	1	1	1	2016-03-20 00:00:00	2016-03-20 00:00:00
4	Afri-Radio	75.00	0.00	0.00	1	1	1	2016-03-20 00:00:00	2016-03-20 00:00:00
5	News Paper	3750.00	0.00	0.00	2	1	1	2016-03-20 00:00:00	2014-05-07 18:29:19
6	GRTS	1416.00	0.00	0.00	3	1	1	2016-03-20 00:00:00	2016-03-20 00:00:00
7	Billboard 6x2.9	500.00	0.00	0.00	4	6	2.9000001	2016-03-20 00:00:00	2014-03-18 13:26:27
8	Banner 3x2	500.00	0.00	0.00	4	3	2	2016-03-20 00:00:00	2014-03-15 22:22:33
9	SMS: pre+postpaid	0.55	0.00	0.00	5	1	1	2016-03-20 00:00:00	2014-05-08 12:12:50
10	Credit	1.00	0.00	0.00	6	1	1	2016-03-20 00:00:00	2016-03-20 00:00:00
11	SIM Card	10.00	0.00	0.00	6	1	1	2016-03-20 00:00:00	2016-03-20 00:00:00
12	P.A System	20000.00	0.00	0.00	7	1	1	2016-03-20 00:00:00	2016-03-20 00:00:00
13	A5 Stickers 0.15x0.21	500.00	0.00	0.00	4	0.150000006	0.209999993	2014-02-16 14:50:50	2014-03-28 13:08:26
14	T-Shirt	125.00	0.00	0.00	9	1	1	2014-02-16 15:03:11	2014-02-16 15:03:11
22	A4 Sticker 0.30x0.21	500.00	0.00	0.00	4	0.300000012	0.209999993	2014-03-28 13:11:47	2014-03-28 13:11:47
16	Banner 3x1	500.00	0.00	0.00	4	3	1	2014-03-14 14:05:01	2014-03-15 10:30:45
30	Bridge & Lights	20000.00	0.00	0.00	7	1	1	2014-05-07 13:33:59	2014-05-07 13:33:59
18	Billboard 4x3	500.00	0.00	0.00	4	4	3	2014-03-18 11:57:43	2014-03-18 11:57:43
19	Umbrella	320.00	0.00	0.00	10	1	1	2014-03-18 15:26:26	2014-03-18 15:26:26
20	Football	200.00	0.00	0.00	10	1	1	2014-03-18 15:27:23	2014-03-18 15:27:23
21	AF1 Mobile Phone	250.00	0.00	0.00	10	1	1	2014-03-18 15:30:49	2014-03-18 15:30:59
23	Sticker 0.15x0.3	500.00	0.00	0.00	4	0.150000006	0.300000012	2014-03-28 13:12:52	2014-03-28 13:12:52
24	A2 Sticker 0.60x0.42	500.00	0.00	0.00	4	0.600000024	0.419999987	2014-03-28 13:14:04	2014-03-28 13:14:04
25	Stage	10000.00	0.00	0.00	7	1	1	2014-04-01 15:40:56	2014-04-01 15:40:56
26	Billboard 8x5	500.00	0.00	0.00	4	8	5	2014-04-14 11:19:41	2014-04-14 11:19:41
27	Billboard 2.4x1.2	500.00	0.00	0.00	4	2.4000001	1.20000005	2014-04-14 11:34:24	2014-04-14 11:34:24
28	42" TV Screen	5000.00	0.00	0.00	7	1	1	2014-04-24 18:07:20	2014-04-24 18:07:20
29	Cash	1.00	0.00	0.00	11	1	1	2014-04-25 15:55:37	2014-04-25 15:55:51
31	Lights	10000.00	0.00	0.00	7	1	1	2014-05-07 13:34:21	2014-05-07 13:34:21
32	Brikama FMB	75.00	0.00	0.00	1	1	1	2014-05-13 15:10:37	2014-05-13 15:10:37
33	Banner 10x3	500.00	0.00	0.00	4	10	3	2014-05-13 18:30:02	2014-05-13 18:30:02
34	Road Show	5000.00	0.00	0.00	12	1	1	2014-05-14 12:50:34	2014-05-14 12:50:34
35	30mins Talk Show	1437.50	0.00	0.00	13	1	1	2014-05-14 13:08:37	2014-05-14 13:08:37
36	1hr Talk Show	2875.00	0.00	0.00	13	1	1	2014-05-14 13:09:06	2014-05-14 13:09:15
37	Bill Board Fixing	3000.00	0.00	0.00	14	1	1	2014-08-13 17:32:58	2014-08-13 17:32:58
38	Billboard 6x4	500.00	0.00	0.00	4	6	4	2014-09-08 18:27:21	2014-09-08 18:29:32
39	Banner 4x1.5	500.00	0.00	0.00	4	4	1.5	2014-09-08 18:28:57	2014-09-08 18:28:57
40	Sky Light	10000.00	0.00	0.00	7	1	1	2015-01-27 12:34:40	2015-01-27 12:34:40
41	Banner 6x3	500.00	0.00	0.00	4	6	3	2015-01-27 12:47:41	2015-01-27 12:47:41
42	Tent	1500.00	0.00	0.00	7	1	1	2015-04-08 11:17:31	2015-04-08 11:17:31
43	A3 Sticker	500.00	0.00	0.00	4	0.400000006	0.300000012	2015-05-06 15:59:59	2015-05-06 15:59:59
44	Afri-Touch Mobile Phone	2475.00	0.00	0.00	10	1	1	2015-07-20 14:30:08	2015-07-20 14:30:08
45	Itel it2100	400.00	0.00	0.00	10	1	1	2016-05-04 11:51:13	2016-05-04 11:51:13
\.


--
-- TOC entry 2266 (class 0 OID 0)
-- Dependencies: 200
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('items_id_seq', 1, false);


--
-- TOC entry 2221 (class 0 OID 16395)
-- Dependencies: 185
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY schema_migrations (version) FROM stdin;
1
\.


--
-- TOC entry 2239 (class 0 OID 16479)
-- Dependencies: 203
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY user_roles (id, name, created_at, updated_at) FROM stdin;
1	admin	2016-04-26 23:12:06	\N
2	user	2016-04-27 23:11:44	\N
\.


--
-- TOC entry 2267 (class 0 OID 0)
-- Dependencies: 202
-- Name: user_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_roles_id_seq', 1, false);


--
-- TOC entry 2241 (class 0 OID 16487)
-- Dependencies: 205
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY users (id, user_role_id, name, email, password_digest, remember_token, created_at, updated_at) FROM stdin;
2	2	user user	uuser@africell.gm	$2a$10$M5Y1SVkzVS6vwFed0K7nBO05pbwdCJkkg8e0l6f8678vKaYos6Pzi	3fb57c9316f5f8d0fa06a473affa5185208ec7a5	2016-04-27 21:13:58	2016-04-29 14:27:23
3	2	test test	test@africell.gm	$2a$10$V7cYvj2b2tOxZn.VIqdEMu6TE4Q39fSOs0yILcMEj2Z1I8/kKWkbu	00470f13e53677b66efc283c5c3d26180dfd92e7	2016-04-28 01:12:41	2016-04-28 01:50:34
1	1	Charles Jarju	cjarju@africell.gm	$2a$10$mg82rSYvCbgqyGYcSeObSuYwrOMynQho2ggeO30wFqUh1fBLz9WgO	0e5eab99ebbf07bd0d1298539c5adb2318a625a7	2016-04-27 03:03:03	2017-03-27 20:25:12.900394
\.


--
-- TOC entry 2268 (class 0 OID 0)
-- Dependencies: 204
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- TOC entry 2081 (class 2606 OID 16409)
-- Name: event_dates event_dates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY event_dates
    ADD CONSTRAINT event_dates_pkey PRIMARY KEY (id);


--
-- TOC entry 2084 (class 2606 OID 16418)
-- Name: event_info_types event_info_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY event_info_types
    ADD CONSTRAINT event_info_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2086 (class 2606 OID 16426)
-- Name: event_item_types event_item_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY event_item_types
    ADD CONSTRAINT event_item_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2088 (class 2606 OID 16438)
-- Name: event_items event_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY event_items
    ADD CONSTRAINT event_items_pkey PRIMARY KEY (id);


--
-- TOC entry 2090 (class 2606 OID 16446)
-- Name: event_types event_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY event_types
    ADD CONSTRAINT event_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2092 (class 2606 OID 16457)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- TOC entry 2094 (class 2606 OID 16466)
-- Name: item_types item_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY item_types
    ADD CONSTRAINT item_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2096 (class 2606 OID 16476)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- TOC entry 2098 (class 2606 OID 16484)
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2103 (class 2606 OID 16495)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2082 (class 1259 OID 16410)
-- Name: index_event_dates_on_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_event_dates_on_event_id ON event_dates USING btree (event_id);


--
-- TOC entry 2099 (class 1259 OID 16496)
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_email ON users USING btree (email);


--
-- TOC entry 2100 (class 1259 OID 16497)
-- Name: index_users_on_remember_token; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_remember_token ON users USING btree (remember_token);


--
-- TOC entry 2101 (class 1259 OID 16498)
-- Name: index_users_on_user_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_user_role_id ON users USING btree (user_role_id);


--
-- TOC entry 2079 (class 1259 OID 16401)
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


-- Completed on 2017-04-10 18:07:40

--
-- PostgreSQL database dump complete
--

