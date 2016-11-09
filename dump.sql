--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
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


SET search_path = public, pg_catalog;

--
-- Name: livequery_simple_pg_2ZfJ(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_2ZfJ"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_2ZfJ',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_2nQQ(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_2nQQ"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_2nQQ',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_4Hth(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_4Hth"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_4Hth',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_4YMy(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_4YMy"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_4YMy',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_5Cm9(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_5Cm9"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_5Cm9',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_6amH(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_6amH"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_6amH',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_6i6k(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION livequery_simple_pg_6i6k() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_6i6k',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_8CYx(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_8CYx"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_8CYx',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_8Dbk(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_8Dbk"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_8Dbk',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_8ENc(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_8ENc"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_8ENc',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_8cmQ(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_8cmQ"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_8cmQ',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_8iLW(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_8iLW"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_8iLW',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_93q8(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION livequery_simple_pg_93q8() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_93q8',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_9QRZ(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_9QRZ"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_9QRZ',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_9iAx(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_9iAx"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_9iAx',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_9oct(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION livequery_simple_pg_9oct() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_9oct',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_AZc2(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_AZc2"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_AZc2',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_DS3x(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_DS3x"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_DS3x',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_Dt8q(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_Dt8q"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_Dt8q',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_Dvkb(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_Dvkb"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_Dvkb',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_EDBn(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_EDBn"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_EDBn',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_GDo7(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_GDo7"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_GDo7',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_GwNX(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_GwNX"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_GwNX',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_JPWj(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_JPWj"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_JPWj',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_KSbB(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_KSbB"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_KSbB',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_KgNG(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_KgNG"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_KgNG',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_LGY3(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_LGY3"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_LGY3',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_LQYy(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_LQYy"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_LQYy',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_LkBu(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_LkBu"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_LkBu',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_PwAA(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_PwAA"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_PwAA',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_Qo8H(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_Qo8H"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_Qo8H',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_RxpK(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_RxpK"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_RxpK',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_SMqv(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_SMqv"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_SMqv',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_Sfgb(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_Sfgb"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_Sfgb',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_Sx9C(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_Sx9C"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_Sx9C',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_T5Sj(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_T5Sj"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_T5Sj',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_TKX5(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_TKX5"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_TKX5',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_TaqT(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_TaqT"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_TaqT',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_TyTD(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_TyTD"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_TyTD',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_WatN(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_WatN"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_WatN',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_XTP2(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_XTP2"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_XTP2',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_YQmw(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_YQmw"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_YQmw',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_YS5P(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_YS5P"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_YS5P',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_aNQZ(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_aNQZ"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_aNQZ',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_ajmM(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_ajmM"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_ajmM',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_azk3(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION livequery_simple_pg_azk3() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_azk3',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_bhJC(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_bhJC"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_bhJC',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_cQAQ(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_cQAQ"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_cQAQ',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_dYxs(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_dYxs"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_dYxs',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_dbPe(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_dbPe"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_dbPe',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_eA7d(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_eA7d"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_eA7d',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_eaNW(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_eaNW"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_eaNW',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_ezBa(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_ezBa"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_ezBa',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_gDgB(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_gDgB"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_gDgB',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_gMmS(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_gMmS"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_gMmS',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_hCSM(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_hCSM"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_hCSM',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_hvuv(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION livequery_simple_pg_hvuv() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_hvuv',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_iA9r(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_iA9r"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_iA9r',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_iMGL(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_iMGL"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_iMGL',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_kPHu(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_kPHu"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_kPHu',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_nPn6(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_nPn6"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_nPn6',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_nQNx(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_nQNx"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_nQNx',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_nmuC(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_nmuC"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_nmuC',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_oc9X(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_oc9X"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_oc9X',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_pq49(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION livequery_simple_pg_pq49() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_pq49',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_ugbf(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION livequery_simple_pg_ugbf() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_ugbf',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_uv8X(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_uv8X"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_uv8X',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_vCMJ(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_vCMJ"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_vCMJ',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_wCnn(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_wCnn"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_wCnn',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_wdWh(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_wdWh"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_wdWh',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_y85H(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_y85H"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_y85H',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_yhyE(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_yhyE"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_yhyE',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


--
-- Name: livequery_simple_pg_zfWx(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "livequery_simple_pg_zfWx"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row_data   RECORD;
    full_msg   TEXT;
    full_len   INT;
    cur_page   INT;
    page_count INT;
    msg_hash   TEXT;
  BEGIN
    IF (TG_OP = 'INSERT') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS data
      INTO row_data;
    ELSIF (TG_OP  = 'DELETE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(OLD) AS data
      INTO row_data;
    ELSIF (TG_OP = 'UPDATE') THEN
      SELECT
        TG_TABLE_NAME AS table,
        TG_OP         AS op,
        json_agg(NEW) AS new_data,
        json_agg(OLD) AS old_data
      INTO row_data;
    END IF;

    SELECT row_to_json(row_data)::TEXT INTO full_msg;
    SELECT char_length(full_msg)       INTO full_len;
    SELECT (full_len / 7950) + 1       INTO page_count;
    SELECT md5(full_msg)               INTO msg_hash;

    FOR cur_page IN 1..page_count LOOP
      PERFORM pg_notify('simple_pg_zfWx',
        msg_hash || ':' || page_count || ':' || cur_page || ':' ||
        substr(full_msg, ((cur_page - 1) * 7950) + 1, 7950)
      );
    END LOOP;
    RETURN NULL;
  END;
$$;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE categories (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    name character varying(255) NOT NULL
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE items (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    name character varying(255) NOT NULL,
    price numeric(8,2),
    unit text,
    category_id bigint,
    CONSTRAINT items_unit_check CHECK ((unit = ANY (ARRAY['ml'::text, 'mg'::text, 'kg'::text, 'ltrs'::text, 'quantity'::text])))
);


--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE items_id_seq OWNED BY items.id;


--
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


--
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE knex_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE knex_migrations_id_seq OWNED BY knex_migrations.id;


--
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE knex_migrations_lock (
    is_locked integer
);


--
-- Name: line_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE line_items (
    id integer NOT NULL,
    quantity bigint,
    discount numeric(8,2),
    item_id bigint,
    transaction_id bigint
);


--
-- Name: line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE line_items_id_seq OWNED BY line_items.id;


--
-- Name: shifts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE shifts (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    started_at timestamp with time zone,
    ended_at timestamp with time zone
);


--
-- Name: shifts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE shifts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shifts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE shifts_id_seq OWNED BY shifts.id;


--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE suppliers (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    name character varying(255) NOT NULL,
    properties jsonb
);


--
-- Name: suppliers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE suppliers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: suppliers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE suppliers_id_seq OWNED BY suppliers.id;


--
-- Name: supplies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE supplies (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    item_id bigint,
    supplier_id bigint,
    quantity bigint
);


--
-- Name: supplies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE supplies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: supplies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE supplies_id_seq OWNED BY supplies.id;


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE transactions (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    shift_id bigint,
    properties jsonb,
    discount bigint
);


--
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE transactions_id_seq OWNED BY transactions.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY items ALTER COLUMN id SET DEFAULT nextval('items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY knex_migrations ALTER COLUMN id SET DEFAULT nextval('knex_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY line_items ALTER COLUMN id SET DEFAULT nextval('line_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY shifts ALTER COLUMN id SET DEFAULT nextval('shifts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY suppliers ALTER COLUMN id SET DEFAULT nextval('suppliers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY supplies ALTER COLUMN id SET DEFAULT nextval('supplies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY transactions ALTER COLUMN id SET DEFAULT nextval('transactions_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories (id, created_at, updated_at, name) FROM stdin;
1	2016-11-03 17:05:26.143655+05	2016-11-03 17:05:26.143655+05	ALL DAY BREAKFAST & BRUNCH
2	2016-11-03 17:05:26.143655+05	2016-11-03 17:05:26.143655+05	WAFFLES PANCAKES, CREPES & FRUIT
3	2016-11-03 17:05:26.143655+05	2016-11-03 17:05:26.143655+05	ORGANIC FREE-RANGE FOLDED OMELETTES
4	2016-11-03 17:05:26.143655+05	2016-11-03 17:05:26.143655+05	SOUPS & SNACK
5	2016-11-03 17:05:26.143655+05	2016-11-03 17:05:26.143655+05	ARTISAN & ORGANIC SALADS
6	2016-11-03 17:05:26.143655+05	2016-11-03 17:05:26.143655+05	SNACKWICH SANDWICHES ( ON THE GO )
7	2016-11-03 17:05:26.143655+05	2016-11-03 17:05:26.143655+05	FLAME-GRILLED GOURMET BURGER
8	2016-11-03 17:05:26.143655+05	2016-11-03 17:05:26.143655+05	GRILLED PANINI SANDWICHES
9	2016-11-03 17:05:26.143655+05	2016-11-03 17:05:26.143655+05	PULLED SPICY BARBECUED MEAT
10	2016-11-03 17:05:26.143655+05	2016-11-03 17:05:26.143655+05	GRILLED MEZZA LUNA
11	2016-11-03 17:05:26.143655+05	2016-11-03 17:05:26.143655+05	STUFFED SAVOURY CRESPELLE
12	2016-11-03 17:05:26.143655+05	2016-11-03 17:05:26.143655+05	NEW ENTREES
13	2016-11-03 17:05:26.143655+05	2016-11-03 17:05:26.143655+05	PIES & PASTAS LEANER COMFORT FOOD
14	2016-11-03 17:05:26.143655+05	2016-11-03 17:05:26.143655+05	PATISSERIE & DESSERTS
15	2016-11-03 17:05:26.143655+05	2016-11-03 17:05:26.143655+05	BLENDED FRAPPES & THICKSHAKES
16	2016-11-03 17:05:26.143655+05	2016-11-03 17:05:26.143655+05	GRANITA ICE BLEND SMOOTHIES
17	2016-11-03 17:05:26.143655+05	2016-11-03 17:05:26.143655+05	ICED COFFEES ON THE ROCKS
18	2016-11-03 17:05:26.143655+05	2016-11-03 17:05:26.143655+05	CAKESHAKES!
19	2016-11-03 17:05:26.143655+05	2016-11-03 17:05:26.143655+05	COLD LOW-FAT SEMIFREDDO DESSERTS
20	2016-11-03 17:05:26.143655+05	2016-11-03 17:05:26.143655+05	FRESH FRUIT SMOOTHIES & JUICES
21	2016-11-03 17:05:26.143655+05	2016-11-03 17:05:26.143655+05	LEMONADE ICED TEA & SOFT DRINKS
22	2016-11-03 17:05:26.143655+05	2016-11-03 17:05:26.143655+05	ARTISAN TEAS & HOT CHOCOLATE
23	2016-11-03 17:05:26.143655+05	2016-11-03 17:05:26.143655+05	MICRO-ROASTED SINGLE ESTATE COFFEES
24	2016-11-03 17:05:26.143655+05	2016-11-03 17:05:26.143655+05	CLASSIC HOT COFFEE BEVERAGES
25	2016-11-03 17:05:26.143655+05	2016-11-03 17:05:26.143655+05	FLAVOURED HOT SIGNATURE COFFEES
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('categories_id_seq', 1, false);


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY items (id, created_at, updated_at, name, price, unit, category_id) FROM stdin;
1	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	THE MOCCA BRUNCH	995.00	\N	1
2	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	DETOX BRUNCH ( LOW-FAT & LOW-CARB )	895.00	\N	1
3	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	PALEO BRUNCH ( GLUTEN FREE )	695.00	\N	1
4	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	WAFFLES, PANCAKES & CREPES PLATTER	595.00	\N	2
5	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	WAFFLE WITH THE WORKS	495.00	\N	2
6	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	WAFFLE WITH THE WORKS With Vanilla ice cream	595.00	\N	2
7	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	FRESH FRUIT WITH LOWFAT YOGURT & GRANOLA	395.00	\N	2
8	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	THE MOCCA OMELETTE	425.00	\N	3
9	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	SKINNY EGG WHITE OMELETTE	425.00	\N	3
10	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CHICKEN & MUSHROOM OMELETTE	525.00	\N	3
11	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	SPICY HUEVOS RANCHEROS OMELETTE	550.00	\N	3
12	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	MEAT & TATERS OMELETTE	575.00	\N	3
13	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CHICKEN-POTATO LEEK SOUP	395.00	\N	4
14	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	LOW-CAL CARROT & CORIANDER SOUP	350.00	\N	4
15	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	LOW-CAL ROASTED TOMATO & ORANGE SOUP	350.00	\N	4
16	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	PERSIAN ASH SOUP	395.00	\N	4
17	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	ROASTED RED PEPPER, TOMATO & BASIL SOUP	350.00	\N	4
18	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	TAPAS PLATTER	750.00	\N	4
19	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	LOADED NACHOS	650.00	\N	4
20	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	MINI BURGER PLATTER	425.00	\N	4
21	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	ROSEMARY POTATO WEDGES	295.00	\N	4
22	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	HUMMUS PLATTER	350.00	\N	4
23	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	ORGANIC URBAN GARDEN SIGNATURE SALAD	650.00	\N	5
24	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	GRILLED VEGETABLE SALAD	595.00	\N	5
25	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	GREEK SALAD ( RAW )	595.00	\N	5
26	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	TUNA SALAD	650.00	\N	5
27	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	GRILLED CHICKEN SALAD	650.00	\N	5
28	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CURRY EGG SALAD	295.00	\N	6
29	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	BEEF PICKLES AND CHILI	375.00	\N	6
30	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CREAM CHEESE AND VEGGIES	350.00	\N	6
31	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CHICKEN MEXICANA	375.00	\N	6
32	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	PULLED CHICKEN N SLAW	375.00	\N	6
33	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CLASSIC BEEF PATTY	650.00	\N	7
34	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CHICKEN & HERB PATTY	625.00	\N	7
35	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	MARINATED GRILLED VEGETABLES	625.00	\N	8
36	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CLASSIC CHEESE, PESTO & TOMATO	575.00	\N	8
37	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	GRILLED TARRAGON LIME CHICKEN	645.00	\N	8
38	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	GRILLED MEXICALI CHICKEN	675.00	\N	8
39	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	GRILLED PAPRIKA JALAPENO CHICKEN	645.00	\N	8
40	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CHICKEN SPICY TANDOORI	645.00	\N	8
41	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	BEEF, ONION & GREEN CHILI	695.00	\N	8
42	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	PEPPERONI PARMESAN	675.00	\N	8
43	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	PULLED BARBECUED BEEF	650.00	\N	9
44	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	PULLED BARBECUED CHICKEN	650.00	\N	9
45	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	MEDITERRANEN MEZZA LUNA	675.00	\N	10
46	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CHICKEN MEZZA LUNA	750.00	\N	10
47	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	BEEF MEZZA LUNA	750.00	\N	10
48	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	PARMESAN CHICKEN	750.00	\N	11
49	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	BEEF MUSHROOM	750.00	\N	11
50	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	SPINACH & FETA	695.00	\N	11
51	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	GRILLED CHICKEN	795.00	\N	12
52	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	PENNE BOLOGNESE	650.00	\N	12
53	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	PASTA PIQUANT	650.00	\N	12
54	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	PESTO PASTA	650.00	\N	12
55	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	FETTUCINE SPINACI SPICY OVENGRILLED PASTA	695.00	\N	13
56	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	PENNE ARRABIATA SPICY OVEN GRILLED PASTA	695.00	\N	13
57	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	ZUCCHINI FETTUCINE ALFREDO OVEN-GRILLED DISH	650.00	\N	13
58	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	SHEPHARDS PIE RE-INVENTED	650.00	\N	13
59	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CHAR-GRILLED TAHINI CHICKEN PLATTER	795.00	\N	13
60	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	FRENCH MACARONS ( GLUTEN FREE ) pr. piece	170.00	\N	14
61	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	FRENCH MACARONS ( GLUTEN FREE ) 6 pieces box	990.00	\N	14
62	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	SCANDINAVIAN BUTTER PIES	495.00	\N	14
63	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	BIG OL DIPPED DOME MUFFINS	225.00	\N	14
64	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	PHILADELPHIA CREAM CHEESE CAKE	495.00	\N	14
65	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	LOW-FAT CARROT CAKE	325.00	\N	14
66	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	LOW-FAT BANANA CAKE	325.00	\N	14
67	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	PALEO NRG BAR ( LOW-FAT )	195.00	\N	14
68	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CARAMINT SWISS CHOCOLATE BROWNIE	225.00	\N	14
69	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	SWISS CHOCOLATE BROWNIE WITH WALNUTS	225.00	\N	14
70	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	SAVOURY SCONES	195.00	\N	14
71	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	SWEET SCONES	195.00	\N	14
72	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CROISSANT	110.00	\N	14
73	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CHEWY COOKIES	250.00	\N	14
74	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	YUMMY MINI MUFFIN SAVOURY	110.00	\N	14
75	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	COOKIE CUPS	395.00	\N	14
76	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	TIRAMISU	550.00	\N	14
77	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	NOUGATELLA	550.00	\N	14
78	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	TRIPLE SWISS CHOCOLATE MOUSSE	595.00	\N	14
79	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	THE FORGET-ABOUT MOLTEN-LAVA-CAKES BROWNIE MELT	650.00	\N	14
80	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	ESPRESSO COFFEE FRAPPE Regular	350.00	\N	15
81	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	ESPRESSO COFFEE FRAPPE Large	395.00	\N	15
82	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CARAMEL COFFEE FRAPPE Regular	350.00	\N	15
83	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CARAMEL COFFEE FRAPPE Large	395.00	\N	15
84	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CARAMINT FRAPPE ( WITHOUT COFFEE ) Regular	340.00	\N	15
85	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CARAMINT FRAPPE ( WITHOUT COFFEE ) Large	385.00	\N	15
86	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	MOCCA COFFEE FRAPPE Regular	350.00	\N	15
87	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	MOCCA COFFEE FRAPPE Large	395.00	\N	15
88	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	FERRERO COFFEE FRAPPE Regular	375.00	\N	15
89	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	FERRERO COFFEE FRAPPE Large	425.00	\N	15
90	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	BERRY WHITE CHOC FRAPPE ( WITHOUT COFFEE ) Regular	340.00	\N	15
91	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	BERRY WHITE CHOC FRAPPE ( WITHOUT COFFEE ) Large	385.00	\N	15
92	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	TROPICAL ICE SMOOTHIE Regular	355.00	\N	16
93	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	TROPICAL ICE SMOOTHIE Large	395.00	\N	16
94	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CITRUS ICE SMOOTHIE Regular	355.00	\N	16
95	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CITRUS ICE SMOOTHIE Large	395.00	\N	16
96	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	FOREST BERRY ICE SMOOTHIE Regular	355.00	\N	16
97	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	FOREST BERRY ICE SMOOTHIE Large	395.00	\N	16
98	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	GINGER LIME MINTY GRANITA Regular	315.00	\N	16
99	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	GINGER LIME MINTY GRANITA Large	365.00	\N	16
100	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	KIWI GREEN MEADOW COOLER Regular	315.00	\N	16
101	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	KIWI GREEN MEADOW COOLER Large	365.00	\N	16
102	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	FLAVOURED ICED LATTE MACCHIATO Single	315.00	\N	17
103	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	FLAVOURED ICED LATTE MACCHIATO Double	365.00	\N	17
104	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	ICED MOCCACCINO HAZELCINO Single	315.00	\N	17
105	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	ICED MOCCACCINO HAZELCINO Double	365.00	\N	17
106	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	SKINNY ICED AMERICANO Regular	250.00	\N	17
107	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	SKINNY ICED AMERICANO Large	300.00	\N	17
108	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	SKINNY ICED LATTE Regular	315.00	\N	17
109	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	SKINNY ICED LATTE Large	365.00	\N	17
110	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	SKINNY GREEK STYLE FRAPPE Regular	315.00	\N	17
111	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	SKINNY GREEK STYLE FRAPPE Large	365.00	\N	17
112	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	VANILLA CHAI & COOKIES CAKESHAKE Regular	385.00	\N	18
113	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	VANILLA CHAI & COOKIES CAKESHAKE Large	430.00	\N	18
114	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CINNAMON CARROTCAKE CAKESHAKE Regular	385.00	\N	18
115	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CINNAMON CARROTCAKE CAKESHAKE Large	430.00	\N	18
116	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	PEANUTBUTTER & BROWNIE CAKESHAKE Regular	385.00	\N	18
117	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	PEANUTBUTTER & BROWNIE CAKESHAKE Large	430.00	\N	18
118	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	LEMON MERINGUE PIE CAKESHAKE Regular	385.00	\N	18
119	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	LEMON MERINGUE PIE CAKESHAKE Large	430.00	\N	18
120	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	GRASSHOPPER CAKESHAKE Regular	385.00	\N	18
121	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	GRASSHOPPER CAKESHAKE Large	430.00	\N	18
122	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	ORANGUTANG CAKESHAKE Regular	385.00	\N	18
123	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	ORANGUTANG CAKESHAKE Large	430.00	\N	18
124	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	NUTELLAAAH CAKESHAKE Regular	385.00	\N	18
125	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	NUTELLAAAH CAKESHAKE Large	430.00	\N	18
126	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	STRAWBERRY & ROSEWATER SEMI-FREDDO	650.00	\N	19
127	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	RASPBERRY & LEMON SEMI-FREDDO	650.00	\N	19
128	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	SOUR GREEN APPLE & MINT SEMI-FREDDO	650.00	\N	19
129	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	NOUGATELLA & HAZELNUT SEMI-FREDDO	650.00	\N	19
130	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	FRESH FRUIT SLOW JUICES Regular	250.00	\N	20
131	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	FRESH FRUIT SLOW JUICES Large	300.00	\N	20
132	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	FRESH FRUIT SMOOTHIES	355.00	\N	20
133	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	FRESH FRUIT SMOOTHIES Large	395.00	\N	20
134	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	ADD ORGANIC ACAI, SPIRULINA OR WHEATGRASS EXTRACT	100.00	\N	20
135	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	BREAKFAST DETOX DAIRY SMOOTHIE Regular	355.00	\N	20
136	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	BREAKFAST DETOX DAIRY SMOOTHIE Large	395.00	\N	20
137	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	BERRYBLAST DAIRY SMOOTHIE Regular	385.00	\N	20
138	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	BERRYBLAST DAIRY SMOOTHIE Large	415.00	\N	20
139	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	GINGER LIME LEMONADE Regular	255.00	\N	21
140	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	GINGER LIME LEMONADE Large	275.00	\N	21
141	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	ICED TEA Regular	250.00	\N	21
142	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	ICED TEA Large	300.00	\N	21
143	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	PERRIER SPARKLING WATER	130.00	\N	21
144	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	NESTLE STILL WATER	40.00	\N	21
145	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	MISC. SOFT DRINKS	95.00	\N	21
146	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	KUSMI TEA	395.00	\N	22
147	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	MIGHTY LEAF TEA ( WITH DRY FRUIT SAMPLER )	495.00	\N	22
148	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	TWINNINGS TEA	175.00	\N	22
149	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	MIGHTY LEAF EBONY FLOWERING TEA	695.00	\N	22
150	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	SWISS HOT CHOCOLATE Regular	340.00	\N	22
151	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	SWISS HOT CHOCOLATE Large	385.00	\N	22
152	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	MOCCA DARK ROAST French Press	385.00	\N	23
153	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	MOCCA DARK ROAST Hario Drip	395.00	\N	23
154	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	MOCCA DARK ROAST Aeropress	395.00	\N	23
155	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	LA MINITA ESTATE COSTA RICA French Press	450.00	\N	23
156	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	LA MINITA ESTATE COSTA RICA Hario Drip	485.00	\N	23
157	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	LA MINITA ESTATE COSTA RICA Aeropress	450.00	\N	23
158	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	GICHERORI ESTATE KENYA AA French Press	450.00	\N	23
159	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	GICHERORI ESTATE KENYA AA Hario Drip	485.00	\N	23
160	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	GICHERORI ESTATE KENYA AA Aeropress	450.00	\N	23
161	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	SERTAO ESTATE BRAZIL  French Press	450.00	\N	23
162	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	SERTAO ESTATE BRAZIL Hario Drip	485.00	\N	23
163	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	SERTAO ESTATE BRAZIL  Aeropress	450.00	\N	23
164	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	VALPARAISO ESTATE GUATEMALA French Press	450.00	\N	23
165	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	VALPARAISO ESTATE GUATEMALA Hario Drip	485.00	\N	23
166	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	VALPARAISO ESTATE GUATEMALA Aeropress	450.00	\N	23
167	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	JAZ DE RIO COCO ESTATE NICARAGUA French Press	450.00	\N	23
168	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	JAZ DE RIO COCO ESTATE NICARAGUA Hario Drip	485.00	\N	23
169	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	JAZ DE RIO COCO ESTATE NICARAGUA Aeropress	450.00	\N	23
170	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	LATTE Regular	310.00	\N	24
171	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	LATTE Large	360.00	\N	24
172	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	ESPRESSO Regular	225.00	\N	24
173	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	ESPRESSO Large	275.00	\N	24
174	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	AMERICANO Regular	240.00	\N	24
175	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	AMERICANO Large	285.00	\N	24
176	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	FLAVOURED LATTE MACCHIATO Regular	340.00	\N	24
177	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	FLAVOURED LATTE MACCHIATO Large	385.00	\N	24
178	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	ESPRESSO MACCHIATO Regular	240.00	\N	24
179	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	ESPRESSO MACCHIATO Large	285.00	\N	24
180	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	AFFOGATO Regular	295.00	\N	24
181	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	AFFOGATO Large	340.00	\N	24
182	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CAPPUCCINO Regular	310.00	\N	24
183	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CAPPUCCINO Large	360.00	\N	24
184	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CORTADO Regular	240.00	\N	24
185	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CORTADO Large	285.00	\N	24
186	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	MOCCACCINO Regular	340.00	\N	25
187	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	MOCCACCINO Large	385.00	\N	25
188	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CARAMELITO Regular	340.00	\N	25
189	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	CARAMELITO Large	385.00	\N	25
190	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	BUTTERSCOTCH CAP Regular	340.00	\N	25
191	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	BUTTERSCOTCH CAP Large	385.00	\N	25
192	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	SWISS CHOCOLATE LATTE Regular	395.00	\N	25
193	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	SWISS CHOCOLATE LATTE Large	450.00	\N	25
194	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	SKINNY & SUGAR-FREE VANILLA / HAZELNUT CAP Regular	340.00	\N	25
195	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	SKINNY & SUGAR-FREE VANILLA / HAZELNUT CAP Large	385.00	\N	25
196	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	WHITE / DARK CHOCOLATE MOCCA Regular	340.00	\N	25
197	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	WHITE / DARK CHOCOLATE MOCCA Large	385.00	\N	25
198	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	HAZEL NOCCIOLA Regular	340.00	\N	25
199	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	HAZEL NOCCIOLA Large	385.00	\N	25
200	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	GINGERBREAD CAP Regular	340.00	\N	25
201	2016-11-04 14:45:34.410399+05	2016-11-04 14:45:34.410399+05	GINGERBREAD CAP Large	385.00	\N	25
\.


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('items_id_seq', 1, false);


--
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY knex_migrations (id, name, batch, migration_time) FROM stdin;
\.


--
-- Name: knex_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('knex_migrations_id_seq', 1, false);


--
-- Data for Name: knex_migrations_lock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY knex_migrations_lock (is_locked) FROM stdin;
\.


--
-- Data for Name: line_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY line_items (id, quantity, discount, item_id, transaction_id) FROM stdin;
\.


--
-- Name: line_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('line_items_id_seq', 1, false);


--
-- Data for Name: shifts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY shifts (id, created_at, updated_at, started_at, ended_at) FROM stdin;
\.


--
-- Name: shifts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('shifts_id_seq', 1, false);


--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY suppliers (id, created_at, updated_at, name, properties) FROM stdin;
\.


--
-- Name: suppliers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('suppliers_id_seq', 1, false);


--
-- Data for Name: supplies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY supplies (id, created_at, updated_at, item_id, supplier_id, quantity) FROM stdin;
\.


--
-- Name: supplies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('supplies_id_seq', 1, false);


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY transactions (id, created_at, updated_at, shift_id, properties, discount) FROM stdin;
\.


--
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('transactions_id_seq', 1, false);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: items_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_name_unique UNIQUE (name);


--
-- Name: items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- Name: line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY line_items
    ADD CONSTRAINT line_items_pkey PRIMARY KEY (id);


--
-- Name: shifts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shifts
    ADD CONSTRAINT shifts_pkey PRIMARY KEY (id);


--
-- Name: suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);


--
-- Name: supplies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY supplies
    ADD CONSTRAINT supplies_pkey PRIMARY KEY (id);


--
-- Name: transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: items_category_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX items_category_id_index ON items USING btree (category_id);


--
-- Name: line_items_item_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX line_items_item_id_index ON line_items USING btree (item_id);


--
-- Name: line_items_transaction_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX line_items_transaction_id_index ON line_items USING btree (transaction_id);


--
-- Name: supplies_item_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX supplies_item_id_index ON supplies USING btree (item_id);


--
-- Name: supplies_supplier_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX supplies_supplier_id_index ON supplies USING btree (supplier_id);


--
-- Name: transactions_shift_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX transactions_shift_id_index ON transactions USING btree (shift_id);


--
-- Name: simple_pg_2ZfJ_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_2ZfJ_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_2ZfJ"();


--
-- Name: simple_pg_2ZfJ_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_2ZfJ_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_2ZfJ"();


--
-- Name: simple_pg_2nQQ_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_2nQQ_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_2nQQ"();


--
-- Name: simple_pg_2nQQ_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_2nQQ_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_2nQQ"();


--
-- Name: simple_pg_4Hth_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_4Hth_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_4Hth"();


--
-- Name: simple_pg_4Hth_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_4Hth_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_4Hth"();


--
-- Name: simple_pg_4YMy_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_4YMy_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_4YMy"();


--
-- Name: simple_pg_5Cm9_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_5Cm9_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_5Cm9"();


--
-- Name: simple_pg_5Cm9_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_5Cm9_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_5Cm9"();


--
-- Name: simple_pg_6amH_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_6amH_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_6amH"();


--
-- Name: simple_pg_6i6k_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER simple_pg_6i6k_categories AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE livequery_simple_pg_6i6k();


--
-- Name: simple_pg_6i6k_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER simple_pg_6i6k_shifts AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE livequery_simple_pg_6i6k();


--
-- Name: simple_pg_8CYx_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_8CYx_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_8CYx"();


--
-- Name: simple_pg_8Dbk_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_8Dbk_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_8Dbk"();


--
-- Name: simple_pg_8ENc_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_8ENc_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_8ENc"();


--
-- Name: simple_pg_8ENc_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_8ENc_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_8ENc"();


--
-- Name: simple_pg_8cmQ_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_8cmQ_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_8cmQ"();


--
-- Name: simple_pg_8iLW_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_8iLW_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_8iLW"();


--
-- Name: simple_pg_8iLW_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_8iLW_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_8iLW"();


--
-- Name: simple_pg_93q8_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER simple_pg_93q8_shifts AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE livequery_simple_pg_93q8();


--
-- Name: simple_pg_9QRZ_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_9QRZ_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_9QRZ"();


--
-- Name: simple_pg_9iAx_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_9iAx_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_9iAx"();


--
-- Name: simple_pg_9oct_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER simple_pg_9oct_categories AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE livequery_simple_pg_9oct();


--
-- Name: simple_pg_9oct_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER simple_pg_9oct_shifts AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE livequery_simple_pg_9oct();


--
-- Name: simple_pg_DS3x_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_DS3x_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_DS3x"();


--
-- Name: simple_pg_DS3x_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_DS3x_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_DS3x"();


--
-- Name: simple_pg_Dt8q_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_Dt8q_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_Dt8q"();


--
-- Name: simple_pg_Dt8q_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_Dt8q_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_Dt8q"();


--
-- Name: simple_pg_Dvkb_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_Dvkb_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_Dvkb"();


--
-- Name: simple_pg_EDBn_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_EDBn_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_EDBn"();


--
-- Name: simple_pg_GDo7_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_GDo7_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_GDo7"();


--
-- Name: simple_pg_GwNX_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_GwNX_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_GwNX"();


--
-- Name: simple_pg_GwNX_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_GwNX_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_GwNX"();


--
-- Name: simple_pg_JPWj_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_JPWj_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_JPWj"();


--
-- Name: simple_pg_JPWj_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_JPWj_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_JPWj"();


--
-- Name: simple_pg_KSbB_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_KSbB_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_KSbB"();


--
-- Name: simple_pg_KgNG_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_KgNG_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_KgNG"();


--
-- Name: simple_pg_KgNG_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_KgNG_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_KgNG"();


--
-- Name: simple_pg_LGY3_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_LGY3_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_LGY3"();


--
-- Name: simple_pg_LGY3_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_LGY3_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_LGY3"();


--
-- Name: simple_pg_LQYy_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_LQYy_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_LQYy"();


--
-- Name: simple_pg_LkBu_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_LkBu_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_LkBu"();


--
-- Name: simple_pg_LkBu_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_LkBu_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_LkBu"();


--
-- Name: simple_pg_PwAA_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_PwAA_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_PwAA"();


--
-- Name: simple_pg_PwAA_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_PwAA_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_PwAA"();


--
-- Name: simple_pg_Qo8H_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_Qo8H_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_Qo8H"();


--
-- Name: simple_pg_RxpK_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_RxpK_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_RxpK"();


--
-- Name: simple_pg_SMqv_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_SMqv_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_SMqv"();


--
-- Name: simple_pg_SMqv_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_SMqv_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_SMqv"();


--
-- Name: simple_pg_Sfgb_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_Sfgb_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_Sfgb"();


--
-- Name: simple_pg_Sfgb_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_Sfgb_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_Sfgb"();


--
-- Name: simple_pg_Sx9C_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_Sx9C_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_Sx9C"();


--
-- Name: simple_pg_Sx9C_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_Sx9C_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_Sx9C"();


--
-- Name: simple_pg_T5Sj_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_T5Sj_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_T5Sj"();


--
-- Name: simple_pg_T5Sj_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_T5Sj_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_T5Sj"();


--
-- Name: simple_pg_TKX5_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_TKX5_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_TKX5"();


--
-- Name: simple_pg_TaqT_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_TaqT_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_TaqT"();


--
-- Name: simple_pg_TyTD_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_TyTD_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_TyTD"();


--
-- Name: simple_pg_TyTD_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_TyTD_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_TyTD"();


--
-- Name: simple_pg_WatN_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_WatN_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_WatN"();


--
-- Name: simple_pg_XTP2_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_XTP2_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_XTP2"();


--
-- Name: simple_pg_XTP2_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_XTP2_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_XTP2"();


--
-- Name: simple_pg_YQmw_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_YQmw_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_YQmw"();


--
-- Name: simple_pg_YS5P_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_YS5P_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_YS5P"();


--
-- Name: simple_pg_YS5P_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_YS5P_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_YS5P"();


--
-- Name: simple_pg_aNQZ_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_aNQZ_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_aNQZ"();


--
-- Name: simple_pg_ajmM_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_ajmM_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_ajmM"();


--
-- Name: simple_pg_azk3_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER simple_pg_azk3_categories AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE livequery_simple_pg_azk3();


--
-- Name: simple_pg_azk3_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER simple_pg_azk3_shifts AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE livequery_simple_pg_azk3();


--
-- Name: simple_pg_bhJC_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_bhJC_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_bhJC"();


--
-- Name: simple_pg_bhJC_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_bhJC_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_bhJC"();


--
-- Name: simple_pg_cQAQ_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_cQAQ_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_cQAQ"();


--
-- Name: simple_pg_cQAQ_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_cQAQ_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_cQAQ"();


--
-- Name: simple_pg_dYxs_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_dYxs_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_dYxs"();


--
-- Name: simple_pg_dbPe_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_dbPe_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_dbPe"();


--
-- Name: simple_pg_eA7d_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_eA7d_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_eA7d"();


--
-- Name: simple_pg_eA7d_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_eA7d_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_eA7d"();


--
-- Name: simple_pg_eaNW_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_eaNW_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_eaNW"();


--
-- Name: simple_pg_eaNW_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_eaNW_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_eaNW"();


--
-- Name: simple_pg_ezBa_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_ezBa_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_ezBa"();


--
-- Name: simple_pg_gDgB_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_gDgB_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_gDgB"();


--
-- Name: simple_pg_gMmS_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_gMmS_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_gMmS"();


--
-- Name: simple_pg_hCSM_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_hCSM_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_hCSM"();


--
-- Name: simple_pg_hvuv_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER simple_pg_hvuv_shifts AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE livequery_simple_pg_hvuv();


--
-- Name: simple_pg_iA9r_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_iA9r_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_iA9r"();


--
-- Name: simple_pg_iA9r_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_iA9r_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_iA9r"();


--
-- Name: simple_pg_iMGL_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_iMGL_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_iMGL"();


--
-- Name: simple_pg_kPHu_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_kPHu_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_kPHu"();


--
-- Name: simple_pg_kPHu_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_kPHu_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_kPHu"();


--
-- Name: simple_pg_nPn6_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_nPn6_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_nPn6"();


--
-- Name: simple_pg_nQNx_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_nQNx_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_nQNx"();


--
-- Name: simple_pg_nQNx_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_nQNx_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_nQNx"();


--
-- Name: simple_pg_nmuC_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_nmuC_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_nmuC"();


--
-- Name: simple_pg_oc9X_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_oc9X_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_oc9X"();


--
-- Name: simple_pg_pq49_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER simple_pg_pq49_shifts AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE livequery_simple_pg_pq49();


--
-- Name: simple_pg_ugbf_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER simple_pg_ugbf_categories AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE livequery_simple_pg_ugbf();


--
-- Name: simple_pg_ugbf_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER simple_pg_ugbf_shifts AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE livequery_simple_pg_ugbf();


--
-- Name: simple_pg_uv8X_categories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_uv8X_categories" AFTER INSERT OR DELETE OR UPDATE ON categories FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_uv8X"();


--
-- Name: simple_pg_uv8X_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_uv8X_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_uv8X"();


--
-- Name: simple_pg_vCMJ_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_vCMJ_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_vCMJ"();


--
-- Name: simple_pg_wdWh_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_wdWh_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_wdWh"();


--
-- Name: simple_pg_y85H_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_y85H_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_y85H"();


--
-- Name: simple_pg_yhyE_shifts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "simple_pg_yhyE_shifts" AFTER INSERT OR DELETE OR UPDATE ON shifts FOR EACH ROW EXECUTE PROCEDURE "livequery_simple_pg_yhyE"();


--
-- Name: items_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_category_id_foreign FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: line_items_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY line_items
    ADD CONSTRAINT line_items_item_id_foreign FOREIGN KEY (item_id) REFERENCES items(id);


--
-- Name: line_items_transaction_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY line_items
    ADD CONSTRAINT line_items_transaction_id_foreign FOREIGN KEY (transaction_id) REFERENCES transactions(id);


--
-- Name: supplies_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY supplies
    ADD CONSTRAINT supplies_item_id_foreign FOREIGN KEY (item_id) REFERENCES items(id);


--
-- Name: supplies_supplier_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY supplies
    ADD CONSTRAINT supplies_supplier_id_foreign FOREIGN KEY (supplier_id) REFERENCES suppliers(id);


--
-- Name: transactions_shift_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_shift_id_foreign FOREIGN KEY (shift_id) REFERENCES shifts(id);


--
-- PostgreSQL database dump complete
--

