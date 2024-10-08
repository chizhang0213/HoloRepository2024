--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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
-- Name: bwmodel3d; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bwmodel3d (
    bw_model_id integer NOT NULL,
    organ_id integer NOT NULL,
    bw_model_path text
);


ALTER TABLE public.bwmodel3d OWNER TO postgres;

--
-- Name: bwmodel3d_bw_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bwmodel3d_bw_model_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bwmodel3d_bw_model_id_seq OWNER TO postgres;

--
-- Name: bwmodel3d_bw_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bwmodel3d_bw_model_id_seq OWNED BY public.bwmodel3d.bw_model_id;


--
-- Name: colormodel3d; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colormodel3d (
    color_model_id integer NOT NULL,
    bw_model_id integer NOT NULL,
    color_model_path text
);


ALTER TABLE public.colormodel3d OWNER TO postgres;

--
-- Name: colormodel3d_color_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.colormodel3d_color_model_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.colormodel3d_color_model_id_seq OWNER TO postgres;

--
-- Name: colormodel3d_color_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.colormodel3d_color_model_id_seq OWNED BY public.colormodel3d.color_model_id;


--
-- Name: dicomfile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dicomfile (
    dicom_id integer NOT NULL,
    organ_id integer NOT NULL,
    dicom_path text
);


ALTER TABLE public.dicomfile OWNER TO postgres;

--
-- Name: dicomfile_dicom_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dicomfile_dicom_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dicomfile_dicom_id_seq OWNER TO postgres;

--
-- Name: dicomfile_dicom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dicomfile_dicom_id_seq OWNED BY public.dicomfile.dicom_id;


--
-- Name: dicomsegmentation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dicomsegmentation (
    dicom_segmentation_id integer NOT NULL,
    dicom_id integer NOT NULL,
    segmentation_path text
);


ALTER TABLE public.dicomsegmentation OWNER TO postgres;

--
-- Name: dicomsegmentation_dicom_segmentation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dicomsegmentation_dicom_segmentation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dicomsegmentation_dicom_segmentation_id_seq OWNER TO postgres;

--
-- Name: dicomsegmentation_dicom_segmentation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dicomsegmentation_dicom_segmentation_id_seq OWNED BY public.dicomsegmentation.dicom_segmentation_id;


