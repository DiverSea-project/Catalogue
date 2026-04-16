--
-- PostgreSQL database dump
--

\restrict V4vMN2qyvBQ86u154si6GSxQ1tTdpdB7YkX8rsQl0ZZQ8lk3WjFRXG9L46mEW3z

-- Dumped from database version 15.8 (Debian 15.8-1.pgdg120+1)
-- Dumped by pg_dump version 18.0

-- Started on 2026-03-12 13:35:57

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 63137)
-- Name: diversea; Type: SCHEMA; Schema: -; Owner: owner
--

CREATE SCHEMA IF NOT EXISTS diversea;


ALTER SCHEMA diversea OWNER TO "owner";

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 282 (class 1259 OID 63447)
-- Name: abiotic_measurements; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.abiotic_measurements (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    sample_station character varying,
    sample_date date,
    depth numeric,
    sample_code character varying,
    temperature numeric,
    salinity numeric,
    total_suspended_matter numeric,
    transparency numeric,
    chlorophyll_a numeric,
    phycocyanin numeric
);


ALTER TABLE diversea.abiotic_measurements OWNER TO "owner";

--
-- TOC entry 6898 (class 0 OID 0)
-- Dependencies: 282
-- Name: TABLE abiotic_measurements; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.abiotic_measurements IS 'Derived from Black Sea (UA) abiotic samples and data.
Used also for Adriatic abiotic -- temp/salinity.';


--
-- TOC entry 6899 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN abiotic_measurements.depth; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.abiotic_measurements.depth IS 'Meters';


--
-- TOC entry 6900 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN abiotic_measurements.temperature; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.abiotic_measurements.temperature IS 'Degrees C';


--
-- TOC entry 6901 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN abiotic_measurements.salinity; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.abiotic_measurements.salinity IS 'Practical salinity units (PSU), promiles';


--
-- TOC entry 6902 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN abiotic_measurements.total_suspended_matter; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.abiotic_measurements.total_suspended_matter IS 'g*m^(-3)';


--
-- TOC entry 6903 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN abiotic_measurements.transparency; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.abiotic_measurements.transparency IS 'Kd, m^(-1)';


--
-- TOC entry 6904 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN abiotic_measurements.chlorophyll_a; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.abiotic_measurements.chlorophyll_a IS 'Chl mg·m⁻³';


--
-- TOC entry 6905 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN abiotic_measurements.phycocyanin; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.abiotic_measurements.phycocyanin IS 'CPC mg·m⁻³';


--
-- TOC entry 281 (class 1259 OID 63446)
-- Name: abiotic_measurements_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.abiotic_measurements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.abiotic_measurements_id_seq OWNER TO "owner";

--
-- TOC entry 6907 (class 0 OID 0)
-- Dependencies: 281
-- Name: abiotic_measurements_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.abiotic_measurements_id_seq OWNED BY diversea.abiotic_measurements.id;


--
-- TOC entry 902 (class 1259 OID 73135)
-- Name: audio_hyrdophones; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.audio_hyrdophones (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    "timestamp" timestamp without time zone,
    filepath character varying NOT NULL,
    encounter_label character varying,
    encounter_duration numeric,
    encounter_classification character varying
);


ALTER TABLE diversea.audio_hyrdophones OWNER TO "owner";

--
-- TOC entry 6909 (class 0 OID 0)
-- Dependencies: 902
-- Name: TABLE audio_hyrdophones; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.audio_hyrdophones IS 'For Ballearic';


--
-- TOC entry 901 (class 1259 OID 73134)
-- Name: audio_hyrdophones_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.audio_hyrdophones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.audio_hyrdophones_id_seq OWNER TO "owner";

--
-- TOC entry 6911 (class 0 OID 0)
-- Dependencies: 901
-- Name: audio_hyrdophones_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.audio_hyrdophones_id_seq OWNED BY diversea.audio_hyrdophones.id;


--
-- TOC entry 302 (class 1259 OID 63553)
-- Name: bacteria_edna_results; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.bacteria_edna_results (
    id integer NOT NULL,
    sample_id integer NOT NULL,
    species_id integer NOT NULL,
    tax_count bigint
);


ALTER TABLE diversea.bacteria_edna_results OWNER TO "owner";

--
-- TOC entry 6912 (class 0 OID 0)
-- Dependencies: 302
-- Name: TABLE bacteria_edna_results; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.bacteria_edna_results IS 'Derived from Hellenic eDNA data, RDS file, otu_table()';


--
-- TOC entry 301 (class 1259 OID 63552)
-- Name: bacteria_edna_results_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.bacteria_edna_results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.bacteria_edna_results_id_seq OWNER TO "owner";

--
-- TOC entry 6914 (class 0 OID 0)
-- Dependencies: 301
-- Name: bacteria_edna_results_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.bacteria_edna_results_id_seq OWNED BY diversea.bacteria_edna_results.id;


--
-- TOC entry 284 (class 1259 OID 63474)
-- Name: bacteria_edna_samples; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.bacteria_edna_samples (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    code character varying,
    depth character varying,
    latitude numeric,
    longitude numeric,
    location character varying,
    season character varying,
    description character varying
);


ALTER TABLE diversea.bacteria_edna_samples OWNER TO "owner";

--
-- TOC entry 6916 (class 0 OID 0)
-- Dependencies: 284
-- Name: TABLE bacteria_edna_samples; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.bacteria_edna_samples IS 'Derived from Hellenic eDNA data, RDS file, sample_data()';


--
-- TOC entry 283 (class 1259 OID 63473)
-- Name: bacteria_edna_samples_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.bacteria_edna_samples_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.bacteria_edna_samples_id_seq OWNER TO "owner";

--
-- TOC entry 6918 (class 0 OID 0)
-- Dependencies: 283
-- Name: bacteria_edna_samples_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.bacteria_edna_samples_id_seq OWNED BY diversea.bacteria_edna_samples.id;


--
-- TOC entry 286 (class 1259 OID 63483)
-- Name: bacteria_edna_species; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.bacteria_edna_species (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    code character varying,
    domain character varying,
    clade_1 character varying,
    clade_2 character varying,
    phylum character varying,
    class character varying,
    "order" character varying,
    family character varying,
    genus character varying,
    species character varying,
    sequence character varying
);


ALTER TABLE diversea.bacteria_edna_species OWNER TO "owner";

--
-- TOC entry 6920 (class 0 OID 0)
-- Dependencies: 286
-- Name: TABLE bacteria_edna_species; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.bacteria_edna_species IS 'Derived from Hellenic eDNA data, RDS file, tax_table()';


--
-- TOC entry 285 (class 1259 OID 63482)
-- Name: bacteria_edna_species_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.bacteria_edna_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.bacteria_edna_species_id_seq OWNER TO "owner";

--
-- TOC entry 6922 (class 0 OID 0)
-- Dependencies: 285
-- Name: bacteria_edna_species_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.bacteria_edna_species_id_seq OWNED BY diversea.bacteria_edna_species.id;


--
-- TOC entry 965 (class 1259 OID 168543)
-- Name: benthic_coverage; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.benthic_coverage (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    transect character varying,
    species character varying,
    coverage numeric,
    photoquad character varying
);


ALTER TABLE diversea.benthic_coverage OWNER TO "owner";

--
-- TOC entry 6924 (class 0 OID 0)
-- Dependencies: 965
-- Name: TABLE benthic_coverage; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.benthic_coverage IS 'Derived from Adriatic/Gabicce data.';


--
-- TOC entry 964 (class 1259 OID 168542)
-- Name: benthic_coverage_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.benthic_coverage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.benthic_coverage_id_seq OWNER TO "owner";

--
-- TOC entry 6925 (class 0 OID 0)
-- Dependencies: 964
-- Name: benthic_coverage_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.benthic_coverage_id_seq OWNED BY diversea.benthic_coverage.id;


--
-- TOC entry 288 (class 1259 OID 63492)
-- Name: biological_pollution; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.biological_pollution (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    station_code character varying,
    sampling_protocol_id integer,
    sample_date date,
    aci numeric,
    rci numeric,
    sbci_level integer,
    record_contributor character varying,
    field_collector character varying
);


ALTER TABLE diversea.biological_pollution OWNER TO "owner";

--
-- TOC entry 6926 (class 0 OID 0)
-- Dependencies: 288
-- Name: TABLE biological_pollution; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.biological_pollution IS 'Biotic. Derived from UA IAS data';


--
-- TOC entry 6927 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN biological_pollution.aci; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.biological_pollution.aci IS 'Abundance Contamination Index (Arbaciauskas et al. 2008)';


--
-- TOC entry 6928 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN biological_pollution.rci; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.biological_pollution.rci IS 'Richness Contamination Index (Arbaciauskas et al. 2008)';


--
-- TOC entry 287 (class 1259 OID 63491)
-- Name: biological_pollution_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.biological_pollution_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.biological_pollution_id_seq OWNER TO "owner";

--
-- TOC entry 6930 (class 0 OID 0)
-- Dependencies: 287
-- Name: biological_pollution_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.biological_pollution_id_seq OWNED BY diversea.biological_pollution.id;


--
-- TOC entry 290 (class 1259 OID 63501)
-- Name: ctd_measurements_basic; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.ctd_measurements_basic (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    "timestamp" timestamp without time zone,
    depth numeric,
    gmt_time numeric,
    latitude numeric,
    longitude numeric,
    corrected_lattitude numeric,
    corrected_longitude numeric,
    conductivity numeric,
    temperature numeric,
    salinity numeric,
    medium character varying
);


ALTER TABLE diversea.ctd_measurements_basic OWNER TO "owner";

--
-- TOC entry 6932 (class 0 OID 0)
-- Dependencies: 290
-- Name: TABLE ctd_measurements_basic; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.ctd_measurements_basic IS 'Derived from Atlantic data samples.';


--
-- TOC entry 289 (class 1259 OID 63500)
-- Name: ctd_measurements_basic_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.ctd_measurements_basic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.ctd_measurements_basic_id_seq OWNER TO "owner";

--
-- TOC entry 6934 (class 0 OID 0)
-- Dependencies: 289
-- Name: ctd_measurements_basic_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.ctd_measurements_basic_id_seq OWNED BY diversea.ctd_measurements_basic.id;


--
-- TOC entry 292 (class 1259 OID 63510)
-- Name: ctd_measurements_chemical; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.ctd_measurements_chemical (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    location character varying,
    date_time timestamp without time zone,
    latitude numeric,
    longitude numeric,
    depth numeric,
    temperature numeric,
    salinity numeric,
    density numeric,
    sigma_t numeric,
    pressure numeric,
    po_temp_090c numeric,
    turb_wet_ntu numeric,
    ph numeric,
    "sbeox_ml/l" numeric,
    sbeox_ps numeric,
    fl_eco_afl numeric,
    orp numeric,
    par numeric,
    dmax numeric,
    cruise numeric
);


ALTER TABLE diversea.ctd_measurements_chemical OWNER TO "owner";

--
-- TOC entry 6936 (class 0 OID 0)
-- Dependencies: 292
-- Name: TABLE ctd_measurements_chemical; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.ctd_measurements_chemical IS 'Derived from Turkish data samples.';


--
-- TOC entry 291 (class 1259 OID 63509)
-- Name: ctd_measurements_chemical_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.ctd_measurements_chemical_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.ctd_measurements_chemical_id_seq OWNER TO "owner";

--
-- TOC entry 6938 (class 0 OID 0)
-- Dependencies: 291
-- Name: ctd_measurements_chemical_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.ctd_measurements_chemical_id_seq OWNED BY diversea.ctd_measurements_chemical.id;


