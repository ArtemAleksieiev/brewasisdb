--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: clientsdb; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clientsdb (
    client_id integer NOT NULL,
    buyer_name text NOT NULL,
    bill_street text NOT NULL,
    bill_city text NOT NULL,
    buyer_licenses text NOT NULL
);


--
-- Name: clientsdb_client_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.clientsdb_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: clientsdb_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.clientsdb_client_id_seq OWNED BY public.clientsdb.client_id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id integer NOT NULL,
    price numeric(15,6),
    name text
);


--
-- Name: sales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sales (
    id integer,
    sale_date date DEFAULT ('now'::text)::date NOT NULL,
    count integer
);


--
-- Name: sales_mined; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sales_mined (
    buyer_name text,
    classification text,
    date_of_order timestamp without time zone,
    product_count integer,
    total numeric(15,3)
);


--
-- Name: clientsdb client_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clientsdb ALTER COLUMN client_id SET DEFAULT nextval('public.clientsdb_client_id_seq'::regclass);


--
-- Data for Name: clientsdb; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.clientsdb (client_id, buyer_name, bill_street, bill_city, buyer_licenses) FROM stdin;
1	Altitude Organic Cannabis	817 Little Beaver Trail	Dillon	402R-00394
2	Boulder Wellness REC	5420 Arapahoe Ave Unit F	Boulder	402R-00415
3	Bud Hut REC	973 U.S. Highway 85 87, Suite 100	Walsenburg	402R-00463
4	Buddy Boy 38th REC	4012 West 38th Avenue	Denver	402R-00386
5	Buddy Boy South Federal	2426 South Federal Boulevard	Denver	402R-00603
6	Buddy Boy Walnut REC	3814 Walnut Street	Denver	402R-00385
7	Canna Co	3019 Toupal Drive	Trinidad	402R-00371
8	Cannasseur REC	41 North Precision Drive	Pueblo West	402R-00196
9	Colorado Harvest Company Broadway REC	1568 S Broadway	Denver	402R-00078
10	Colorado Harvest Company Broadway REC	1568 South Broadway	Denver	402R-00078
11	Colorado Harvest Company Kalamath REC	1178 S Kalamath St.	Denver	402R-00077
12	Dank REC	3835 Elm Street, Suite C	Denver	402R-00004
13	Den-Rec	2117 Larimer Street	Denver	402R-00133
14	Doobie Sisters REC	695 N Broadway	Cortez	402R-00563
15	Durango Organics	1104 East Main Street	Cortez	402R-00388
16	Durango Organics REC	72 Suttle St. Unit F	Durango	402R-00243
17	Golden Leaf REC	1755 Lincoln Ave	Steamboat Springs	402R-00171
18	Golden Leaf REC	1755 Lincoln Avenue	Steamboat Springs	402R-00171
19	Green Dream Cannabis REC	6700 Lookout Road, Suite #5	Boulder	402R-00553
20	Green Tree Longmont REC	12626 North 107 Street	Longmont	402R-00535
21	Greenstop	130 Maine Street, Unit B	Log Lane Village	402R-00252
22	Greentree Medicinals Boulder REC	5565 Arapahoe Avenue	Boulder	402R-00536
23	Groundswell REC	3121 East Colfax Avenue	Denver	402R-00400
24	Groundswell REC	3121 E. Colfax	Denver	402R-00400
25	Growhouse Fraser REC	535 Zerex Street, Suite B-203	Fraser	402R-00366
26	Healing House	2383 S. Downing St.	Denver	402R-00041
27	Helping Hands REC	1021 Pearl Street, Suite C	Boulder	402R-00236
28	Helping Hands REC	1021 Pearl St. #b	Boulder	402R-00236
29	Herbal Alternatives REC	2568 South Broadway	Denver	402R-00148
30	Herbal Wellness REC	400 West South Boulder Road, Suite 2700	Lafayette	402R-00215
31	Herban Underground	70 Broadway, Suite 50	Denver	402R-00237
32	High Country Healing Vail REC	40928 Highway 6, Unit 2-C	Avon	402R-00405
33	High Level Health Colfax REC	2028 E. Colfax	Denver	402R-00082
34	High Level Health Lincoln REC	970 Lincoln St	Denver	402R-00083
35	Infinite Wellness Center REC	900 North College Avenue	Fort Collins	402R-00235
36	Kind Care of Colorado REC	6617 South College Avenue	Fort Collins	402R-00516
37	Kind Love	439 North Commercial Street	Trinidad	402R-00616
38	Lightshade 6th REC	745 East 6th Avenue	Denver	402R-00479
39	Lightshade Dayton	330 South Dayton	Denver	402R-00106
40	Lightshade Havana REC	503 Havana St	Aurora	402R-00293
41	Lightshade Holly REC	3950 Holly St.	Denver	402R-00073
42	Lightshade Iliff REC	16821 E. Iliff Ave	Aurora	402R-00579
43	Lightshade Peoria REC	11975 East 40th Avenue	Denver	402R-00163
44	Lightshade Peoria REC	11975 E 40th Ave.	Denver	402R-00163
45	Lightshade Sheridan REC	1126 S. Sheridan Blvd	Denver	402R-00360
46	LivWell Broadway REC	432 South Broadway	Denver	402R-00166
47	Livwell Cortez REC	1819 East Main St.	Cortez	402R-00355
48	Livwell Evans REC	1941 West Evans Avenue	Denver	402R-00168
49	Livwell Franklin REC	3980 Franklin Street	Denver	402R-00111
50	Livwell Garden City REC	2647 8th Avenue	Garden City	402R-00194
51	LivWell Larimer REC	2863 Larimer Street, Suite B	Denver	402R-00167
52	Livwell Mancos REC	449 Railroad Ave #1	Mancos	402R-00356
53	Livwell Pearl REC	1660 Pearl Street	Denver	402R-00112
54	LivWell Stapleton REC	3955 Oneida Street	Denver	402R-00454
55	Livwell Trinidad REC	124 Santa Fe Trail	Trinidad	402r-00352
56	Local Product of Colorado	419 West 13th Avenue	Denver	402R-00543
57	Lucy Sky Broadway REC	2390 - 2394 South Broadway	Denver	402R-00497
58	Lucy Sky Dispensary Wash Park REC	2215 East Mississippi Avenue	Denver	402R-00159
59	Magnolia Road Cannabis Co	413 North Commercial Street	Trinidad	402R-00569
60	Magnolia Road Inc	1750 30th Street, Unit 84	Boulder	402R-00327
61	Main Street Cannabis	401 West Main Street	Trinidad	402R-00523
62	Mighty Tree REC	2268 S Delaware St.	Denver	402R-00600
63	Mighty Tree REC	2268 South Delaware Street	Denver	402R-00600
64	Mindful Colfax REC	5926 E. Colfax	Denver	402R-00085
65	MMJ America Downtown REC	2042 Arapahoe St	Denver	402R-00019
66	Mountain Medicinals	2313 Colorado Blvd	Idaho Springs	402R-00161
67	Native Roots Adams REC	620 E 58th Ave	Denver	402R-00493
68	Native Roots Aspen REC	308 S Hunter St	Aspen	402R-00379
69	Native Roots Boulder REC	1146 Pearl Street	Boulder	402R-00173
70	Native Roots Dillon REC	850 Little Beaver Trail	Dillon	402R-00434
71	Native Roots Downtown REC	910 16th Street	Denver	402R-00027
72	Native Roots Edgewater REC	5610 W 20th Ave.	Edgewater	402R-00335
73	Native Roots Frisco REC	861 N Summit Blvd	Frisco	402R-00363
74	Native Roots Frisco REC	861 N Summit Blvd	Frisco	402R-00636
75	Native Roots Highlands REC	2209 W. 32nd Ave.	Denver	402R-00368
76	Native Roots Littleton REC	7870 W Quincy Ave	Denver	402R-00380
77	Native Roots Longmont REC	19 South Sunset St.	Longmont	402R-00416
78	Native Roots Santa Fe REC	2645 S Santa Fe Dr	Denver	402R-00484
79	Native Roots Trinidad REC	3140 Santa Fe Trail	Trinidad	402R-00617
80	Native Roots Vail REC	41290 Hwy 6	Avon	402R-00221
81	Nectar Bee - Green Solution	4410 North Washington St.	Denver	404-00003
82	Options	9085 W 44th	Wheatridge	402R-00184
83	Organic Alternatives REC	346 E. Mountain Ave.	Fort Collins	402R-00220
84	RiverRock North REC	4935 York Street	Denver	402R-00125
85	RiverRock South REC	990 West 6th Ave	Denver	402R-00126
86	Rocky Mountain Cannabis Gunnison	901 West New York Avenue	Gunnison	402r-00509
87	Sacred Seed REC	5885 E. Evans Ave.	Denver	402R-00037
88	Sante Alternative Wellness REC	742 1/2 Main Ave.	Durango	402R-00336
89	Seed & Smith	5070 Oakland Street	Denver	402R-00677
90	Silver Stem Colfax REC	8151 East Colfax Avenue	Denver	402R-00102
91	Silverton Green Works REC	124 e 13th Street Unit A	Silverton	402R-00264
92	Simply Pure REC	2000-2002 West 32nd Avenue	Denver	402R-00510
93	Smokey's 420 House	5740 South College Avenue, Unit C	Fort Collins	402R-00554
94	Smokey's 420 House REC	2515 7th ave	Garden City	402R-00169
95	SOMA Gunnison	500 West Highway 50, Unit 101	Gunnison	402R-00499
96	Starbuds Brighton REC	4690 Brighton Boulevard	Denver	402R-00021
97	Starbuds DU REC	1640 E Evans	Denver	402R-00022
98	Sticky Buds Broadway REC	2262 South Broadway	Denver	402R-00101
99	Sticky Buds Broadway REC	2262 S. Broadway	Denver	402R-00101
100	Sticky Buds Colfax REC	4615 East Colfax Avenue	Denver	402R-00238
101	Sticky Buds Colfax REC	4615 E Colfax Ave	Denver	402R-00238
102	Strawberry Fields Highway	2285 North Interstate 25	Pueblo	402R-00537
103	Strawberry Fields Pueblo City REC	4116 Nature Center Road	Pueblo	402R-00475
104	Sweet Leaf Pioneer	1286 Chambers #105	Eagle	402R-00211
105	Terrapin Care Station 33rd REC - Apogee Management	11900 E. 33rd Avenue	Aurora	402R-00334
106	Terrapin Care Station Broadway REC - Ares Strategies	1 Broadway, #A-150	Denver	402R-00142
107	Terrapin Care Station Folsom REC - Artemis Strategies	1795 Folsom St.	Boulder	402R-00175
108	Terrapin Care Station Mississippi REC - Apogee Management	11091 E. Mississippi Ave. #B	Aurora	402R-00269
109	The 404 Dispensary	404 N. Greenwood St.	Pueblo	402R-00682
110	The Bud Depot REC	138 Main Street	Lyons	402R-00358
111	The Clinic Colfax REC	4625 E. Colfax Ave	Denver	402R-00047
112	The Clinic Colorado REC	2020 S. Colorado Blvd.	Denver	402R-00079
113	The Clinic Highlands REC	3460 West 32nd Avenue	Denver	402R-00042
114	The Clinic Highlands REC	3460 W. 32nd Ave	Denver	402R-00042
115	The Doc's Apothecary	2100 E. 112th Ave	Northglenn	402R-00146
116	The Farmers Market REC	2070 S. Huron St.	Denver	402R-00409
117	The Farmers Market REC	2070 South Huron Street	Denver	402R-00409
118	The Giving Tree REC	2707 W. 38th. Ave.	Denver	402R-00113
119	The Green Joint	1030 Grand Avenue	Glenwood Springs	402R-00212
120	The Green Joint	315 East 1st Street	Parachute	402R-00518
121	The Greenery REC	208 Parker Avenue, Suite E	Durango	402R-00422
122	The Herbal Cure REC	985 South Logan Street	Denver	402R-00139
123	The Kind Room REC	1881 South Broadway	Denver	402R-00012
124	The Underground Station	439 North Commercial Street	Trinidad	402R-00616
125	Timberline Herbal Clinic and Wellness Center	3995 East 50th Avenue	Denver	402R-00087
126	Verde Natural Boulder	302 Pearl St.	Boulder	402R-00662
127	Verde Natural REC	5101 East Colfax	Denver	402R-00676
128	Verts LLC	1240 West Elizabeth Street	Fort Collins	402R-00545
129	Village Green Society REC	2043 16th st	Boulder	402R-00200
130	Wise Cannabis Company	21950 Highway 285	Fairplay	402R-00531
131	Igadi	72399 US Highway 40	Tabernash	402-00989
132	Boulder Wellness MED	5420 Arapahoe Avenue, Units E & F5420 Arapahoe Ave Unit F	Boulder	402-00642
133	Ganja Gourmet	1810 South Broadway	Denver	402-00655
134	Good Meds Englewood	3431 South Federal Blvd	Englewood	402-00736
135	Groundswell MED	3121 E. Colfax	Denver	402-00161
136	Pink House Blooms	111 S. Madison	Denver	402-00334
137	Rocky Mountain Organic Medicine	511 Orchard Street	Golden	402-00251
138	The Kind Room MED	1881 South Broadway	Denver	402-00498
139	Verde Natural MED	5101 E. Colfax Ave.	Denver	402-00207
140	Herban Underground MED	70 Broadway, Suite 50	Denver	402-00306
141	Buku Loud	3079 South Academy	Colorado Springs	402-01176
142	Chronorado	6625 Leetsdale Dr	Denver	402-00324
143	Dank MED	3835 Elm Street, Suite C	Denver	402-00011
144	Native Roots Aspen MED	308 S Hunter St	Aspen	402-01047
145	Native Roots Littleton MED	7870 W Quincy Ave	Denver	402-00977
146	Native Roots Longmont MED	19 South Sunset St.	Longmont	402-00961
147	Native Roots Santa Fe MED	2645 S Santa Fe Dr	Denver	402-01070
148	Native Roots Uintah MED	1705 W. Uintah St.	Colorado Springs	402-01083
149	Buddy Boy York MED	5050 York St.	Denver	402-00249
150	Local Product of Colorado	419 W 13th Ave	Denver	402-00585
151	The Epic Remedy	3995 North Academy Boulevard	Colorado Springs	402-01092
152	Buddy Boy South Federal MED	2426 S. Federal Blvd.	Denver	402-00690
153	Canna Botica	219 Vallejo St.	Denver	402-00691
154	Good Meds Lakewood	8420 West Colfax Ave.	Lakewood	402-00738
155	Buddy Boy Brands North Federal	155 N Federal Blvd	Denver	402-00751
156	The Clinic Highlands MED	3460 W. 32nd Ave	Denver	402-00137
157	Native Roots Austin Bluffs MED	3660 Austin Bluffs PKWY	Colorado Springs	402-01042
158	Native Roots Frisco MED	861 N Summit Blvd	Frisco	402-00905
159	High Valley Healing MED	0711 West Highway 160 Suite B	Alamosa	402-00869
160	Lucy Sky Dispensary Wash Park	2215 East Mississippi Avenue	Denver	402-00951
161	Terrapin Care Station Manhattan MED - The Genetic Locker	5370 Manhattan Circle #104	Boulder	402-00923
162	Golden Leaf MED	1755 Lincoln Ave	Steamboat Springs	402-00481
163	Native Roots Edgewater MED	5610 W 20th Ave.	Edgewater	402-00972
164	Native Roots Vail MED	41290 Hwy 6	Avon	402-00893
165	The Dandelion MED	845 Walnut	Boulder	402-00194
166	Native Roots Academy MED	1003 N Academy Blvd	Colorado Springs	402-01084
167	Greentree Medicinals MED	5565 Arapahoe Avenue, Suite G	Boulder	402-00473
168	Native Roots Downtown MED	1555 Champa St	Denver	402-00913
169	Ascend Canna Co MED	10712 W. Alameda Ave	Denver	402-00313
170	Good Meds Englewood	3431-G S. Federal Blvd.	Englewood	402-00736
171	Good Meds Lakewood	8420 W Colfax Ave	Lakewood	402-00738
172	Grant Pharms MMC	320 Prairie Road	Colorado Springs	402-01153
173	Native Roots Tejon MED	1433 S. Tejon St.	Colorado Springs	402-01140
174	Natural Mystic Wellness Center MED	204 E Main St.	Buena Vista	402-00823
175	Rocky Mountain Cannabis Cañon City MED	200 Water Street	Canon City	402-01196
176	Acme Healing Center of Crested Butte	309 Belleview Ave	Crested Butte	402-00519
177	Colorado Harvest Company Broadway MED	1568 S Broadway	Denver	402-00418
178	J & J Mountain Medicals, LLC	11505 US Highway 24 West	Co Springs/ Divide	402-00586
179	Kind Meds MED	260 North Santa Fe Drive	Denver	402-00945
180	Kind Pain Management MED	2636 Youngfield St	Lakewood	402-00635
181	MHSDGO, LLC	789 Tech Center Drive #e	Durango	402-00535
182	Sacred Seed MED	5885 East Evans Avenue	Denver	402-00240
183	The Bud Depot MED	138 Main Street	Lyons	402-00206
184	The Clinic Colorado MED	2020 S. Colorado Blvd	Denver	402-00872
185	Bgood Ventures llc	80 S. Pennsylvania	Denver	402-00670
186	The Clinic Wadsworth MED	3600 S. Wadsworth Blvd	Lakewood	402-00940
187	Naturaleaf	2727 Palmer Park Boulevard	Colorado Springs	402-01065
188	Telluride Green Room MED	250 S. Fur	Telluride	402-00474
189	Silver Stem Littleton MED	1086 W Littleton Blvd.	Littleton	402-00452
190	Sweet Leaf Pioneer MED	1286 Chambers #105	Eagle	402-00614
191	Strawberry Fields MED	3404 W. Colorado Ave	Colorado Springs	402-00167
192	Native Roots Airport MED	7050 Tower Road	Denver	402-00417
193	The Clinic Wadsworth MED	3600 South Wadsworth Boulevard, Units D & E	Lakewood	402-00940
194	Helping Hands MED	1021 Pearl Street, Suite C	Boulder	402-00533
195	Sunrise Solutions MED	43 Main St.	Bailey	402-00576
196	Infinite Wellness Center MED	900 North College Avenue	Fort Collins	402-00837
197	Herbal Wellness MED	400 West South Boulder Road, Suite 2700	Lafayette	402-00698
198	Helping Hands MED	1021 Pearl St. #b	Boulder	402-00533
199	Buddy Boy 38th MED	4012 West 38th Avenue	Denver	402-00849
200	Buddy Boy Walnut MED	3814 Walnut Street	Denver	402-00118
201	Buddy Boy Walnut MED	3814 Walnut St.	Denver	402-00118
202	Golden Leaf MED	1755 Lincoln Avenue	Steamboat Springs	402-00481
203	Buddy Boy South Federal MED	2426 South Federal	Denver	402-00690
204	Buddy Boy Umatilla MED	777 Umatilla Street	Denver	402-00746
205	Groundswell MED	3121 East Colfax Avenue	Denver	402-00161
206	Patient's Choice / Livegreen Lakewood MED	7063 West Colfax Ave	Lakewood	402-00374
207	High Level Health Colfax MED	2028 E. Colfax	Denver	402-00262
208	High Level Health Lincoln MED	970 Lincoln St	Denver	402-00263
209	Lucy Sky Cannabis Boutique	2390 - 2394 South Broadway	Denver	402-01101
210	Peaceful Choice MED	7464 Arapahoe #A-9	Boulder	402-00924
211	Bgood Northglenn MED	1830 West 92nd Avenue	Federal Heights	402-01126
212	Standing Akimbo	3801 N. Jason St.	Denver	402-00729
213	Boulder Wellness MED	5420 Arapahoe Avenue, Unit E	Boulder	402-00642
214	Buddy Boy Umatilla MED	777 Umatilla St	Denver	402-00746
215	Native Roots Highlands MED	2209 W. 32nd Ave.	Denver	402-00367
216	Tweed Leaf MED	1602 W Colorado Ave	Colorado Springs	402-00390
217	Organic Alternatives MED	346 E. Mountain Ave.	Fort Collins	402-00844
218	Mindful Colfax MED	5926 E. Colfax	Denver	402-00703
219	Life Flower Dispensary	4966 Leetsdale	Glendale	402-00613
220	Canna Co	3019 Toupal Drive	Trinidad	402-01247
221	Mighty Tree MED	2268 S Delaware St.	Denver	402‐01030
222	RiverRock North MED	4935 York St.	Denver	402-00150
223	RiverRock South MED	990 West 6th Avenue	Denver	402-00043
224	High Rollers	1445 S Pearl St	Denver	402-01221
225	Karmaceuticals MED	4 South Santa Fe Drive	Denver	402-00693
226	Buddy Boy York MED	5050 York Street	Denver	402-00249
227	Lucy Sky Cannabis Boutique	3480  Galena St	Denver	402-01193
228	The Giving Tree MED	2707 West 38th Avenue	Denver	402-00193
229	Adam's Green Crossing , LLC	3640 West Colorado Avenue	Colorado Springs	402-01097
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products (id, price, name) FROM stdin;
1	2.990000	Beer
2	1.990000	King Beer
120	3.990000	Gold Beer
121	4.550000	Queens Beer
45	6.990000	Best Beer
22	2.190000	Cold Beer
\.