--
-- Name: donor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.donor (
    donor_id integer NOT NULL,
    age integer NOT NULL,
    date_of_death date NOT NULL,
    cause_of_death text NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.donor OWNER TO postgres;

--
-- Name: donor_donor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.donor_donor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.donor_donor_id_seq OWNER TO postgres;

--
-- Name: donor_donor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.donor_donor_id_seq OWNED BY public.donor.donor_id;


--
-- Name: model3d; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model3d (
    model_id integer NOT NULL,
    organ_id integer,
    model_path text
);


ALTER TABLE public.model3d OWNER TO postgres;

--
-- Name: model3d_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.model3d_model_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.model3d_model_id_seq OWNER TO postgres;

--
-- Name: model3d_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.model3d_model_id_seq OWNED BY public.model3d.model_id;


--
-- Name: organ; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organ (
    organ_id integer NOT NULL,
    donor_id integer NOT NULL,
    organ_name_id integer,
    organ_side text
);


ALTER TABLE public.organ OWNER TO postgres;

--
-- Name: organ_organ_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organ_organ_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.organ_organ_id_seq OWNER TO postgres;

--
-- Name: organ_organ_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organ_organ_id_seq OWNED BY public.organ.organ_id;


--
-- Name: organname; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organname (
    organ_name_id integer NOT NULL,
    organ_name text,
    has_side boolean NOT NULL
);


ALTER TABLE public.organname OWNER TO postgres;

--
-- Name: organname_organ_name_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organname_organ_name_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.organname_organ_name_id_seq OWNER TO postgres;

--
-- Name: organname_organ_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organname_organ_name_id_seq OWNED BY public.organname.organ_name_id;


--
-- Name: organtag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organtag (
    organ_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.organtag OWNER TO postgres;

--
-- Name: segmentation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.segmentation (
    segmentation_id integer NOT NULL,
    slice_id integer,
    segmentation_path text
);


ALTER TABLE public.segmentation OWNER TO postgres;

--
-- Name: segmentation_segmentation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.segmentation_segmentation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.segmentation_segmentation_id_seq OWNER TO postgres;

--
-- Name: segmentation_segmentation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.segmentation_segmentation_id_seq OWNED BY public.segmentation.segmentation_id;


--
-- Name: sliceimage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sliceimage (
    slice_id integer NOT NULL,
    organ_id integer,
    dicom_id integer,
    additional_info text,
    image_path text
);


ALTER TABLE public.sliceimage OWNER TO postgres;

--
-- Name: sliceimage_slice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sliceimage_slice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sliceimage_slice_id_seq OWNER TO postgres;

--
-- Name: sliceimage_slice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sliceimage_slice_id_seq OWNED BY public.sliceimage.slice_id;


--
-- Name: tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tag (
    tag_id integer NOT NULL,
    tag_name text NOT NULL
);


ALTER TABLE public.tag OWNER TO postgres;

--
-- Name: tag_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tag_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tag_tag_id_seq OWNER TO postgres;

--
-- Name: tag_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tag_tag_id_seq OWNED BY public.tag.tag_id;


--
-- Name: texturemap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.texturemap (
    texture_id integer NOT NULL,
    segmentation_id integer,
    texture_path text
);


ALTER TABLE public.texturemap OWNER TO postgres;

--
-- Name: texturemap_texture_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.texturemap_texture_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.texturemap_texture_id_seq OWNER TO postgres;

--
-- Name: texturemap_texture_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.texturemap_texture_id_seq OWNED BY public.texturemap.texture_id;


--
-- Name: bwmodel3d bw_model_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bwmodel3d ALTER COLUMN bw_model_id SET DEFAULT nextval('public.bwmodel3d_bw_model_id_seq'::regclass);


--
-- Name: colormodel3d color_model_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colormodel3d ALTER COLUMN color_model_id SET DEFAULT nextval('public.colormodel3d_color_model_id_seq'::regclass);


--
-- Name: dicomfile dicom_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dicomfile ALTER COLUMN dicom_id SET DEFAULT nextval('public.dicomfile_dicom_id_seq'::regclass);


--
-- Name: dicomsegmentation dicom_segmentation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dicomsegmentation ALTER COLUMN dicom_segmentation_id SET DEFAULT nextval('public.dicomsegmentation_dicom_segmentation_id_seq'::regclass);


--
-- Name: donor donor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donor ALTER COLUMN donor_id SET DEFAULT nextval('public.donor_donor_id_seq'::regclass);


--
-- Name: model3d model_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model3d ALTER COLUMN model_id SET DEFAULT nextval('public.model3d_model_id_seq'::regclass);


--
-- Name: organ organ_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organ ALTER COLUMN organ_id SET DEFAULT nextval('public.organ_organ_id_seq'::regclass);


--
-- Name: organname organ_name_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organname ALTER COLUMN organ_name_id SET DEFAULT nextval('public.organname_organ_name_id_seq'::regclass);


--
-- Name: segmentation segmentation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.segmentation ALTER COLUMN segmentation_id SET DEFAULT nextval('public.segmentation_segmentation_id_seq'::regclass);


--
-- Name: sliceimage slice_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sliceimage ALTER COLUMN slice_id SET DEFAULT nextval('public.sliceimage_slice_id_seq'::regclass);


--
-- Name: tag tag_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag ALTER COLUMN tag_id SET DEFAULT nextval('public.tag_tag_id_seq'::regclass);


--
-- Name: texturemap texture_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.texturemap ALTER COLUMN texture_id SET DEFAULT nextval('public.texturemap_texture_id_seq'::regclass);


--
-- Data for Name: bwmodel3d; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bwmodel3d (bw_model_id, organ_id, bw_model_path) FROM stdin;
\.


--
-- Data for Name: colormodel3d; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.colormodel3d (color_model_id, bw_model_id, color_model_path) FROM stdin;
\.


--
-- Data for Name: dicomfile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dicomfile (dicom_id, organ_id, dicom_path) FROM stdin;
214	9	data\\DICOMFile\\image-000001.dcm
215	9	data\\DICOMFile\\image-000002.dcm
216	9	data\\DICOMFile\\image-000003.dcm
217	9	data\\DICOMFile\\image-000004.dcm
218	9	data\\DICOMFile\\image-000005.dcm
219	9	data\\DICOMFile\\image-000006.dcm
220	9	data\\DICOMFile\\image-000007.dcm
221	9	data\\DICOMFile\\image-000008.dcm
222	9	data\\DICOMFile\\image-000009.dcm
223	9	data\\DICOMFile\\image-000010.dcm
224	9	data\\DICOMFile\\image-000011.dcm
225	9	data\\DICOMFile\\image-000012.dcm
226	9	data\\DICOMFile\\image-000013.dcm
227	9	data\\DICOMFile\\image-000014.dcm
228	9	data\\DICOMFile\\image-000015.dcm
229	9	data\\DICOMFile\\image-000016.dcm
230	9	data\\DICOMFile\\image-000017.dcm
231	9	data\\DICOMFile\\image-000018.dcm
232	9	data\\DICOMFile\\image-000019.dcm
233	9	data\\DICOMFile\\image-000020.dcm
234	9	data\\DICOMFile\\image-000021.dcm
235	9	data\\DICOMFile\\image-000022.dcm
236	9	data\\DICOMFile\\image-000023.dcm
237	9	data\\DICOMFile\\image-000024.dcm
238	10	data\\DICOMFile\\image-000001.dcm
239	10	data\\DICOMFile\\image-000002.dcm
240	10	data\\DICOMFile\\image-000003.dcm
241	10	data\\DICOMFile\\image-000004.dcm
242	10	data\\DICOMFile\\image-000005.dcm
243	10	data\\DICOMFile\\image-000006.dcm
244	10	data\\DICOMFile\\image-000007.dcm
245	10	data\\DICOMFile\\image-000008.dcm
246	10	data\\DICOMFile\\image-000009.dcm
247	10	data\\DICOMFile\\image-000010.dcm
248	10	data\\DICOMFile\\image-000011.dcm
249	10	data\\DICOMFile\\image-000012.dcm
250	10	data\\DICOMFile\\image-000013.dcm
251	10	data\\DICOMFile\\image-000014.dcm
252	10	data\\DICOMFile\\image-000015.dcm
253	10	data\\DICOMFile\\image-000016.dcm
254	10	data\\DICOMFile\\image-000017.dcm
255	10	data\\DICOMFile\\image-000018.dcm
256	10	data\\DICOMFile\\image-000019.dcm
257	10	data\\DICOMFile\\image-000020.dcm
258	10	data\\DICOMFile\\image-000021.dcm
259	10	data\\DICOMFile\\image-000022.dcm
260	10	data\\DICOMFile\\image-000023.dcm
261	10	data\\DICOMFile\\image-000024.dcm
\.


--
-- Data for Name: dicomsegmentation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dicomsegmentation (dicom_segmentation_id, dicom_id, segmentation_path) FROM stdin;
\.


--
-- Data for Name: donor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.donor (donor_id, age, date_of_death, cause_of_death, "timestamp") FROM stdin;
1	44	2023-09-13	cancer	2024-09-09 09:35:01.284359+01
2	26	2024-07-08	respiratory tract infection	2024-09-09 09:37:01.564696+01
\.


--
-- Data for Name: model3d; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model3d (model_id, organ_id, model_path) FROM stdin;
6	10	data\\Model3D\\kidney_test_0000.glb
\.


--
-- Data for Name: organ; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.organ (organ_id, donor_id, organ_name_id, organ_side) FROM stdin;
9	1	1	\N
10	2	3	Right
\.


--
-- Data for Name: organname; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.organname (organ_name_id, organ_name, has_side) FROM stdin;
1	Heart	f
2	Lung	t
3	Kidney	t
4	Liver	f
5	Brain	f
6	Stomach	f
\.


--
-- Data for Name: organtag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.organtag (organ_id, tag_id) FROM stdin;
9	1
10	2
\.


--
-- Data for Name: segmentation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.segmentation (segmentation_id, slice_id, segmentation_path) FROM stdin;
\.


--
-- Data for Name: sliceimage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sliceimage (slice_id, organ_id, dicom_id, additional_info, image_path) FROM stdin;
12	9	214	123	data\\SliceImage\\1-Heart-0001-20240909.jpg
13	10	248	demo	data\\SliceImage\\2-Kidney(Right)-0001-20240909.jpg
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tag (tag_id, tag_name) FROM stdin;
1	COVID-19
2	Diabetes
3	Obesity
4	Malnutrition
5	Healthy
6	Alcoholism
\.


--
-- Data for Name: texturemap; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.texturemap (texture_id, segmentation_id, texture_path) FROM stdin;
\.


--
-- Name: bwmodel3d_bw_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bwmodel3d_bw_model_id_seq', 1, false);


--
-- Name: colormodel3d_color_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.colormodel3d_color_model_id_seq', 1, false);


--
-- Name: dicomfile_dicom_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dicomfile_dicom_id_seq', 261, true);


--
-- Name: dicomsegmentation_dicom_segmentation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dicomsegmentation_dicom_segmentation_id_seq', 1, false);


--
-- Name: donor_donor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.donor_donor_id_seq', 1, true);


--
-- Name: model3d_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.model3d_model_id_seq', 6, true);


--
-- Name: organ_organ_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.organ_organ_id_seq', 10, true);


--
-- Name: organname_organ_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.organname_organ_name_id_seq', 6, true);


--
-- Name: segmentation_segmentation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.segmentation_segmentation_id_seq', 1, false);


--
-- Name: sliceimage_slice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sliceimage_slice_id_seq', 13, true);


--
-- Name: tag_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tag_tag_id_seq', 6, true);


--
-- Name: texturemap_texture_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.texturemap_texture_id_seq', 1, false);


--
-- Name: bwmodel3d bwmodel3d_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bwmodel3d
    ADD CONSTRAINT bwmodel3d_pkey PRIMARY KEY (bw_model_id);


--
-- Name: colormodel3d colormodel3d_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colormodel3d
    ADD CONSTRAINT colormodel3d_pkey PRIMARY KEY (color_model_id);


--
-- Name: dicomfile dicomfile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dicomfile
    ADD CONSTRAINT dicomfile_pkey PRIMARY KEY (dicom_id);


--
-- Name: dicomsegmentation dicomsegmentation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dicomsegmentation
    ADD CONSTRAINT dicomsegmentation_pkey PRIMARY KEY (dicom_segmentation_id);


--
-- Name: donor donor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.donor
    ADD CONSTRAINT donor_pkey PRIMARY KEY (donor_id);


--
-- Name: model3d model3d_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model3d
    ADD CONSTRAINT model3d_pkey PRIMARY KEY (model_id);


--
-- Name: organ organ_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organ
    ADD CONSTRAINT organ_pkey PRIMARY KEY (organ_id);


--
-- Name: organname organname_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organname
    ADD CONSTRAINT organname_pkey PRIMARY KEY (organ_name_id);


--
-- Name: organtag organtag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organtag
    ADD CONSTRAINT organtag_pkey PRIMARY KEY (organ_id, tag_id);


--
-- Name: segmentation segmentation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.segmentation
    ADD CONSTRAINT segmentation_pkey PRIMARY KEY (segmentation_id);


--
-- Name: sliceimage sliceimage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sliceimage
    ADD CONSTRAINT sliceimage_pkey PRIMARY KEY (slice_id);


--
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (tag_id);


--
-- Name: texturemap texturemap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.texturemap
    ADD CONSTRAINT texturemap_pkey PRIMARY KEY (texture_id);


--
-- Name: bwmodel3d bwmodel3d_organ_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bwmodel3d
    ADD CONSTRAINT bwmodel3d_organ_id_fkey FOREIGN KEY (organ_id) REFERENCES public.organ(organ_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: colormodel3d colormodel3d_bw_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colormodel3d
    ADD CONSTRAINT colormodel3d_bw_model_id_fkey FOREIGN KEY (bw_model_id) REFERENCES public.bwmodel3d(bw_model_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: sliceimage dicom_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sliceimage
    ADD CONSTRAINT dicom_id FOREIGN KEY (dicom_id) REFERENCES public.dicomfile(dicom_id) ON DELETE CASCADE;


--
-- Name: dicomsegmentation dicom_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dicomsegmentation
    ADD CONSTRAINT dicom_id FOREIGN KEY (dicom_id) REFERENCES public.dicomfile(dicom_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: organ donor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organ
    ADD CONSTRAINT donor_id FOREIGN KEY (donor_id) REFERENCES public.donor(donor_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: organtag organ_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organtag
    ADD CONSTRAINT organ_id FOREIGN KEY (organ_id) REFERENCES public.organ(organ_id) ON DELETE CASCADE;


--
-- Name: model3d organ_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model3d
    ADD CONSTRAINT organ_id FOREIGN KEY (organ_id) REFERENCES public.organ(organ_id) ON DELETE CASCADE;


--
-- Name: sliceimage organ_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sliceimage
    ADD CONSTRAINT organ_id FOREIGN KEY (organ_id) REFERENCES public.organ(organ_id) ON DELETE CASCADE;


--
-- Name: dicomfile organ_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dicomfile
    ADD CONSTRAINT organ_id FOREIGN KEY (organ_id) REFERENCES public.organ(organ_id) ON DELETE CASCADE;


--
-- Name: organ organ_name_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organ
    ADD CONSTRAINT organ_name_id FOREIGN KEY (organ_name_id) REFERENCES public.organname(organ_name_id);


--
-- Name: texturemap segmentation_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.texturemap
    ADD CONSTRAINT segmentation_id FOREIGN KEY (segmentation_id) REFERENCES public.segmentation(segmentation_id) ON DELETE CASCADE;


--
-- Name: segmentation slice_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.segmentation
    ADD CONSTRAINT slice_id FOREIGN KEY (slice_id) REFERENCES public.sliceimage(slice_id) ON DELETE CASCADE;


--
-- Name: organtag tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organtag
    ADD CONSTRAINT tag_id FOREIGN KEY (tag_id) REFERENCES public.tag(tag_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