--
-- TOC entry 223 (class 1259 OID 63139)
-- Name: data_gathering_types; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.data_gathering_types (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE diversea.data_gathering_types OWNER TO "owner";

--
-- TOC entry 6940 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE data_gathering_types; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.data_gathering_types IS 'Whether the data is from field samples or artificially generated.';


--
-- TOC entry 222 (class 1259 OID 63138)
-- Name: data_gathering_types_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.data_gathering_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.data_gathering_types_id_seq OWNER TO "owner";

--
-- TOC entry 6942 (class 0 OID 0)
-- Dependencies: 222
-- Name: data_gathering_types_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.data_gathering_types_id_seq OWNED BY diversea.data_gathering_types.id;


--
-- TOC entry 239 (class 1259 OID 63203)
-- Name: dataset; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.dataset (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    location character varying,
    category_id integer,
    data_gathering_type_id integer,
    description character varying,
    organization_id integer,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    location_geom postgis.geometry
);


ALTER TABLE diversea.dataset OWNER TO "owner";

--
-- TOC entry 6944 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN dataset.data_gathering_type_id; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.dataset.data_gathering_type_id IS 'Maybe remove this as I don''t remember what it''s about';


--
-- TOC entry 6945 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN dataset.start_time; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.dataset.start_time IS 'Start of the time period the dataset has been collected';


--
-- TOC entry 6946 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN dataset.end_time; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.dataset.end_time IS 'End of the time period the dataset has been collected. NULL if ther is none';


--
-- TOC entry 225 (class 1259 OID 63146)
-- Name: dataset_categories; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.dataset_categories (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE diversea.dataset_categories OWNER TO "owner";

--
-- TOC entry 6948 (class 0 OID 0)
-- Dependencies: 225
-- Name: TABLE dataset_categories; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.dataset_categories IS 'Categories whether the data has been cleaned up or completely raw';


--
-- TOC entry 224 (class 1259 OID 63145)
-- Name: dataset_categories_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.dataset_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.dataset_categories_id_seq OWNER TO "owner";

--
-- TOC entry 6950 (class 0 OID 0)
-- Dependencies: 224
-- Name: dataset_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.dataset_categories_id_seq OWNED BY diversea.dataset_categories.id;


--
-- TOC entry 238 (class 1259 OID 63202)
-- Name: dataset_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.dataset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.dataset_id_seq OWNER TO "owner";

--
-- TOC entry 6952 (class 0 OID 0)
-- Dependencies: 238
-- Name: dataset_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.dataset_id_seq OWNED BY diversea.dataset.id;


--
-- TOC entry 993 (class 1259 OID 174067)
-- Name: ecological_status_class; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.ecological_status_class (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE diversea.ecological_status_class OWNER TO "owner";

--
-- TOC entry 992 (class 1259 OID 174066)
-- Name: ecological_status_class_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.ecological_status_class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.ecological_status_class_id_seq OWNER TO "owner";

--
-- TOC entry 6954 (class 0 OID 0)
-- Dependencies: 992
-- Name: ecological_status_class_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.ecological_status_class_id_seq OWNED BY diversea.ecological_status_class.id;


--
-- TOC entry 294 (class 1259 OID 63519)
-- Name: eukaryotes_edna_results; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.eukaryotes_edna_results (
    id integer NOT NULL,
    sample_id integer NOT NULL,
    species_id integer NOT NULL,
    tax_count bigint
);


ALTER TABLE diversea.eukaryotes_edna_results OWNER TO "owner";

--
-- TOC entry 6955 (class 0 OID 0)
-- Dependencies: 294
-- Name: TABLE eukaryotes_edna_results; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.eukaryotes_edna_results IS 'Derived from Hellenic eDNA data, RDS file, otu_table()';


--
-- TOC entry 293 (class 1259 OID 63518)
-- Name: eukaryotes_edna_results_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.eukaryotes_edna_results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.eukaryotes_edna_results_id_seq OWNER TO "owner";

--
-- TOC entry 6957 (class 0 OID 0)
-- Dependencies: 293
-- Name: eukaryotes_edna_results_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.eukaryotes_edna_results_id_seq OWNED BY diversea.eukaryotes_edna_results.id;


--
-- TOC entry 241 (class 1259 OID 63212)
-- Name: eukaryotes_edna_samples; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.eukaryotes_edna_samples (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    code character varying,
    depth character varying,
    latitude numeric,
    longitude numeric,
    location character varying,
    season character varying,
    description character varying
);


ALTER TABLE diversea.eukaryotes_edna_samples OWNER TO "owner";

--
-- TOC entry 6959 (class 0 OID 0)
-- Dependencies: 241
-- Name: TABLE eukaryotes_edna_samples; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.eukaryotes_edna_samples IS 'Derived from Hellenic eDNA data, RDS file, sample_data()';


--
-- TOC entry 240 (class 1259 OID 63211)
-- Name: eukaryotes_edna_samples_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.eukaryotes_edna_samples_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.eukaryotes_edna_samples_id_seq OWNER TO "owner";

--
-- TOC entry 6961 (class 0 OID 0)
-- Dependencies: 240
-- Name: eukaryotes_edna_samples_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.eukaryotes_edna_samples_id_seq OWNED BY diversea.eukaryotes_edna_samples.id;


--
-- TOC entry 243 (class 1259 OID 63221)
-- Name: eukaryotes_edna_species; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.eukaryotes_edna_species (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    code character varying,
    domain character varying,
    clade_1 character varying,
    clade_2 character varying,
    phylum character varying,
    class character varying,
    "order" character varying,
    family character varying,
    genus character varying,
    species character varying,
    sequence character varying
);


ALTER TABLE diversea.eukaryotes_edna_species OWNER TO "owner";

--
-- TOC entry 6963 (class 0 OID 0)
-- Dependencies: 243
-- Name: TABLE eukaryotes_edna_species; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.eukaryotes_edna_species IS 'Derived from Hellenic eDNA data, RDS file, tax_table()';


--
-- TOC entry 242 (class 1259 OID 63220)
-- Name: eukaryotes_edna_species_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.eukaryotes_edna_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.eukaryotes_edna_species_id_seq OWNER TO "owner";

--
-- TOC entry 6965 (class 0 OID 0)
-- Dependencies: 242
-- Name: eukaryotes_edna_species_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.eukaryotes_edna_species_id_seq OWNED BY diversea.eukaryotes_edna_species.id;


--
-- TOC entry 245 (class 1259 OID 63230)
-- Name: fish_data; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.fish_data (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    sample_id integer,
    sample_datetime timestamp without time zone,
    sampling_protocol_id integer,
    sampling_effort character varying,
    location character varying,
    latitude numeric,
    longitude numeric,
    species_name character varying,
    species_count integer,
    species_weight numeric,
    geom postgis.geometry
);


ALTER TABLE diversea.fish_data OWNER TO "owner";

--
-- TOC entry 6967 (class 0 OID 0)
-- Dependencies: 245
-- Name: TABLE fish_data; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.fish_data IS 'Derived from UA fish samples and data';


--
-- TOC entry 244 (class 1259 OID 63229)
-- Name: fish_data_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.fish_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.fish_data_id_seq OWNER TO "owner";

--
-- TOC entry 6969 (class 0 OID 0)
-- Dependencies: 244
-- Name: fish_data_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.fish_data_id_seq OWNED BY diversea.fish_data.id;


--
-- TOC entry 296 (class 1259 OID 63526)
-- Name: ground_surveys_habitat; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.ground_surveys_habitat (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    location character varying,
    date_time timestamp without time zone,
    latitude numeric,
    longitude numeric,
    depth numeric,
    habitat character varying,
    video_id integer NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE diversea.ground_surveys_habitat OWNER TO "owner";

--
-- TOC entry 6971 (class 0 OID 0)
-- Dependencies: 296
-- Name: TABLE ground_surveys_habitat; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.ground_surveys_habitat IS 'Derived from Turkish data samples.';


--
-- TOC entry 295 (class 1259 OID 63525)
-- Name: ground_surveys_habitat_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.ground_surveys_habitat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.ground_surveys_habitat_id_seq OWNER TO "owner";

--
-- TOC entry 6973 (class 0 OID 0)
-- Dependencies: 295
-- Name: ground_surveys_habitat_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.ground_surveys_habitat_id_seq OWNED BY diversea.ground_surveys_habitat.id;


--
-- TOC entry 298 (class 1259 OID 63535)
-- Name: ground_surveys_species; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.ground_surveys_species (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    location character varying,
    date_time timestamp without time zone,
    latitude numeric,
    longitude numeric,
    depth numeric,
    species character varying,
    video_id integer NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE diversea.ground_surveys_species OWNER TO "owner";

--
-- TOC entry 6975 (class 0 OID 0)
-- Dependencies: 298
-- Name: TABLE ground_surveys_species; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.ground_surveys_species IS 'Derived from Turkish data samples.';


--
-- TOC entry 297 (class 1259 OID 63534)
-- Name: ground_surveys_species_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.ground_surveys_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.ground_surveys_species_id_seq OWNER TO "owner";

--
-- TOC entry 6977 (class 0 OID 0)
-- Dependencies: 297
-- Name: ground_surveys_species_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.ground_surveys_species_id_seq OWNED BY diversea.ground_surveys_species.id;


--
-- TOC entry 790 (class 1259 OID 68236)
-- Name: hydrophones_cetaseans_detection; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.hydrophones_cetaseans_detection (
    id integer NOT NULL,
    datased_id integer NOT NULL,
    mooring_point_lat numeric,
    mooring_point_lon numeric,
    datetime timestamp without time zone,
    has_cetasians boolean,
    detected_speices character varying
);


ALTER TABLE diversea.hydrophones_cetaseans_detection OWNER TO "owner";

--
-- TOC entry 6979 (class 0 OID 0)
-- Dependencies: 790
-- Name: TABLE hydrophones_cetaseans_detection; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.hydrophones_cetaseans_detection IS 'Based on D2.6 feedback';


--
-- TOC entry 6980 (class 0 OID 0)
-- Dependencies: 790
-- Name: COLUMN hydrophones_cetaseans_detection.detected_speices; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.hydrophones_cetaseans_detection.detected_speices IS 'Contains only one species; If many then many rows';


--
-- TOC entry 789 (class 1259 OID 68235)
-- Name: hydrophones_cetaseans_detection_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.hydrophones_cetaseans_detection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.hydrophones_cetaseans_detection_id_seq OWNER TO "owner";

--
-- TOC entry 6982 (class 0 OID 0)
-- Dependencies: 789
-- Name: hydrophones_cetaseans_detection_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.hydrophones_cetaseans_detection_id_seq OWNED BY diversea.hydrophones_cetaseans_detection.id;


--
-- TOC entry 1071 (class 1259 OID 348741)
-- Name: hydrophones_locations; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.hydrophones_locations (
    id integer NOT NULL,
    name character varying NOT NULL,
    geom postgis.geometry
);


ALTER TABLE diversea.hydrophones_locations OWNER TO "owner";

--
-- TOC entry 6983 (class 0 OID 0)
-- Dependencies: 1071
-- Name: TABLE hydrophones_locations; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.hydrophones_locations IS 'Derived from Balearic data';


--
-- TOC entry 1070 (class 1259 OID 348740)
-- Name: hydrophones_locations_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.hydrophones_locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.hydrophones_locations_id_seq OWNER TO "owner";

--
-- TOC entry 6984 (class 0 OID 0)
-- Dependencies: 1070
-- Name: hydrophones_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.hydrophones_locations_id_seq OWNED BY diversea.hydrophones_locations.id;


--
-- TOC entry 247 (class 1259 OID 63237)
-- Name: hydrophones_noise_levels; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.hydrophones_noise_levels (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    utc_timestamp timestamp without time zone,
    band_id integer NOT NULL,
    mean numeric,
    median numeric,
    low_95 numeric,
    high_95 numeric,
    min numeric,
    max numeric,
    location_id integer
);


ALTER TABLE diversea.hydrophones_noise_levels OWNER TO "owner";

--
-- TOC entry 6985 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE hydrophones_noise_levels; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.hydrophones_noise_levels IS 'Derived from Ballearic data sample and data';


--
-- TOC entry 246 (class 1259 OID 63236)
-- Name: hydrophones_noise_levels_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.hydrophones_noise_levels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.hydrophones_noise_levels_id_seq OWNER TO "owner";

--
-- TOC entry 6987 (class 0 OID 0)
-- Dependencies: 246
-- Name: hydrophones_noise_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.hydrophones_noise_levels_id_seq OWNED BY diversea.hydrophones_noise_levels.id;


--
-- TOC entry 1149 (class 1259 OID 1260058)
-- Name: hydrophones_whistles; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.hydrophones_whistles (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    filename character varying,
    datetime timestamp without time zone,
    location_id integer,
    presence boolean,
    magic integer
);


ALTER TABLE diversea.hydrophones_whistles OWNER TO "owner";

--
-- TOC entry 6989 (class 0 OID 0)
-- Dependencies: 1149
-- Name: TABLE hydrophones_whistles; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.hydrophones_whistles IS 'Derived from Balearic data.';


--
-- TOC entry 6990 (class 0 OID 0)
-- Dependencies: 1149
-- Name: COLUMN hydrophones_whistles.magic; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.hydrophones_whistles.magic IS 'Some random numbers with no column header';


--
-- TOC entry 1148 (class 1259 OID 1260057)
-- Name: hydrophones_whistles_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.hydrophones_whistles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.hydrophones_whistles_id_seq OWNER TO "owner";

--
-- TOC entry 6991 (class 0 OID 0)
-- Dependencies: 1148
-- Name: hydrophones_whistles_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.hydrophones_whistles_id_seq OWNED BY diversea.hydrophones_whistles.id;


--
-- TOC entry 872 (class 1259 OID 68848)
-- Name: hypso_data_files; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.hypso_data_files (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    "timestamp" timestamp without time zone,
    filepath character varying,
    description character varying
);


ALTER TABLE diversea.hypso_data_files OWNER TO "owner";

--
-- TOC entry 6992 (class 0 OID 0)
-- Dependencies: 872
-- Name: TABLE hypso_data_files; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.hypso_data_files IS 'Derived from Norwegian level 1C TOA Radiance data from HYPSO-1 and HYPSO-2 captures over various DiverSea sites.';


--
-- TOC entry 6993 (class 0 OID 0)
-- Dependencies: 872
-- Name: COLUMN hypso_data_files.description; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.hypso_data_files.description IS 'Might be used if there are other levels than 1C';


--
-- TOC entry 871 (class 1259 OID 68847)
-- Name: hypso_data_files_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.hypso_data_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.hypso_data_files_id_seq OWNER TO "owner";

--
-- TOC entry 6995 (class 0 OID 0)
-- Dependencies: 871
-- Name: hypso_data_files_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.hypso_data_files_id_seq OWNED BY diversea.hypso_data_files.id;


--
-- TOC entry 792 (class 1259 OID 68245)
-- Name: images_aerial; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.images_aerial (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    "timestamp" timestamp without time zone,
    filepath character varying NOT NULL,
    auxilary_filepath character varying
);


ALTER TABLE diversea.images_aerial OWNER TO "owner";

--
-- TOC entry 6996 (class 0 OID 0)
-- Dependencies: 792
-- Name: TABLE images_aerial; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.images_aerial IS 'Derived from Atlantic Aerial data and data samples, and Turkish UAV/Satelite data samples.';


--
-- TOC entry 791 (class 1259 OID 68244)
-- Name: images_aerial_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.images_aerial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.images_aerial_id_seq OWNER TO "owner";

--
-- TOC entry 6998 (class 0 OID 0)
-- Dependencies: 791
-- Name: images_aerial_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.images_aerial_id_seq OWNED BY diversea.images_aerial.id;


--
-- TOC entry 249 (class 1259 OID 63255)
-- Name: images_ground_survey; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.images_ground_survey (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    filepath character varying NOT NULL,
    "timestamp" timestamp without time zone
);


ALTER TABLE diversea.images_ground_survey OWNER TO "owner";

--
-- TOC entry 6999 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE images_ground_survey; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.images_ground_survey IS 'Derived from Turkish Ground Survey data samples.';


--
-- TOC entry 248 (class 1259 OID 63254)
-- Name: images_ground_survey_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.images_ground_survey_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.images_ground_survey_id_seq OWNER TO "owner";

--
-- TOC entry 7001 (class 0 OID 0)
-- Dependencies: 248
-- Name: images_ground_survey_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.images_ground_survey_id_seq OWNED BY diversea.images_ground_survey.id;


--
-- TOC entry 886 (class 1259 OID 72919)
-- Name: images_phytoplankton; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.images_phytoplankton (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    "timestamp" timestamp without time zone,
    filepath character varying NOT NULL
);


ALTER TABLE diversea.images_phytoplankton OWNER TO "owner";

--
-- TOC entry 7003 (class 0 OID 0)
-- Dependencies: 886
-- Name: TABLE images_phytoplankton; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.images_phytoplankton IS 'From Turkish data.';


--
-- TOC entry 885 (class 1259 OID 72918)
-- Name: images_phytoplankton_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.images_phytoplankton_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.images_phytoplankton_id_seq OWNER TO "owner";

--
-- TOC entry 7005 (class 0 OID 0)
-- Dependencies: 885
-- Name: images_phytoplankton_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.images_phytoplankton_id_seq OWNED BY diversea.images_phytoplankton.id;


--
-- TOC entry 794 (class 1259 OID 68296)
-- Name: images_underwater; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.images_underwater (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    "timestamp" timestamp without time zone,
    filepath character varying NOT NULL
);


ALTER TABLE diversea.images_underwater OWNER TO "owner";

--
-- TOC entry 7006 (class 0 OID 0)
-- Dependencies: 794
-- Name: TABLE images_underwater; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.images_underwater IS 'From Atlantic Underwater data samples.';


--
-- TOC entry 793 (class 1259 OID 68295)
-- Name: images_underwater_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.images_underwater_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.images_underwater_id_seq OWNER TO "owner";

--
-- TOC entry 7008 (class 0 OID 0)
-- Dependencies: 793
-- Name: images_underwater_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.images_underwater_id_seq OWNED BY diversea.images_underwater.id;


--
-- TOC entry 251 (class 1259 OID 63273)
-- Name: invasive_alien_species; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.invasive_alien_species (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    sample_date date,
    station_code character varying,
    sampling_protocol_id integer,
    species_name character varying,
    species_abundance numeric,
    habitat character varying,
    record_contributor character varying,
    field_collector character varying
);


ALTER TABLE diversea.invasive_alien_species OWNER TO "owner";

--
-- TOC entry 7009 (class 0 OID 0)
-- Dependencies: 251
-- Name: TABLE invasive_alien_species; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.invasive_alien_species IS 'Derived from UA IAS data';


--
-- TOC entry 7010 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN invasive_alien_species.habitat; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.invasive_alien_species.habitat IS 'Да се прави ли някаква нормализация?';


--
-- TOC entry 250 (class 1259 OID 63272)
-- Name: invasive_alien_species_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.invasive_alien_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.invasive_alien_species_id_seq OWNER TO "owner";

--
-- TOC entry 7012 (class 0 OID 0)
-- Dependencies: 250
-- Name: invasive_alien_species_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.invasive_alien_species_id_seq OWNED BY diversea.invasive_alien_species.id;


--
-- TOC entry 796 (class 1259 OID 68305)
-- Name: lidar_files; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.lidar_files (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    "timestamp" timestamp without time zone,
    filepath character varying NOT NULL
);


ALTER TABLE diversea.lidar_files OWNER TO "owner";

--
-- TOC entry 7014 (class 0 OID 0)
-- Dependencies: 796
-- Name: TABLE lidar_files; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.lidar_files IS 'Derived from Atlantic Lidar data samples and data';


--
-- TOC entry 795 (class 1259 OID 68304)
-- Name: lidar_files_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.lidar_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.lidar_files_id_seq OWNER TO "owner";

--
-- TOC entry 7016 (class 0 OID 0)
-- Dependencies: 795
-- Name: lidar_files_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.lidar_files_id_seq OWNED BY diversea.lidar_files.id;


--
-- TOC entry 963 (class 1259 OID 168529)
-- Name: macrobenthos_general_data; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.macrobenthos_general_data (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    transect character varying,
    station character varying,
    abundance integer,
    species_count integer,
    dominance numeric,
    simpson numeric,
    shannon numeric,
    evenness numeric,
    total_biomass numeric
);


ALTER TABLE diversea.macrobenthos_general_data OWNER TO "owner";

--
-- TOC entry 7017 (class 0 OID 0)
-- Dependencies: 963
-- Name: TABLE macrobenthos_general_data; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.macrobenthos_general_data IS 'Derived from Adriatic/Gabicce data.';


--
-- TOC entry 7018 (class 0 OID 0)
-- Dependencies: 963
-- Name: COLUMN macrobenthos_general_data.abundance; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.macrobenthos_general_data.abundance IS 'Number of individuals per sq. metre';


--
-- TOC entry 7019 (class 0 OID 0)
-- Dependencies: 963
-- Name: COLUMN macrobenthos_general_data.species_count; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.macrobenthos_general_data.species_count IS 'Number of species';


--
-- TOC entry 7020 (class 0 OID 0)
-- Dependencies: 963
-- Name: COLUMN macrobenthos_general_data.dominance; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.macrobenthos_general_data.dominance IS 'Dominance (D)';


--
-- TOC entry 7021 (class 0 OID 0)
-- Dependencies: 963
-- Name: COLUMN macrobenthos_general_data.simpson; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.macrobenthos_general_data.simpson IS 'Simpson (1-D)';


--
-- TOC entry 7022 (class 0 OID 0)
-- Dependencies: 963
-- Name: COLUMN macrobenthos_general_data.shannon; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.macrobenthos_general_data.shannon IS 'Shannon (H)';


--
-- TOC entry 7023 (class 0 OID 0)
-- Dependencies: 963
-- Name: COLUMN macrobenthos_general_data.evenness; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.macrobenthos_general_data.evenness IS 'Evenness (H/lnS)';


--
-- TOC entry 7024 (class 0 OID 0)
-- Dependencies: 963
-- Name: COLUMN macrobenthos_general_data.total_biomass; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.macrobenthos_general_data.total_biomass IS 'Total biomass (g*m-2)';


--
-- TOC entry 962 (class 1259 OID 168528)
-- Name: macrobenthos_general_data_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.macrobenthos_general_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.macrobenthos_general_data_id_seq OWNER TO "owner";

--
-- TOC entry 7025 (class 0 OID 0)
-- Dependencies: 962
-- Name: macrobenthos_general_data_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.macrobenthos_general_data_id_seq OWNED BY diversea.macrobenthos_general_data.id;


--
-- TOC entry 253 (class 1259 OID 63291)
-- Name: macrofauna; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.macrofauna (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    location character varying,
    transact character varying,
    depth numeric,
    latitude character varying,
    longitude character varying,
    station integer,
    total_biomass_avg numeric,
    total_biomass_sd numeric
);


ALTER TABLE diversea.macrofauna OWNER TO "owner";

--
-- TOC entry 7026 (class 0 OID 0)
-- Dependencies: 253
-- Name: TABLE macrofauna; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.macrofauna IS 'Derived from Adriatic sample.';


--
-- TOC entry 255 (class 1259 OID 63300)
-- Name: macrofauna_diversity_index; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.macrofauna_diversity_index (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    location character varying,
    taxa_s_avg numeric,
    taxa_s_sd numeric,
    dominance_d_avg numeric,
    dominance_d_sd numeric,
    shannon_h_avg numeric,
    shannon_h_sd numeric,
    "evenness_e^h/s_avg" numeric,
    "evenness_e^h/s_sd" numeric,
    margalef_avg numeric,
    margalef_sd numeric,
    equitability_j_avg numeric,
    equitability_j_sd numeric
);


ALTER TABLE diversea.macrofauna_diversity_index OWNER TO "owner";

--
-- TOC entry 7028 (class 0 OID 0)
-- Dependencies: 255
-- Name: TABLE macrofauna_diversity_index; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.macrofauna_diversity_index IS 'Derived from Adriatic sample.';


--
-- TOC entry 254 (class 1259 OID 63299)
-- Name: macrofauna_diversity_index_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.macrofauna_diversity_index_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.macrofauna_diversity_index_id_seq OWNER TO "owner";

--
-- TOC entry 7030 (class 0 OID 0)
-- Dependencies: 254
-- Name: macrofauna_diversity_index_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.macrofauna_diversity_index_id_seq OWNED BY diversea.macrofauna_diversity_index.id;


--
-- TOC entry 252 (class 1259 OID 63290)
-- Name: macrofauna_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.macrofauna_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.macrofauna_id_seq OWNER TO "owner";

--
-- TOC entry 7032 (class 0 OID 0)
-- Dependencies: 252
-- Name: macrofauna_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.macrofauna_id_seq OWNED BY diversea.macrofauna.id;


--
-- TOC entry 257 (class 1259 OID 63309)
-- Name: macrofauna_tax_counts; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.macrofauna_tax_counts (
    id integer NOT NULL,
    sample_id integer NOT NULL,
    species_name character varying,
    biomass_avg numeric,
    biomass_sd numeric,
    abundance_avg numeric,
    abundance_sd numeric
);


ALTER TABLE diversea.macrofauna_tax_counts OWNER TO "owner";

--
-- TOC entry 7034 (class 0 OID 0)
-- Dependencies: 257
-- Name: TABLE macrofauna_tax_counts; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.macrofauna_tax_counts IS 'Derived from Adriatic sample';


--
-- TOC entry 256 (class 1259 OID 63308)
-- Name: macrofauna_tax_counts_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.macrofauna_tax_counts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.macrofauna_tax_counts_id_seq OWNER TO "owner";

--
-- TOC entry 7036 (class 0 OID 0)
-- Dependencies: 256
-- Name: macrofauna_tax_counts_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.macrofauna_tax_counts_id_seq OWNED BY diversea.macrofauna_tax_counts.id;


--
-- TOC entry 1007 (class 1259 OID 227635)
-- Name: macrophytes_eco_status; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.macrophytes_eco_status (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    sample_date date,
    location character varying,
    depth numeric,
    swx numeric,
    swx_err numeric,
    esc_id integer
);


ALTER TABLE diversea.macrophytes_eco_status OWNER TO "owner";

--
-- TOC entry 7038 (class 0 OID 0)
-- Dependencies: 1007
-- Name: TABLE macrophytes_eco_status; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.macrophytes_eco_status IS 'Functional indicators for macrophytes which include Ecological Status Class (ESC).
Derived from UA data.';


--
-- TOC entry 7039 (class 0 OID 0)
-- Dependencies: 1007
-- Name: COLUMN macrophytes_eco_status.swx; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.macrophytes_eco_status.swx IS 'm^2/kg';


--
-- TOC entry 1006 (class 1259 OID 227634)
-- Name: macrophytes_eco_status_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.macrophytes_eco_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.macrophytes_eco_status_id_seq OWNER TO "owner";

--
-- TOC entry 7040 (class 0 OID 0)
-- Dependencies: 1006
-- Name: macrophytes_eco_status_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.macrophytes_eco_status_id_seq OWNED BY diversea.macrophytes_eco_status.id;


--
-- TOC entry 259 (class 1259 OID 63318)
-- Name: macrophytobenthos; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.macrophytobenthos (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    date date,
    depth numeric,
    location character varying,
    description character varying,
    coverage numeric,
    frame_size numeric,
    species_name character varying,
    swp numeric,
    swp_error numeric,
    ssp numeric,
    ssp_sign character(1),
    p_biomass_avg numeric,
    p_biomass_avg_sign character(1),
    p_surface_index numeric,
    p_surface_index_sign character(1),
    ocurrence_frequency numeric,
    dominant_coefficient numeric,
    dominant_coefficient_sign character(1),
    sw3dp numeric,
    sw3dp_error numeric,
    biomass_of_population_max numeric,
    biomass_of_population_sign character(1),
    biomass_of_population_avg numeric,
    biomass_of_middow_max numeric,
    biomass_of_middow_avg numeric,
    phytocenosis_surface_index_max numeric,
    phytocenosis_surface_index_avg numeric
);


ALTER TABLE diversea.macrophytobenthos OWNER TO "owner";

--
-- TOC entry 7041 (class 0 OID 0)
-- Dependencies: 259
-- Name: TABLE macrophytobenthos; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.macrophytobenthos IS 'Derived from UA data';


--
-- TOC entry 7042 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN macrophytobenthos.swp; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.macrophytobenthos.swp IS 'S/Wp, m2∙kg-1';


--
-- TOC entry 7043 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN macrophytobenthos.ssp; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.macrophytobenthos.ssp IS 'Ssp, %                (≤25 S/Wp     m2∙kg-1)';


--
-- TOC entry 7044 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN macrophytobenthos.ssp_sign; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.macrophytobenthos.ssp_sign IS 'Used when SSP is not a value but rather ''+'' or ''-''';


--
-- TOC entry 7045 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN macrophytobenthos.p_biomass_avg_sign; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.macrophytobenthos.p_biomass_avg_sign IS 'Used when it''s not a value';


--
-- TOC entry 7046 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN macrophytobenthos.p_surface_index_sign; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.macrophytobenthos.p_surface_index_sign IS 'Used when it''s not a value';


--
-- TOC entry 7047 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN macrophytobenthos.dominant_coefficient_sign; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.macrophytobenthos.dominant_coefficient_sign IS 'Used when it''s not a value';


--
-- TOC entry 261 (class 1259 OID 63327)
-- Name: macrophytobenthos_frame; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.macrophytobenthos_frame (
    id integer NOT NULL,
    sample_id integer NOT NULL,
    biomass numeric,
    biomass_sign character(1),
    surface_index numeric,
    surface_index_sign character(1)
);


ALTER TABLE diversea.macrophytobenthos_frame OWNER TO "owner";

--
-- TOC entry 260 (class 1259 OID 63326)
-- Name: macrophytobenthos_frame_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.macrophytobenthos_frame_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.macrophytobenthos_frame_id_seq OWNER TO "owner";

--
-- TOC entry 7050 (class 0 OID 0)
-- Dependencies: 260
-- Name: macrophytobenthos_frame_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.macrophytobenthos_frame_id_seq OWNED BY diversea.macrophytobenthos_frame.id;


--
-- TOC entry 258 (class 1259 OID 63317)
-- Name: macrophytobenthos_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.macrophytobenthos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.macrophytobenthos_id_seq OWNER TO "owner";

--
-- TOC entry 7052 (class 0 OID 0)
-- Dependencies: 258
-- Name: macrophytobenthos_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.macrophytobenthos_id_seq OWNED BY diversea.macrophytobenthos.id;


--
-- TOC entry 263 (class 1259 OID 63336)
-- Name: macrozoobenthos; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.macrozoobenthos (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    location character varying(100),
    sample_no bigint,
    sample_date date,
    substrate_id integer NOT NULL,
    depth numeric,
    sample_code character varying,
    replicates_count integer,
    sampling_device_id integer NOT NULL,
    species_name character varying,
    abundance integer,
    biomass numeric
);


ALTER TABLE diversea.macrozoobenthos OWNER TO "owner";

--
-- TOC entry 7054 (class 0 OID 0)
-- Dependencies: 263
-- Name: TABLE macrozoobenthos; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.macrozoobenthos IS 'Derived from UA data';


--
-- TOC entry 7055 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN macrozoobenthos.substrate_id; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.macrozoobenthos.substrate_id IS 'Да бъде ли номерче, или да си е текста?';


--
-- TOC entry 7056 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN macrozoobenthos.sampling_device_id; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.macrozoobenthos.sampling_device_id IS 'Да бъде ли номерче или текст?';


--
-- TOC entry 1009 (class 1259 OID 227680)
-- Name: macrozoobenthos_eco_status; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.macrozoobenthos_eco_status (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    location character varying(9999999),
    sample_date date,
    m_ambi numeric,
    esc_id integer,
    depth numeric
);


ALTER TABLE diversea.macrozoobenthos_eco_status OWNER TO "owner";

--
-- TOC entry 7058 (class 0 OID 0)
-- Dependencies: 1009
-- Name: TABLE macrozoobenthos_eco_status; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.macrozoobenthos_eco_status IS 'Derived from Black Sea data.';


--
-- TOC entry 1004 (class 1259 OID 227632)
-- Name: macrozoobenthos_eco_status_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.macrozoobenthos_eco_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.macrozoobenthos_eco_status_id_seq OWNER TO "owner";

--
-- TOC entry 7059 (class 0 OID 0)
-- Dependencies: 1004
-- Name: macrozoobenthos_eco_status_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.macrozoobenthos_eco_status_id_seq OWNED BY diversea.macrozoobenthos_eco_status.id;


--
-- TOC entry 262 (class 1259 OID 63335)
-- Name: macrozoobenthos_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.macrozoobenthos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.macrozoobenthos_id_seq OWNER TO "owner";

--
-- TOC entry 7060 (class 0 OID 0)
-- Dependencies: 262
-- Name: macrozoobenthos_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.macrozoobenthos_id_seq OWNED BY diversea.macrozoobenthos.id;


--
-- TOC entry 265 (class 1259 OID 63345)
-- Name: marine_litter; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.marine_litter (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    latitude numeric,
    longitude numeric,
    date_time timestamp without time zone,
    type character varying,
    colour character varying,
    cluster character varying,
    size_category character varying,
    description character varying,
    image character varying
);


ALTER TABLE diversea.marine_litter OWNER TO "owner";

--
-- TOC entry 7062 (class 0 OID 0)
-- Dependencies: 265
-- Name: TABLE marine_litter; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.marine_litter IS 'Derived from Atlantic sample data.';


--
-- TOC entry 264 (class 1259 OID 63344)
-- Name: marine_litter_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.marine_litter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.marine_litter_id_seq OWNER TO "owner";

--
-- TOC entry 7064 (class 0 OID 0)
-- Dependencies: 264
-- Name: marine_litter_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.marine_litter_id_seq OWNED BY diversea.marine_litter.id;


--
-- TOC entry 267 (class 1259 OID 63354)
-- Name: meiofauna; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.meiofauna (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    location character varying,
    transact character varying,
    depth numeric,
    latitude character varying,
    longitude character varying,
    station integer,
    total_abundance_avg numeric,
    total_abundance_sd numeric,
    total_biomass_avg numeric,
    total_biomass_sd numeric,
    richness_of_taxa_avg numeric,
    richness_of_taxa_sd numeric,
    total_richness_of_taxa numeric,
    ostracods_avg numeric,
    ostracods_sd numeric,
    "ne:co_avg" numeric,
    "ne:co_sd" numeric,
    "ne:ki_avg" numeric,
    "ne:ki_sd" numeric
);


ALTER TABLE diversea.meiofauna OWNER TO "owner";

--
-- TOC entry 7066 (class 0 OID 0)
-- Dependencies: 267
-- Name: TABLE meiofauna; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.meiofauna IS 'Derived from Adriatic sample.';


--
-- TOC entry 7067 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN meiofauna.total_abundance_avg; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.meiofauna.total_abundance_avg IS 'n. ind 10 cm-2';


--
-- TOC entry 7068 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN meiofauna.total_abundance_sd; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.meiofauna.total_abundance_sd IS 'n. ind 10 cm-2';


--
-- TOC entry 7069 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN meiofauna.total_biomass_avg; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.meiofauna.total_biomass_avg IS 'µg C 10 cm-2';


--
-- TOC entry 7070 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN meiofauna.total_biomass_sd; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.meiofauna.total_biomass_sd IS 'µg C 10 cm-2';


--
-- TOC entry 7071 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN meiofauna.ostracods_avg; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.meiofauna.ostracods_avg IS 'ind. 10 cm2';


--
-- TOC entry 7072 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN meiofauna.ostracods_sd; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.meiofauna.ostracods_sd IS 'ind. 10 cm2';


--
-- TOC entry 266 (class 1259 OID 63353)
-- Name: meiofauna_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.meiofauna_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.meiofauna_id_seq OWNER TO "owner";

--
-- TOC entry 7074 (class 0 OID 0)
-- Dependencies: 266
-- Name: meiofauna_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.meiofauna_id_seq OWNED BY diversea.meiofauna.id;


--
-- TOC entry 925 (class 1259 OID 168119)
-- Name: microbiome_composition_results; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.microbiome_composition_results (
    id integer NOT NULL,
    sample_id integer NOT NULL,
    species_id integer NOT NULL,
    tax_count bigint
);


ALTER TABLE diversea.microbiome_composition_results OWNER TO "owner";

--
-- TOC entry 7076 (class 0 OID 0)
-- Dependencies: 925
-- Name: TABLE microbiome_composition_results; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.microbiome_composition_results IS 'Derived from Adriatic data feature tables';


--
-- TOC entry 924 (class 1259 OID 168118)
-- Name: microbiome_composition_results_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.microbiome_composition_results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.microbiome_composition_results_id_seq OWNER TO "owner";

--
-- TOC entry 7077 (class 0 OID 0)
-- Dependencies: 924
-- Name: microbiome_composition_results_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.microbiome_composition_results_id_seq OWNED BY diversea.microbiome_composition_results.id;


--
-- TOC entry 923 (class 1259 OID 168105)
-- Name: microbiome_composition_samples; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.microbiome_composition_samples (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    code character varying,
    description character varying
);


ALTER TABLE diversea.microbiome_composition_samples OWNER TO "owner";

--
-- TOC entry 7078 (class 0 OID 0)
-- Dependencies: 923
-- Name: TABLE microbiome_composition_samples; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.microbiome_composition_samples IS 'Derived from Adriatic data';


--
-- TOC entry 922 (class 1259 OID 168104)
-- Name: microbiome_composition_samples_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.microbiome_composition_samples_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.microbiome_composition_samples_id_seq OWNER TO "owner";

--
-- TOC entry 7079 (class 0 OID 0)
-- Dependencies: 922
-- Name: microbiome_composition_samples_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.microbiome_composition_samples_id_seq OWNED BY diversea.microbiome_composition_samples.id;


--
-- TOC entry 921 (class 1259 OID 168091)
-- Name: microbiome_taxonomy_species; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.microbiome_taxonomy_species (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    code character varying,
    domain character varying,
    supergroup character varying,
    kingdom character varying,
    phylum character varying,
    class character varying,
    "order" character varying,
    family character varying,
    genus character varying,
    species character varying
);


ALTER TABLE diversea.microbiome_taxonomy_species OWNER TO "owner";

--
-- TOC entry 7080 (class 0 OID 0)
-- Dependencies: 921
-- Name: TABLE microbiome_taxonomy_species; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.microbiome_taxonomy_species IS 'Derived from Adriatic taxonomy tables';


--
-- TOC entry 920 (class 1259 OID 168090)
-- Name: microbiome_taxonomy_species_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.microbiome_taxonomy_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.microbiome_taxonomy_species_id_seq OWNER TO "owner";

--
-- TOC entry 7081 (class 0 OID 0)
-- Dependencies: 920
-- Name: microbiome_taxonomy_species_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.microbiome_taxonomy_species_id_seq OWNED BY diversea.microbiome_taxonomy_species.id;


--
-- TOC entry 227 (class 1259 OID 63153)
-- Name: noise_level_bands; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.noise_level_bands (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE diversea.noise_level_bands OWNER TO "owner";

--
-- TOC entry 226 (class 1259 OID 63152)
-- Name: noise_level_bands_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.noise_level_bands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.noise_level_bands_id_seq OWNER TO "owner";

--
-- TOC entry 7083 (class 0 OID 0)
-- Dependencies: 226
-- Name: noise_level_bands_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.noise_level_bands_id_seq OWNED BY diversea.noise_level_bands.id;


--
-- TOC entry 900 (class 1259 OID 73084)
-- Name: organization; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.organization (
    id integer NOT NULL,
    name character varying,
    details character varying
);


ALTER TABLE diversea.organization OWNER TO "owner";

--
-- TOC entry 899 (class 1259 OID 73083)
-- Name: organization_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.organization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.organization_id_seq OWNER TO "owner";

--
-- TOC entry 7086 (class 0 OID 0)
-- Dependencies: 899
-- Name: organization_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.organization_id_seq OWNED BY diversea.organization.id;


--
-- TOC entry 269 (class 1259 OID 63363)
-- Name: phytoplankton; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.phytoplankton (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    location character varying,
    date date,
    species_name character varying,
    cell_volume numeric,
    abundance numeric,
    biomass numeric,
    carbon_biomass numeric,
    surface numeric,
    sw numeric,
    abundance_mean numeric,
    abundance_std numeric
);


ALTER TABLE diversea.phytoplankton OWNER TO "owner";

--
-- TOC entry 7087 (class 0 OID 0)
-- Dependencies: 269
-- Name: TABLE phytoplankton; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.phytoplankton IS 'Derived from UA data. Cutoff from sample data compared to previous model.

Also Turkish data.';


--
-- TOC entry 7088 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN phytoplankton.cell_volume; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.phytoplankton.cell_volume IS 'µm3';


--
-- TOC entry 7089 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN phytoplankton.abundance; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.phytoplankton.abundance IS '*1000cells/l';


--
-- TOC entry 7090 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN phytoplankton.biomass; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.phytoplankton.biomass IS 'mg/m3';


--
-- TOC entry 7091 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN phytoplankton.carbon_biomass; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.phytoplankton.carbon_biomass IS 'mg/m3';


--
-- TOC entry 7092 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN phytoplankton.surface; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.phytoplankton.surface IS 'µm2';


--
-- TOC entry 7093 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN phytoplankton.abundance_mean; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.phytoplankton.abundance_mean IS 'Derived from Turkish data.';


--
-- TOC entry 7094 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN phytoplankton.abundance_std; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.phytoplankton.abundance_std IS 'Derived from Turkish data. Standard deviation';


--
-- TOC entry 1008 (class 1259 OID 227662)
-- Name: phytoplankton_eco_status; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.phytoplankton_eco_status (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    sample_date date,
    esc_id integer,
    location character varying(9999999),
    avg_cell_volume numeric,
    total_abundance numeric,
    total_biomass numeric,
    total_carbon_biomass numeric
);


ALTER TABLE diversea.phytoplankton_eco_status OWNER TO "owner";

--
-- TOC entry 7096 (class 0 OID 0)
-- Dependencies: 1008
-- Name: TABLE phytoplankton_eco_status; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.phytoplankton_eco_status IS 'Derived from Black Sea data.';


--
-- TOC entry 1005 (class 1259 OID 227633)
-- Name: phytoplankton_eco_status_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.phytoplankton_eco_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.phytoplankton_eco_status_id_seq OWNER TO "owner";

--
-- TOC entry 7097 (class 0 OID 0)
-- Dependencies: 1005
-- Name: phytoplankton_eco_status_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.phytoplankton_eco_status_id_seq OWNED BY diversea.phytoplankton_eco_status.id;


--
-- TOC entry 268 (class 1259 OID 63362)
-- Name: phytoplankton_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.phytoplankton_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.phytoplankton_id_seq OWNER TO "owner";

--
-- TOC entry 7098 (class 0 OID 0)
-- Dependencies: 268
-- Name: phytoplankton_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.phytoplankton_id_seq OWNED BY diversea.phytoplankton.id;


--
-- TOC entry 1069 (class 1259 OID 348727)
-- Name: phytoplankton_results; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.phytoplankton_results (
    id integer NOT NULL,
    sample_id integer NOT NULL,
    species_name character varying,
    abundance numeric,
    biomass numeric
);


ALTER TABLE diversea.phytoplankton_results OWNER TO "owner";

--
-- TOC entry 1068 (class 1259 OID 348726)
-- Name: phytoplankton_results_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.phytoplankton_results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.phytoplankton_results_id_seq OWNER TO "owner";

--
-- TOC entry 7100 (class 0 OID 0)
-- Dependencies: 1068
-- Name: phytoplankton_results_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.phytoplankton_results_id_seq OWNED BY diversea.phytoplankton_results.id;


--
-- TOC entry 1067 (class 1259 OID 348713)
-- Name: phytoplankton_samples; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.phytoplankton_samples (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    code character varying,
    latitude numeric,
    longitude numeric,
    location character varying,
    depth character varying,
    stress character varying,
    date_month character varying,
    date_year integer,
    description character varying
);


ALTER TABLE diversea.phytoplankton_samples OWNER TO "owner";

--
-- TOC entry 7101 (class 0 OID 0)
-- Dependencies: 1067
-- Name: TABLE phytoplankton_samples; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.phytoplankton_samples IS 'Derived from Hellenic data.';


--
-- TOC entry 1066 (class 1259 OID 348712)
-- Name: phytoplankton_samples_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.phytoplankton_samples_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.phytoplankton_samples_id_seq OWNER TO "owner";

--
-- TOC entry 7102 (class 0 OID 0)
-- Dependencies: 1066
-- Name: phytoplankton_samples_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.phytoplankton_samples_id_seq OWNED BY diversea.phytoplankton_samples.id;


--
-- TOC entry 1314 (class 1259 OID 1269145)
-- Name: posidonia_analysis; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.posidonia_analysis (
    id integer NOT NULL,
    date date,
    sample_id integer NOT NULL
);


ALTER TABLE diversea.posidonia_analysis OWNER TO "owner";

--
-- TOC entry 1304 (class 1259 OID 1269134)
-- Name: posidonia_analysis_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.posidonia_analysis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.posidonia_analysis_id_seq OWNER TO "owner";

--
-- TOC entry 7103 (class 0 OID 0)
-- Dependencies: 1304
-- Name: posidonia_analysis_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.posidonia_analysis_id_seq OWNED BY diversea.posidonia_analysis.id;


--
-- TOC entry 1315 (class 1259 OID 1269149)
-- Name: posidonia_biomass; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.posidonia_biomass (
    id integer NOT NULL,
    analysis_id integer NOT NULL,
    rhizome_code character varying,
    adult_green_leaf_weight numeric,
    leaf_base_weight numeric,
    other_leaves_weight numeric,
    leaf_total_weight numeric,
    epiphyte_gross_weight numeric,
    epiphyte_tare numeric,
    epiphyte_biomass numeric,
    leaf_base_length numeric,
    leaf_total_length numeric,
    apex character varying,
    foglia_total_length numeric,
    density numeric,
    sample_origin character varying
);


ALTER TABLE diversea.posidonia_biomass OWNER TO "owner";

--
-- TOC entry 1305 (class 1259 OID 1269135)
-- Name: posidonia_biomass_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.posidonia_biomass_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.posidonia_biomass_id_seq OWNER TO "owner";

--
-- TOC entry 7104 (class 0 OID 0)
-- Dependencies: 1305
-- Name: posidonia_biomass_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.posidonia_biomass_id_seq OWNED BY diversea.posidonia_biomass.id;


--
-- TOC entry 1316 (class 1259 OID 1269155)
-- Name: posidonia_field; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.posidonia_field (
    id integer NOT NULL,
    sample_id integer NOT NULL,
    replicate integer,
    coverage numeric,
    density_sq numeric,
    density numeric,
    depth numeric
);


ALTER TABLE diversea.posidonia_field OWNER TO "owner";

--
-- TOC entry 1306 (class 1259 OID 1269136)
-- Name: posidonia_field_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.posidonia_field_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.posidonia_field_id_seq OWNER TO "owner";

--
-- TOC entry 7105 (class 0 OID 0)
-- Dependencies: 1306
-- Name: posidonia_field_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.posidonia_field_id_seq OWNED BY diversea.posidonia_field.id;


--
-- TOC entry 1317 (class 1259 OID 1269161)
-- Name: posidonia_lepido; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.posidonia_lepido (
    id integer NOT NULL,
    analysis_id integer NOT NULL,
    rhizome_code character varying,
    cycle integer,
    year integer,
    undamaged_scales_mean_length numeric,
    base_number_per_year numeric,
    rhizome_length numeric,
    rhizome_weight numeric
);


ALTER TABLE diversea.posidonia_lepido OWNER TO "owner";

--
-- TOC entry 1307 (class 1259 OID 1269137)
-- Name: posidonia_lepido_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.posidonia_lepido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.posidonia_lepido_id_seq OWNER TO "owner";

--
-- TOC entry 7106 (class 0 OID 0)
-- Dependencies: 1307
-- Name: posidonia_lepido_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.posidonia_lepido_id_seq OWNED BY diversea.posidonia_lepido.id;


--
-- TOC entry 1318 (class 1259 OID 1269167)
-- Name: posidonia_phenology; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.posidonia_phenology (
    id integer NOT NULL,
    analysis_id integer NOT NULL,
    shoot_code character varying,
    leaf_number integer,
    phase character varying,
    width numeric,
    total_length numeric,
    necrosed_length numeric,
    base_length numeric,
    green_length numeric,
    apex character varying,
    flower character varying,
    sample_origin character varying
);


ALTER TABLE diversea.posidonia_phenology OWNER TO "owner";

--
-- TOC entry 1308 (class 1259 OID 1269138)
-- Name: posidonia_phenology_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.posidonia_phenology_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.posidonia_phenology_id_seq OWNER TO "owner";

--
-- TOC entry 7107 (class 0 OID 0)
-- Dependencies: 1308
-- Name: posidonia_phenology_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.posidonia_phenology_id_seq OWNED BY diversea.posidonia_phenology.id;


--
-- TOC entry 1319 (class 1259 OID 1269173)
-- Name: posidonia_samples; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.posidonia_samples (
    id integer NOT NULL,
    city character varying,
    town character varying,
    station character varying,
    station_code character varying,
    station_description character varying,
    date date,
    depth numeric,
    latitude numeric,
    longitude numeric,
    substrate_type integer,
    continuity integer,
    composition integer,
    alien_species integer,
    potential_pressures integer,
    signs_of_damage character varying,
    flowering integer,
    lower_limit_depth numeric,
    dataset_id integer NOT NULL
);


ALTER TABLE diversea.posidonia_samples OWNER TO "owner";

--
-- TOC entry 1309 (class 1259 OID 1269139)
-- Name: posidonia_samples_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.posidonia_samples_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.posidonia_samples_id_seq OWNER TO "owner";

--
-- TOC entry 7108 (class 0 OID 0)
-- Dependencies: 1309
-- Name: posidonia_samples_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.posidonia_samples_id_seq OWNED BY diversea.posidonia_samples.id;


--
-- TOC entry 1320 (class 1259 OID 1269179)
-- Name: posidonia_species_coverage; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.posidonia_species_coverage (
    id integer NOT NULL,
    sample_id integer NOT NULL,
    species character varying,
    coverage numeric
);


ALTER TABLE diversea.posidonia_species_coverage OWNER TO "owner";

--
-- TOC entry 1310 (class 1259 OID 1269140)
-- Name: posidonia_species_coverage_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.posidonia_species_coverage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.posidonia_species_coverage_id_seq OWNER TO "owner";

--
-- TOC entry 7109 (class 0 OID 0)
-- Dependencies: 1310
-- Name: posidonia_species_coverage_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.posidonia_species_coverage_id_seq OWNED BY diversea.posidonia_species_coverage.id;


--
-- TOC entry 229 (class 1259 OID 63160)
-- Name: sampling_devices; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.sampling_devices (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    details character varying
);


ALTER TABLE diversea.sampling_devices OWNER TO "owner";

--
-- TOC entry 7110 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE sampling_devices; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.sampling_devices IS 'Reference table for the macrozoobenthos (and mabye others) sampling devices. Derived from UA macrozoobenthos data.';


--
-- TOC entry 228 (class 1259 OID 63159)
-- Name: sampling_devices_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.sampling_devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.sampling_devices_id_seq OWNER TO "owner";

--
-- TOC entry 7112 (class 0 OID 0)
-- Dependencies: 228
-- Name: sampling_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.sampling_devices_id_seq OWNED BY diversea.sampling_devices.id;


--
-- TOC entry 231 (class 1259 OID 63169)
-- Name: sampling_protocols; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.sampling_protocols (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    details character varying
);


ALTER TABLE diversea.sampling_protocols OWNER TO "owner";

--
-- TOC entry 7114 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE sampling_protocols; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.sampling_protocols IS 'Reference table for the fishing (maybe other) protocols. Derived from UA fish data.';


--
-- TOC entry 230 (class 1259 OID 63168)
-- Name: sampling_protocols_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.sampling_protocols_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.sampling_protocols_id_seq OWNER TO "owner";

--
-- TOC entry 7116 (class 0 OID 0)
-- Dependencies: 230
-- Name: sampling_protocols_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.sampling_protocols_id_seq OWNED BY diversea.sampling_protocols.id;


--
-- TOC entry 1321 (class 1259 OID 1269185)
-- Name: seawater_measurements; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.seawater_measurements (
    id integer NOT NULL,
    sample_id integer NOT NULL,
    secchi_depth numeric,
    multimeter_do numeric,
    multimeter_temperature numeric,
    multimeter_ph numeric,
    castaway_temperature numeric,
    castaway_salinity numeric,
    "chl-a" numeric,
    total_suspended_solid numeric,
    "nh4+" numeric,
    "no3-" numeric,
    "no2-" numeric,
    "po4-3" numeric,
    si numeric,
    toc_mg numeric,
    toc_ug numeric,
    poc numeric,
    doc numeric,
    ptc numeric,
    pn numeric
);


ALTER TABLE diversea.seawater_measurements OWNER TO "owner";

--
-- TOC entry 1311 (class 1259 OID 1269141)
-- Name: seawater_measurements_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.seawater_measurements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.seawater_measurements_id_seq OWNER TO "owner";

--
-- TOC entry 7118 (class 0 OID 0)
-- Dependencies: 1311
-- Name: seawater_measurements_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.seawater_measurements_id_seq OWNED BY diversea.seawater_measurements.id;


--
-- TOC entry 1322 (class 1259 OID 1269191)
-- Name: seawater_samples; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.seawater_samples (
    id integer NOT NULL,
    date date,
    station character varying,
    location character varying,
    longitude numeric,
    latitude numeric,
    total_depth numeric,
    sampling_depth_lower_range numeric,
    sampling_depth_upper_range numeric,
    dataset_id integer,
    depth_category character varying
);


ALTER TABLE diversea.seawater_samples OWNER TO "owner";

--
-- TOC entry 1312 (class 1259 OID 1269142)
-- Name: seawater_samples_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.seawater_samples_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.seawater_samples_id_seq OWNER TO "owner";

--
-- TOC entry 7119 (class 0 OID 0)
-- Dependencies: 1312
-- Name: seawater_samples_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.seawater_samples_id_seq OWNED BY diversea.seawater_samples.id;


--
-- TOC entry 233 (class 1259 OID 63178)
-- Name: sediment_contaminants; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.sediment_contaminants (
    id integer NOT NULL,
    name character varying,
    details character varying
);


ALTER TABLE diversea.sediment_contaminants OWNER TO "owner";

--
-- TOC entry 7120 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE sediment_contaminants; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.sediment_contaminants IS 'Derived from Adriatic sample.';


--
-- TOC entry 232 (class 1259 OID 63177)
-- Name: sediment_contaminants_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.sediment_contaminants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.sediment_contaminants_id_seq OWNER TO "owner";

--
-- TOC entry 7122 (class 0 OID 0)
-- Dependencies: 232
-- Name: sediment_contaminants_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.sediment_contaminants_id_seq OWNED BY diversea.sediment_contaminants.id;


--
-- TOC entry 300 (class 1259 OID 63544)
-- Name: sediment_contamination_detail; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.sediment_contamination_detail (
    id integer NOT NULL,
    sample_id integer NOT NULL,
    contaminant_id integer NOT NULL,
    mass numeric
);


ALTER TABLE diversea.sediment_contamination_detail OWNER TO "owner";

--
-- TOC entry 7124 (class 0 OID 0)
-- Dependencies: 300
-- Name: TABLE sediment_contamination_detail; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.sediment_contamination_detail IS 'Derived from Adriatic sample';


--
-- TOC entry 299 (class 1259 OID 63543)
-- Name: sediment_contamination_detail_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.sediment_contamination_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.sediment_contamination_detail_id_seq OWNER TO "owner";

--
-- TOC entry 7126 (class 0 OID 0)
-- Dependencies: 299
-- Name: sediment_contamination_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.sediment_contamination_detail_id_seq OWNED BY diversea.sediment_contamination_detail.id;


--
-- TOC entry 271 (class 1259 OID 63372)
-- Name: sediment_contamination_samples; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.sediment_contamination_samples (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    location character varying,
    transact character varying,
    station character varying,
    depth numeric,
    layer character varying,
    sum_pah_lmw numeric,
    sum_pah_hmw numeric,
    sum_pcb numeric
);


ALTER TABLE diversea.sediment_contamination_samples OWNER TO "owner";

--
-- TOC entry 7128 (class 0 OID 0)
-- Dependencies: 271
-- Name: TABLE sediment_contamination_samples; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.sediment_contamination_samples IS 'Derived from Adriatic sample.';


--
-- TOC entry 7129 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN sediment_contamination_samples.sum_pah_lmw; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.sediment_contamination_samples.sum_pah_lmw IS 'µg/kg';


--
-- TOC entry 7130 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN sediment_contamination_samples.sum_pah_hmw; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.sediment_contamination_samples.sum_pah_hmw IS 'µg/kg';


--
-- TOC entry 7131 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN sediment_contamination_samples.sum_pcb; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.sediment_contamination_samples.sum_pcb IS 'µg/kg';


--
-- TOC entry 270 (class 1259 OID 63371)
-- Name: sediment_contamination_samples_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.sediment_contamination_samples_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.sediment_contamination_samples_id_seq OWNER TO "owner";

--
-- TOC entry 7133 (class 0 OID 0)
-- Dependencies: 270
-- Name: sediment_contamination_samples_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.sediment_contamination_samples_id_seq OWNED BY diversea.sediment_contamination_samples.id;


--
-- TOC entry 1335 (class 1259 OID 1298122)
-- Name: sediment_measurements; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.sediment_measurements (
    id integer,
    dataset_id integer,
    location character varying,
    latitude numeric,
    longitude numeric,
    depth numeric,
    pebble_shells numeric,
    sand numeric,
    silt numeric,
    clay numeric,
    seabed_sediment_class character varying,
    mean_diameter numeric,
    gravel numeric,
    pelite numeric,
    date date,
    station character varying,
    tn numeric,
    toc numeric,
    tc numeric
);


ALTER TABLE diversea.sediment_measurements OWNER TO "owner";

--
-- TOC entry 798 (class 1259 OID 68314)
-- Name: sonar_files; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.sonar_files (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    "timestamp" timestamp without time zone,
    filepath character varying NOT NULL,
    auxilary_filepath character varying,
    geocoded_data_path character varying
);


ALTER TABLE diversea.sonar_files OWNER TO "owner";

--
-- TOC entry 7135 (class 0 OID 0)
-- Dependencies: 798
-- Name: TABLE sonar_files; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.sonar_files IS 'Derived from Turkish SSS data sample.';


--
-- TOC entry 7136 (class 0 OID 0)
-- Dependencies: 798
-- Name: COLUMN sonar_files.geocoded_data_path; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.sonar_files.geocoded_data_path IS 'Vector data for Turkish samle. For Atlantic: .kmz file';


--
-- TOC entry 797 (class 1259 OID 68313)
-- Name: sonar_files_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.sonar_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.sonar_files_id_seq OWNER TO "owner";

--
-- TOC entry 7138 (class 0 OID 0)
-- Dependencies: 797
-- Name: sonar_files_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.sonar_files_id_seq OWNED BY diversea.sonar_files.id;


--
-- TOC entry 235 (class 1259 OID 63187)
-- Name: standards; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.standards (
    id integer NOT NULL,
    name character varying,
    reference character varying
);


ALTER TABLE diversea.standards OWNER TO "owner";

--
-- TOC entry 272 (class 1259 OID 63398)
-- Name: standards_datasets; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.standards_datasets (
    standard_id integer NOT NULL,
    dataset_id integer NOT NULL
);


ALTER TABLE diversea.standards_datasets OWNER TO "owner";

--
-- TOC entry 234 (class 1259 OID 63186)
-- Name: standards_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.standards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.standards_id_seq OWNER TO "owner";

--
-- TOC entry 7141 (class 0 OID 0)
-- Dependencies: 234
-- Name: standards_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.standards_id_seq OWNED BY diversea.standards.id;


--
-- TOC entry 237 (class 1259 OID 63196)
-- Name: substrate_types; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.substrate_types (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE diversea.substrate_types OWNER TO "owner";

--
-- TOC entry 7143 (class 0 OID 0)
-- Dependencies: 237
-- Name: TABLE substrate_types; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.substrate_types IS 'Reference table for the macrozoobenthos (and mabye others) substrate types. Derived from UA macrozoobenthos data.';


--
-- TOC entry 236 (class 1259 OID 63195)
-- Name: substrate_types_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.substrate_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.substrate_types_id_seq OWNER TO "owner";

--
-- TOC entry 7145 (class 0 OID 0)
-- Dependencies: 236
-- Name: substrate_types_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.substrate_types_id_seq OWNED BY diversea.substrate_types.id;


--
-- TOC entry 1079 (class 1259 OID 348777)
-- Name: survey_effort_types; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.survey_effort_types (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE diversea.survey_effort_types OWNER TO "owner";

--
-- TOC entry 7147 (class 0 OID 0)
-- Dependencies: 1079
-- Name: TABLE survey_effort_types; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.survey_effort_types IS 'Derived from Balearic data.';


--
-- TOC entry 1078 (class 1259 OID 348776)
-- Name: survey_effort_types_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.survey_effort_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.survey_effort_types_id_seq OWNER TO "owner";

--
-- TOC entry 7148 (class 0 OID 0)
-- Dependencies: 1078
-- Name: survey_effort_types_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.survey_effort_types_id_seq OWNED BY diversea.survey_effort_types.id;


--
-- TOC entry 1147 (class 1259 OID 1260044)
-- Name: survey_encounter_type; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.survey_encounter_type (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE diversea.survey_encounter_type OWNER TO "owner";

--
-- TOC entry 1146 (class 1259 OID 1260043)
-- Name: survey_encounter_type_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.survey_encounter_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.survey_encounter_type_id_seq OWNER TO "owner";

--
-- TOC entry 7149 (class 0 OID 0)
-- Dependencies: 1146
-- Name: survey_encounter_type_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.survey_encounter_type_id_seq OWNED BY diversea.survey_encounter_type.id;


--
-- TOC entry 1081 (class 1259 OID 348786)
-- Name: survey_tracks_encounters; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.survey_tracks_encounters (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    date_year integer,
    campaign character varying,
    effort_id integer,
    encounter_number integer,
    individual_count integer,
    calves_count integer,
    utc_timestamp timestamp without time zone,
    latitude numeric,
    longitude numeric,
    speed numeric,
    heading numeric,
    species_id integer,
    best_count integer,
    min_count integer,
    max_count integer,
    angle integer,
    distance integer,
    vessel_type_id integer,
    fishing_gear_id integer,
    side boolean,
    encounter_type_id integer
);


ALTER TABLE diversea.survey_tracks_encounters OWNER TO "owner";

--
-- TOC entry 7150 (class 0 OID 0)
-- Dependencies: 1081
-- Name: TABLE survey_tracks_encounters; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.survey_tracks_encounters IS 'Derived from Balearic data.';


--
-- TOC entry 7151 (class 0 OID 0)
-- Dependencies: 1081
-- Name: COLUMN survey_tracks_encounters.side; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.survey_tracks_encounters.side IS '0 for port, 1 for starboard';


--
-- TOC entry 1080 (class 1259 OID 348785)
-- Name: survey_tracks_encounters_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.survey_tracks_encounters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.survey_tracks_encounters_id_seq OWNER TO "owner";

--
-- TOC entry 7152 (class 0 OID 0)
-- Dependencies: 1080
-- Name: survey_tracks_encounters_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.survey_tracks_encounters_id_seq OWNED BY diversea.survey_tracks_encounters.id;


--
-- TOC entry 1075 (class 1259 OID 348759)
-- Name: survey_tracks_fishing_gear; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.survey_tracks_fishing_gear (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE diversea.survey_tracks_fishing_gear OWNER TO "owner";

--
-- TOC entry 7153 (class 0 OID 0)
-- Dependencies: 1075
-- Name: TABLE survey_tracks_fishing_gear; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.survey_tracks_fishing_gear IS 'Derived from Balearic data.';


--
-- TOC entry 1074 (class 1259 OID 348758)
-- Name: survey_tracks_fishing_gear_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.survey_tracks_fishing_gear_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.survey_tracks_fishing_gear_id_seq OWNER TO "owner";

--
-- TOC entry 7154 (class 0 OID 0)
-- Dependencies: 1074
-- Name: survey_tracks_fishing_gear_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.survey_tracks_fishing_gear_id_seq OWNED BY diversea.survey_tracks_fishing_gear.id;


--
-- TOC entry 1073 (class 1259 OID 348750)
-- Name: survey_tracks_species; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.survey_tracks_species (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE diversea.survey_tracks_species OWNER TO "owner";

--
-- TOC entry 7155 (class 0 OID 0)
-- Dependencies: 1073
-- Name: TABLE survey_tracks_species; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.survey_tracks_species IS 'Derived from Balearic data';


--
-- TOC entry 1072 (class 1259 OID 348749)
-- Name: survey_tracks_species_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.survey_tracks_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.survey_tracks_species_id_seq OWNER TO "owner";

--
-- TOC entry 7156 (class 0 OID 0)
-- Dependencies: 1072
-- Name: survey_tracks_species_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.survey_tracks_species_id_seq OWNED BY diversea.survey_tracks_species.id;


--
-- TOC entry 1077 (class 1259 OID 348768)
-- Name: survey_tracks_vessel_type; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.survey_tracks_vessel_type (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE diversea.survey_tracks_vessel_type OWNER TO "owner";

--
-- TOC entry 7157 (class 0 OID 0)
-- Dependencies: 1077
-- Name: TABLE survey_tracks_vessel_type; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.survey_tracks_vessel_type IS 'Derived from Balearic data.';


--
-- TOC entry 1076 (class 1259 OID 348767)
-- Name: survey_tracks_vessel_type_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.survey_tracks_vessel_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.survey_tracks_vessel_type_id_seq OWNER TO "owner";

--
-- TOC entry 7158 (class 0 OID 0)
-- Dependencies: 1076
-- Name: survey_tracks_vessel_type_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.survey_tracks_vessel_type_id_seq OWNED BY diversea.survey_tracks_vessel_type.id;


--
-- TOC entry 1323 (class 1259 OID 1269203)
-- Name: undamaged_scales_lengths; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.undamaged_scales_lengths (
    id integer NOT NULL,
    lepido_id integer NOT NULL,
    "order" integer,
    length numeric
);


ALTER TABLE diversea.undamaged_scales_lengths OWNER TO "owner";

--
-- TOC entry 1313 (class 1259 OID 1269144)
-- Name: undamaged_scales_lengths_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.undamaged_scales_lengths_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.undamaged_scales_lengths_id_seq OWNER TO "owner";

--
-- TOC entry 7159 (class 0 OID 0)
-- Dependencies: 1313
-- Name: undamaged_scales_lengths_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.undamaged_scales_lengths_id_seq OWNED BY diversea.undamaged_scales_lengths.id;


--
-- TOC entry 274 (class 1259 OID 63404)
-- Name: video_ground_survey; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.video_ground_survey (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    filepath character varying NOT NULL,
    "timestamp" timestamp without time zone
);


ALTER TABLE diversea.video_ground_survey OWNER TO "owner";

--
-- TOC entry 7160 (class 0 OID 0)
-- Dependencies: 274
-- Name: TABLE video_ground_survey; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.video_ground_survey IS 'Derived from Turkish Ground Survey data samples.';


--
-- TOC entry 273 (class 1259 OID 63403)
-- Name: video_ground_survey_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.video_ground_survey_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.video_ground_survey_id_seq OWNER TO "owner";

--
-- TOC entry 7162 (class 0 OID 0)
-- Dependencies: 273
-- Name: video_ground_survey_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.video_ground_survey_id_seq OWNED BY diversea.video_ground_survey.id;


--
-- TOC entry 276 (class 1259 OID 63413)
-- Name: water_surveying; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.water_surveying (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    campaign character varying,
    survey_type character varying,
    date_month integer,
    date_year integer,
    "timestamp" timestamp without time zone,
    lattitude numeric,
    longitude numeric,
    slope numeric,
    aspect numeric,
    depth numeric,
    sst numeric,
    bst numeric,
    slope_sst numeric,
    slope_bst numeric,
    chl numeric,
    ssh numeric,
    sla numeric,
    ugosa numeric,
    vgosa numeric
);


ALTER TABLE diversea.water_surveying OWNER TO "owner";

--
-- TOC entry 7164 (class 0 OID 0)
-- Dependencies: 276
-- Name: TABLE water_surveying; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.water_surveying IS 'Derived from Balearic data sample.';


--
-- TOC entry 275 (class 1259 OID 63412)
-- Name: water_surveying_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.water_surveying_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.water_surveying_id_seq OWNER TO "owner";

--
-- TOC entry 7166 (class 0 OID 0)
-- Dependencies: 275
-- Name: water_surveying_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.water_surveying_id_seq OWNED BY diversea.water_surveying.id;


--
-- TOC entry 278 (class 1259 OID 63422)
-- Name: water_temperature_logs; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.water_temperature_logs (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    date_time timestamp without time zone,
    temperature timestamp without time zone
);


ALTER TABLE diversea.water_temperature_logs OWNER TO "owner";

--
-- TOC entry 7168 (class 0 OID 0)
-- Dependencies: 278
-- Name: TABLE water_temperature_logs; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.water_temperature_logs IS 'For  "EnvLoggers Data" from Atlantic. Missing sample.';


--
-- TOC entry 277 (class 1259 OID 63421)
-- Name: water_temperature_logs_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.water_temperature_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.water_temperature_logs_id_seq OWNER TO "owner";

--
-- TOC entry 7170 (class 0 OID 0)
-- Dependencies: 277
-- Name: water_temperature_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.water_temperature_logs_id_seq OWNED BY diversea.water_temperature_logs.id;


--
-- TOC entry 280 (class 1259 OID 63438)
-- Name: zooplankton; Type: TABLE; Schema: diversea; Owner: owner
--

CREATE TABLE diversea.zooplankton (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    location character varying,
    sample_date date,
    volume_of_filtered_water numeric,
    species_name character varying,
    individual_mass numeric,
    individual_count integer,
    abundance integer,
    biomass numeric
);


ALTER TABLE diversea.zooplankton OWNER TO "owner";

--
-- TOC entry 7172 (class 0 OID 0)
-- Dependencies: 280
-- Name: TABLE zooplankton; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON TABLE diversea.zooplankton IS 'Derived from UA data';


--
-- TOC entry 7173 (class 0 OID 0)
-- Dependencies: 280
-- Name: COLUMN zooplankton.individual_mass; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.zooplankton.individual_mass IS 'mg';


--
-- TOC entry 7174 (class 0 OID 0)
-- Dependencies: 280
-- Name: COLUMN zooplankton.abundance; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.zooplankton.abundance IS 'ind m^3';


--
-- TOC entry 7175 (class 0 OID 0)
-- Dependencies: 280
-- Name: COLUMN zooplankton.biomass; Type: COMMENT; Schema: diversea; Owner: owner
--

COMMENT ON COLUMN diversea.zooplankton.biomass IS 'mg m^3';


--
-- TOC entry 279 (class 1259 OID 63437)
-- Name: zooplankton_id_seq; Type: SEQUENCE; Schema: diversea; Owner: owner
--

CREATE SEQUENCE diversea.zooplankton_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE diversea.zooplankton_id_seq OWNER TO "owner";

--
-- TOC entry 7177 (class 0 OID 0)
-- Dependencies: 279
-- Name: zooplankton_id_seq; Type: SEQUENCE OWNED BY; Schema: diversea; Owner: owner
--

ALTER SEQUENCE diversea.zooplankton_id_seq OWNED BY diversea.zooplankton.id;


--
-- TOC entry 6450 (class 2604 OID 63450)
-- Name: abiotic_measurements id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.abiotic_measurements ALTER COLUMN id SET DEFAULT nextval('diversea.abiotic_measurements_id_seq'::regclass);


--
-- TOC entry 6469 (class 2604 OID 73138)
-- Name: audio_hyrdophones id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.audio_hyrdophones ALTER COLUMN id SET DEFAULT nextval('diversea.audio_hyrdophones_id_seq'::regclass);


--
-- TOC entry 6460 (class 2604 OID 63556)
-- Name: bacteria_edna_results id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.bacteria_edna_results ALTER COLUMN id SET DEFAULT nextval('diversea.bacteria_edna_results_id_seq'::regclass);


--
-- TOC entry 6451 (class 2604 OID 63477)
-- Name: bacteria_edna_samples id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.bacteria_edna_samples ALTER COLUMN id SET DEFAULT nextval('diversea.bacteria_edna_samples_id_seq'::regclass);


--
-- TOC entry 6452 (class 2604 OID 63486)
-- Name: bacteria_edna_species id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.bacteria_edna_species ALTER COLUMN id SET DEFAULT nextval('diversea.bacteria_edna_species_id_seq'::regclass);


--
-- TOC entry 6474 (class 2604 OID 168546)
-- Name: benthic_coverage id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.benthic_coverage ALTER COLUMN id SET DEFAULT nextval('diversea.benthic_coverage_id_seq'::regclass);


--
-- TOC entry 6453 (class 2604 OID 63495)
-- Name: biological_pollution id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.biological_pollution ALTER COLUMN id SET DEFAULT nextval('diversea.biological_pollution_id_seq'::regclass);


--
-- TOC entry 6454 (class 2604 OID 63504)
-- Name: ctd_measurements_basic id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.ctd_measurements_basic ALTER COLUMN id SET DEFAULT nextval('diversea.ctd_measurements_basic_id_seq'::regclass);


--
-- TOC entry 6455 (class 2604 OID 63513)
-- Name: ctd_measurements_chemical id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.ctd_measurements_chemical ALTER COLUMN id SET DEFAULT nextval('diversea.ctd_measurements_chemical_id_seq'::regclass);


--
-- TOC entry 6421 (class 2604 OID 63142)
-- Name: data_gathering_types id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.data_gathering_types ALTER COLUMN id SET DEFAULT nextval('diversea.data_gathering_types_id_seq'::regclass);


--
-- TOC entry 6429 (class 2604 OID 63206)
-- Name: dataset id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.dataset ALTER COLUMN id SET DEFAULT nextval('diversea.dataset_id_seq'::regclass);


--
-- TOC entry 6422 (class 2604 OID 63149)
-- Name: dataset_categories id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.dataset_categories ALTER COLUMN id SET DEFAULT nextval('diversea.dataset_categories_id_seq'::regclass);


--
-- TOC entry 6475 (class 2604 OID 174070)
-- Name: ecological_status_class id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.ecological_status_class ALTER COLUMN id SET DEFAULT nextval('diversea.ecological_status_class_id_seq'::regclass);


--
-- TOC entry 6456 (class 2604 OID 63522)
-- Name: eukaryotes_edna_results id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.eukaryotes_edna_results ALTER COLUMN id SET DEFAULT nextval('diversea.eukaryotes_edna_results_id_seq'::regclass);


--
-- TOC entry 6430 (class 2604 OID 63215)
-- Name: eukaryotes_edna_samples id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.eukaryotes_edna_samples ALTER COLUMN id SET DEFAULT nextval('diversea.eukaryotes_edna_samples_id_seq'::regclass);


--
-- TOC entry 6431 (class 2604 OID 63224)
-- Name: eukaryotes_edna_species id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.eukaryotes_edna_species ALTER COLUMN id SET DEFAULT nextval('diversea.eukaryotes_edna_species_id_seq'::regclass);


--
-- TOC entry 6432 (class 2604 OID 63233)
-- Name: fish_data id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.fish_data ALTER COLUMN id SET DEFAULT nextval('diversea.fish_data_id_seq'::regclass);


--
-- TOC entry 6457 (class 2604 OID 63529)
-- Name: ground_surveys_habitat id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.ground_surveys_habitat ALTER COLUMN id SET DEFAULT nextval('diversea.ground_surveys_habitat_id_seq'::regclass);


--
-- TOC entry 6458 (class 2604 OID 63538)
-- Name: ground_surveys_species id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.ground_surveys_species ALTER COLUMN id SET DEFAULT nextval('diversea.ground_surveys_species_id_seq'::regclass);


--
-- TOC entry 6461 (class 2604 OID 68239)
-- Name: hydrophones_cetaseans_detection id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.hydrophones_cetaseans_detection ALTER COLUMN id SET DEFAULT nextval('diversea.hydrophones_cetaseans_detection_id_seq'::regclass);


--
-- TOC entry 6481 (class 2604 OID 348744)
-- Name: hydrophones_locations id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.hydrophones_locations ALTER COLUMN id SET DEFAULT nextval('diversea.hydrophones_locations_id_seq'::regclass);


--
-- TOC entry 6433 (class 2604 OID 63240)
-- Name: hydrophones_noise_levels id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.hydrophones_noise_levels ALTER COLUMN id SET DEFAULT nextval('diversea.hydrophones_noise_levels_id_seq'::regclass);


--
-- TOC entry 6488 (class 2604 OID 1260061)
-- Name: hydrophones_whistles id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.hydrophones_whistles ALTER COLUMN id SET DEFAULT nextval('diversea.hydrophones_whistles_id_seq'::regclass);


--
-- TOC entry 6466 (class 2604 OID 68851)
-- Name: hypso_data_files id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.hypso_data_files ALTER COLUMN id SET DEFAULT nextval('diversea.hypso_data_files_id_seq'::regclass);


--
-- TOC entry 6462 (class 2604 OID 68248)
-- Name: images_aerial id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.images_aerial ALTER COLUMN id SET DEFAULT nextval('diversea.images_aerial_id_seq'::regclass);


--
-- TOC entry 6434 (class 2604 OID 63258)
-- Name: images_ground_survey id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.images_ground_survey ALTER COLUMN id SET DEFAULT nextval('diversea.images_ground_survey_id_seq'::regclass);


--
-- TOC entry 6467 (class 2604 OID 72922)
-- Name: images_phytoplankton id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.images_phytoplankton ALTER COLUMN id SET DEFAULT nextval('diversea.images_phytoplankton_id_seq'::regclass);


--
-- TOC entry 6463 (class 2604 OID 68299)
-- Name: images_underwater id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.images_underwater ALTER COLUMN id SET DEFAULT nextval('diversea.images_underwater_id_seq'::regclass);


--
-- TOC entry 6435 (class 2604 OID 63276)
-- Name: invasive_alien_species id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.invasive_alien_species ALTER COLUMN id SET DEFAULT nextval('diversea.invasive_alien_species_id_seq'::regclass);


--
-- TOC entry 6464 (class 2604 OID 68308)
-- Name: lidar_files id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.lidar_files ALTER COLUMN id SET DEFAULT nextval('diversea.lidar_files_id_seq'::regclass);


--
-- TOC entry 6473 (class 2604 OID 168532)
-- Name: macrobenthos_general_data id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrobenthos_general_data ALTER COLUMN id SET DEFAULT nextval('diversea.macrobenthos_general_data_id_seq'::regclass);


--
-- TOC entry 6436 (class 2604 OID 63294)
-- Name: macrofauna id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrofauna ALTER COLUMN id SET DEFAULT nextval('diversea.macrofauna_id_seq'::regclass);


--
-- TOC entry 6437 (class 2604 OID 63303)
-- Name: macrofauna_diversity_index id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrofauna_diversity_index ALTER COLUMN id SET DEFAULT nextval('diversea.macrofauna_diversity_index_id_seq'::regclass);


--
-- TOC entry 6438 (class 2604 OID 63312)
-- Name: macrofauna_tax_counts id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrofauna_tax_counts ALTER COLUMN id SET DEFAULT nextval('diversea.macrofauna_tax_counts_id_seq'::regclass);


--
-- TOC entry 6476 (class 2604 OID 227638)
-- Name: macrophytes_eco_status id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrophytes_eco_status ALTER COLUMN id SET DEFAULT nextval('diversea.macrophytes_eco_status_id_seq'::regclass);


--
-- TOC entry 6439 (class 2604 OID 63321)
-- Name: macrophytobenthos id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrophytobenthos ALTER COLUMN id SET DEFAULT nextval('diversea.macrophytobenthos_id_seq'::regclass);


--
-- TOC entry 6440 (class 2604 OID 63330)
-- Name: macrophytobenthos_frame id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrophytobenthos_frame ALTER COLUMN id SET DEFAULT nextval('diversea.macrophytobenthos_frame_id_seq'::regclass);


--
-- TOC entry 6441 (class 2604 OID 63339)
-- Name: macrozoobenthos id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrozoobenthos ALTER COLUMN id SET DEFAULT nextval('diversea.macrozoobenthos_id_seq'::regclass);


--
-- TOC entry 6478 (class 2604 OID 227683)
-- Name: macrozoobenthos_eco_status id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrozoobenthos_eco_status ALTER COLUMN id SET DEFAULT nextval('diversea.macrozoobenthos_eco_status_id_seq'::regclass);


--
-- TOC entry 6442 (class 2604 OID 63348)
-- Name: marine_litter id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.marine_litter ALTER COLUMN id SET DEFAULT nextval('diversea.marine_litter_id_seq'::regclass);


--
-- TOC entry 6443 (class 2604 OID 63357)
-- Name: meiofauna id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.meiofauna ALTER COLUMN id SET DEFAULT nextval('diversea.meiofauna_id_seq'::regclass);


--
-- TOC entry 6472 (class 2604 OID 168122)
-- Name: microbiome_composition_results id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.microbiome_composition_results ALTER COLUMN id SET DEFAULT nextval('diversea.microbiome_composition_results_id_seq'::regclass);


--
-- TOC entry 6471 (class 2604 OID 168108)
-- Name: microbiome_composition_samples id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.microbiome_composition_samples ALTER COLUMN id SET DEFAULT nextval('diversea.microbiome_composition_samples_id_seq'::regclass);


--
-- TOC entry 6470 (class 2604 OID 168094)
-- Name: microbiome_taxonomy_species id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.microbiome_taxonomy_species ALTER COLUMN id SET DEFAULT nextval('diversea.microbiome_taxonomy_species_id_seq'::regclass);


--
-- TOC entry 6423 (class 2604 OID 63156)
-- Name: noise_level_bands id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.noise_level_bands ALTER COLUMN id SET DEFAULT nextval('diversea.noise_level_bands_id_seq'::regclass);


--
-- TOC entry 6468 (class 2604 OID 73087)
-- Name: organization id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.organization ALTER COLUMN id SET DEFAULT nextval('diversea.organization_id_seq'::regclass);


--
-- TOC entry 6444 (class 2604 OID 63366)
-- Name: phytoplankton id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.phytoplankton ALTER COLUMN id SET DEFAULT nextval('diversea.phytoplankton_id_seq'::regclass);


--
-- TOC entry 6477 (class 2604 OID 227665)
-- Name: phytoplankton_eco_status id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.phytoplankton_eco_status ALTER COLUMN id SET DEFAULT nextval('diversea.phytoplankton_eco_status_id_seq'::regclass);


--
-- TOC entry 6480 (class 2604 OID 348730)
-- Name: phytoplankton_results id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.phytoplankton_results ALTER COLUMN id SET DEFAULT nextval('diversea.phytoplankton_results_id_seq'::regclass);


--
-- TOC entry 6479 (class 2604 OID 348716)
-- Name: phytoplankton_samples id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.phytoplankton_samples ALTER COLUMN id SET DEFAULT nextval('diversea.phytoplankton_samples_id_seq'::regclass);


--
-- TOC entry 6489 (class 2604 OID 1269148)
-- Name: posidonia_analysis id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.posidonia_analysis ALTER COLUMN id SET DEFAULT nextval('diversea.posidonia_analysis_id_seq'::regclass);


--
-- TOC entry 6490 (class 2604 OID 1269152)
-- Name: posidonia_biomass id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.posidonia_biomass ALTER COLUMN id SET DEFAULT nextval('diversea.posidonia_biomass_id_seq'::regclass);


--
-- TOC entry 6491 (class 2604 OID 1269158)
-- Name: posidonia_field id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.posidonia_field ALTER COLUMN id SET DEFAULT nextval('diversea.posidonia_field_id_seq'::regclass);


--
-- TOC entry 6492 (class 2604 OID 1269164)
-- Name: posidonia_lepido id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.posidonia_lepido ALTER COLUMN id SET DEFAULT nextval('diversea.posidonia_lepido_id_seq'::regclass);


--
-- TOC entry 6493 (class 2604 OID 1269170)
-- Name: posidonia_phenology id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.posidonia_phenology ALTER COLUMN id SET DEFAULT nextval('diversea.posidonia_phenology_id_seq'::regclass);


--
-- TOC entry 6494 (class 2604 OID 1269176)
-- Name: posidonia_samples id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.posidonia_samples ALTER COLUMN id SET DEFAULT nextval('diversea.posidonia_samples_id_seq'::regclass);


--
-- TOC entry 6495 (class 2604 OID 1269182)
-- Name: posidonia_species_coverage id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.posidonia_species_coverage ALTER COLUMN id SET DEFAULT nextval('diversea.posidonia_species_coverage_id_seq'::regclass);


--
-- TOC entry 6424 (class 2604 OID 63163)
-- Name: sampling_devices id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.sampling_devices ALTER COLUMN id SET DEFAULT nextval('diversea.sampling_devices_id_seq'::regclass);


--
-- TOC entry 6425 (class 2604 OID 63172)
-- Name: sampling_protocols id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.sampling_protocols ALTER COLUMN id SET DEFAULT nextval('diversea.sampling_protocols_id_seq'::regclass);


--
-- TOC entry 6496 (class 2604 OID 1269188)
-- Name: seawater_measurements id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.seawater_measurements ALTER COLUMN id SET DEFAULT nextval('diversea.seawater_measurements_id_seq'::regclass);


--
-- TOC entry 6497 (class 2604 OID 1269194)
-- Name: seawater_samples id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.seawater_samples ALTER COLUMN id SET DEFAULT nextval('diversea.seawater_samples_id_seq'::regclass);


--
-- TOC entry 6426 (class 2604 OID 63181)
-- Name: sediment_contaminants id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.sediment_contaminants ALTER COLUMN id SET DEFAULT nextval('diversea.sediment_contaminants_id_seq'::regclass);


--
-- TOC entry 6459 (class 2604 OID 63547)
-- Name: sediment_contamination_detail id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.sediment_contamination_detail ALTER COLUMN id SET DEFAULT nextval('diversea.sediment_contamination_detail_id_seq'::regclass);


--
-- TOC entry 6445 (class 2604 OID 63375)
-- Name: sediment_contamination_samples id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.sediment_contamination_samples ALTER COLUMN id SET DEFAULT nextval('diversea.sediment_contamination_samples_id_seq'::regclass);


--
-- TOC entry 6465 (class 2604 OID 68317)
-- Name: sonar_files id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.sonar_files ALTER COLUMN id SET DEFAULT nextval('diversea.sonar_files_id_seq'::regclass);


--
-- TOC entry 6427 (class 2604 OID 63190)
-- Name: standards id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.standards ALTER COLUMN id SET DEFAULT nextval('diversea.standards_id_seq'::regclass);


--
-- TOC entry 6428 (class 2604 OID 63199)
-- Name: substrate_types id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.substrate_types ALTER COLUMN id SET DEFAULT nextval('diversea.substrate_types_id_seq'::regclass);


--
-- TOC entry 6485 (class 2604 OID 348780)
-- Name: survey_effort_types id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.survey_effort_types ALTER COLUMN id SET DEFAULT nextval('diversea.survey_effort_types_id_seq'::regclass);


--
-- TOC entry 6487 (class 2604 OID 1260047)
-- Name: survey_encounter_type id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.survey_encounter_type ALTER COLUMN id SET DEFAULT nextval('diversea.survey_encounter_type_id_seq'::regclass);


--
-- TOC entry 6486 (class 2604 OID 348789)
-- Name: survey_tracks_encounters id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.survey_tracks_encounters ALTER COLUMN id SET DEFAULT nextval('diversea.survey_tracks_encounters_id_seq'::regclass);


--
-- TOC entry 6483 (class 2604 OID 348762)
-- Name: survey_tracks_fishing_gear id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.survey_tracks_fishing_gear ALTER COLUMN id SET DEFAULT nextval('diversea.survey_tracks_fishing_gear_id_seq'::regclass);


--
-- TOC entry 6482 (class 2604 OID 348753)
-- Name: survey_tracks_species id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.survey_tracks_species ALTER COLUMN id SET DEFAULT nextval('diversea.survey_tracks_species_id_seq'::regclass);


--
-- TOC entry 6484 (class 2604 OID 348771)
-- Name: survey_tracks_vessel_type id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.survey_tracks_vessel_type ALTER COLUMN id SET DEFAULT nextval('diversea.survey_tracks_vessel_type_id_seq'::regclass);


--
-- TOC entry 6498 (class 2604 OID 1269206)
-- Name: undamaged_scales_lengths id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.undamaged_scales_lengths ALTER COLUMN id SET DEFAULT nextval('diversea.undamaged_scales_lengths_id_seq'::regclass);


--
-- TOC entry 6446 (class 2604 OID 63407)
-- Name: video_ground_survey id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.video_ground_survey ALTER COLUMN id SET DEFAULT nextval('diversea.video_ground_survey_id_seq'::regclass);


--
-- TOC entry 6447 (class 2604 OID 63416)
-- Name: water_surveying id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.water_surveying ALTER COLUMN id SET DEFAULT nextval('diversea.water_surveying_id_seq'::regclass);


--
-- TOC entry 6448 (class 2604 OID 63425)
-- Name: water_temperature_logs id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.water_temperature_logs ALTER COLUMN id SET DEFAULT nextval('diversea.water_temperature_logs_id_seq'::regclass);


--
-- TOC entry 6449 (class 2604 OID 63441)
-- Name: zooplankton id; Type: DEFAULT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.zooplankton ALTER COLUMN id SET DEFAULT nextval('diversea.zooplankton_id_seq'::regclass);


--
-- TOC entry 6558 (class 2606 OID 63454)
-- Name: abiotic_measurements pk_abiotic_measurements; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.abiotic_measurements
    ADD CONSTRAINT pk_abiotic_measurements PRIMARY KEY (id, dataset_id);


--
-- TOC entry 6578 (class 2606 OID 63558)
-- Name: bacteria_edna_results pk_bacteria_edna_results; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.bacteria_edna_results
    ADD CONSTRAINT pk_bacteria_edna_results PRIMARY KEY (id, sample_id, species_id);


--
-- TOC entry 6560 (class 2606 OID 63481)
-- Name: bacteria_edna_samples pk_bacteria_edna_samples; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.bacteria_edna_samples
    ADD CONSTRAINT pk_bacteria_edna_samples PRIMARY KEY (id);


--
-- TOC entry 6562 (class 2606 OID 63490)
-- Name: bacteria_edna_species pk_bacteria_edna_species; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.bacteria_edna_species
    ADD CONSTRAINT pk_bacteria_edna_species PRIMARY KEY (id);


--
-- TOC entry 6606 (class 2606 OID 168550)
-- Name: benthic_coverage pk_benthic_coverage; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.benthic_coverage
    ADD CONSTRAINT pk_benthic_coverage PRIMARY KEY (id);


--
-- TOC entry 6564 (class 2606 OID 63499)
-- Name: biological_pollution pk_biological_pollution; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.biological_pollution
    ADD CONSTRAINT pk_biological_pollution PRIMARY KEY (id);


--
-- TOC entry 6566 (class 2606 OID 63508)
-- Name: ctd_measurements_basic pk_ctd_measurements_basic; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.ctd_measurements_basic
    ADD CONSTRAINT pk_ctd_measurements_basic PRIMARY KEY (id);


--
-- TOC entry 6568 (class 2606 OID 63517)
-- Name: ctd_measurements_chemical pk_ctd_measurements_chemical; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.ctd_measurements_chemical
    ADD CONSTRAINT pk_ctd_measurements_chemical PRIMARY KEY (id);


--
-- TOC entry 6500 (class 2606 OID 63144)
-- Name: data_gathering_types pk_data_gathering_types; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.data_gathering_types
    ADD CONSTRAINT pk_data_gathering_types PRIMARY KEY (id);


--
-- TOC entry 6516 (class 2606 OID 63210)
-- Name: dataset pk_dataset; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.dataset
    ADD CONSTRAINT pk_dataset PRIMARY KEY (id);


--
-- TOC entry 6502 (class 2606 OID 63151)
-- Name: dataset_categories pk_dataset_categories; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.dataset_categories
    ADD CONSTRAINT pk_dataset_categories PRIMARY KEY (id);


--
-- TOC entry 6608 (class 2606 OID 174074)
-- Name: ecological_status_class pk_ecological_status_class; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.ecological_status_class
    ADD CONSTRAINT pk_ecological_status_class PRIMARY KEY (id);


--
-- TOC entry 6570 (class 2606 OID 63524)
-- Name: eukaryotes_edna_results pk_eukaryotes_edna_results; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.eukaryotes_edna_results
    ADD CONSTRAINT pk_eukaryotes_edna_results PRIMARY KEY (id, sample_id, species_id);


--
-- TOC entry 6518 (class 2606 OID 63219)
-- Name: eukaryotes_edna_samples pk_eukaryotes_edna_samples; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.eukaryotes_edna_samples
    ADD CONSTRAINT pk_eukaryotes_edna_samples PRIMARY KEY (id);


--
-- TOC entry 6520 (class 2606 OID 63228)
-- Name: eukaryotes_edna_species pk_eukaryotes_edna_species; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.eukaryotes_edna_species
    ADD CONSTRAINT pk_eukaryotes_edna_species PRIMARY KEY (id);


--
-- TOC entry 6572 (class 2606 OID 63533)
-- Name: ground_surveys_habitat pk_ground_surveys_habitat; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.ground_surveys_habitat
    ADD CONSTRAINT pk_ground_surveys_habitat PRIMARY KEY (id);


--
-- TOC entry 6574 (class 2606 OID 63542)
-- Name: ground_surveys_species pk_ground_surveys_species; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.ground_surveys_species
    ADD CONSTRAINT pk_ground_surveys_species PRIMARY KEY (id);


--
-- TOC entry 6580 (class 2606 OID 68243)
-- Name: hydrophones_cetaseans_detection pk_hydrophones_cetaseans_detection; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.hydrophones_cetaseans_detection
    ADD CONSTRAINT pk_hydrophones_cetaseans_detection PRIMARY KEY (id);


--
-- TOC entry 6620 (class 2606 OID 348748)
-- Name: hydrophones_locations pk_hydrophones_locations; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.hydrophones_locations
    ADD CONSTRAINT pk_hydrophones_locations PRIMARY KEY (id);


--
-- TOC entry 6522 (class 2606 OID 63244)
-- Name: hydrophones_noise_levels pk_hydrophones_noise_levels; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.hydrophones_noise_levels
    ADD CONSTRAINT pk_hydrophones_noise_levels PRIMARY KEY (id);


--
-- TOC entry 6634 (class 2606 OID 1260065)
-- Name: hydrophones_whistles pk_hydrophones_whistles; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.hydrophones_whistles
    ADD CONSTRAINT pk_hydrophones_whistles PRIMARY KEY (id);


--
-- TOC entry 6590 (class 2606 OID 68855)
-- Name: hypso_data_files pk_hypso_data_files; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.hypso_data_files
    ADD CONSTRAINT pk_hypso_data_files PRIMARY KEY (id);


--
-- TOC entry 6582 (class 2606 OID 68252)
-- Name: images_aerial pk_images_aerial; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.images_aerial
    ADD CONSTRAINT pk_images_aerial PRIMARY KEY (id);


--
-- TOC entry 6524 (class 2606 OID 63262)
-- Name: images_ground_survey pk_images_ground_survey; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.images_ground_survey
    ADD CONSTRAINT pk_images_ground_survey PRIMARY KEY (id);


--
-- TOC entry 6592 (class 2606 OID 72926)
-- Name: images_phytoplankton pk_images_phytoplankton; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.images_phytoplankton
    ADD CONSTRAINT pk_images_phytoplankton PRIMARY KEY (id);


--
-- TOC entry 6584 (class 2606 OID 68303)
-- Name: images_underwater pk_images_underwater; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.images_underwater
    ADD CONSTRAINT pk_images_underwater PRIMARY KEY (id);


--
-- TOC entry 6596 (class 2606 OID 73142)
-- Name: audio_hyrdophones pk_images_underwater_0; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.audio_hyrdophones
    ADD CONSTRAINT pk_images_underwater_0 PRIMARY KEY (id);


--
-- TOC entry 6526 (class 2606 OID 63280)
-- Name: invasive_alien_species pk_invasive_alien_species; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.invasive_alien_species
    ADD CONSTRAINT pk_invasive_alien_species PRIMARY KEY (id);


--
-- TOC entry 6586 (class 2606 OID 68312)
-- Name: lidar_files pk_lidar_files; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.lidar_files
    ADD CONSTRAINT pk_lidar_files PRIMARY KEY (id);


--
-- TOC entry 6604 (class 2606 OID 168536)
-- Name: macrobenthos_general_data pk_macrobenthos_general_data; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrobenthos_general_data
    ADD CONSTRAINT pk_macrobenthos_general_data PRIMARY KEY (id);


--
-- TOC entry 6528 (class 2606 OID 63298)
-- Name: macrofauna pk_macrofauna; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrofauna
    ADD CONSTRAINT pk_macrofauna PRIMARY KEY (id);


--
-- TOC entry 6542 (class 2606 OID 63361)
-- Name: meiofauna pk_macrofauna_0; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.meiofauna
    ADD CONSTRAINT pk_macrofauna_0 PRIMARY KEY (id);


--
-- TOC entry 6530 (class 2606 OID 63307)
-- Name: macrofauna_diversity_index pk_macrofauna_diversity_index; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrofauna_diversity_index
    ADD CONSTRAINT pk_macrofauna_diversity_index PRIMARY KEY (id);


--
-- TOC entry 6532 (class 2606 OID 63316)
-- Name: macrofauna_tax_counts pk_macrofauna_tax_counts; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrofauna_tax_counts
    ADD CONSTRAINT pk_macrofauna_tax_counts PRIMARY KEY (id, sample_id);


--
-- TOC entry 6610 (class 2606 OID 227642)
-- Name: macrophytes_eco_status pk_macrophytes_eco_status; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrophytes_eco_status
    ADD CONSTRAINT pk_macrophytes_eco_status PRIMARY KEY (id);


--
-- TOC entry 6534 (class 2606 OID 63325)
-- Name: macrophytobenthos pk_macrophytobenthos_individual_measurements; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrophytobenthos
    ADD CONSTRAINT pk_macrophytobenthos_individual_measurements PRIMARY KEY (id);


--
-- TOC entry 6536 (class 2606 OID 63334)
-- Name: macrophytobenthos_frame pk_macrophytobentos_frame; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrophytobenthos_frame
    ADD CONSTRAINT pk_macrophytobentos_frame PRIMARY KEY (id, sample_id);


--
-- TOC entry 6538 (class 2606 OID 63343)
-- Name: macrozoobenthos pk_macrozoobenthos; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrozoobenthos
    ADD CONSTRAINT pk_macrozoobenthos PRIMARY KEY (id);


--
-- TOC entry 6614 (class 2606 OID 227687)
-- Name: macrozoobenthos_eco_status pk_macrozoobenthos_eco_status; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrozoobenthos_eco_status
    ADD CONSTRAINT pk_macrozoobenthos_eco_status PRIMARY KEY (id);


--
-- TOC entry 6540 (class 2606 OID 63352)
-- Name: marine_litter pk_marine_litter; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.marine_litter
    ADD CONSTRAINT pk_marine_litter PRIMARY KEY (id);


--
-- TOC entry 6602 (class 2606 OID 168124)
-- Name: microbiome_composition_results pk_microbiome_composition_results; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.microbiome_composition_results
    ADD CONSTRAINT pk_microbiome_composition_results PRIMARY KEY (id, sample_id, species_id);


--
-- TOC entry 6600 (class 2606 OID 168112)
-- Name: microbiome_composition_samples pk_microbiome_composition_samples; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.microbiome_composition_samples
    ADD CONSTRAINT pk_microbiome_composition_samples PRIMARY KEY (id);


--
-- TOC entry 6598 (class 2606 OID 168098)
-- Name: microbiome_taxonomy_species pk_microbiome_taxonomy_species; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.microbiome_taxonomy_species
    ADD CONSTRAINT pk_microbiome_taxonomy_species PRIMARY KEY (id);


--
-- TOC entry 6504 (class 2606 OID 63158)
-- Name: noise_level_bands pk_noise_level_bands; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.noise_level_bands
    ADD CONSTRAINT pk_noise_level_bands PRIMARY KEY (id);


--
-- TOC entry 6594 (class 2606 OID 73091)
-- Name: organization pk_organization; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.organization
    ADD CONSTRAINT pk_organization PRIMARY KEY (id);


--
-- TOC entry 6544 (class 2606 OID 63370)
-- Name: phytoplankton pk_phytoplankton; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.phytoplankton
    ADD CONSTRAINT pk_phytoplankton PRIMARY KEY (id);


--
-- TOC entry 6612 (class 2606 OID 227669)
-- Name: phytoplankton_eco_status pk_phytoplankton_eco_status; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.phytoplankton_eco_status
    ADD CONSTRAINT pk_phytoplankton_eco_status PRIMARY KEY (id);


--
-- TOC entry 6618 (class 2606 OID 348734)
-- Name: phytoplankton_results pk_phytoplankton_results; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.phytoplankton_results
    ADD CONSTRAINT pk_phytoplankton_results PRIMARY KEY (id);


--
-- TOC entry 6616 (class 2606 OID 348720)
-- Name: phytoplankton_samples pk_phytoplankton_samples; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.phytoplankton_samples
    ADD CONSTRAINT pk_phytoplankton_samples PRIMARY KEY (id);


--
-- TOC entry 6636 (class 2606 OID 1269220)
-- Name: posidonia_analysis pk_posidonia_analysis; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.posidonia_analysis
    ADD CONSTRAINT pk_posidonia_analysis PRIMARY KEY (id);


--
-- TOC entry 6638 (class 2606 OID 1269221)
-- Name: posidonia_biomass pk_posidonia_biomass; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.posidonia_biomass
    ADD CONSTRAINT pk_posidonia_biomass PRIMARY KEY (id);


--
-- TOC entry 6640 (class 2606 OID 1269222)
-- Name: posidonia_field pk_posidonia_field; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.posidonia_field
    ADD CONSTRAINT pk_posidonia_field PRIMARY KEY (id);


--
-- TOC entry 6642 (class 2606 OID 1269223)
-- Name: posidonia_lepido pk_posidonia_lepido; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.posidonia_lepido
    ADD CONSTRAINT pk_posidonia_lepido PRIMARY KEY (id);


--
-- TOC entry 6644 (class 2606 OID 1269224)
-- Name: posidonia_phenology pk_posidonia_phenology; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.posidonia_phenology
    ADD CONSTRAINT pk_posidonia_phenology PRIMARY KEY (id);


--
-- TOC entry 6646 (class 2606 OID 1269225)
-- Name: posidonia_samples pk_posidonia_samples; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.posidonia_samples
    ADD CONSTRAINT pk_posidonia_samples PRIMARY KEY (id);


--
-- TOC entry 6648 (class 2606 OID 1269226)
-- Name: posidonia_species_coverage pk_posidonia_species_coverage; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.posidonia_species_coverage
    ADD CONSTRAINT pk_posidonia_species_coverage PRIMARY KEY (id);


--
-- TOC entry 6506 (class 2606 OID 63167)
-- Name: sampling_devices pk_samping_devices; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.sampling_devices
    ADD CONSTRAINT pk_samping_devices PRIMARY KEY (id);


--
-- TOC entry 6508 (class 2606 OID 63176)
-- Name: sampling_protocols pk_samping_protocols; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.sampling_protocols
    ADD CONSTRAINT pk_samping_protocols PRIMARY KEY (id);


--
-- TOC entry 6650 (class 2606 OID 1269227)
-- Name: seawater_measurements pk_seawater_measurements; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.seawater_measurements
    ADD CONSTRAINT pk_seawater_measurements PRIMARY KEY (id);


--
-- TOC entry 6652 (class 2606 OID 1269228)
-- Name: seawater_samples pk_seawater_samples; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.seawater_samples
    ADD CONSTRAINT pk_seawater_samples PRIMARY KEY (id);


--
-- TOC entry 6510 (class 2606 OID 63185)
-- Name: sediment_contaminants pk_sediment_contaminants; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.sediment_contaminants
    ADD CONSTRAINT pk_sediment_contaminants PRIMARY KEY (id);


--
-- TOC entry 6546 (class 2606 OID 63379)
-- Name: sediment_contamination_samples pk_sediment_contamination; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.sediment_contamination_samples
    ADD CONSTRAINT pk_sediment_contamination PRIMARY KEY (id);


--
-- TOC entry 6576 (class 2606 OID 63551)
-- Name: sediment_contamination_detail pk_sediment_contamination_detail; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.sediment_contamination_detail
    ADD CONSTRAINT pk_sediment_contamination_detail PRIMARY KEY (id, sample_id);


--
-- TOC entry 6588 (class 2606 OID 68321)
-- Name: sonar_files pk_sonar_files; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.sonar_files
    ADD CONSTRAINT pk_sonar_files PRIMARY KEY (id);


--
-- TOC entry 6512 (class 2606 OID 63194)
-- Name: standards pk_standards; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.standards
    ADD CONSTRAINT pk_standards PRIMARY KEY (id);


--
-- TOC entry 6548 (class 2606 OID 63402)
-- Name: standards_datasets pk_standards_datasets; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.standards_datasets
    ADD CONSTRAINT pk_standards_datasets PRIMARY KEY (standard_id, dataset_id);


--
-- TOC entry 6514 (class 2606 OID 63201)
-- Name: substrate_types pk_substrate_types; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.substrate_types
    ADD CONSTRAINT pk_substrate_types PRIMARY KEY (id);


--
-- TOC entry 6628 (class 2606 OID 348784)
-- Name: survey_effort_types pk_survey_effort_types; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.survey_effort_types
    ADD CONSTRAINT pk_survey_effort_types PRIMARY KEY (id);


--
-- TOC entry 6632 (class 2606 OID 1260051)
-- Name: survey_encounter_type pk_survey_encounter_type; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.survey_encounter_type
    ADD CONSTRAINT pk_survey_encounter_type PRIMARY KEY (id);


--
-- TOC entry 6630 (class 2606 OID 348793)
-- Name: survey_tracks_encounters pk_survey_tracks_encounters; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.survey_tracks_encounters
    ADD CONSTRAINT pk_survey_tracks_encounters PRIMARY KEY (id);


--
-- TOC entry 6624 (class 2606 OID 348766)
-- Name: survey_tracks_fishing_gear pk_survey_tracks_fishing_gear; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.survey_tracks_fishing_gear
    ADD CONSTRAINT pk_survey_tracks_fishing_gear PRIMARY KEY (id);


--
-- TOC entry 6622 (class 2606 OID 348757)
-- Name: survey_tracks_species pk_survey_tracks_species; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.survey_tracks_species
    ADD CONSTRAINT pk_survey_tracks_species PRIMARY KEY (id);


--
-- TOC entry 6626 (class 2606 OID 348775)
-- Name: survey_tracks_vessel_type pk_survey_tracks_vessel_type; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.survey_tracks_vessel_type
    ADD CONSTRAINT pk_survey_tracks_vessel_type PRIMARY KEY (id);


--
-- TOC entry 6654 (class 2606 OID 1269230)
-- Name: undamaged_scales_lengths pk_undamaged_scales_lengths; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.undamaged_scales_lengths
    ADD CONSTRAINT pk_undamaged_scales_lengths PRIMARY KEY (id);


--
-- TOC entry 6550 (class 2606 OID 63411)
-- Name: video_ground_survey pk_video_ground_survey; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.video_ground_survey
    ADD CONSTRAINT pk_video_ground_survey PRIMARY KEY (id);


--
-- TOC entry 6554 (class 2606 OID 63427)
-- Name: water_temperature_logs pk_water_temperature_logs; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.water_temperature_logs
    ADD CONSTRAINT pk_water_temperature_logs PRIMARY KEY (id);


--
-- TOC entry 6552 (class 2606 OID 63420)
-- Name: water_surveying pk_whale_encounters_0; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.water_surveying
    ADD CONSTRAINT pk_whale_encounters_0 PRIMARY KEY (id);


--
-- TOC entry 6556 (class 2606 OID 63445)
-- Name: zooplankton pk_zooplankton; Type: CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.zooplankton
    ADD CONSTRAINT pk_zooplankton PRIMARY KEY (id);


--
-- TOC entry 6686 (class 2606 OID 63559)
-- Name: abiotic_measurements fk_abiotic_measurements; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.abiotic_measurements
    ADD CONSTRAINT fk_abiotic_measurements FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id);


--
-- TOC entry 6712 (class 2606 OID 73168)
-- Name: audio_hyrdophones fk_audio_hyrdophones_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.audio_hyrdophones
    ADD CONSTRAINT fk_audio_hyrdophones_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6703 (class 2606 OID 63574)
-- Name: bacteria_edna_results fk_bacteria_edna_results_sample; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.bacteria_edna_results
    ADD CONSTRAINT fk_bacteria_edna_results_sample FOREIGN KEY (sample_id) REFERENCES diversea.bacteria_edna_samples(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6704 (class 2606 OID 63579)
-- Name: bacteria_edna_results fk_bacteria_edna_results_species; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.bacteria_edna_results
    ADD CONSTRAINT fk_bacteria_edna_results_species FOREIGN KEY (species_id) REFERENCES diversea.bacteria_edna_species(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6688 (class 2606 OID 63589)
-- Name: bacteria_edna_species fk_bacteria_edna_species_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.bacteria_edna_species
    ADD CONSTRAINT fk_bacteria_edna_species_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6687 (class 2606 OID 63584)
-- Name: bacteria_edna_samples fk_bacteriaedna_samples_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.bacteria_edna_samples
    ADD CONSTRAINT fk_bacteriaedna_samples_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6718 (class 2606 OID 168551)
-- Name: benthic_coverage fk_benthic_coverage_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.benthic_coverage
    ADD CONSTRAINT fk_benthic_coverage_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6689 (class 2606 OID 63594)
-- Name: biological_pollution fk_biological_pollution_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.biological_pollution
    ADD CONSTRAINT fk_biological_pollution_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6690 (class 2606 OID 63599)
-- Name: biological_pollution fk_biological_pollution_sampling_protocol; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.biological_pollution
    ADD CONSTRAINT fk_biological_pollution_sampling_protocol FOREIGN KEY (sampling_protocol_id) REFERENCES diversea.sampling_protocols(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6691 (class 2606 OID 63604)
-- Name: ctd_measurements_basic fk_ctd_measurements_basic_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.ctd_measurements_basic
    ADD CONSTRAINT fk_ctd_measurements_basic_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6692 (class 2606 OID 63609)
-- Name: ctd_measurements_chemical fk_ctd_measurements_chemical_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.ctd_measurements_chemical
    ADD CONSTRAINT fk_ctd_measurements_chemical_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6655 (class 2606 OID 63614)
-- Name: dataset fk_dataset_category; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.dataset
    ADD CONSTRAINT fk_dataset_category FOREIGN KEY (category_id) REFERENCES diversea.dataset_categories(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6656 (class 2606 OID 63619)
-- Name: dataset fk_dataset_gatheringtype; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.dataset
    ADD CONSTRAINT fk_dataset_gatheringtype FOREIGN KEY (data_gathering_type_id) REFERENCES diversea.data_gathering_types(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6657 (class 2606 OID 73184)
-- Name: dataset fk_dataset_organization; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.dataset
    ADD CONSTRAINT fk_dataset_organization FOREIGN KEY (organization_id) REFERENCES diversea.organization(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6693 (class 2606 OID 63624)
-- Name: eukaryotes_edna_results fk_eukaryotes_edna_results_sample; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.eukaryotes_edna_results
    ADD CONSTRAINT fk_eukaryotes_edna_results_sample FOREIGN KEY (sample_id) REFERENCES diversea.eukaryotes_edna_samples(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6694 (class 2606 OID 63629)
-- Name: eukaryotes_edna_results fk_eukaryotes_edna_results_species; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.eukaryotes_edna_results
    ADD CONSTRAINT fk_eukaryotes_edna_results_species FOREIGN KEY (species_id) REFERENCES diversea.eukaryotes_edna_species(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6658 (class 2606 OID 63634)
-- Name: eukaryotes_edna_samples fk_eukaryotes_edna_samples_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.eukaryotes_edna_samples
    ADD CONSTRAINT fk_eukaryotes_edna_samples_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6659 (class 2606 OID 63639)
-- Name: eukaryotes_edna_species fk_eukaryotes_edna_species_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.eukaryotes_edna_species
    ADD CONSTRAINT fk_eukaryotes_edna_species_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6660 (class 2606 OID 63644)
-- Name: fish_data fk_fish_data_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.fish_data
    ADD CONSTRAINT fk_fish_data_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6661 (class 2606 OID 63649)
-- Name: fish_data fk_fish_data_samping_protocols; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.fish_data
    ADD CONSTRAINT fk_fish_data_samping_protocols FOREIGN KEY (sampling_protocol_id) REFERENCES diversea.sampling_protocols(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6695 (class 2606 OID 63654)
-- Name: ground_surveys_habitat fk_ground_surveys_habitat_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.ground_surveys_habitat
    ADD CONSTRAINT fk_ground_surveys_habitat_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6696 (class 2606 OID 63664)
-- Name: ground_surveys_habitat fk_ground_surveys_habitat_image; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.ground_surveys_habitat
    ADD CONSTRAINT fk_ground_surveys_habitat_image FOREIGN KEY (image_id) REFERENCES diversea.images_ground_survey(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6697 (class 2606 OID 63659)
-- Name: ground_surveys_habitat fk_ground_surveys_habitat_video; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.ground_surveys_habitat
    ADD CONSTRAINT fk_ground_surveys_habitat_video FOREIGN KEY (video_id) REFERENCES diversea.video_ground_survey(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6698 (class 2606 OID 63669)
-- Name: ground_surveys_species fk_ground_surveys_species_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.ground_surveys_species
    ADD CONSTRAINT fk_ground_surveys_species_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6699 (class 2606 OID 63679)
-- Name: ground_surveys_species fk_ground_surveys_species_image; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.ground_surveys_species
    ADD CONSTRAINT fk_ground_surveys_species_image FOREIGN KEY (image_id) REFERENCES diversea.images_ground_survey(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6700 (class 2606 OID 63674)
-- Name: ground_surveys_species fk_ground_surveys_species_video; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.ground_surveys_species
    ADD CONSTRAINT fk_ground_surveys_species_video FOREIGN KEY (video_id) REFERENCES diversea.video_ground_survey(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6705 (class 2606 OID 68290)
-- Name: hydrophones_cetaseans_detection fk_hydrophones_cetaseans_detection_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.hydrophones_cetaseans_detection
    ADD CONSTRAINT fk_hydrophones_cetaseans_detection_dataset FOREIGN KEY (datased_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6662 (class 2606 OID 63689)
-- Name: hydrophones_noise_levels fk_hydrophones_noise_levels_band; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.hydrophones_noise_levels
    ADD CONSTRAINT fk_hydrophones_noise_levels_band FOREIGN KEY (band_id) REFERENCES diversea.noise_level_bands(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6663 (class 2606 OID 63684)
-- Name: hydrophones_noise_levels fk_hydrophones_noise_levels_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.hydrophones_noise_levels
    ADD CONSTRAINT fk_hydrophones_noise_levels_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6664 (class 2606 OID 348819)
-- Name: hydrophones_noise_levels fk_hydrophones_noise_levels_location; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.hydrophones_noise_levels
    ADD CONSTRAINT fk_hydrophones_noise_levels_location FOREIGN KEY (location_id) REFERENCES diversea.hydrophones_locations(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6733 (class 2606 OID 1260066)
-- Name: hydrophones_whistles fk_hydrophones_whistles_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.hydrophones_whistles
    ADD CONSTRAINT fk_hydrophones_whistles_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6734 (class 2606 OID 1260071)
-- Name: hydrophones_whistles fk_hydrophones_whistles_location; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.hydrophones_whistles
    ADD CONSTRAINT fk_hydrophones_whistles_location FOREIGN KEY (location_id) REFERENCES diversea.hydrophones_locations(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6710 (class 2606 OID 68856)
-- Name: hypso_data_files fk_hypso_data_files_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.hypso_data_files
    ADD CONSTRAINT fk_hypso_data_files_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6706 (class 2606 OID 73148)
-- Name: images_aerial fk_images_aerial_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.images_aerial
    ADD CONSTRAINT fk_images_aerial_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6665 (class 2606 OID 63699)
-- Name: images_ground_survey fk_images_ground_survey_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.images_ground_survey
    ADD CONSTRAINT fk_images_ground_survey_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6711 (class 2606 OID 72927)
-- Name: images_phytoplankton fk_images_phytoplankton_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.images_phytoplankton
    ADD CONSTRAINT fk_images_phytoplankton_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6707 (class 2606 OID 73153)
-- Name: images_underwater fk_images_underwater_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.images_underwater
    ADD CONSTRAINT fk_images_underwater_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6666 (class 2606 OID 63709)
-- Name: invasive_alien_species fk_invasive_alien_species_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.invasive_alien_species
    ADD CONSTRAINT fk_invasive_alien_species_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6667 (class 2606 OID 63714)
-- Name: invasive_alien_species fk_invasive_alien_species_sampling_protocol; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.invasive_alien_species
    ADD CONSTRAINT fk_invasive_alien_species_sampling_protocol FOREIGN KEY (sampling_protocol_id) REFERENCES diversea.sampling_protocols(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6708 (class 2606 OID 73158)
-- Name: lidar_files fk_lidar_files_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.lidar_files
    ADD CONSTRAINT fk_lidar_files_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6717 (class 2606 OID 168537)
-- Name: macrobenthos_general_data fk_macrobenthos_general_data_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrobenthos_general_data
    ADD CONSTRAINT fk_macrobenthos_general_data_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6668 (class 2606 OID 63724)
-- Name: macrofauna fk_macrofauna_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrofauna
    ADD CONSTRAINT fk_macrofauna_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6669 (class 2606 OID 63729)
-- Name: macrofauna_diversity_index fk_macrofauna_diversity_index_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrofauna_diversity_index
    ADD CONSTRAINT fk_macrofauna_diversity_index_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6670 (class 2606 OID 63734)
-- Name: macrofauna_tax_counts fk_macrofauna_tax_counts_sample; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrofauna_tax_counts
    ADD CONSTRAINT fk_macrofauna_tax_counts_sample FOREIGN KEY (sample_id) REFERENCES diversea.macrofauna(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6719 (class 2606 OID 227643)
-- Name: macrophytes_eco_status fk_macrophytes_eco_status_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrophytes_eco_status
    ADD CONSTRAINT fk_macrophytes_eco_status_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6720 (class 2606 OID 227648)
-- Name: macrophytes_eco_status fk_macrophytes_eco_status_esc; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrophytes_eco_status
    ADD CONSTRAINT fk_macrophytes_eco_status_esc FOREIGN KEY (esc_id) REFERENCES diversea.ecological_status_class(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6671 (class 2606 OID 63739)
-- Name: macrophytobenthos fk_macrophytobenthos_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrophytobenthos
    ADD CONSTRAINT fk_macrophytobenthos_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6672 (class 2606 OID 63744)
-- Name: macrophytobenthos_frame fk_macrophytobentos_frame_sample; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrophytobenthos_frame
    ADD CONSTRAINT fk_macrophytobentos_frame_sample FOREIGN KEY (sample_id) REFERENCES diversea.macrophytobenthos(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6673 (class 2606 OID 63749)
-- Name: macrozoobenthos fk_macrozoobenthos_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrozoobenthos
    ADD CONSTRAINT fk_macrozoobenthos_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6723 (class 2606 OID 227693)
-- Name: macrozoobenthos_eco_status fk_macrozoobenthos_eco_status_class; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrozoobenthos_eco_status
    ADD CONSTRAINT fk_macrozoobenthos_eco_status_class FOREIGN KEY (esc_id) REFERENCES diversea.ecological_status_class(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6724 (class 2606 OID 227688)
-- Name: macrozoobenthos_eco_status fk_macrozoobenthos_eco_status_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrozoobenthos_eco_status
    ADD CONSTRAINT fk_macrozoobenthos_eco_status_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6674 (class 2606 OID 63754)
-- Name: macrozoobenthos fk_macrozoobenthos_sampling_device; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrozoobenthos
    ADD CONSTRAINT fk_macrozoobenthos_sampling_device FOREIGN KEY (sampling_device_id) REFERENCES diversea.sampling_devices(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6675 (class 2606 OID 63759)
-- Name: macrozoobenthos fk_macrozoobenthos_substrate; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.macrozoobenthos
    ADD CONSTRAINT fk_macrozoobenthos_substrate FOREIGN KEY (substrate_id) REFERENCES diversea.substrate_types(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6676 (class 2606 OID 63764)
-- Name: marine_litter fk_marine_litter_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.marine_litter
    ADD CONSTRAINT fk_marine_litter_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6677 (class 2606 OID 63769)
-- Name: meiofauna fk_meiofauna_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.meiofauna
    ADD CONSTRAINT fk_meiofauna_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6715 (class 2606 OID 168125)
-- Name: microbiome_composition_results fk_microbiome_composition_results_sample; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.microbiome_composition_results
    ADD CONSTRAINT fk_microbiome_composition_results_sample FOREIGN KEY (sample_id) REFERENCES diversea.microbiome_composition_samples(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6716 (class 2606 OID 168130)
-- Name: microbiome_composition_results fk_microbiome_composition_results_species; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.microbiome_composition_results
    ADD CONSTRAINT fk_microbiome_composition_results_species FOREIGN KEY (species_id) REFERENCES diversea.microbiome_taxonomy_species(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6714 (class 2606 OID 168113)
-- Name: microbiome_composition_samples fk_microbiome_composition_samples_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.microbiome_composition_samples
    ADD CONSTRAINT fk_microbiome_composition_samples_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6713 (class 2606 OID 168099)
-- Name: microbiome_taxonomy_species fk_microbiome_taxonomy_species_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.microbiome_taxonomy_species
    ADD CONSTRAINT fk_microbiome_taxonomy_species_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6678 (class 2606 OID 63774)
-- Name: phytoplankton fk_phytoplankton_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.phytoplankton
    ADD CONSTRAINT fk_phytoplankton_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6721 (class 2606 OID 227675)
-- Name: phytoplankton_eco_status fk_phytoplankton_eco_status_class; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.phytoplankton_eco_status
    ADD CONSTRAINT fk_phytoplankton_eco_status_class FOREIGN KEY (esc_id) REFERENCES diversea.ecological_status_class(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6722 (class 2606 OID 227670)
-- Name: phytoplankton_eco_status fk_phytoplankton_eco_status_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.phytoplankton_eco_status
    ADD CONSTRAINT fk_phytoplankton_eco_status_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6726 (class 2606 OID 348735)
-- Name: phytoplankton_results fk_phytoplankton_results_sample; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.phytoplankton_results
    ADD CONSTRAINT fk_phytoplankton_results_sample FOREIGN KEY (sample_id) REFERENCES diversea.phytoplankton_samples(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6725 (class 2606 OID 348721)
-- Name: phytoplankton_samples fk_phytoplankton_samples_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.phytoplankton_samples
    ADD CONSTRAINT fk_phytoplankton_samples_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6738 (class 2606 OID 1269246)
-- Name: posidonia_lepido fk_posedonia_lepido_null; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.posidonia_lepido
    ADD CONSTRAINT fk_posedonia_lepido_null FOREIGN KEY (analysis_id) REFERENCES diversea.posidonia_analysis(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6735 (class 2606 OID 1269231)
-- Name: posidonia_analysis fk_posidonia_analysis_null; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.posidonia_analysis
    ADD CONSTRAINT fk_posidonia_analysis_null FOREIGN KEY (sample_id) REFERENCES diversea.posidonia_samples(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6737 (class 2606 OID 1269241)
-- Name: posidonia_field fk_posidonia_field_null; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.posidonia_field
    ADD CONSTRAINT fk_posidonia_field_null FOREIGN KEY (sample_id) REFERENCES diversea.posidonia_samples(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6739 (class 2606 OID 1269251)
-- Name: posidonia_phenology fk_posidonia_phenology_null; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.posidonia_phenology
    ADD CONSTRAINT fk_posidonia_phenology_null FOREIGN KEY (analysis_id) REFERENCES diversea.posidonia_analysis(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6740 (class 2606 OID 1269256)
-- Name: posidonia_samples fk_posidonia_samples_fish_data; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.posidonia_samples
    ADD CONSTRAINT fk_posidonia_samples_fish_data FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id);


--
-- TOC entry 6741 (class 2606 OID 1269261)
-- Name: posidonia_species_coverage fk_posidonia_species_coverage; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.posidonia_species_coverage
    ADD CONSTRAINT fk_posidonia_species_coverage FOREIGN KEY (sample_id) REFERENCES diversea.posidonia_samples(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6742 (class 2606 OID 1269266)
-- Name: seawater_measurements fk_seawater_measurements_null; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.seawater_measurements
    ADD CONSTRAINT fk_seawater_measurements_null FOREIGN KEY (sample_id) REFERENCES diversea.seawater_samples(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6743 (class 2606 OID 1269271)
-- Name: seawater_samples fk_seawater_samples_null; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.seawater_samples
    ADD CONSTRAINT fk_seawater_samples_null FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6701 (class 2606 OID 63784)
-- Name: sediment_contamination_detail fk_sediment_contamination_detail_contaminant; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.sediment_contamination_detail
    ADD CONSTRAINT fk_sediment_contamination_detail_contaminant FOREIGN KEY (contaminant_id) REFERENCES diversea.sediment_contaminants(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6702 (class 2606 OID 63779)
-- Name: sediment_contamination_detail fk_sediment_contamination_detail_sample; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.sediment_contamination_detail
    ADD CONSTRAINT fk_sediment_contamination_detail_sample FOREIGN KEY (sample_id) REFERENCES diversea.sediment_contamination_samples(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6679 (class 2606 OID 63789)
-- Name: sediment_contamination_samples fk_sediment_contamination_samples_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.sediment_contamination_samples
    ADD CONSTRAINT fk_sediment_contamination_samples_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6709 (class 2606 OID 73163)
-- Name: sonar_files fk_sonar_files_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.sonar_files
    ADD CONSTRAINT fk_sonar_files_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6680 (class 2606 OID 63809)
-- Name: standards_datasets fk_standards_datasets_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.standards_datasets
    ADD CONSTRAINT fk_standards_datasets_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6681 (class 2606 OID 63804)
-- Name: standards_datasets fk_standards_datasets_standard; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.standards_datasets
    ADD CONSTRAINT fk_standards_datasets_standard FOREIGN KEY (standard_id) REFERENCES diversea.standards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6727 (class 2606 OID 348794)
-- Name: survey_tracks_encounters fk_survey_tracks_encounters_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.survey_tracks_encounters
    ADD CONSTRAINT fk_survey_tracks_encounters_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6728 (class 2606 OID 348799)
-- Name: survey_tracks_encounters fk_survey_tracks_encounters_effort; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.survey_tracks_encounters
    ADD CONSTRAINT fk_survey_tracks_encounters_effort FOREIGN KEY (effort_id) REFERENCES diversea.survey_effort_types(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6729 (class 2606 OID 1260052)
-- Name: survey_tracks_encounters fk_survey_tracks_encounters_encounter_type; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.survey_tracks_encounters
    ADD CONSTRAINT fk_survey_tracks_encounters_encounter_type FOREIGN KEY (encounter_type_id) REFERENCES diversea.survey_encounter_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6730 (class 2606 OID 348814)
-- Name: survey_tracks_encounters fk_survey_tracks_encounters_fishing_gear; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.survey_tracks_encounters
    ADD CONSTRAINT fk_survey_tracks_encounters_fishing_gear FOREIGN KEY (fishing_gear_id) REFERENCES diversea.survey_tracks_fishing_gear(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6731 (class 2606 OID 348804)
-- Name: survey_tracks_encounters fk_survey_tracks_encounters_species; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.survey_tracks_encounters
    ADD CONSTRAINT fk_survey_tracks_encounters_species FOREIGN KEY (species_id) REFERENCES diversea.survey_tracks_species(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6732 (class 2606 OID 348809)
-- Name: survey_tracks_encounters fk_survey_tracks_encounters_vessel; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.survey_tracks_encounters
    ADD CONSTRAINT fk_survey_tracks_encounters_vessel FOREIGN KEY (vessel_type_id) REFERENCES diversea.survey_tracks_vessel_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6744 (class 2606 OID 1269281)
-- Name: undamaged_scales_lengths fk_undamaged_scales_lengths; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.undamaged_scales_lengths
    ADD CONSTRAINT fk_undamaged_scales_lengths FOREIGN KEY (lepido_id) REFERENCES diversea.posidonia_lepido(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6682 (class 2606 OID 63814)
-- Name: video_ground_survey fk_video_ground_survey_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.video_ground_survey
    ADD CONSTRAINT fk_video_ground_survey_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6683 (class 2606 OID 63819)
-- Name: water_surveying fk_water_surveying_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.water_surveying
    ADD CONSTRAINT fk_water_surveying_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6684 (class 2606 OID 63824)
-- Name: water_temperature_logs fk_water_temperature_logs_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.water_temperature_logs
    ADD CONSTRAINT fk_water_temperature_logs_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6685 (class 2606 OID 63834)
-- Name: zooplankton fk_zooplankton_dataset; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.zooplankton
    ADD CONSTRAINT fk_zooplankton_dataset FOREIGN KEY (dataset_id) REFERENCES diversea.dataset(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6736 (class 2606 OID 1269236)
-- Name: posidonia_biomass pos; Type: FK CONSTRAINT; Schema: diversea; Owner: owner
--

ALTER TABLE ONLY diversea.posidonia_biomass
    ADD CONSTRAINT pos FOREIGN KEY (analysis_id) REFERENCES diversea.posidonia_analysis(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6897 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA diversea; Type: ACL; Schema: -; Owner: owner
--

GRANT USAGE ON SCHEMA diversea TO grp_diversea_adriatic;


--
-- TOC entry 6906 (class 0 OID 0)
-- Dependencies: 282
-- Name: TABLE abiotic_measurements; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.abiotic_measurements TO grp_diversea_adriatic;


--
-- TOC entry 6908 (class 0 OID 0)
-- Dependencies: 281
-- Name: SEQUENCE abiotic_measurements_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.abiotic_measurements_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 6910 (class 0 OID 0)
-- Dependencies: 902
-- Name: TABLE audio_hyrdophones; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.audio_hyrdophones TO grp_diversea_adriatic;


--
-- TOC entry 6913 (class 0 OID 0)
-- Dependencies: 302
-- Name: TABLE bacteria_edna_results; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.bacteria_edna_results TO grp_diversea_adriatic;


--
-- TOC entry 6915 (class 0 OID 0)
-- Dependencies: 301
-- Name: SEQUENCE bacteria_edna_results_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.bacteria_edna_results_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 6917 (class 0 OID 0)
-- Dependencies: 284
-- Name: TABLE bacteria_edna_samples; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.bacteria_edna_samples TO grp_diversea_adriatic;


--
-- TOC entry 6919 (class 0 OID 0)
-- Dependencies: 283
-- Name: SEQUENCE bacteria_edna_samples_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.bacteria_edna_samples_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 6921 (class 0 OID 0)
-- Dependencies: 286
-- Name: TABLE bacteria_edna_species; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.bacteria_edna_species TO grp_diversea_adriatic;


--
-- TOC entry 6923 (class 0 OID 0)
-- Dependencies: 285
-- Name: SEQUENCE bacteria_edna_species_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.bacteria_edna_species_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 6929 (class 0 OID 0)
-- Dependencies: 288
-- Name: TABLE biological_pollution; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.biological_pollution TO grp_diversea_adriatic;


--
-- TOC entry 6931 (class 0 OID 0)
-- Dependencies: 287
-- Name: SEQUENCE biological_pollution_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.biological_pollution_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 6933 (class 0 OID 0)
-- Dependencies: 290
-- Name: TABLE ctd_measurements_basic; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.ctd_measurements_basic TO grp_diversea_adriatic;


--
-- TOC entry 6935 (class 0 OID 0)
-- Dependencies: 289
-- Name: SEQUENCE ctd_measurements_basic_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.ctd_measurements_basic_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 6937 (class 0 OID 0)
-- Dependencies: 292
-- Name: TABLE ctd_measurements_chemical; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.ctd_measurements_chemical TO grp_diversea_adriatic;


--
-- TOC entry 6939 (class 0 OID 0)
-- Dependencies: 291
-- Name: SEQUENCE ctd_measurements_chemical_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.ctd_measurements_chemical_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 6941 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE data_gathering_types; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.data_gathering_types TO grp_diversea_adriatic;


--
-- TOC entry 6943 (class 0 OID 0)
-- Dependencies: 222
-- Name: SEQUENCE data_gathering_types_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.data_gathering_types_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 6947 (class 0 OID 0)
-- Dependencies: 239
-- Name: TABLE dataset; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.dataset TO grp_diversea_adriatic;


--
-- TOC entry 6949 (class 0 OID 0)
-- Dependencies: 225
-- Name: TABLE dataset_categories; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.dataset_categories TO grp_diversea_adriatic;


--
-- TOC entry 6951 (class 0 OID 0)
-- Dependencies: 224
-- Name: SEQUENCE dataset_categories_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.dataset_categories_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 6953 (class 0 OID 0)
-- Dependencies: 238
-- Name: SEQUENCE dataset_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.dataset_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 6956 (class 0 OID 0)
-- Dependencies: 294
-- Name: TABLE eukaryotes_edna_results; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.eukaryotes_edna_results TO grp_diversea_adriatic;


--
-- TOC entry 6958 (class 0 OID 0)
-- Dependencies: 293
-- Name: SEQUENCE eukaryotes_edna_results_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.eukaryotes_edna_results_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 6960 (class 0 OID 0)
-- Dependencies: 241
-- Name: TABLE eukaryotes_edna_samples; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.eukaryotes_edna_samples TO grp_diversea_adriatic;


--
-- TOC entry 6962 (class 0 OID 0)
-- Dependencies: 240
-- Name: SEQUENCE eukaryotes_edna_samples_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.eukaryotes_edna_samples_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 6964 (class 0 OID 0)
-- Dependencies: 243
-- Name: TABLE eukaryotes_edna_species; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.eukaryotes_edna_species TO grp_diversea_adriatic;


--
-- TOC entry 6966 (class 0 OID 0)
-- Dependencies: 242
-- Name: SEQUENCE eukaryotes_edna_species_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.eukaryotes_edna_species_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 6968 (class 0 OID 0)
-- Dependencies: 245
-- Name: TABLE fish_data; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.fish_data TO grp_diversea_adriatic;


--
-- TOC entry 6970 (class 0 OID 0)
-- Dependencies: 244
-- Name: SEQUENCE fish_data_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.fish_data_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 6972 (class 0 OID 0)
-- Dependencies: 296
-- Name: TABLE ground_surveys_habitat; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.ground_surveys_habitat TO grp_diversea_adriatic;


--
-- TOC entry 6974 (class 0 OID 0)
-- Dependencies: 295
-- Name: SEQUENCE ground_surveys_habitat_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.ground_surveys_habitat_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 6976 (class 0 OID 0)
-- Dependencies: 298
-- Name: TABLE ground_surveys_species; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.ground_surveys_species TO grp_diversea_adriatic;


--
-- TOC entry 6978 (class 0 OID 0)
-- Dependencies: 297
-- Name: SEQUENCE ground_surveys_species_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.ground_surveys_species_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 6981 (class 0 OID 0)
-- Dependencies: 790
-- Name: TABLE hydrophones_cetaseans_detection; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.hydrophones_cetaseans_detection TO grp_diversea_adriatic;


--
-- TOC entry 6986 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE hydrophones_noise_levels; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.hydrophones_noise_levels TO grp_diversea_adriatic;


--
-- TOC entry 6988 (class 0 OID 0)
-- Dependencies: 246
-- Name: SEQUENCE hydrophones_noise_levels_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.hydrophones_noise_levels_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 6994 (class 0 OID 0)
-- Dependencies: 872
-- Name: TABLE hypso_data_files; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.hypso_data_files TO grp_diversea_adriatic;


--
-- TOC entry 6997 (class 0 OID 0)
-- Dependencies: 792
-- Name: TABLE images_aerial; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.images_aerial TO grp_diversea_adriatic;


--
-- TOC entry 7000 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE images_ground_survey; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.images_ground_survey TO grp_diversea_adriatic;


--
-- TOC entry 7002 (class 0 OID 0)
-- Dependencies: 248
-- Name: SEQUENCE images_ground_survey_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.images_ground_survey_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 7004 (class 0 OID 0)
-- Dependencies: 886
-- Name: TABLE images_phytoplankton; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.images_phytoplankton TO grp_diversea_adriatic;


--
-- TOC entry 7007 (class 0 OID 0)
-- Dependencies: 794
-- Name: TABLE images_underwater; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.images_underwater TO grp_diversea_adriatic;


--
-- TOC entry 7011 (class 0 OID 0)
-- Dependencies: 251
-- Name: TABLE invasive_alien_species; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.invasive_alien_species TO grp_diversea_adriatic;


--
-- TOC entry 7013 (class 0 OID 0)
-- Dependencies: 250
-- Name: SEQUENCE invasive_alien_species_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.invasive_alien_species_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 7015 (class 0 OID 0)
-- Dependencies: 796
-- Name: TABLE lidar_files; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.lidar_files TO grp_diversea_adriatic;


--
-- TOC entry 7027 (class 0 OID 0)
-- Dependencies: 253
-- Name: TABLE macrofauna; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.macrofauna TO grp_diversea_adriatic;


--
-- TOC entry 7029 (class 0 OID 0)
-- Dependencies: 255
-- Name: TABLE macrofauna_diversity_index; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.macrofauna_diversity_index TO grp_diversea_adriatic;


--
-- TOC entry 7031 (class 0 OID 0)
-- Dependencies: 254
-- Name: SEQUENCE macrofauna_diversity_index_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.macrofauna_diversity_index_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 7033 (class 0 OID 0)
-- Dependencies: 252
-- Name: SEQUENCE macrofauna_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.macrofauna_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 7035 (class 0 OID 0)
-- Dependencies: 257
-- Name: TABLE macrofauna_tax_counts; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.macrofauna_tax_counts TO grp_diversea_adriatic;


--
-- TOC entry 7037 (class 0 OID 0)
-- Dependencies: 256
-- Name: SEQUENCE macrofauna_tax_counts_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.macrofauna_tax_counts_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 7048 (class 0 OID 0)
-- Dependencies: 259
-- Name: TABLE macrophytobenthos; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.macrophytobenthos TO grp_diversea_adriatic;


--
-- TOC entry 7049 (class 0 OID 0)
-- Dependencies: 261
-- Name: TABLE macrophytobenthos_frame; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.macrophytobenthos_frame TO grp_diversea_adriatic;


--
-- TOC entry 7051 (class 0 OID 0)
-- Dependencies: 260
-- Name: SEQUENCE macrophytobenthos_frame_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.macrophytobenthos_frame_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 7053 (class 0 OID 0)
-- Dependencies: 258
-- Name: SEQUENCE macrophytobenthos_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.macrophytobenthos_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 7057 (class 0 OID 0)
-- Dependencies: 263
-- Name: TABLE macrozoobenthos; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.macrozoobenthos TO grp_diversea_adriatic;


--
-- TOC entry 7061 (class 0 OID 0)
-- Dependencies: 262
-- Name: SEQUENCE macrozoobenthos_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.macrozoobenthos_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 7063 (class 0 OID 0)
-- Dependencies: 265
-- Name: TABLE marine_litter; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.marine_litter TO grp_diversea_adriatic;


--
-- TOC entry 7065 (class 0 OID 0)
-- Dependencies: 264
-- Name: SEQUENCE marine_litter_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.marine_litter_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 7073 (class 0 OID 0)
-- Dependencies: 267
-- Name: TABLE meiofauna; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.meiofauna TO grp_diversea_adriatic;


--
-- TOC entry 7075 (class 0 OID 0)
-- Dependencies: 266
-- Name: SEQUENCE meiofauna_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.meiofauna_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 7082 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE noise_level_bands; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.noise_level_bands TO grp_diversea_adriatic;


--
-- TOC entry 7084 (class 0 OID 0)
-- Dependencies: 226
-- Name: SEQUENCE noise_level_bands_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.noise_level_bands_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 7085 (class 0 OID 0)
-- Dependencies: 900
-- Name: TABLE organization; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.organization TO grp_diversea_adriatic;


--
-- TOC entry 7095 (class 0 OID 0)
-- Dependencies: 269
-- Name: TABLE phytoplankton; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.phytoplankton TO grp_diversea_adriatic;


--
-- TOC entry 7099 (class 0 OID 0)
-- Dependencies: 268
-- Name: SEQUENCE phytoplankton_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.phytoplankton_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 7111 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE sampling_devices; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.sampling_devices TO grp_diversea_adriatic;


--
-- TOC entry 7113 (class 0 OID 0)
-- Dependencies: 228
-- Name: SEQUENCE sampling_devices_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.sampling_devices_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 7115 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE sampling_protocols; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.sampling_protocols TO grp_diversea_adriatic;


--
-- TOC entry 7117 (class 0 OID 0)
-- Dependencies: 230
-- Name: SEQUENCE sampling_protocols_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.sampling_protocols_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 7121 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE sediment_contaminants; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.sediment_contaminants TO grp_diversea_adriatic;


--
-- TOC entry 7123 (class 0 OID 0)
-- Dependencies: 232
-- Name: SEQUENCE sediment_contaminants_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.sediment_contaminants_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 7125 (class 0 OID 0)
-- Dependencies: 300
-- Name: TABLE sediment_contamination_detail; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.sediment_contamination_detail TO grp_diversea_adriatic;


--
-- TOC entry 7127 (class 0 OID 0)
-- Dependencies: 299
-- Name: SEQUENCE sediment_contamination_detail_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.sediment_contamination_detail_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 7132 (class 0 OID 0)
-- Dependencies: 271
-- Name: TABLE sediment_contamination_samples; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.sediment_contamination_samples TO grp_diversea_adriatic;


--
-- TOC entry 7134 (class 0 OID 0)
-- Dependencies: 270
-- Name: SEQUENCE sediment_contamination_samples_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.sediment_contamination_samples_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 7137 (class 0 OID 0)
-- Dependencies: 798
-- Name: TABLE sonar_files; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.sonar_files TO grp_diversea_adriatic;


--
-- TOC entry 7139 (class 0 OID 0)
-- Dependencies: 235
-- Name: TABLE standards; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.standards TO grp_diversea_adriatic;


--
-- TOC entry 7140 (class 0 OID 0)
-- Dependencies: 272
-- Name: TABLE standards_datasets; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.standards_datasets TO grp_diversea_adriatic;


--
-- TOC entry 7142 (class 0 OID 0)
-- Dependencies: 234
-- Name: SEQUENCE standards_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.standards_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 7144 (class 0 OID 0)
-- Dependencies: 237
-- Name: TABLE substrate_types; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.substrate_types TO grp_diversea_adriatic;


--
-- TOC entry 7146 (class 0 OID 0)
-- Dependencies: 236
-- Name: SEQUENCE substrate_types_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.substrate_types_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 7161 (class 0 OID 0)
-- Dependencies: 274
-- Name: TABLE video_ground_survey; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.video_ground_survey TO grp_diversea_adriatic;


--
-- TOC entry 7163 (class 0 OID 0)
-- Dependencies: 273
-- Name: SEQUENCE video_ground_survey_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.video_ground_survey_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 7165 (class 0 OID 0)
-- Dependencies: 276
-- Name: TABLE water_surveying; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.water_surveying TO grp_diversea_adriatic;


--
-- TOC entry 7167 (class 0 OID 0)
-- Dependencies: 275
-- Name: SEQUENCE water_surveying_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.water_surveying_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 7169 (class 0 OID 0)
-- Dependencies: 278
-- Name: TABLE water_temperature_logs; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.water_temperature_logs TO grp_diversea_adriatic;


--
-- TOC entry 7171 (class 0 OID 0)
-- Dependencies: 277
-- Name: SEQUENCE water_temperature_logs_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.water_temperature_logs_id_seq TO grp_diversea_adriatic;


--
-- TOC entry 7176 (class 0 OID 0)
-- Dependencies: 280
-- Name: TABLE zooplankton; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON TABLE diversea.zooplankton TO grp_diversea_adriatic;


--
-- TOC entry 7178 (class 0 OID 0)
-- Dependencies: 279
-- Name: SEQUENCE zooplankton_id_seq; Type: ACL; Schema: diversea; Owner: owner
--

GRANT SELECT ON SEQUENCE diversea.zooplankton_id_seq TO grp_diversea_adriatic;


-- Completed on 2026-03-12 13:35:58

--
-- PostgreSQL database dump complete
--

\unrestrict V4vMN2qyvBQ86u154si6GSxQ1tTdpdB7YkX8rsQl0ZZQ8lk3WjFRXG9L46mEW3z