--
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sales (id, sale_date, count) FROM stdin;
45	2019-01-01	5
45	2019-01-09	4
1	2019-02-06	10
45	2019-03-20	6
22	2019-04-09	22
120	2019-05-09	12
45	2019-05-11	8
121	2019-06-22	18
1	2019-07-05	12
121	2019-07-12	17
45	2019-06-06	2
\.


--
-- Data for Name: sales_mined; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sales_mined (buyer_name, classification, date_of_order, product_count, total) FROM stdin;
Altitude Organic Cannabis	Adult Use	2017-03-06 02:30:40	82	370.000
Boulder Wellness REC	Adult Use	2017-08-19 16:15:54	10	90.000
Boulder Wellness REC	Adult Use	2017-11-18 22:07:25	10	110.000
Boulder Wellness REC	Adult Use	2016-12-19 19:12:27	20	180.000
Boulder Wellness REC	Adult Use	2017-02-06 19:31:51	24	236.000
Boulder Wellness REC	Adult Use	2017-06-25 18:34:12	20	245.000
Boulder Wellness REC	Adult Use	2017-05-08 18:17:47	20	245.000
Boulder Wellness REC	Adult Use	2017-09-20 23:33:54	35	250.000
Bud Hut REC	Adult Use	2016-11-08 15:04:36	136	769.000
Buddy Boy 38th REC	Adult Use	2016-11-09 19:36:01	68	385.000
Buddy Boy South Federal	Adult Use	2017-10-28 01:39:01	24	174.000
Buddy Boy Walnut REC	Adult Use	2016-11-09 19:30:30	68	385.000
Canna Co	Adult Use	2017-03-06 16:55:14	44	121.000
Canna Co	Adult Use	2017-10-09 17:24:54	30	140.000
Canna Co	Adult Use	2017-11-24 16:55:15	36	158.000
Canna Co	Adult Use	2017-05-15 17:12:49	40	160.000
Canna Co	Adult Use	2017-04-10 17:29:43	40	160.000
Canna Co	Adult Use	2017-08-22 14:05:29	60	230.000
Cannasseur REC	Adult Use	2017-01-03 17:27:52	40	270.000
Colorado Harvest Company Broadway REC	Adult Use	2017-06-22 16:21:18	21	204.650
Colorado Harvest Company Broadway REC	Adult Use	2017-06-09 19:42:26	20	225.000
Colorado Harvest Company Broadway REC	Adult Use	2017-07-20 16:31:07	20	230.000
Colorado Harvest Company Broadway REC	Adult Use	2017-07-06 19:51:52	20	230.000
Colorado Harvest Company Broadway REC	Adult Use	2017-05-18 16:54:48	20	230.000
Colorado Harvest Company Broadway REC	Adult Use	2017-12-07 22:39:23	40	460.000
Colorado Harvest Company Broadway REC	Adult Use	2017-11-20 15:34:50	40	460.000
Colorado Harvest Company Broadway REC	Adult Use	2017-10-16 16:41:54	40	460.000
Colorado Harvest Company Broadway REC	Adult Use	2017-08-04 03:37:52	49	460.000
Colorado Harvest Company Broadway REC	Adult Use	2017-08-17 15:35:16	61	615.800
Colorado Harvest Company Broadway REC	Adult Use	2017-09-07 18:34:44	80	920.000
Colorado Harvest Company Kalamath REC	Adult Use	2017-09-07 15:48:58	45	460.000
Dank REC	Adult Use	2017-09-11 16:25:39	20	60.000
Dank REC	Adult Use	2017-06-27 15:57:51	20	60.000
Dank REC	Adult Use	2017-02-20 16:57:19	20	60.000
Dank REC	Adult Use	2017-08-15 16:34:20	40	120.000
Dank REC	Adult Use	2017-01-23 16:32:22	16	144.000
Dank REC	Adult Use	2016-11-07 18:28:52	32	192.000
Dank REC	Adult Use	2017-01-10 18:14:39	48	240.000
Dank REC	Adult Use	2017-04-12 15:08:44	60	342.000
Dank REC	Adult Use	2017-03-20 18:40:16	50	360.000
Dank REC	Adult Use	2017-07-26 23:54:05	40	460.000
Den-Rec	Adult Use	2017-02-22 22:02:21	15	85.000
Den-Rec	Adult Use	2016-12-27 17:19:41	20	130.000
Den-Rec	Adult Use	2017-05-28 12:30:14	60	350.000
Den-Rec	Adult Use	2017-07-27 17:08:42	35	360.000
Den-Rec	Adult Use	2016-10-21 21:01:21	60	420.000
Den-Rec	Adult Use	2017-06-19 20:24:23	40	460.000
Den-Rec	Adult Use	2017-04-17 12:56:49	60	494.000
Den-Rec	Adult Use	2017-08-11 22:01:12	76	598.400
Den-Rec	Adult Use	2017-08-30 23:48:12	75	650.000
Den-Rec	Adult Use	2017-09-15 18:19:21	75	655.000
Den-Rec	Adult Use	2017-11-24 18:25:26	60	690.000
Den-Rec	Adult Use	2017-10-27 18:55:20	80	740.000
Den-Rec	Adult Use	2017-09-29 22:29:38	121	1028.000
Doobie Sisters REC	Adult Use	2016-12-13 15:36:00	126	817.000
Durango Organics	Adult Use	2017-05-11 22:56:28	77	437.000
Durango Organics REC	Adult Use	2017-10-17 21:05:42	15	130.000
Durango Organics REC	Adult Use	2016-11-07 21:33:06	24	146.000
Durango Organics REC	Adult Use	2017-01-13 18:28:11	48	333.000
Golden Leaf REC	Adult Use	2017-03-01 04:11:53	13	117.000
Golden Leaf REC	Adult Use	2017-05-08 19:15:02	20	185.000
Golden Leaf REC	Adult Use	2016-11-14 19:32:53	32	256.000
Golden Leaf REC	Adult Use	2017-08-21 22:37:54	50	262.500
Golden Leaf REC	Adult Use	2017-06-05 15:06:50	20	270.000
Golden Leaf REC	Adult Use	2017-01-10 00:32:14	40	280.000
Golden Leaf REC	Adult Use	2017-07-10 19:28:20	71	475.000
Golden Leaf REC	Adult Use	2018-01-02 16:56:56	83	604.000
Green Dream Cannabis REC	Adult Use	2017-05-04 20:40:50	48	348.000
Green Tree Longmont REC	Adult Use	2017-08-11 21:50:20	81	450.800
Green Tree Longmont REC	Adult Use	2017-06-05 16:25:16	87	460.000
Green Tree Longmont REC	Adult Use	2017-10-30 13:48:05	100	700.000
Greenstop	Adult Use	2017-05-16 16:38:36	15	95.000
Greentree Medicinals Boulder REC	Adult Use	2017-08-16 14:33:34	20	220.000
Greentree Medicinals Boulder REC	Adult Use	2017-06-27 19:33:00	20	220.000
Groundswell REC	Adult Use	2017-02-18 20:01:55	72	193.000
Groundswell REC	Adult Use	2017-09-25 20:35:47	60	200.000
Groundswell REC	Adult Use	2017-08-29 15:10:34	20	230.000
Groundswell REC	Adult Use	2017-03-28 19:33:43	112	288.000
Groundswell REC	Adult Use	2017-06-19 18:33:27	41	388.000
Groundswell REC	Adult Use	2017-11-01 18:50:10	63	396.000
Groundswell REC	Adult Use	2017-10-06 20:35:15	48	552.000
Groundswell REC	Adult Use	2017-03-15 14:58:33	64	576.000
Groundswell REC	Adult Use	2017-07-17 18:02:12	120	700.000
Groundswell REC	Adult Use	2017-12-21 23:41:34	96	712.000
Growhouse Fraser REC	Adult Use	2017-01-02 21:10:32	32	227.000
Healing House	Adult Use	2017-06-08 16:28:09	65	265.000
Healing House	Adult Use	2017-05-09 16:46:46	80	450.000
Helping Hands REC	Adult Use	2017-07-17 23:11:57	24	276.000
Helping Hands REC	Adult Use	2017-10-09 22:41:25	24	288.000
Helping Hands REC	Adult Use	2017-08-15 13:27:03	24	291.000
Helping Hands REC	Adult Use	2017-08-28 13:35:52	24	296.000
Helping Hands REC	Adult Use	2017-09-04 18:16:32	24	303.000
Helping Hands REC	Adult Use	2017-10-24 15:24:13	36	402.000
Helping Hands REC	Adult Use	2017-06-13 15:19:57	36	420.000
Helping Hands REC	Adult Use	2017-06-05 22:47:00	48	528.000
Helping Hands REC	Adult Use	2017-08-07 21:40:30	49	540.960
Helping Hands REC	Adult Use	2017-12-11 19:51:32	48	546.000
Helping Hands REC	Adult Use	2017-09-12 14:00:24	48	552.000
Helping Hands REC	Adult Use	2017-07-31 21:42:59	48	552.000
Helping Hands REC	Adult Use	2017-05-23 18:27:43	48	552.000
Helping Hands REC	Adult Use	2017-05-02 14:29:56	72	828.000
Helping Hands REC	Adult Use	2016-10-25 01:01:41	96	864.000
Herbal Alternatives REC	Adult Use	2016-10-24 18:46:44	32	106.000
Herbal Alternatives REC	Adult Use	2017-09-25 19:22:35	27	264.000
Herbal Alternatives REC	Adult Use	2017-05-08 19:34:50	40	460.000
Herbal Wellness REC	Adult Use	2016-10-25 00:58:26	54	486.000
Herban Underground	Adult Use	2017-02-20 17:45:22	20	70.000
Herban Underground	Adult Use	2017-01-10 22:41:29	15	105.000
Herban Underground	Adult Use	2016-10-24 18:04:45	46	169.000
Herban Underground	Adult Use	2017-06-06 03:07:01	47	200.000
Herban Underground	Adult Use	2016-12-03 00:40:21	40	240.000
High Country Healing Vail REC	Adult Use	2017-08-11 21:53:59	81	568.400
High Level Health Colfax REC	Adult Use	2017-06-02 15:00:23	53	160.000
High Level Health Colfax REC	Adult Use	2017-10-17 20:58:54	20	230.000
High Level Health Colfax REC	Adult Use	2017-09-18 20:26:22	30	270.000
High Level Health Colfax REC	Adult Use	2017-08-03 22:21:56	35	290.000
High Level Health Lincoln REC	Adult Use	2017-08-29 22:01:02	25	145.000
High Level Health Lincoln REC	Adult Use	2017-06-02 14:38:38	53	160.000
High Level Health Lincoln REC	Adult Use	2017-10-17 20:58:54	20	230.000
High Level Health Lincoln REC	Adult Use	2017-09-18 20:26:22	20	230.000
High Level Health Lincoln REC	Adult Use	2017-08-03 22:21:57	20	230.000
Infinite Wellness Center REC	Adult Use	2016-11-07 21:01:18	32	192.000
Kind Care of Colorado REC	Adult Use	2017-09-20 18:13:52	84	660.000
Kind Care of Colorado REC	Adult Use	2017-07-18 14:54:33	96	696.000
Kind Love	Adult Use	2017-06-19 23:58:38	83	290.000
Lightshade 6th REC	Adult Use	2017-06-16 14:43:01	20	60.000
Lightshade 6th REC	Adult Use	2017-10-31 19:38:51	20	70.000
Lightshade 6th REC	Adult Use	2017-10-03 18:41:50	10	105.000
Lightshade 6th REC	Adult Use	2017-11-27 15:44:56	10	115.000
Lightshade 6th REC	Adult Use	2017-09-25 15:12:40	10	120.000
Lightshade 6th REC	Adult Use	2017-03-17 15:46:51	50	120.000
Lightshade 6th REC	Adult Use	2017-09-08 00:37:16	30	180.000
Lightshade 6th REC	Adult Use	2017-12-08 20:09:22	20	225.000
Lightshade 6th REC	Adult Use	2017-10-16 14:58:15	30	255.000
Lightshade 6th REC	Adult Use	2017-08-22 13:54:04	40	360.000
Lightshade 6th REC	Adult Use	2017-05-03 18:39:17	40	450.000
Lightshade Dayton	Adult Use	2017-11-27 15:43:48	6	82.000
Lightshade Dayton	Adult Use	2017-10-30 14:02:46	6	82.000
Lightshade Dayton	Adult Use	2017-10-23 14:47:06	30	234.000
Lightshade Havana REC	Adult Use	2017-07-28 17:04:32	36	75.000
Lightshade Havana REC	Adult Use	2017-03-17 15:48:57	50	120.000
Lightshade Havana REC	Adult Use	2017-10-09 16:28:42	30	345.000
Lightshade Havana REC	Adult Use	2017-05-03 18:39:42	40	450.000
Lightshade Holly REC	Adult Use	2017-08-24 16:17:07	10	120.000
Lightshade Holly REC	Adult Use	2017-03-17 15:14:57	50	120.000
Lightshade Holly REC	Adult Use	2017-11-20 19:23:13	50	397.500
Lightshade Holly REC	Adult Use	2017-05-03 18:38:49	40	450.000
Lightshade Iliff REC	Adult Use	2017-03-17 15:10:12	50	120.000
Lightshade Iliff REC	Adult Use	2017-06-29 13:45:10	35	142.500
Lightshade Iliff REC	Adult Use	2017-12-04 15:23:38	30	330.000
Lightshade Iliff REC	Adult Use	2017-05-03 18:38:10	40	450.000
Lightshade Iliff REC	Adult Use	2018-01-08 16:46:52	40	480.000
Lightshade Iliff REC	Adult Use	2017-09-13 16:05:09	72	702.000
Lightshade Peoria REC	Adult Use	2017-05-12 03:53:29	30	90.000
Lightshade Peoria REC	Adult Use	2017-03-17 15:16:34	50	120.000
Lightshade Peoria REC	Adult Use	2017-05-19 16:46:44	45	135.000
Lightshade Peoria REC	Adult Use	2017-09-25 15:14:23	36	216.000
Lightshade Peoria REC	Adult Use	2017-05-03 18:37:54	40	450.000
Lightshade Peoria REC	Adult Use	2017-10-09 16:32:10	45	502.500
Lightshade Sheridan REC	Adult Use	2017-03-17 15:18:52	50	120.000
Lightshade Sheridan REC	Adult Use	2017-11-20 19:33:24	50	397.500
Lightshade Sheridan REC	Adult Use	2017-05-03 18:39:33	40	450.000
LivWell Broadway REC	Adult Use	2017-02-07 00:26:42	32	106.000
LivWell Broadway REC	Adult Use	2017-07-24 19:32:34	10	130.000
LivWell Broadway REC	Adult Use	2017-05-25 14:28:08	10	130.000
LivWell Broadway REC	Adult Use	2017-03-14 13:07:52	16	154.000
LivWell Broadway REC	Adult Use	2017-01-16 18:26:02	32	192.000
LivWell Broadway REC	Adult Use	2016-12-30 14:30:47	32	192.000
LivWell Broadway REC	Adult Use	2017-11-14 20:20:53	20	210.000
LivWell Broadway REC	Adult Use	2017-08-22 19:27:30	20	210.000
LivWell Broadway REC	Adult Use	2017-06-27 13:46:53	20	210.000
LivWell Broadway REC	Adult Use	2017-08-09 14:20:32	20	225.000
LivWell Broadway REC	Adult Use	2017-09-19 15:15:32	20	240.000
LivWell Broadway REC	Adult Use	2017-04-25 18:12:35	20	240.000
LivWell Broadway REC	Adult Use	2017-04-04 16:48:22	73	336.000
Livwell Cortez REC	Adult Use	2017-05-25 14:29:23	10	155.000
Livwell Cortez REC	Adult Use	2017-04-04 16:58:01	32	242.000
Livwell Cortez REC	Adult Use	2017-07-11 13:50:48	20	265.000
Livwell Cortez REC	Adult Use	2017-04-25 18:21:07	20	290.000
Livwell Cortez REC	Adult Use	2017-01-16 19:19:46	64	384.000
Livwell Cortez REC	Adult Use	2017-11-14 20:21:19	40	530.000
Livwell Evans REC	Adult Use	2017-02-07 00:26:34	16	58.000
Livwell Evans REC	Adult Use	2017-07-24 19:33:10	10	115.000
Livwell Evans REC	Adult Use	2017-06-12 22:07:31	10	115.000
Livwell Evans REC	Adult Use	2017-08-09 14:30:57	10	130.000
Livwell Evans REC	Adult Use	2017-06-27 13:52:40	10	130.000
Livwell Evans REC	Adult Use	2016-12-30 14:46:04	32	192.000
Livwell Evans REC	Adult Use	2017-08-22 19:30:24	20	210.000
Livwell Evans REC	Adult Use	2017-09-19 15:16:22	20	240.000
Livwell Evans REC	Adult Use	2017-04-25 18:22:31	20	240.000
Livwell Franklin REC	Adult Use	2017-06-27 13:53:43	10	130.000
Livwell Franklin REC	Adult Use	2016-12-30 14:48:53	32	192.000
Livwell Franklin REC	Adult Use	2017-06-12 22:08:46	20	225.000
Livwell Franklin REC	Adult Use	2017-04-25 18:23:17	20	240.000
Livwell Garden City REC	Adult Use	2017-06-27 13:49:58	10	105.000
Livwell Garden City REC	Adult Use	2017-07-24 19:30:45	10	115.000
Livwell Garden City REC	Adult Use	2017-05-25 14:31:41	10	130.000
Livwell Garden City REC	Adult Use	2017-03-14 13:09:42	16	169.000
Livwell Garden City REC	Adult Use	2017-01-16 19:10:34	16	169.000
Livwell Garden City REC	Adult Use	2016-12-30 14:51:24	32	192.000
Livwell Garden City REC	Adult Use	2017-04-25 18:23:25	20	265.000
Livwell Garden City REC	Adult Use	2017-08-22 19:31:54	40	470.000
LivWell Larimer REC	Adult Use	2017-07-11 13:51:45	10	115.000
LivWell Larimer REC	Adult Use	2017-07-24 19:35:35	10	130.000
LivWell Larimer REC	Adult Use	2017-04-04 16:52:28	38	154.000
LivWell Larimer REC	Adult Use	2016-12-30 14:52:28	32	192.000
LivWell Larimer REC	Adult Use	2017-11-14 20:22:09	20	210.000
LivWell Larimer REC	Adult Use	2017-04-25 18:12:50	20	240.000
Livwell Mancos REC	Adult Use	2017-04-28 20:40:37	20	292.000
Livwell Pearl REC	Adult Use	2017-06-12 22:18:28	10	115.000
Livwell Pearl REC	Adult Use	2017-04-04 17:02:45	36	154.000
Livwell Pearl REC	Adult Use	2016-12-30 14:55:44	32	192.000
Livwell Pearl REC	Adult Use	2017-07-11 13:27:51	20	225.000
Livwell Pearl REC	Adult Use	2017-06-27 13:51:32	20	225.000
Livwell Pearl REC	Adult Use	2017-08-09 14:32:07	21	235.200
Livwell Pearl REC	Adult Use	2017-11-14 20:28:30	20	240.000
Livwell Pearl REC	Adult Use	2017-04-25 18:23:36	20	240.000
Livwell Pearl REC	Adult Use	2017-07-24 19:30:05	30	315.000
Livwell Pearl REC	Adult Use	2017-05-25 14:33:29	40	450.000
LivWell Stapleton REC	Adult Use	2017-08-09 14:39:06	10	115.000
LivWell Stapleton REC	Adult Use	2016-12-30 15:00:01	32	192.000
LivWell Stapleton REC	Adult Use	2017-09-19 15:17:50	20	210.000
LivWell Stapleton REC	Adult Use	2017-11-14 20:29:15	20	240.000
LivWell Stapleton REC	Adult Use	2017-04-25 18:16:25	20	240.000
LivWell Stapleton REC	Adult Use	2017-04-04 17:08:31	48	240.000
LivWell Stapleton REC	Adult Use	2017-05-25 14:34:37	40	480.000
Livwell Trinidad REC	Adult Use	2017-03-14 13:11:16	16	88.000
Livwell Trinidad REC	Adult Use	2017-08-09 14:38:37	10	145.000
Livwell Trinidad REC	Adult Use	2017-06-12 22:16:06	10	145.000
Livwell Trinidad REC	Adult Use	2017-02-07 00:26:24	32	146.000
Livwell Trinidad REC	Adult Use	2017-06-27 13:51:56	10	160.000
Livwell Trinidad REC	Adult Use	2017-11-14 20:29:58	20	260.000
Livwell Trinidad REC	Adult Use	2017-04-25 18:23:49	20	280.000
Livwell Trinidad REC	Adult Use	2017-01-16 19:25:56	48	336.000
Local Product of Colorado	Adult Use	2017-01-18 19:48:14	40	240.000
Lucy Sky Broadway REC	Adult Use	2017-12-25 01:10:48	20	230.000
Lucy Sky Broadway REC	Adult Use	2017-07-27 13:31:54	40	290.000
Lucy Sky Broadway REC	Adult Use	2017-06-21 21:28:28	41	290.000
Lucy Sky Broadway REC	Adult Use	2017-09-29 18:28:44	45	430.000
Lucy Sky Broadway REC	Adult Use	2017-11-10 21:04:57	60	520.000
Lucy Sky Broadway REC	Adult Use	2017-08-30 14:36:44	87	580.000
Lucy Sky Dispensary Wash Park REC	Adult Use	2017-09-03 19:47:50	20	60.000
Lucy Sky Dispensary Wash Park REC	Adult Use	2017-06-28 21:58:23	41	370.000
Lucy Sky Dispensary Wash Park REC	Adult Use	2017-01-13 17:40:15	80	432.000
Lucy Sky Dispensary Wash Park REC	Adult Use	2017-08-30 18:52:01	40	460.000
Lucy Sky Dispensary Wash Park REC	Adult Use	2017-03-29 18:44:06	110	460.000
Magnolia Road Cannabis Co	Adult Use	2017-03-20 19:13:34	32	128.000
Magnolia Road Inc	Adult Use	2017-02-28 20:13:19	50	140.000
Magnolia Road Inc	Adult Use	2017-07-25 22:26:19	50	280.000
Main Street Cannabis	Adult Use	2017-03-05 21:33:20	32	217.000
Main Street Cannabis	Adult Use	2017-06-26 20:47:53	61	355.000
Mighty Tree REC	Adult Use	2017-02-10 18:52:03	20	190.000
Mighty Tree REC	Adult Use	2017-03-09 16:15:39	98	280.000
Mighty Tree REC	Adult Use	2017-07-06 22:20:16	41	415.000
Mindful Colfax REC	Adult Use	2017-04-23 17:54:48	18	144.000
MMJ America Downtown REC	Adult Use	2017-01-17 20:37:56	20	130.000
MMJ America Downtown REC	Adult Use	2017-02-14 17:50:16	20	140.000
Mountain Medicinals	Adult Use	2017-05-31 15:47:59	80	420.000
Native Roots Adams REC	Adult Use	2017-04-06 19:46:59	9	49.000
Native Roots Adams REC	Adult Use	2017-08-02 21:29:18	8	106.000
Native Roots Adams REC	Adult Use	2016-11-15 17:44:39	36	180.000
Native Roots Adams REC	Adult Use	2017-01-12 19:45:09	36	190.000
Native Roots Adams REC	Adult Use	2017-04-26 15:39:38	48	288.000
Native Roots Aspen REC	Adult Use	2016-11-28 06:51:18	14	116.000
Native Roots Aspen REC	Adult Use	2017-03-28 00:01:18	17	121.000
Native Roots Aspen REC	Adult Use	2016-12-12 14:29:22	15	155.000
Native Roots Aspen REC	Adult Use	2017-08-02 21:33:03	20	166.000
Native Roots Aspen REC	Adult Use	2017-04-25 23:46:49	16	172.000
Native Roots Aspen REC	Adult Use	2017-07-19 22:33:09	23	203.000
Native Roots Aspen REC	Adult Use	2017-06-20 14:24:26	26	208.000
Native Roots Aspen REC	Adult Use	2017-01-03 15:46:17	25	215.000
Native Roots Aspen REC	Adult Use	2017-08-18 13:50:33	36	228.500
Native Roots Aspen REC	Adult Use	2017-07-12 23:22:35	32	254.000
Native Roots Aspen REC	Adult Use	2017-02-13 14:56:04	35	275.000
Native Roots Boulder REC	Adult Use	2017-07-05 14:09:49	10	135.000
Native Roots Boulder REC	Adult Use	2017-07-19 22:30:09	12	169.000
Native Roots Boulder REC	Adult Use	2016-12-27 19:18:37	20	195.000
Native Roots Boulder REC	Adult Use	2017-06-20 21:50:32	31	217.000
Native Roots Boulder REC	Adult Use	2017-05-02 21:12:08	26	218.000
Native Roots Boulder REC	Adult Use	2017-03-28 19:39:39	34	225.000
Native Roots Boulder REC	Adult Use	2017-07-12 23:20:09	24	252.000
Native Roots Boulder REC	Adult Use	2017-03-05 21:30:21	40	360.000
Native Roots Boulder REC	Adult Use	2017-08-03 14:50:06	40	441.000
Native Roots Boulder REC	Adult Use	2017-05-31 19:28:35	60	540.000
Native Roots Boulder REC	Adult Use	2016-10-24 15:14:09	90	570.000
Native Roots Boulder REC	Adult Use	2017-01-22 21:55:31	100	660.000
Native Roots Boulder REC	Adult Use	2017-04-10 20:30:20	130	840.000
Native Roots Dillon REC	Adult Use	2017-04-19 15:19:39	10	96.000
Native Roots Dillon REC	Adult Use	2016-11-25 19:53:27	14	117.000
Native Roots Dillon REC	Adult Use	2017-01-24 18:27:44	10	120.000
Native Roots Dillon REC	Adult Use	2016-11-14 22:13:37	14	138.000
Native Roots Dillon REC	Adult Use	2017-04-06 15:19:55	12	138.000
Native Roots Dillon REC	Adult Use	2017-05-30 15:35:19	18	156.000
Native Roots Dillon REC	Adult Use	2016-12-21 03:53:24	25	189.000
Native Roots Dillon REC	Adult Use	2017-01-02 14:03:53	26	192.000
Native Roots Dillon REC	Adult Use	2017-07-12 23:25:23	38	219.000
Native Roots Dillon REC	Adult Use	2017-02-09 16:44:15	32	222.000
Native Roots Dillon REC	Adult Use	2017-02-27 15:12:15	40	270.000
Native Roots Dillon REC	Adult Use	2017-08-07 17:16:37	31	308.700
Native Roots Dillon REC	Adult Use	2017-03-14 12:59:36	58	419.000
Native Roots Downtown REC	Adult Use	2017-04-25 02:40:41	12	118.000
Native Roots Downtown REC	Adult Use	2017-02-27 15:08:15	36	118.000
Native Roots Downtown REC	Adult Use	2017-04-04 16:05:04	40	130.000
Native Roots Downtown REC	Adult Use	2017-05-02 21:17:24	18	162.000
Native Roots Downtown REC	Adult Use	2017-08-01 15:41:39	31	163.800
Native Roots Downtown REC	Adult Use	2017-07-11 13:25:18	50	225.000
Native Roots Downtown REC	Adult Use	2016-11-29 15:55:37	30	234.000
Native Roots Downtown REC	Adult Use	2017-02-07 14:50:02	40	240.000
Native Roots Downtown REC	Adult Use	2017-01-23 20:40:27	40	240.000
Native Roots Downtown REC	Adult Use	2016-12-19 20:34:49	40	240.000
Native Roots Downtown REC	Adult Use	2017-05-22 14:23:54	36	252.000
Native Roots Downtown REC	Adult Use	2016-11-15 16:34:47	47	261.020
Native Roots Downtown REC	Adult Use	2017-02-18 20:44:04	48	288.000
Native Roots Downtown REC	Adult Use	2017-07-03 16:11:02	48	324.000
Native Roots Downtown REC	Adult Use	2017-03-20 16:52:45	105	420.000
Native Roots Downtown REC	Adult Use	2017-08-21 16:03:06	50	465.000
Native Roots Downtown REC	Adult Use	2017-08-07 16:24:21	50	465.000
Native Roots Downtown REC	Adult Use	2017-03-05 23:02:29	72	504.000
Native Roots Downtown REC	Adult Use	2017-07-17 16:08:26	55	525.000
Native Roots Downtown REC	Adult Use	2017-06-05 17:45:59	135	735.000
Native Roots Edgewater REC	Adult Use	2017-02-20 22:52:28	24	82.000
Native Roots Edgewater REC	Adult Use	2016-12-21 03:56:08	20	120.000
Native Roots Edgewater REC	Adult Use	2016-12-04 20:59:50	20	130.000
Native Roots Edgewater REC	Adult Use	2017-03-22 13:30:37	40	130.000
Native Roots Edgewater REC	Adult Use	2017-08-07 16:19:58	30	190.000
Native Roots Edgewater REC	Adult Use	2017-02-07 14:48:46	30	210.000
Native Roots Edgewater REC	Adult Use	2016-10-24 16:13:08	40	240.000
Native Roots Edgewater REC	Adult Use	2017-01-05 00:13:46	40	240.000
Native Roots Edgewater REC	Adult Use	2017-01-18 23:04:10	60	360.000
Native Roots Edgewater REC	Adult Use	2017-04-07 21:50:44	90	570.000
Native Roots Frisco REC	Adult Use	2017-07-05 14:05:54	12	66.000
Native Roots Frisco REC	Adult Use	2017-06-28 14:51:17	20	90.000
Native Roots Frisco REC	Adult Use	2016-11-17 21:57:56	25	165.000
Native Roots Frisco REC	Adult Use	2017-03-14 12:55:47	34	197.000
Native Roots Frisco REC	Adult Use	2016-12-19 14:53:31	30	300.000
Native Roots Frisco REC	Adult Use	2017-06-06 14:37:33	32	329.000
Native Roots Frisco REC	Adult Use	2017-04-05 15:59:44	61	366.000
Native Roots Frisco REC	Adult Use	2017-01-08 21:36:31	50	390.000
Native Roots Frisco REC	Adult Use	2016-12-26 22:00:05	50	450.000
Native Roots Frisco REC	Adult Use	2017-02-06 14:43:48	80	600.000
Native Roots Frisco REC	Adult Use	2017-01-26 15:50:17	80	600.000
Native Roots Frisco REC	Adult Use	2017-08-07 17:08:04	91	637.000
Native Roots Frisco REC	Adult Use	2017-02-20 15:25:55	100	660.000
Native Roots Frisco REC	Adult Use	2017-03-06 20:43:25	80	720.000
Native Roots Highlands REC	Adult Use	2016-11-22 01:43:40	9	55.000
Native Roots Highlands REC	Adult Use	2017-02-15 17:03:07	5	55.000
Native Roots Highlands REC	Adult Use	2017-01-27 23:14:55	12	72.000
Native Roots Highlands REC	Adult Use	2016-10-23 21:16:31	12	82.000
Native Roots Highlands REC	Adult Use	2017-06-16 15:47:31	24	82.000
Native Roots Highlands REC	Adult Use	2017-01-10 03:44:40	12	82.000
Native Roots Highlands REC	Adult Use	2017-07-19 14:12:50	26	142.000
Native Roots Highlands REC	Adult Use	2016-12-05 18:41:30	24	154.000
Native Roots Highlands REC	Adult Use	2017-06-28 18:30:35	22	156.000
Native Roots Highlands REC	Adult Use	2017-06-08 02:21:32	32	190.000
Native Roots Highlands REC	Adult Use	2017-05-04 19:55:12	36	190.000
Native Roots Highlands REC	Adult Use	2017-03-29 14:56:00	29	195.000
Native Roots Highlands REC	Adult Use	2017-08-07 16:09:04	51	385.800
Native Roots Littleton REC	Adult Use	2017-01-25 17:10:36	3	37.000
Native Roots Littleton REC	Adult Use	2017-01-10 15:56:19	9	55.000
Native Roots Littleton REC	Adult Use	2017-06-26 21:01:56	20	70.000
Native Roots Littleton REC	Adult Use	2017-03-14 21:09:49	10	70.000
Native Roots Littleton REC	Adult Use	2016-11-16 03:35:39	10	90.000
Native Roots Littleton REC	Adult Use	2017-01-03 14:32:54	12	94.000
Native Roots Littleton REC	Adult Use	2016-12-18 19:52:06	12	100.000
Native Roots Littleton REC	Adult Use	2017-05-22 14:25:38	12	118.000
Native Roots Littleton REC	Adult Use	2016-12-26 22:03:19	20	132.000
Native Roots Littleton REC	Adult Use	2017-04-03 22:38:14	22	162.000
Native Roots Littleton REC	Adult Use	2017-01-18 22:33:44	21	163.000
Native Roots Littleton REC	Adult Use	2017-08-03 15:09:11	49	227.200
Native Roots Littleton REC	Adult Use	2016-11-28 06:49:24	35	237.000
Native Roots Littleton REC	Adult Use	2017-02-01 15:13:27	45	243.000
Native Roots Littleton REC	Adult Use	2017-06-05 17:50:16	40	250.000
Native Roots Littleton REC	Adult Use	2017-03-27 15:21:27	45	351.000
Native Roots Littleton REC	Adult Use	2017-05-04 00:17:30	65	405.000
Native Roots Littleton REC	Adult Use	2017-02-27 19:41:02	60	420.000
Native Roots Littleton REC	Adult Use	2017-07-11 14:01:11	46	453.000
Native Roots Littleton REC	Adult Use	2017-06-19 16:39:06	56	573.000
Native Roots Longmont REC	Adult Use	2017-06-19 17:48:57	16	86.000
Native Roots Longmont REC	Adult Use	2016-11-08 02:47:47	15	125.000
Native Roots Longmont REC	Adult Use	2017-03-06 21:01:18	15	130.000
Native Roots Longmont REC	Adult Use	2016-11-20 17:35:52	20	140.000
Native Roots Longmont REC	Adult Use	2017-04-26 00:14:45	24	164.000
Native Roots Longmont REC	Adult Use	2017-04-19 15:13:58	24	164.000
Native Roots Longmont REC	Adult Use	2017-02-02 00:11:10	20	180.000
Native Roots Longmont REC	Adult Use	2017-05-17 15:58:37	18	182.000
Native Roots Longmont REC	Adult Use	2016-12-08 14:40:57	48	288.000
Native Roots Longmont REC	Adult Use	2017-07-17 21:50:22	24	296.000
Native Roots Santa Fe REC	Adult Use	2017-02-08 19:37:27	5	55.000
Native Roots Santa Fe REC	Adult Use	2017-01-30 17:50:40	10	70.000
Native Roots Santa Fe REC	Adult Use	2016-12-07 03:28:02	16	96.000
Native Roots Santa Fe REC	Adult Use	2017-01-04 00:30:52	16	118.000
Native Roots Santa Fe REC	Adult Use	2017-06-08 02:23:20	12	130.000
Native Roots Santa Fe REC	Adult Use	2017-08-07 16:22:49	20	135.000
Native Roots Santa Fe REC	Adult Use	2017-03-15 14:47:40	26	148.000
Native Roots Santa Fe REC	Adult Use	2017-07-19 14:15:04	12	154.000
Native Roots Santa Fe REC	Adult Use	2017-02-15 16:52:59	36	190.000
Native Roots Santa Fe REC	Adult Use	2017-03-21 16:14:10	30	270.000
Native Roots Trinidad REC	Adult Use	2017-06-06 16:51:45	24	160.000
Native Roots Trinidad REC	Adult Use	2017-07-18 16:16:10	18	258.000
Native Roots Trinidad REC	Adult Use	2017-04-21 20:48:33	94	480.000
Native Roots Trinidad REC	Adult Use	2017-08-22 14:07:53	91	638.000
Native Roots Trinidad REC	Adult Use	2017-08-07 17:21:38	111	808.500
Native Roots Vail REC	Adult Use	2017-03-27 23:48:17	20	95.000
Native Roots Vail REC	Adult Use	2017-07-03 16:14:55	35	135.000
Native Roots Vail REC	Adult Use	2017-04-06 15:31:02	28	162.000
Native Roots Vail REC	Adult Use	2017-08-07 17:11:23	24	256.670
Native Roots Vail REC	Adult Use	2016-11-10 14:56:17	64	331.000
Native Roots Vail REC	Adult Use	2017-07-19 22:36:20	30	410.000
Native Roots Vail REC	Adult Use	2017-01-19 21:06:13	166	965.000
Nectar Bee - Green Solution	Adult Use	2017-11-29 20:49:11	540	4050.000
Nectar Bee - Green Solution	Adult Use	2017-11-21 18:36:00	540	4050.000
Options	Adult Use	2017-07-12 21:14:16	40	120.000
Organic Alternatives REC	Adult Use	2017-08-30 17:51:23	71	180.000
Organic Alternatives REC	Adult Use	2016-11-29 00:24:51	40	360.000
Organic Alternatives REC	Adult Use	2017-02-01 20:15:14	40	360.000
Organic Alternatives REC	Adult Use	2017-01-04 20:57:24	60	420.000
Organic Alternatives REC	Adult Use	2017-08-23 23:52:54	40	470.000
Organic Alternatives REC	Adult Use	2017-09-25 21:18:29	80	920.000
Organic Alternatives REC	Adult Use	2017-05-10 22:29:11	80	920.000
Organic Alternatives REC	Adult Use	2016-10-31 17:49:25	160	960.000
Organic Alternatives REC	Adult Use	2017-03-06 17:30:34	160	960.000
Organic Alternatives REC	Adult Use	2017-11-01 17:54:25	120	1040.000
Organic Alternatives REC	Adult Use	2017-08-01 16:08:28	240	1480.000
RiverRock North REC	Adult Use	2016-11-18 02:20:47	64	384.000
RiverRock South REC	Adult Use	2016-11-18 02:30:38	64	394.000
Rocky Mountain Cannabis Gunnison	Adult Use	2017-02-22 20:54:24	49	160.000
Sacred Seed REC	Adult Use	2017-05-23 17:30:46	22	253.000
Sacred Seed REC	Adult Use	2017-07-10 20:56:55	24	276.000
Sacred Seed REC	Adult Use	2017-04-29 23:26:53	24	276.000
Sacred Seed REC	Adult Use	2016-11-22 17:42:58	32	288.000
Sacred Seed REC	Adult Use	2017-03-07 18:48:20	42	328.000
Sacred Seed REC	Adult Use	2017-08-15 21:03:39	41	450.800
Sacred Seed REC	Adult Use	2017-11-06 23:30:57	40	460.000
Sante Alternative Wellness REC	Adult Use	2017-08-28 17:36:30	89	600.000
Sante Alternative Wellness REC	Adult Use	2017-10-02 17:50:40	110	785.000
Seed & Smith	Adult Use	2017-12-28 18:26:07	57	474.100
Silver Stem Colfax REC	Adult Use	2016-11-04 17:46:30	32	181.000
Silverton Green Works REC	Adult Use	2017-06-23 21:33:51	93	580.000
Simply Pure REC	Adult Use	2017-08-07 15:53:25	20	220.000
Simply Pure REC	Adult Use	2017-10-05 16:05:16	30	260.000
Simply Pure REC	Adult Use	2016-12-20 15:12:33	49	324.000
Simply Pure REC	Adult Use	2017-07-27 19:41:12	80	760.000
Smokey's 420 House	Adult Use	2017-06-26 17:10:47	73	370.000
Smokey's 420 House	Adult Use	2017-09-12 05:33:32	60	545.000
Smokey's 420 House REC	Adult Use	2017-06-26 17:11:34	73	370.000
SOMA Gunnison	Adult Use	2017-11-14 00:13:38	44	391.000
Starbuds Brighton REC	Adult Use	2016-12-30 20:54:56	36	324.000
Starbuds Brighton REC	Adult Use	2016-12-02 02:58:22	88	337.000
Starbuds DU REC	Adult Use	2017-07-21 23:08:36	24	82.000
Starbuds DU REC	Adult Use	2017-04-12 14:01:03	60	200.000
Sticky Buds Broadway REC	Adult Use	2017-02-27 16:51:01	10	30.000
Sticky Buds Broadway REC	Adult Use	2017-06-19 15:03:45	21	140.000
Sticky Buds Broadway REC	Adult Use	2017-12-04 17:25:36	20	230.000
Sticky Buds Broadway REC	Adult Use	2016-11-20 17:51:51	40	240.000
Sticky Buds Broadway REC	Adult Use	2017-08-14 22:03:53	35	273.000
Sticky Buds Broadway REC	Adult Use	2017-09-15 18:13:49	40	290.000
Sticky Buds Broadway REC	Adult Use	2017-04-07 21:36:14	60	320.000
Sticky Buds Colfax REC	Adult Use	2016-11-20 17:54:39	40	240.000
Sticky Buds Colfax REC	Adult Use	2017-08-01 23:24:32	60	349.200
Strawberry Fields Highway	Adult Use	2017-03-08 16:30:07	40	360.000
Strawberry Fields Pueblo City REC	Adult Use	2016-11-24 16:08:53	14	23.950
Sweet Leaf Pioneer	Adult Use	2017-11-01 19:49:47	40	210.000
Terrapin Care Station 33rd REC - Apogee Management	Adult Use	2017-11-06 23:33:27	12	144.000
Terrapin Care Station 33rd REC - Apogee Management	Adult Use	2017-07-31 21:32:07	30	180.000
Terrapin Care Station 33rd REC - Apogee Management	Adult Use	2017-09-25 20:53:03	40	300.000
Terrapin Care Station 33rd REC - Apogee Management	Adult Use	2017-08-14 18:39:19	45	360.000
Terrapin Care Station Broadway REC - Ares Strategies	Adult Use	2016-10-31 19:53:11	24	216.000
Terrapin Care Station Broadway REC - Ares Strategies	Adult Use	2017-12-26 20:48:04	40	220.000
Terrapin Care Station Broadway REC - Ares Strategies	Adult Use	2017-10-09 22:16:42	20	220.000
Terrapin Care Station Broadway REC - Ares Strategies	Adult Use	2017-09-25 19:52:48	35	250.000
Terrapin Care Station Broadway REC - Ares Strategies	Adult Use	2017-07-31 20:31:21	40	300.000
Terrapin Care Station Broadway REC - Ares Strategies	Adult Use	2017-08-29 03:11:49	36	324.000
Terrapin Care Station Broadway REC - Ares Strategies	Adult Use	2017-08-14 17:40:40	40	375.000
Terrapin Care Station Folsom REC - Artemis Strategies	Adult Use	2017-01-02 19:14:29	18	177.000
Terrapin Care Station Folsom REC - Artemis Strategies	Adult Use	2017-03-13 18:44:49	32	288.000
Terrapin Care Station Folsom REC - Artemis Strategies	Adult Use	2016-11-07 23:16:29	34	306.000
Terrapin Care Station Folsom REC - Artemis Strategies	Adult Use	2017-02-20 23:14:56	34	306.000
Terrapin Care Station Folsom REC - Artemis Strategies	Adult Use	2017-01-09 20:52:37	34	306.000
Terrapin Care Station Folsom REC - Artemis Strategies	Adult Use	2017-11-20 17:31:44	50	320.000
Terrapin Care Station Folsom REC - Artemis Strategies	Adult Use	2016-10-24 23:04:51	36	324.000
Terrapin Care Station Folsom REC - Artemis Strategies	Adult Use	2017-04-03 18:00:14	36	324.000
Terrapin Care Station Folsom REC - Artemis Strategies	Adult Use	2016-12-26 18:08:24	36	324.000
Terrapin Care Station Folsom REC - Artemis Strategies	Adult Use	2017-12-18 21:34:27	40	340.000
Terrapin Care Station Folsom REC - Artemis Strategies	Adult Use	2017-07-31 16:40:03	60	370.000
Terrapin Care Station Folsom REC - Artemis Strategies	Adult Use	2017-09-11 20:07:16	40	380.000
Terrapin Care Station Folsom REC - Artemis Strategies	Adult Use	2017-08-28 20:08:52	40	380.000
Terrapin Care Station Folsom REC - Artemis Strategies	Adult Use	2017-08-22 14:35:43	60	380.000
Terrapin Care Station Folsom REC - Artemis Strategies	Adult Use	2017-12-26 21:53:21	40	460.000
Terrapin Care Station Folsom REC - Artemis Strategies	Adult Use	2017-10-09 19:29:34	40	460.000
Terrapin Care Station Folsom REC - Artemis Strategies	Adult Use	2017-08-14 18:44:12	80	600.000
Terrapin Care Station Folsom REC - Artemis Strategies	Adult Use	2017-09-25 20:46:09	85	620.000
Terrapin Care Station Folsom REC - Artemis Strategies	Adult Use	2017-11-06 17:21:38	70	730.000
Terrapin Care Station Mississippi REC - Apogee Management	Adult Use	2017-12-04 21:15:47	40	210.000
Terrapin Care Station Mississippi REC - Apogee Management	Adult Use	2017-11-07 15:41:30	20	230.000
Terrapin Care Station Mississippi REC - Apogee Management	Adult Use	2017-07-31 19:06:23	55	310.000
Terrapin Care Station Mississippi REC - Apogee Management	Adult Use	2017-07-17 19:37:25	49	312.000
The 404 Dispensary	Adult Use	2017-07-29 03:23:51	48	275.000
The Bud Depot REC	Adult Use	2017-03-29 14:41:24	51	180.000
The Bud Depot REC	Adult Use	2017-06-05 19:52:25	30	330.000
The Bud Depot REC	Adult Use	2017-08-07 22:04:42	31	343.400
The Bud Depot REC	Adult Use	2017-08-28 21:11:52	40	440.000
The Bud Depot REC	Adult Use	2017-07-03 18:46:07	40	440.000
The Bud Depot REC	Adult Use	2017-06-27 13:56:40	40	440.000
The Bud Depot REC	Adult Use	2017-05-23 19:24:14	40	440.000
The Bud Depot REC	Adult Use	2016-10-25 00:47:58	50	450.000
The Bud Depot REC	Adult Use	2017-04-11 15:42:31	50	450.000
The Bud Depot REC	Adult Use	2017-10-16 19:31:43	50	562.500
The Bud Depot REC	Adult Use	2017-07-24 20:26:34	60	660.000
The Bud Depot REC	Adult Use	2017-07-17 22:03:02	60	660.000
The Bud Depot REC	Adult Use	2018-01-02 18:51:40	100	1137.500
The Bud Depot REC	Adult Use	2017-08-21 14:51:45	130	1430.000
The Bud Depot REC	Adult Use	2017-09-26 13:57:32	150	1737.500
The Bud Depot REC	Adult Use	2016-11-21 21:55:52	260	1740.000
The Bud Depot REC	Adult Use	2017-10-23 23:02:39	160	1820.000
The Clinic Colfax REC	Adult Use	2017-03-17 17:38:19	26	90.000
The Clinic Colfax REC	Adult Use	2017-08-16 22:01:25	30	130.000
The Clinic Colorado REC	Adult Use	2016-12-04 16:26:21	30	150.000
The Clinic Colorado REC	Adult Use	2017-06-21 18:29:15	80	580.000
The Clinic Highlands REC	Adult Use	2017-02-22 04:49:31	20	60.000
The Clinic Highlands REC	Adult Use	2017-04-05 20:24:59	18	100.000
The Clinic Highlands REC	Adult Use	2017-06-05 19:53:36	25	155.000
The Clinic Highlands REC	Adult Use	2017-08-07 16:05:43	37	252.000
The Clinic Highlands REC	Adult Use	2017-03-13 19:41:43	40	300.000
The Clinic Highlands REC	Adult Use	2017-10-06 00:04:17	48	348.000
The Clinic Highlands REC	Adult Use	2016-11-29 17:38:24	80	600.000
The Doc's Apothecary	Adult Use	2017-07-30 15:02:09	19	214.000
The Doc's Apothecary	Adult Use	2017-07-16 16:04:20	20	230.000
The Doc's Apothecary	Adult Use	2017-06-10 20:41:57	23	230.000
The Farmers Market REC	Adult Use	2017-05-04 23:14:30	10	115.000
The Farmers Market REC	Adult Use	2016-10-25 22:36:56	20	190.000
The Giving Tree REC	Adult Use	2017-03-01 03:43:04	52	160.000
The Giving Tree REC	Adult Use	2017-01-27 23:00:18	48	432.000
The Giving Tree REC	Adult Use	2017-06-08 18:22:37	55	505.000
The Green Joint	Adult Use	2017-08-28 23:49:39	80	600.000
The Green Joint	Adult Use	2017-08-28 23:05:58	93	600.000
The Greenery REC	Adult Use	2017-07-12 03:02:40	48	605.000
The Greenery REC	Adult Use	2016-10-22 00:07:11	64	621.000
The Greenery REC	Adult Use	2017-11-27 22:01:40	64	750.000
The Greenery REC	Adult Use	2016-12-07 03:38:35	105	753.000
The Greenery REC	Adult Use	2017-05-17 15:47:23	84	875.000
The Greenery REC	Adult Use	2017-08-16 13:59:25	81	917.280
The Greenery REC	Adult Use	2017-09-29 14:30:53	96	1104.000
The Herbal Cure REC	Adult Use	2017-07-31 15:06:35	49	294.000
The Kind Room REC	Adult Use	2017-12-11 20:37:56	21	105.000
The Kind Room REC	Adult Use	2017-05-02 14:27:22	21	185.000
The Kind Room REC	Adult Use	2016-11-08 18:50:44	32	288.000
The Kind Room REC	Adult Use	2017-06-05 18:43:44	40	460.000
The Underground Station	Adult Use	2017-07-03 14:50:21	25	185.000
Timberline Herbal Clinic and Wellness Center	Adult Use	2017-01-20 22:25:18	26	109.000
Verde Natural Boulder	Adult Use	2017-12-14 17:37:20	66	340.000
Verde Natural REC	Adult Use	2018-01-02 18:44:48	24	276.000
Verts LLC	Adult Use	2016-10-26 02:25:17	60	451.000
Village Green Society REC	Adult Use	2016-11-02 00:45:19	70	330.000
Village Green Society REC	Adult Use	2017-03-09 19:59:03	65	420.000
Wise Cannabis Company	Adult Use	2016-11-07 18:44:51	48	366.000
Igadi	Medical	2016-11-15 16:49:00	5	10.000
Boulder Wellness MED	Medical	2017-11-22 16:55:49	10	100.000
Ganja Gourmet	Medical	2017-10-22 18:33:18	13	100.000
Good Meds Englewood	Medical	2017-06-11 17:11:14	10	100.000
Good Meds Englewood	Medical	2017-01-12 20:54:07	10	100.000
Groundswell MED	Medical	2017-08-29 15:10:35	10	100.000
Pink House Blooms	Medical	2017-08-07 23:46:53	10	100.000
Rocky Mountain Organic Medicine	Medical	2016-11-21 23:40:28	10	100.000
The Kind Room MED	Medical	2017-12-11 20:49:21	10	100.000
Verde Natural MED	Medical	2017-03-06 17:59:17	14	100.000
Herban Underground MED	Medical	2017-10-24 00:41:40	10	105.000
Buku Loud	Medical	2017-07-04 00:42:43	17	108.000
Chronorado	Medical	2016-12-27 18:02:13	12	108.000
Dank MED	Medical	2017-06-12 20:44:33	12	108.000
Native Roots Aspen MED	Medical	2017-08-07 16:02:34	12	108.000
Native Roots Littleton MED	Medical	2017-05-04 00:15:29	12	108.000
Native Roots Littleton MED	Medical	2016-12-26 22:02:04	12	108.000
Native Roots Longmont MED	Medical	2017-04-26 00:12:21	12	108.000
Native Roots Santa Fe MED	Medical	2016-12-07 03:29:28	12	108.000
Native Roots Uintah MED	Medical	2017-05-23 14:59:45	12	108.000
Buddy Boy York MED	Medical	2017-06-27 22:32:37	21	109.000
Good Meds Englewood	Medical	2017-02-01 00:36:06	11	109.000
Good Meds Englewood	Medical	2017-12-01 20:01:24	10	110.000
Local Product of Colorado	Medical	2017-11-22 16:35:19	10	110.000
Native Roots Longmont MED	Medical	2017-07-05 14:12:54	10	110.000
Native Roots Longmont MED	Medical	2017-02-13 21:21:31	10	110.000
The Epic Remedy	Medical	2017-09-11 14:49:02	10	110.000
Boulder Wellness MED	Medical	2017-10-28 19:13:17	10	115.000
Buddy Boy South Federal MED	Medical	2017-07-22 23:58:34	12	118.000
Canna Botica	Medical	2017-04-28 23:48:12	12	118.000
Good Meds Lakewood	Medical	2017-07-13 20:54:43	12	118.000
Good Meds Lakewood	Medical	2017-06-06 15:23:12	12	118.000
Good Meds Lakewood	Medical	2017-05-23 17:05:50	12	118.000
Good Meds Lakewood	Medical	2017-01-03 18:04:32	12	118.000
Native Roots Littleton MED	Medical	2017-05-30 15:53:11	12	118.000
Verde Natural MED	Medical	2017-04-17 17:46:29	12	118.000
Buddy Boy Brands North Federal	Medical	2016-12-20 03:21:06	16	119.000
The Clinic Highlands MED	Medical	2017-11-08 00:13:30	12	120.000
Native Roots Austin Bluffs MED	Medical	2017-08-07 17:41:02	10	125.000
Verde Natural MED	Medical	2017-06-05 18:21:18	14	125.000
Native Roots Frisco MED	Medical	2017-04-05 16:02:32	14	126.000
Native Roots Longmont MED	Medical	2017-04-07 22:19:37	12	128.000
High Valley Healing MED	Medical	2017-03-28 19:43:37	10	130.000
Lucy Sky Dispensary Wash Park	Medical	2017-04-11 17:31:13	21	130.000
The Clinic Highlands MED	Medical	2017-11-26 21:29:06	12	130.000
Verde Natural MED	Medical	2016-12-05 21:09:07	16	130.000
Terrapin Care Station Manhattan MED - The Genetic Locker	Medical	2017-10-27 19:30:36	14	133.000
Golden Leaf MED	Medical	2017-05-08 17:22:33	15	135.000
Native Roots Edgewater MED	Medical	2016-12-21 03:58:42	15	135.000
Native Roots Frisco MED	Medical	2016-12-26 21:59:01	15	135.000
Native Roots Longmont MED	Medical	2016-11-08 02:44:52	15	135.000
Native Roots Vail MED	Medical	2017-04-06 15:27:11	15	135.000
The Dandelion MED	Medical	2017-01-18 14:51:44	14	141.000
Native Roots Academy MED	Medical	2017-08-02 19:32:12	12	143.000
Dank MED	Medical	2017-01-23 16:32:17	16	144.000
Greentree Medicinals MED	Medical	2016-10-20 00:30:27	16	144.000
Native Roots Littleton MED	Medical	2017-07-11 14:14:21	16	144.000
Local Product of Colorado	Medical	2017-01-12 02:30:40	20	145.000
Native Roots Downtown MED	Medical	2017-02-13 19:08:20	15	145.000
Good Meds Englewood	Medical	2017-05-21 18:10:14	18	146.000
The Dandelion MED	Medical	2016-12-13 14:51:24	14	146.000
Good Meds Englewood	Medical	2017-09-10 22:11:16	15	150.000
The Dandelion MED	Medical	2016-12-26 23:50:42	15	150.000
Ascend Canna Co MED	Medical	2016-12-21 16:23:08	16	154.000
Buddy Boy Brands North Federal	Medical	2017-08-09 01:31:58	16	154.000
Buddy Boy Brands North Federal	Medical	2017-03-23 01:24:17	16	154.000
Canna Botica	Medical	2017-06-14 20:18:55	16	154.000
Canna Botica	Medical	2017-05-16 23:46:05	16	154.000
Good Meds Englewood	Medical	2016-11-05 16:08:32	16	154.000
Good Meds Lakewood	Medical	2016-11-05 16:14:34	16	154.000
Good Meds Lakewood	Medical	2017-08-07 18:53:59	16	154.000
Good Meds Lakewood	Medical	2017-02-23 01:02:54	16	154.000
The Kind Room MED	Medical	2016-12-20 14:41:15	16	154.000
The Dandelion MED	Medical	2017-03-21 16:35:36	15	155.000
The Dandelion MED	Medical	2017-03-05 21:05:55	15	155.000
Verde Natural MED	Medical	2017-11-06 19:43:39	15	155.000
Good Meds Lakewood	Medical	2017-09-01 13:34:02	15	158.000
Grant Pharms MMC	Medical	2017-01-29 00:02:14	15	160.000
Lucy Sky Dispensary Wash Park	Medical	2017-08-30 18:52:38	17	160.000
Native Roots Downtown MED	Medical	2017-08-01 15:42:40	18	162.000
Native Roots Santa Fe MED	Medical	2017-08-07 16:21:24	18	162.000
Native Roots Santa Fe MED	Medical	2017-03-21 16:22:29	18	162.000
Good Meds Englewood	Medical	2017-07-26 16:51:43	17	163.000
Native Roots Austin Bluffs MED	Medical	2017-03-06 01:56:21	16	169.000
Native Roots Tejon MED	Medical	2017-03-21 13:48:05	16	169.000
Canna Botica	Medical	2017-10-31 00:04:56	16	170.000
Native Roots Tejon MED	Medical	2016-12-21 20:34:33	20	170.000
Good Meds Lakewood	Medical	2017-03-21 16:10:17	22	172.000
The Dandelion MED	Medical	2017-04-07 21:58:58	18	177.000
Natural Mystic Wellness Center MED	Medical	2016-10-24 18:16:37	16	179.000
Natural Mystic Wellness Center MED	Medical	2016-12-29 19:24:00	16	179.000
Rocky Mountain Cannabis Cañon City MED	Medical	2017-03-13 16:57:16	16	179.000
Acme Healing Center of Crested Butte	Medical	2017-06-07 22:19:18	25	180.000
Colorado Harvest Company Broadway MED	Medical	2017-08-25 16:19:21	20	180.000
Dank MED	Medical	2017-03-20 18:39:17	20	180.000
Dank MED	Medical	2017-01-30 20:36:02	20	180.000
Herban Underground MED	Medical	2017-01-10 22:38:09	20	180.000
High Valley Healing MED	Medical	2017-01-19 20:57:18	15	180.000
J & J Mountain Medicals, LLC	Medical	2017-07-06 17:54:34	25	180.000
Kind Meds MED	Medical	2017-04-07 21:06:23	20	180.000
Kind Pain Management MED	Medical	2017-06-02 17:26:50	20	180.000
Lucy Sky Dispensary Wash Park	Medical	2017-11-27 21:49:08	20	180.000
Lucy Sky Dispensary Wash Park	Medical	2017-06-28 21:59:53	20	180.000
MHSDGO, LLC	Medical	2017-06-05 20:39:39	25	180.000
Native Roots Aspen MED	Medical	2017-02-13 14:54:14	20	180.000
Native Roots Littleton MED	Medical	2016-11-16 03:41:01	20	180.000
Native Roots Littleton MED	Medical	2017-08-21 16:32:36	18	180.000
Natural Mystic Wellness Center MED	Medical	2017-04-28 19:43:50	20	180.000
Pink House Blooms	Medical	2017-05-09 21:35:09	20	180.000
Sacred Seed MED	Medical	2017-05-08 20:15:28	20	180.000
The Bud Depot MED	Medical	2017-11-27 22:39:28	20	180.000
The Bud Depot MED	Medical	2017-11-07 19:52:17	20	180.000
The Bud Depot MED	Medical	2017-05-23 19:29:00	20	180.000
The Clinic Colorado MED	Medical	2016-12-04 16:26:21	20	180.000
The Clinic Highlands MED	Medical	2017-06-05 19:55:23	20	180.000
The Kind Room MED	Medical	2017-06-05 18:44:45	20	180.000
Verde Natural MED	Medical	2017-06-26 19:59:43	23	181.000
Native Roots Austin Bluffs MED	Medical	2017-04-19 14:56:01	18	187.000
Ascend Canna Co MED	Medical	2016-10-20 17:43:32	20	190.000
Bgood Ventures llc	Medical	2017-07-05 19:44:56	20	190.000
Kind Pain Management MED	Medical	2017-01-30 18:14:48	20	190.000
Native Roots Santa Fe MED	Medical	2017-06-28 14:30:52	20	190.000
The Clinic Wadsworth MED	Medical	2017-08-08 18:02:37	20	190.000
Naturaleaf	Medical	2017-08-22 03:53:20	23	191.000
Good Meds Englewood	Medical	2017-05-04 20:01:32	24	192.000
Native Roots Frisco MED	Medical	2016-11-17 21:55:17	18	192.000
Telluride Green Room MED	Medical	2017-02-07 17:49:56	16	194.000
Native Roots Vail MED	Medical	2016-12-05 14:41:46	18	197.000
Canna Botica	Medical	2017-08-26 01:34:45	20	198.000
Canna Botica	Medical	2017-03-30 23:58:55	22	198.000
The Clinic Wadsworth MED	Medical	2016-12-02 21:09:42	22	198.000
The Clinic Wadsworth MED	Medical	2017-06-14 17:25:19	22	198.000
Boulder Wellness MED	Medical	2017-11-18 22:07:25	20	200.000
Dank MED	Medical	2017-10-09 22:25:12	20	200.000
Dank MED	Medical	2017-09-05 15:35:29	20	200.000
Groundswell MED	Medical	2017-11-11 20:53:14	20	200.000
Silver Stem Littleton MED	Medical	2017-10-12 23:46:42	20	200.000
Sweet Leaf Pioneer MED	Medical	2017-11-01 18:21:26	22	200.000
The Bud Depot MED	Medical	2018-01-02 18:53:48	20	200.000
Native Roots Austin Bluffs MED	Medical	2017-01-04 00:35:28	20	205.000
Strawberry Fields MED	Medical	2017-01-25 21:14:36	20	205.000
Native Roots Littleton MED	Medical	2017-02-01 15:10:40	23	207.000
The Clinic Wadsworth MED	Medical	2017-10-06 17:46:52	21	209.000
Native Roots Uintah MED	Medical	2017-06-12 15:04:15	21	214.000
Native Roots Uintah MED	Medical	2017-07-19 22:01:03	20	215.000
Bgood Ventures llc	Medical	2017-04-12 22:06:25	24	216.000
Canna Botica	Medical	2017-02-28 17:50:47	28	216.000
Dank MED	Medical	2017-04-04 15:02:09	24	216.000
Good Meds Lakewood	Medical	2017-03-12 00:22:31	24	216.000
Native Roots Airport MED	Medical	2017-04-11 15:43:42	28	216.000
Native Roots Littleton MED	Medical	2017-05-17 15:09:55	24	216.000
Native Roots Tejon MED	Medical	2017-07-05 14:34:04	24	216.000
Rocky Mountain Organic Medicine	Medical	2017-05-01 16:27:46	24	216.000
Rocky Mountain Organic Medicine	Medical	2017-01-31 14:59:07	24	216.000
Silver Stem Littleton MED	Medical	2017-02-13 23:40:03	24	216.000
The Clinic Highlands MED	Medical	2017-08-07 16:04:28	24	216.000
The Clinic Wadsworth MED	Medical	2017-02-19 04:40:04	24	216.000
Rocky Mountain Cannabis Cañon City MED	Medical	2016-12-21 16:32:57	28	217.000
Pink House Blooms	Medical	2017-09-04 20:16:02	22	218.000
Native Roots Uintah MED	Medical	2017-06-05 16:59:00	22	223.000
Native Roots Frisco MED	Medical	2017-03-20 21:11:10	21	224.000
Kind Pain Management MED	Medical	2016-11-27 19:56:08	25	225.000
Kind Pain Management MED	Medical	2017-03-21 18:53:27	25	225.000
Native Roots Frisco MED	Medical	2017-01-26 15:40:50	25	225.000
The Bud Depot MED	Medical	2017-09-01 00:04:39	31	225.000
The Clinic Wadsworth MED	Medical	2016-10-25 22:12:09	25	225.000
The Clinic Wadsworth MED	Medical	2017-03-13 15:27:53	25	225.000
Native Roots Vail MED	Medical	2017-07-12 23:32:53	22	228.000
The Dandelion MED	Medical	2016-10-28 13:54:34	24	231.000
The Dandelion MED	Medical	2017-06-07 15:11:27	24	231.000
Helping Hands MED	Medical	2017-09-25 19:13:34	25	235.000
Helping Hands MED	Medical	2017-08-07 20:36:17	25	240.000
High Valley Healing MED	Medical	2017-09-01 13:39:28	36	240.000
Silver Stem Littleton MED	Medical	2017-11-06 19:28:34	24	240.000
Sunrise Solutions MED	Medical	2017-10-10 21:14:58	24	240.000
Sweet Leaf Pioneer MED	Medical	2017-09-05 18:12:50	25	240.000
The Clinic Highlands MED	Medical	2017-10-14 22:29:37	24	240.000
Verde Natural MED	Medical	2018-01-02 18:43:11	24	240.000
Infinite Wellness Center MED	Medical	2016-11-07 20:20:31	32	241.000
Silver Stem Littleton MED	Medical	2017-08-19 19:48:44	24	242.000
Silver Stem Littleton MED	Medical	2017-09-02 18:25:37	26	244.000
Good Meds Lakewood	Medical	2017-12-18 18:54:43	25	250.000
Kind Pain Management MED	Medical	2017-09-27 23:41:55	25	250.000
Sweet Leaf Pioneer MED	Medical	2017-12-11 15:38:52	20	250.000
Native Roots Longmont MED	Medical	2017-05-30 15:39:48	26	254.000
Herbal Wellness MED	Medical	2016-12-08 21:03:22	33	256.000
High Valley Healing MED	Medical	2017-08-07 20:39:01	25	265.000
Boulder Wellness MED	Medical	2016-12-19 19:11:55	30	270.000
Kind Pain Management MED	Medical	2017-07-02 21:55:53	30	270.000
Silver Stem Littleton MED	Medical	2017-07-25 22:13:19	30	270.000
The Clinic Highlands MED	Medical	2017-01-22 18:46:12	30	270.000
High Valley Healing MED	Medical	2016-11-25 19:42:29	33	273.000
Helping Hands MED	Medical	2017-10-10 21:17:54	30	275.500
Good Meds Englewood	Medical	2017-02-13 21:19:09	40	280.000
Silver Stem Littleton MED	Medical	2017-12-16 21:07:59	28	280.000
Helping Hands MED	Medical	2017-07-11 19:00:58	30	285.000
Buddy Boy 38th MED	Medical	2016-11-09 20:37:31	32	288.000
Buddy Boy Walnut MED	Medical	2016-11-09 20:21:43	32	288.000
Buddy Boy Walnut MED	Medical	2016-12-20 03:08:02	32	288.000
Golden Leaf MED	Medical	2016-11-14 19:40:45	32	288.000
Groundswell MED	Medical	2017-03-29 20:46:43	32	288.000
Lucy Sky Dispensary Wash Park	Medical	2017-01-13 17:46:29	32	288.000
Native Roots Downtown MED	Medical	2017-05-02 21:15:44	32	288.000
Rocky Mountain Organic Medicine	Medical	2017-06-20 21:55:07	32	288.000
Buddy Boy South Federal MED	Medical	2016-11-09 20:49:34	36	289.000
Buddy Boy Umatilla MED	Medical	2016-11-09 20:16:02	36	289.000
Groundswell MED	Medical	2017-02-18 19:57:13	36	289.000
Boulder Wellness MED	Medical	2017-09-20 23:33:54	30	290.000
Golden Leaf MED	Medical	2017-08-21 22:39:10	30	290.000
Patient's Choice / Livegreen Lakewood MED	Medical	2017-09-12 20:32:18	30	290.000
Strawberry Fields MED	Medical	2017-05-03 16:17:24	30	295.000
Native Roots Uintah MED	Medical	2017-08-15 20:59:44	6	3.000
Kind Pain Management MED	Medical	2017-10-26 23:44:11	30	300.000
Kind Pain Management MED	Medical	2017-08-14 17:21:09	30	300.000
Telluride Green Room MED	Medical	2017-10-06 18:37:35	30	300.000
Terrapin Care Station Manhattan MED - The Genetic Locker	Medical	2017-12-26 23:13:57	30	300.000
Terrapin Care Station Manhattan MED - The Genetic Locker	Medical	2017-09-25 21:42:45	30	300.000
The Clinic Wadsworth MED	Medical	2017-11-04 22:20:10	30	300.000
Boulder Wellness MED	Medical	2017-06-20 19:29:36	32	303.000
Sunrise Solutions MED	Medical	2017-01-25 18:03:32	30	305.000
Sunrise Solutions MED	Medical	2016-11-08 17:50:51	34	306.000
The Clinic Wadsworth MED	Medical	2017-07-06 14:24:59	34	306.000
Rocky Mountain Organic Medicine	Medical	2017-11-27 16:00:30	32	308.000
Telluride Green Room MED	Medical	2017-05-29 17:47:31	30	320.000
Helping Hands MED	Medical	2016-11-21 22:11:34	36	324.000
Native Roots Longmont MED	Medical	2017-02-02 00:10:34	36	324.000
MHSDGO, LLC	Medical	2017-09-26 20:10:59	35	330.000
Native Roots Longmont MED	Medical	2017-05-23 14:57:11	36	344.000
Good Meds Englewood	Medical	2017-02-27 15:19:54	4	36.000
Colorado Harvest Company Broadway MED	Medical	2017-11-20 19:20:51	61	360.000
High Level Health Colfax MED	Medical	2017-06-02 14:42:19	45	360.000
High Level Health Lincoln MED	Medical	2017-06-02 14:33:45	45	360.000
Lucy Sky Cannabis Boutique	Medical	2017-07-27 13:50:40	40	360.000
Lucy Sky Cannabis Boutique	Medical	2017-06-21 21:35:09	40	360.000
Native Roots Academy MED	Medical	2016-12-14 22:39:52	40	360.000
Patient's Choice / Livegreen Lakewood MED	Medical	2017-07-12 23:29:33	40	360.000
Peaceful Choice MED	Medical	2017-06-22 20:42:32	40	360.000
Sacred Seed MED	Medical	2017-04-03 23:27:55	40	360.000
Silver Stem Littleton MED	Medical	2017-05-26 22:44:52	40	360.000
Silver Stem Littleton MED	Medical	2017-03-07 22:32:39	40	360.000
Sunrise Solutions MED	Medical	2017-06-14 18:37:08	40	360.000
Sunrise Solutions MED	Medical	2017-03-31 20:49:07	40	360.000
The Clinic Highlands MED	Medical	2017-02-22 04:51:58	40	360.000
Bgood Northglenn MED	Medical	2017-05-05 21:06:51	40	370.000
Buddy Boy York MED	Medical	2016-12-20 03:18:44	40	370.000
Infinite Wellness Center MED	Medical	2017-11-08 17:05:01	39	370.000
Standing Akimbo	Medical	2017-05-10 17:44:16	40	370.000
Helping Hands MED	Medical	2017-04-07 21:52:49	54	374.000
Helping Hands MED	Medical	2017-09-06 13:54:59	40	385.000
Native Roots Longmont MED	Medical	2016-12-08 14:39:31	44	396.000
Sacred Seed MED	Medical	2016-11-29 20:38:29	46	396.500
Golden Leaf MED	Medical	2017-10-04 14:26:05	40	420.000
Boulder Wellness MED	Medical	2016-10-20 00:25:08	48	432.000
Boulder Wellness MED	Medical	2017-04-18 16:15:52	48	432.000
Boulder Wellness MED	Medical	2017-03-05 17:55:52	48	432.000
Buddy Boy Umatilla MED	Medical	2017-05-01 02:36:10	48	432.000
Dank MED	Medical	2016-11-17 14:23:40	48	432.000
Native Roots Highlands MED	Medical	2017-01-29 18:03:40	48	432.000
Terrapin Care Station Manhattan MED - The Genetic Locker	Medical	2017-03-20 18:08:10	48	432.000
Terrapin Care Station Manhattan MED - The Genetic Locker	Medical	2017-02-06 22:36:10	48	432.000
Terrapin Care Station Manhattan MED - The Genetic Locker	Medical	2016-12-26 20:18:52	48	432.000
Tweed Leaf MED	Medical	2017-01-23 21:07:38	50	432.000
Golden Leaf MED	Medical	2017-07-10 19:26:13	5	45.000
Native Roots Frisco MED	Medical	2017-02-20 15:23:49	5	45.000
Native Roots Littleton MED	Medical	2016-12-02 20:28:45	5	45.000
Native Roots Longmont MED	Medical	2017-03-06 21:03:12	5	45.000
The Clinic Wadsworth MED	Medical	2017-01-23 22:34:44	50	450.000
Boulder Wellness MED	Medical	2016-11-22 00:10:26	3	46.000
Native Roots Littleton MED	Medical	2017-01-25 17:09:32	4	46.000
Native Roots Littleton MED	Medical	2016-12-13 18:52:00	4	46.000
Terrapin Care Station Manhattan MED - The Genetic Locker	Medical	2017-08-14 20:30:02	48	464.000
Organic Alternatives MED	Medical	2017-08-23 23:50:50	50	480.000
Boulder Wellness MED	Medical	2017-08-21 15:52:52	5	50.000
Mindful Colfax MED	Medical	2017-09-07 18:56:18	5	50.000
Patient's Choice / Livegreen Lakewood MED	Medical	2017-11-29 22:32:54	5	50.000
Groundswell MED	Medical	2017-08-22 00:17:40	50	500.000
Helping Hands MED	Medical	2017-12-01 17:49:36	55	515.000
Good Meds Englewood	Medical	2017-07-06 16:24:26	6	54.000
Native Roots Littleton MED	Medical	2017-01-03 14:37:37	6	54.000
Native Roots Vail MED	Medical	2016-12-12 18:14:42	6	54.000
Rocky Mountain Organic Medicine	Medical	2017-02-13 19:30:01	6	54.000
Organic Alternatives MED	Medical	2016-11-28 22:48:08	60	540.000
Organic Alternatives MED	Medical	2017-05-23 00:40:24	60	540.000
Patient's Choice / Livegreen Lakewood MED	Medical	2017-04-17 17:30:12	60	540.000
The Bud Depot MED	Medical	2016-11-28 22:41:04	60	540.000
Buddy Boy South Federal MED	Medical	2017-03-23 01:21:52	5	55.000
Life Flower Dispensary	Medical	2017-01-30 18:54:33	10	55.000
Native Roots Vail MED	Medical	2016-11-10 15:00:25	7	55.000
Canna Co	Medical	2017-12-05 16:58:49	65	570.000
Groundswell MED	Medical	2017-03-15 14:49:48	64	576.000
Mighty Tree MED	Medical	2017-03-09 16:21:32	68	576.000
Native Roots Uintah MED	Medical	2016-12-09 18:45:18	64	576.000
RiverRock North MED	Medical	2016-11-18 02:18:58	64	576.000
RiverRock South MED	Medical	2016-11-18 02:32:20	64	576.000
Terrapin Care Station Manhattan MED - The Genetic Locker	Medical	2017-06-12 20:12:28	64	576.000
Golden Leaf MED	Medical	2017-03-01 04:10:23	2	58.000
Buddy Boy South Federal MED	Medical	2017-10-28 01:25:43	6	60.000
The Dandelion MED	Medical	2016-11-21 17:28:53	5	60.000
Native Roots Littleton MED	Medical	2017-03-27 15:12:49	7	63.000
Native Roots Santa Fe MED	Medical	2017-01-04 00:26:17	6	64.000
Verde Natural MED	Medical	2017-07-10 18:41:13	6	64.000
Verde Natural MED	Medical	2017-04-25 18:57:36	11	69.000
Native Roots Littleton MED	Medical	2017-08-07 17:33:17	8	72.000
Boulder Wellness MED	Medical	2017-07-12 20:18:47	80	720.000
High Rollers	Medical	2017-05-30 00:28:58	85	720.000
Karmaceuticals MED	Medical	2017-03-29 14:36:54	84	720.000
Organic Alternatives MED	Medical	2017-03-06 17:18:44	80	720.000
Buddy Boy York MED	Medical	2016-11-28 15:35:02	11	73.000
Verde Natural MED	Medical	2017-07-20 16:35:00	7	73.000
Boulder Wellness MED	Medical	2016-11-17 20:31:35	5	75.000
Native Roots Tejon MED	Medical	2017-06-05 17:33:11	6	79.000
Lucy Sky Cannabis Boutique	Medical	2017-10-08 16:16:34	10	80.000
Herban Underground MED	Medical	2016-12-03 00:44:01	9	81.000
Buddy Boy South Federal MED	Medical	2017-04-07 21:19:54	8	82.000
Buddy Boy Umatilla MED	Medical	2017-01-09 14:26:11	8	82.000
Canna Botica	Medical	2017-07-05 23:39:08	8	82.000
Good Meds Englewood	Medical	2017-03-23 22:51:24	8	82.000
Native Roots Edgewater MED	Medical	2016-11-21 14:41:15	8	82.000
Native Roots Highlands MED	Medical	2017-07-12 16:45:13	8	82.000
Verde Natural MED	Medical	2017-05-08 19:20:38	8	82.000
Native Roots Frisco MED	Medical	2016-12-13 14:47:36	6	84.000
Buddy Boy South Federal MED	Medical	2017-10-03 00:01:52	8	90.000
Golden Leaf MED	Medical	2017-06-05 15:08:17	10	90.000
Golden Leaf MED	Medical	2017-01-09 19:58:45	10	90.000
Good Meds Englewood	Medical	2016-11-30 18:16:48	20	90.000
Native Roots Frisco MED	Medical	2017-07-05 14:04:01	10	90.000
Native Roots Frisco MED	Medical	2017-03-14 12:55:32	10	90.000
Native Roots Frisco MED	Medical	2017-01-08 21:31:20	10	90.000
Native Roots Littleton MED	Medical	2017-03-14 21:09:04	10	90.000
Native Roots Vail MED	Medical	2017-07-03 16:15:51	10	90.000
Native Roots Vail MED	Medical	2017-02-14 18:24:36	10	90.000
The Giving Tree MED	Medical	2017-03-01 03:52:42	10	90.000
Verde Natural MED	Medical	2017-10-16 17:19:08	10	90.000
Adam's Green Crossing , LLC	Medical	2017-01-26 00:42:37	14	91.000
\.


--
-- Name: clientsdb_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.clientsdb_client_id_seq', 229, true);


--
-- Name: clientsdb clientsdb_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clientsdb
    ADD CONSTRAINT clientsdb_pkey PRIMARY KEY (client_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: sales sales_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_id_fkey FOREIGN KEY (id) REFERENCES public.products(id);


--
-- PostgreSQL database dump complete
--

