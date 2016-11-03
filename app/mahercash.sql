--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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
-- Name: items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE knex_migrations_lock (
    is_locked integer
);


--
-- Name: line_items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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
-- Name: shifts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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
-- Name: suppliers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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
-- Name: supplies; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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
-- Name: transactions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: items_name_unique; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_name_unique UNIQUE (name);


--
-- Name: items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- Name: line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY line_items
    ADD CONSTRAINT line_items_pkey PRIMARY KEY (id);


--
-- Name: shifts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shifts
    ADD CONSTRAINT shifts_pkey PRIMARY KEY (id);


--
-- Name: suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);


--
-- Name: supplies_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY supplies
    ADD CONSTRAINT supplies_pkey PRIMARY KEY (id);


--
-- Name: transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: items_category_id_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX items_category_id_index ON items USING btree (category_id);


--
-- Name: line_items_item_id_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX line_items_item_id_index ON line_items USING btree (item_id);


--
-- Name: line_items_transaction_id_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX line_items_transaction_id_index ON line_items USING btree (transaction_id);


--
-- Name: supplies_item_id_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX supplies_item_id_index ON supplies USING btree (item_id);


--
-- Name: supplies_supplier_id_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX supplies_supplier_id_index ON supplies USING btree (supplier_id);


--
-- Name: transactions_shift_id_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
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
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM yosuuf;
GRANT ALL ON SCHEMA public TO yosuuf;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

