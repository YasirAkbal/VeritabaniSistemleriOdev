--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

-- Started on 2018-12-16 20:04:59

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 229 (class 1255 OID 34350)
-- Name: bagiscilarigoster(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.bagiscilarigoster() RETURNS TABLE(ismi character varying, soyismi character varying, bagisadedi smallint)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT "adi", "soyadi","bagisSayisi" FROM "kisiler"
	INNER JOIN "bagisyapanlar" ON "kisiler"."kisiNo" = "bagisyapanlar"."kisiNo"													  
    WHERE "bagisSayisi" > 0
	ORDER BY "bagisSayisi";
END;
$$;


ALTER FUNCTION public.bagiscilarigoster() OWNER TO postgres;

--
-- TOC entry 234 (class 1255 OID 34394)
-- Name: calisanAlmaTR4(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."calisanAlmaTR4"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN

	UPDATE "calisanlar" SET "girisTarihi" = CURRENT_DATE WHERE "kisiNo" = NEW."kisiNo";

    RETURN NEW;
END;
$$;


ALTER FUNCTION public."calisanAlmaTR4"() OWNER TO postgres;

--
-- TOC entry 242 (class 1255 OID 42254)
-- Name: calisanekle(character varying, character varying, character, character varying, character, character varying, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.calisanekle(p_adi character varying, p_soyadi character varying, p_dt character, p_dy character varying, p_tel character, p_adres character varying, p_cinsiyet character varying, p_eposta character varying, p_istanimi character varying, p_sicilno character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$	
DECLARE
   v_id BIGINT;
BEGIN

   v_id = kisiekle(p_adi,p_soyadi,p_dt,p_dy,p_tel,p_adres,p_cinsiyet,p_eposta);
   
   INSERT INTO "calisanlar"("kisiNo","isTanimi","sicilNo") VALUES(v_id, p_isTanimi, p_sicilNo);
	
END;
$$;


ALTER FUNCTION public.calisanekle(p_adi character varying, p_soyadi character varying, p_dt character, p_dy character varying, p_tel character, p_adres character varying, p_cinsiyet character varying, p_eposta character varying, p_istanimi character varying, p_sicilno character varying) OWNER TO postgres;

--
-- TOC entry 241 (class 1255 OID 42241)
-- Name: katalogvekitap(character varying, character, smallint, character varying, character varying, character, smallint, character varying, bigint, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.katalogvekitap(p_ktpadi character varying, p_basimt character, p_ciltno smallint, p_dil character varying, p_tipi character varying, p_isbn character, p_sayfasayisi smallint, p_yayinevi character varying, p_kitapkategori bigint, p_yazaradi character varying, p_yazarsoyadi character varying, p_bagislayanad character varying, p_bagislayansoyad character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$DECLARE
   v_id BIGINT;
   yazar_no BIGINT;
   bagisyapan_no BIGINT;
BEGIN

	IF EXISTS(SELECT * FROM "kisiler" WHERE p_bagislayanAd = "adi" AND p_bagislayanSoyad = "soyadi")
	THEN
	   SELECT "kisiNo" INTO bagisyapan_no FROM "kisiler" WHERE p_bagislayanAd = "adi" AND p_bagislayanSoyad = "soyadi";

	   IF NOT EXISTS(SELECT * FROM "bagisyapanlar" WHERE "kisiNo" = bagisyapan_no)
	   THEN
			INSERT INTO "bagisyapanlar"("kisiNo") VALUES(bagisyapan_no);
	   END IF;

	ELSE
		INSERT INTO "kisiler"("adi","soyadi") VALUES(p_bagislayanAd,p_bagislayanSoyad) RETURNING "kisiNo" INTO bagisyapan_no;
		INSERT INTO "bagisyapanlar"("kisiNo") VALUES(bagisyapan_no);
	END IF;
	
   
   IF EXISTS(SELECT "yazarNo" FROM "yazarlar"  WHERE "yazarAdi" = p_yazarAdi AND "yazarSoyadi" = p_yazarSoyadi)
   THEN
   		SELECT "yazarNo" INTO yazar_no FROM "yazarlar"  WHERE "yazarAdi" = p_yazarAdi AND "yazarSoyadi" = p_yazarSoyadi;
   ELSE
   		INSERT INTO "yazarlar"("yazarAdi","yazarSoyadi") VALUES(p_yazarAdi,p_yazarSoyadi) RETURNING "yazarNo" INTO yazar_no;
   END IF;
   
   
   INSERT INTO "katalogkitap"("kitapAdi","basimYili","ciltNo","dil","kaynakTipi","ISBN","sayfaSayisi","yayinEvi","kitapKategori","yazar")
   VALUES (p_ktpAdi, p_basimT, p_ciltNo, p_dil, p_Tipi, p_isbn, p_sayfaSayisi, p_yayinEvi, p_kitapKategori, yazar_no)
   RETURNING "katalogNo" INTO v_id;

   INSERT INTO "kitaplar"("katalogNo","bagislayan") VALUES (v_id,bagisyapan_no);
	
END;
$$;


ALTER FUNCTION public.katalogvekitap(p_ktpadi character varying, p_basimt character, p_ciltno smallint, p_dil character varying, p_tipi character varying, p_isbn character, p_sayfasayisi smallint, p_yayinevi character varying, p_kitapkategori bigint, p_yazaradi character varying, p_yazarsoyadi character varying, p_bagislayanad character varying, p_bagislayansoyad character varying) OWNER TO postgres;

--
-- TOC entry 240 (class 1255 OID 42250)
-- Name: kisiekle(character varying, character varying, character, character varying, character, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.kisiekle(p_adi character varying, p_soyadi character varying, p_dt character, p_dy character varying, p_tel character, p_adres character varying, p_cinsiyet character varying, p_eposta character varying) RETURNS bigint
    LANGUAGE plpgsql
    AS $$	
DECLARE
   v_id BIGINT;
BEGIN

   INSERT INTO "kisiler"("adi","soyadi","dogumTarihi","dogumYeri","telefon","adres","cinsiyet","eposta")
   VALUES (p_adi, p_soyadi, p_dT, p_dY, p_tel, p_adres, p_cinsiyet, p_eposta)
   RETURNING "kisiNo" INTO v_id;
	
	RETURN v_id;
	
END;
$$;


ALTER FUNCTION public.kisiekle(p_adi character varying, p_soyadi character varying, p_dt character, p_dy character varying, p_tel character, p_adres character varying, p_cinsiyet character varying, p_eposta character varying) OWNER TO postgres;

--
-- TOC entry 243 (class 1255 OID 42256)
-- Name: kitapEklemeTR5(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."kitapEklemeTR5"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$DECLARE
	y_bagislayan BIGINT;
BEGIN
	
	UPDATE "katalogkitap" SET "adet" = "adet" + 1 
		WHERE "katalogkitap"."katalogNo" = NEW."katalogNo";
	UPDATE "kitaplar" SET "eklenmeTarihi" = CURRENT_DATE WHERE "kitapNo" = NEW."kitapNo";
	UPDATE "bagisyapanlar" SET "bagisSayisi" = "bagisSayisi" + 1 WHERE "kisiNo" = NEW."bagislayan";
		
    RETURN NEW;
END;
$$;


ALTER FUNCTION public."kitapEklemeTR5"() OWNER TO postgres;

--
-- TOC entry 237 (class 1255 OID 42302)
-- Name: kitapSilmeTR7(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."kitapSilmeTR7"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN

	UPDATE "katalogkitap" SET "adet" = "adet" - 1 WHERE "katalogkitap"."katalogNo" = OLD."katalogNo";

    RETURN NEW;
END;
$$;


ALTER FUNCTION public."kitapSilmeTR7"() OWNER TO postgres;

--
-- TOC entry 235 (class 1255 OID 42283)
-- Name: kitapekle(bigint, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.kitapekle(p_katalogno bigint, p_bagislayanad character varying, p_bagislayansoyad character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
	bagisyapan_no BIGINT;
BEGIN

	IF EXISTS(SELECT * FROM "kisiler" WHERE p_bagislayanAd = "adi" AND p_bagislayanSoyad = "soyadi")
	THEN

	   SELECT "kisiNo" INTO bagisyapan_no FROM "kisiler" WHERE p_bagislayanAd = "adi" AND p_bagislayanSoyad = "soyadi";

	   IF NOT EXISTS(SELECT * FROM "bagisyapanlar" WHERE "kisiNo" = bagisyapan_no)
	   THEN
			INSERT INTO "bagisyapanlar"("kisiNo") VALUES(bagisyapan_no);
	   END IF;

	ELSE
		INSERT INTO "kisiler"("adi","soyadi") VALUES(p_bagislayanAd,p_bagislayanSoyad) RETURNING "kisiNo" INTO bagisyapan_no;
		INSERT INTO "bagisyapanlar"("kisiNo") VALUES(bagisyapan_no);
	END IF;
	
	INSERT INTO "kitaplar"("katalogNo","bagislayan") VALUES (p_katalogno,bagisyapan_no);
	
END;
$$;


ALTER FUNCTION public.kitapekle(p_katalogno bigint, p_bagislayanad character varying, p_bagislayansoyad character varying) OWNER TO postgres;

--
-- TOC entry 232 (class 1255 OID 34367)
-- Name: kitapodunc(bigint, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.kitapodunc(ktpno bigint, ksno bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN

	IF EXISTS(SELECT * FROM "kitaplar" WHERE "kitaplar"."kitapNo" = ktpNo AND "kitaplar"."oduncAlan" = '0' 
			  AND "kitaplar"."rezerv" = false)
	THEN
    UPDATE "kitaplar" SET "oduncAlan" = ksNo, "teslimAlinma" = CURRENT_DATE, "teslimEdilecek" = CURRENT_DATE + INTEGER '14'
    WHERE "kitapNo" = ktpNo;
	END IF;

END;
$$;


ALTER FUNCTION public.kitapodunc(ktpno bigint, ksno bigint) OWNER TO postgres;

--
-- TOC entry 231 (class 1255 OID 34378)
-- Name: oduncAlmaTR1(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."oduncAlmaTR1"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW."oduncAlan" <> OLD."oduncAlan" THEN
        INSERT INTO "oduncAlmalariKaydet"("kisiNo", "kitapNo", "alinmaTarihi", "verilecekTarih")
        VALUES(NEW."oduncAlan", NEW."kitapNo", CURRENT_DATE, CURRENT_DATE  + INTEGER '14');
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public."oduncAlmaTR1"() OWNER TO postgres;

--
-- TOC entry 230 (class 1255 OID 34362)
-- Name: raftakilerigoster(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.raftakilerigoster() RETURNS TABLE(kitapismi character varying, yazarismi text, tipi "char", yeri text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT "kitapAdi", "yazarAdi" || ' ' || "yazarSoyadi", "kaynakTipi", "kat" || '.' || raf || '.' || sira 
	FROM "katalogkitap"
	INNER JOIN "kitaplar" ON "katalogkitap"."katalogNo" = "kitaplar"."katalogNo"
	INNER JOIN "yazarlar" ON "katalogkitap"."yazar" = "yazarlar"."yazarNo"
	INNER JOIN "yer" ON "kitaplar"."yerNo" = "yer"."yerNo"
    WHERE "oduncAlan" = 0
	ORDER BY "kitapAdi";
END;
$$;


ALTER FUNCTION public.raftakilerigoster() OWNER TO postgres;

--
-- TOC entry 236 (class 1255 OID 34382)
-- Name: rezervYapmaTR2(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."rezervYapmaTR2"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN

    IF EXISTS(SELECT * FROM "kitaplar" WHERE "kitaplar"."kitapNo" = NEW."kitapNo")
	THEN
		UPDATE "kitaplar" SET "rezerv" = true WHERE "kitaplar"."kitapNo" = NEW."kitapNo";
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public."rezervYapmaTR2"() OWNER TO postgres;

--
-- TOC entry 244 (class 1255 OID 42279)
-- Name: rezervYapmaTR6(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."rezervYapmaTR6"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN
    IF NEW."oduncAlan" = 0 AND NEW."rezerv" <> OLD."rezerv" THEN
        INSERT INTO "rezervasyonlariKaydet"("kisiNo", "kitapNo", "tarih")
        VALUES(NEW."oduncAlan", NEW."kitapNo", CURRENT_DATE);
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public."rezervYapmaTR6"() OWNER TO postgres;

--
-- TOC entry 238 (class 1255 OID 42305)
-- Name: rezervyap(bigint, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.rezervyap(p_kitapno bigint, p_kisino bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN

	IF EXISTS(SELECT * FROM "kitaplar" WHERE "kitapNo" = p_kitapno AND "oduncAlan" = 0 AND rezerv = false)
	THEN
		INSERT INTO "kitaprezervasyon"("kitapNo","kisiNo") VALUES(p_kitapno,p_kisino);
	END IF;
		
END;
$$;


ALTER FUNCTION public.rezervyap(p_kitapno bigint, p_kisino bigint) OWNER TO postgres;

--
-- TOC entry 233 (class 1255 OID 34390)
-- Name: uyeOlmaTR3(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."uyeOlmaTR3"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN

	UPDATE "uyeler" SET "kayitTarihi" = CURRENT_DATE WHERE "kisiNo" = NEW."kisiNo";

    RETURN NEW;
END;
$$;


ALTER FUNCTION public."uyeOlmaTR3"() OWNER TO postgres;

--
-- TOC entry 239 (class 1255 OID 42253)
-- Name: uyeekle(character varying, character varying, character, character varying, character, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.uyeekle(p_adi character varying, p_soyadi character varying, p_dt character, p_dy character varying, p_tel character, p_adres character varying, p_cinsiyet character varying, p_eposta character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$	
DECLARE
   v_id BIGINT;
BEGIN

   v_id = kisiekle(p_adi,p_soyadi,p_dt,p_dy,p_tel,p_adres,p_cinsiyet,p_eposta);
   
   INSERT INTO "uyeler"("kisiNo") VALUES(v_id);
	
END;
$$;


ALTER FUNCTION public.uyeekle(p_adi character varying, p_soyadi character varying, p_dt character, p_dy character varying, p_tel character, p_adres character varying, p_cinsiyet character varying, p_eposta character varying) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 205 (class 1259 OID 34243)
-- Name: bagisyapanlar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bagisyapanlar (
    "kisiNo" bigint NOT NULL,
    "bagisSayisi" smallint DEFAULT 0
);


ALTER TABLE public.bagisyapanlar OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 34263)
-- Name: calisanlar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calisanlar (
    "kisiNo" bigint NOT NULL,
    "isTanimi" character varying(300),
    "girisTarihi" character(25),
    "sicilNo" character(13)
);


ALTER TABLE public.calisanlar OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 34174)
-- Name: katalogkitap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.katalogkitap (
    "katalogNo" bigint NOT NULL,
    "kitapAdi" character varying(50),
    "basimYili" character(25) DEFAULT '2000.01.01'::bpchar,
    "ciltNo" smallint DEFAULT 0,
    dil character varying(25),
    "kaynakTipi" character varying(15),
    "ISBN" character(13),
    adet smallint DEFAULT 0,
    "sayfaSayisi" smallint DEFAULT 0,
    "kitapKategori" bigint DEFAULT 0,
    yazar bigint DEFAULT 0,
    "oduncAdedi" smallint DEFAULT 0,
    "yayinEvi" character varying(40)
);


ALTER TABLE public.katalogkitap OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 34172)
-- Name: katalogkitap_katalogNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."katalogkitap_katalogNo_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."katalogkitap_katalogNo_seq" OWNER TO postgres;

--
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 196
-- Name: katalogkitap_katalogNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."katalogkitap_katalogNo_seq" OWNED BY public.katalogkitap."katalogNo";


--
-- TOC entry 201 (class 1259 OID 34196)
-- Name: kategoriler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kategoriler (
    "kategoriNo" bigint NOT NULL,
    "kategoriAdi" character varying(30) NOT NULL,
    aciklama character varying(100)
);


ALTER TABLE public.kategoriler OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 34194)
-- Name: kategoriler_kategoriNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."kategoriler_kategoriNo_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."kategoriler_kategoriNo_seq" OWNER TO postgres;

--
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 200
-- Name: kategoriler_kategoriNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."kategoriler_kategoriNo_seq" OWNED BY public.kategoriler."kategoriNo";


--
-- TOC entry 204 (class 1259 OID 34224)
-- Name: kisiler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kisiler (
    "kisiNo" bigint NOT NULL,
    adi character varying(40),
    soyadi character varying(40),
    "dogumTarihi" character(25),
    "dogumYeri" character varying(50),
    telefon character(13),
    adres character varying(250),
    cinsiyet character varying(15),
    eposta character varying(100)
);


ALTER TABLE public.kisiler OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 34222)
-- Name: kisiler_kisiNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."kisiler_kisiNo_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."kisiler_kisiNo_seq" OWNER TO postgres;

--
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 203
-- Name: kisiler_kisiNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."kisiler_kisiNo_seq" OWNED BY public.kisiler."kisiNo";


--
-- TOC entry 202 (class 1259 OID 34207)
-- Name: kitapkategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kitapkategori (
    "katalogNo" bigint NOT NULL,
    "kategoriNo" bigint NOT NULL
);


ALTER TABLE public.kitapkategori OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 34182)
-- Name: kitaplar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kitaplar (
    "katalogNo" bigint NOT NULL,
    "kitapNo" bigint NOT NULL,
    "oduncAlan" bigint DEFAULT 0,
    "yerNo" bigint,
    bagislayan bigint,
    "teslimAlinma" character varying(25) DEFAULT 0,
    "teslimEdilecek" character varying(25),
    "eklenmeTarihi" character(25),
    rezerv boolean DEFAULT false
);


ALTER TABLE public.kitaplar OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 34180)
-- Name: kitaplar_kitapNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."kitaplar_kitapNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."kitaplar_kitapNo_seq" OWNER TO postgres;

--
-- TOC entry 2984 (class 0 OID 0)
-- Dependencies: 198
-- Name: kitaplar_kitapNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."kitaplar_kitapNo_seq" OWNED BY public.kitaplar."kitapNo";


--
-- TOC entry 212 (class 1259 OID 34318)
-- Name: kitaprezervasyon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kitaprezervasyon (
    "rezNo" bigint NOT NULL,
    "kitapNo" bigint NOT NULL,
    "kisiNo" bigint NOT NULL
);


ALTER TABLE public.kitaprezervasyon OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 34316)
-- Name: kitaprezervasyon_rezNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."kitaprezervasyon_rezNo_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."kitaprezervasyon_rezNo_seq" OWNER TO postgres;

--
-- TOC entry 2985 (class 0 OID 0)
-- Dependencies: 211
-- Name: kitaprezervasyon_rezNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."kitaprezervasyon_rezNo_seq" OWNED BY public.kitaprezervasyon."rezNo";


--
-- TOC entry 214 (class 1259 OID 34372)
-- Name: oduncAlmalariKaydet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."oduncAlmalariKaydet" (
    no bigint NOT NULL,
    "kisiNo" bigint,
    "kitapNo" bigint,
    "alinmaTarihi" character(25),
    "verilecekTarih" character(25)
);


ALTER TABLE public."oduncAlmalariKaydet" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 34370)
-- Name: oduncAlmalariKaydet_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."oduncAlmalariKaydet_no_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."oduncAlmalariKaydet_no_seq" OWNER TO postgres;

--
-- TOC entry 2986 (class 0 OID 0)
-- Dependencies: 213
-- Name: oduncAlmalariKaydet_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."oduncAlmalariKaydet_no_seq" OWNED BY public."oduncAlmalariKaydet".no;


--
-- TOC entry 216 (class 1259 OID 42261)
-- Name: rezervasyonlariKaydet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."rezervasyonlariKaydet" (
    no bigint NOT NULL,
    "kisiNo" bigint,
    "kitapNo" bigint,
    tarih character(25)
);


ALTER TABLE public."rezervasyonlariKaydet" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 42259)
-- Name: rezervasyonlariKaydet_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."rezervasyonlariKaydet_no_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rezervasyonlariKaydet_no_seq" OWNER TO postgres;

--
-- TOC entry 2987 (class 0 OID 0)
-- Dependencies: 215
-- Name: rezervasyonlariKaydet_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."rezervasyonlariKaydet_no_seq" OWNED BY public."rezervasyonlariKaydet".no;


--
-- TOC entry 206 (class 1259 OID 34253)
-- Name: uyeler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uyeler (
    "kisiNo" bigint NOT NULL,
    "kayitTarihi" character(25)
);


ALTER TABLE public.uyeler OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 34275)
-- Name: yazarlar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yazarlar (
    "yazarNo" integer NOT NULL,
    "yazarAdi" character varying(40) NOT NULL,
    "yazarSoyadi" character varying(40) NOT NULL,
    biyografi text,
    "dogumTarihi" character(25)
);


ALTER TABLE public.yazarlar OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 34273)
-- Name: yazalar_yazarNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."yazalar_yazarNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."yazalar_yazarNo_seq" OWNER TO postgres;

--
-- TOC entry 2988 (class 0 OID 0)
-- Dependencies: 208
-- Name: yazalar_yazarNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."yazalar_yazarNo_seq" OWNED BY public.yazarlar."yazarNo";


--
-- TOC entry 210 (class 1259 OID 34299)
-- Name: yer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yer (
    "yerNo" bigint NOT NULL,
    kat character(1),
    raf character(3),
    sira character(4)
);


ALTER TABLE public.yer OWNER TO postgres;

--
-- TOC entry 2750 (class 2604 OID 34177)
-- Name: katalogkitap katalogNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.katalogkitap ALTER COLUMN "katalogNo" SET DEFAULT nextval('public."katalogkitap_katalogNo_seq"'::regclass);


--
-- TOC entry 2762 (class 2604 OID 34199)
-- Name: kategoriler kategoriNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategoriler ALTER COLUMN "kategoriNo" SET DEFAULT nextval('public."kategoriler_kategoriNo_seq"'::regclass);


--
-- TOC entry 2763 (class 2604 OID 34227)
-- Name: kisiler kisiNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kisiler ALTER COLUMN "kisiNo" SET DEFAULT nextval('public."kisiler_kisiNo_seq"'::regclass);


--
-- TOC entry 2758 (class 2604 OID 34309)
-- Name: kitaplar kitapNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitaplar ALTER COLUMN "kitapNo" SET DEFAULT nextval('public."kitaplar_kitapNo_seq"'::regclass);


--
-- TOC entry 2766 (class 2604 OID 34321)
-- Name: kitaprezervasyon rezNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitaprezervasyon ALTER COLUMN "rezNo" SET DEFAULT nextval('public."kitaprezervasyon_rezNo_seq"'::regclass);


--
-- TOC entry 2767 (class 2604 OID 34375)
-- Name: oduncAlmalariKaydet no; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."oduncAlmalariKaydet" ALTER COLUMN no SET DEFAULT nextval('public."oduncAlmalariKaydet_no_seq"'::regclass);


--
-- TOC entry 2768 (class 2604 OID 42264)
-- Name: rezervasyonlariKaydet no; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."rezervasyonlariKaydet" ALTER COLUMN no SET DEFAULT nextval('public."rezervasyonlariKaydet_no_seq"'::regclass);


--
-- TOC entry 2765 (class 2604 OID 34278)
-- Name: yazarlar yazarNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yazarlar ALTER COLUMN "yazarNo" SET DEFAULT nextval('public."yazalar_yazarNo_seq"'::regclass);


--
-- TOC entry 2961 (class 0 OID 34243)
-- Dependencies: 205
-- Data for Name: bagisyapanlar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bagisyapanlar ("kisiNo", "bagisSayisi") FROM stdin;
26	5
\.


--
-- TOC entry 2963 (class 0 OID 34263)
-- Dependencies: 207
-- Data for Name: calisanlar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.calisanlar ("kisiNo", "isTanimi", "girisTarihi", "sicilNo") FROM stdin;
36	kitap dağıtır	2018-12-16               	1593678526951
37	kitap dağıtır	2018-12-16               	1593678526952
\.


--
-- TOC entry 2953 (class 0 OID 34174)
-- Dependencies: 197
-- Data for Name: katalogkitap; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.katalogkitap ("katalogNo", "kitapAdi", "basimYili", "ciltNo", dil, "kaynakTipi", "ISBN", adet, "sayfaSayisi", "kitapKategori", yazar, "oduncAdedi", "yayinEvi") FROM stdin;
28	PostgreSQL	01.01.2000               	1	TÜrkçe	Kitap	0123456789111	1	400	1	15	0	Pusula
31	PostgreSQL	01.01.2000               	2	TÜrkçe	Kitap	0123456789112	3	400	1	15	0	Pusula
\.


--
-- TOC entry 2957 (class 0 OID 34196)
-- Dependencies: 201
-- Data for Name: kategoriler; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kategoriler ("kategoriNo", "kategoriAdi", aciklama) FROM stdin;
4	kategori1	\N
5	kategori2	\N
6	kategori3	\N
7	kategori4	\N
8	kategori5	\N
\.


--
-- TOC entry 2960 (class 0 OID 34224)
-- Dependencies: 204
-- Data for Name: kisiler; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kisiler ("kisiNo", adi, soyadi, "dogumTarihi", "dogumYeri", telefon, adres, cinsiyet, eposta) FROM stdin;
26	Ahmet	Akbal	\N	\N	\N	\N	\N	\N
28	denad1	densoyad2	1.09.1990                	istanbul	05348693620  	sakarya	ERKEK	deneme1@hotmail.com
29	denad2	densoyad2	1.09.1990                	istanbul	05348693622  	sakarya	ERKEK	deneme2@hotmail.com
30	denad3	densoyad3	1.09.1990                	istanbul	05348693623  	sakarya	ERKEK	deneme3@hotmail.com
32	denad5	densoyad5	1.09.1990                	istanbul	05348693625  	sakarya	ERKEK	deneme5@hotmail.com
36	calisanad1	calisansoyad1	16.12.1980               	fatih1	05376932541  	dogumyeri1	ERKEK	calisan1@hotmail.com
37	calisanad2	calisansoyad2	16.12.1980               	fatih1	05376932542  	dogumyeri2	ERKEK	calisan2@hotmail.com
\.


--
-- TOC entry 2958 (class 0 OID 34207)
-- Dependencies: 202
-- Data for Name: kitapkategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kitapkategori ("katalogNo", "kategoriNo") FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 34182)
-- Dependencies: 199
-- Data for Name: kitaplar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kitaplar ("katalogNo", "kitapNo", "oduncAlan", "yerNo", bagislayan, "teslimAlinma", "teslimEdilecek", "eklenmeTarihi", rezerv) FROM stdin;
31	32	0	\N	26	0	\N	2018-12-16               	f
31	30	28	\N	26	2018-12-16	2018-12-30	2018-12-16               	f
31	31	0	\N	26	0	\N	2018-12-16               	t
\.


--
-- TOC entry 2968 (class 0 OID 34318)
-- Dependencies: 212
-- Data for Name: kitaprezervasyon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kitaprezervasyon ("rezNo", "kitapNo", "kisiNo") FROM stdin;
3	31	29
\.


--
-- TOC entry 2970 (class 0 OID 34372)
-- Dependencies: 214
-- Data for Name: oduncAlmalariKaydet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."oduncAlmalariKaydet" (no, "kisiNo", "kitapNo", "alinmaTarihi", "verilecekTarih") FROM stdin;
4	27	29	2018-12-16               	2018-12-30               
5	28	30	2018-12-16               	2018-12-30               
\.


--
-- TOC entry 2972 (class 0 OID 42261)
-- Dependencies: 216
-- Data for Name: rezervasyonlariKaydet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."rezervasyonlariKaydet" (no, "kisiNo", "kitapNo", tarih) FROM stdin;
4	0	31	2018-12-16               
\.


--
-- TOC entry 2962 (class 0 OID 34253)
-- Dependencies: 206
-- Data for Name: uyeler; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.uyeler ("kisiNo", "kayitTarihi") FROM stdin;
28	2018-12-16               
29	2018-12-16               
30	2018-12-16               
32	2018-12-16               
\.


--
-- TOC entry 2965 (class 0 OID 34275)
-- Dependencies: 209
-- Data for Name: yazarlar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.yazarlar ("yazarNo", "yazarAdi", "yazarSoyadi", biyografi, "dogumTarihi") FROM stdin;
15	Mehmet	Şanlı	\N	\N
\.


--
-- TOC entry 2966 (class 0 OID 34299)
-- Dependencies: 210
-- Data for Name: yer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.yer ("yerNo", kat, raf, sira) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 0)
-- Dependencies: 196
-- Name: katalogkitap_katalogNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."katalogkitap_katalogNo_seq"', 31, true);


--
-- TOC entry 2990 (class 0 OID 0)
-- Dependencies: 200
-- Name: kategoriler_kategoriNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."kategoriler_kategoriNo_seq"', 8, true);


--
-- TOC entry 2991 (class 0 OID 0)
-- Dependencies: 203
-- Name: kisiler_kisiNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."kisiler_kisiNo_seq"', 39, true);


--
-- TOC entry 2992 (class 0 OID 0)
-- Dependencies: 198
-- Name: kitaplar_kitapNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."kitaplar_kitapNo_seq"', 32, true);


--
-- TOC entry 2993 (class 0 OID 0)
-- Dependencies: 211
-- Name: kitaprezervasyon_rezNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."kitaprezervasyon_rezNo_seq"', 3, true);


--
-- TOC entry 2994 (class 0 OID 0)
-- Dependencies: 213
-- Name: oduncAlmalariKaydet_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."oduncAlmalariKaydet_no_seq"', 5, true);


--
-- TOC entry 2995 (class 0 OID 0)
-- Dependencies: 215
-- Name: rezervasyonlariKaydet_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."rezervasyonlariKaydet_no_seq"', 4, true);


--
-- TOC entry 2996 (class 0 OID 0)
-- Dependencies: 208
-- Name: yazalar_yazarNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."yazalar_yazarNo_seq"', 15, true);


--
-- TOC entry 2797 (class 2606 OID 34247)
-- Name: bagisyapanlar bagisYapanlar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bagisyapanlar
    ADD CONSTRAINT "bagisYapanlar_pkey" PRIMARY KEY ("kisiNo");


--
-- TOC entry 2801 (class 2606 OID 34267)
-- Name: calisanlar calisanlar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calisanlar
    ADD CONSTRAINT calisanlar_pkey PRIMARY KEY ("kisiNo");


--
-- TOC entry 2771 (class 2606 OID 34179)
-- Name: katalogkitap katalogkitap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.katalogkitap
    ADD CONSTRAINT katalogkitap_pkey PRIMARY KEY ("katalogNo");


--
-- TOC entry 2783 (class 2606 OID 34201)
-- Name: kategoriler kategoriler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategoriler
    ADD CONSTRAINT kategoriler_pkey PRIMARY KEY ("kategoriNo");


--
-- TOC entry 2789 (class 2606 OID 42463)
-- Name: kisiler kisiler_adi_soyadi_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kisiler
    ADD CONSTRAINT kisiler_adi_soyadi_key UNIQUE (adi, soyadi);


--
-- TOC entry 2791 (class 2606 OID 34242)
-- Name: kisiler kisiler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kisiler
    ADD CONSTRAINT kisiler_pkey PRIMARY KEY ("kisiNo");


--
-- TOC entry 2773 (class 2606 OID 34421)
-- Name: katalogkitap kitapAdiveciltUnique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.katalogkitap
    ADD CONSTRAINT "kitapAdiveciltUnique" UNIQUE ("kitapAdi", "ciltNo");


--
-- TOC entry 2787 (class 2606 OID 34211)
-- Name: kitapkategori kitapKategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitapkategori
    ADD CONSTRAINT "kitapKategori_pkey" PRIMARY KEY ("kategoriNo", "katalogNo");


--
-- TOC entry 2777 (class 2606 OID 34325)
-- Name: kitaplar kitaplar_kitapNo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitaplar
    ADD CONSTRAINT "kitaplar_kitapNo_key" UNIQUE ("kitapNo");


--
-- TOC entry 2779 (class 2606 OID 34311)
-- Name: kitaplar kitaplar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitaplar
    ADD CONSTRAINT kitaplar_pkey PRIMARY KEY ("katalogNo", "kitapNo");


--
-- TOC entry 2811 (class 2606 OID 34323)
-- Name: kitaprezervasyon kitaprezervasyon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitaprezervasyon
    ADD CONSTRAINT kitaprezervasyon_pkey PRIMARY KEY ("kitapNo", "kisiNo", "rezNo");


--
-- TOC entry 2813 (class 2606 OID 34377)
-- Name: oduncAlmalariKaydet oduncAlmalariKaydet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."oduncAlmalariKaydet"
    ADD CONSTRAINT "oduncAlmalariKaydet_pkey" PRIMARY KEY (no);


--
-- TOC entry 2815 (class 2606 OID 42266)
-- Name: rezervasyonlariKaydet rezervasyonlariKaydet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."rezervasyonlariKaydet"
    ADD CONSTRAINT "rezervasyonlariKaydet_pkey" PRIMARY KEY (no);


--
-- TOC entry 2807 (class 2606 OID 34423)
-- Name: yer unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yer
    ADD CONSTRAINT "unique" UNIQUE (kat, raf, sira);


--
-- TOC entry 2803 (class 2606 OID 34437)
-- Name: calisanlar unique_calisanlar_sicilNo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calisanlar
    ADD CONSTRAINT "unique_calisanlar_sicilNo" UNIQUE ("sicilNo");


--
-- TOC entry 2775 (class 2606 OID 34419)
-- Name: katalogkitap unique_katalogkitap_ISBN; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.katalogkitap
    ADD CONSTRAINT "unique_katalogkitap_ISBN" UNIQUE ("ISBN");


--
-- TOC entry 2785 (class 2606 OID 42459)
-- Name: kategoriler unique_kategoriler_kategoriAdi; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategoriler
    ADD CONSTRAINT "unique_kategoriler_kategoriAdi" UNIQUE ("kategoriAdi");


--
-- TOC entry 2793 (class 2606 OID 34431)
-- Name: kisiler unique_kisiler_eposta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kisiler
    ADD CONSTRAINT unique_kisiler_eposta UNIQUE (eposta);


--
-- TOC entry 2795 (class 2606 OID 34433)
-- Name: kisiler unique_kisiler_telefon; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kisiler
    ADD CONSTRAINT unique_kisiler_telefon UNIQUE (telefon);


--
-- TOC entry 2781 (class 2606 OID 34425)
-- Name: kitaplar unique_kitaplar_yerNo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitaplar
    ADD CONSTRAINT "unique_kitaplar_yerNo" UNIQUE ("yerNo");


--
-- TOC entry 2799 (class 2606 OID 34257)
-- Name: uyeler uyeler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uyeler
    ADD CONSTRAINT uyeler_pkey PRIMARY KEY ("kisiNo");


--
-- TOC entry 2805 (class 2606 OID 34283)
-- Name: yazarlar yazalar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yazarlar
    ADD CONSTRAINT yazalar_pkey PRIMARY KEY ("yazarNo");


--
-- TOC entry 2809 (class 2606 OID 34303)
-- Name: yer yer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yer
    ADD CONSTRAINT yer_pkey PRIMARY KEY ("yerNo");


--
-- TOC entry 2769 (class 1259 OID 34417)
-- Name: index_kitapAdi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "index_kitapAdi" ON public.katalogkitap USING btree ("kitapAdi");


--
-- TOC entry 2829 (class 2620 OID 34395)
-- Name: calisanlar calisanAlindiginda; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "calisanAlindiginda" AFTER INSERT ON public.calisanlar FOR EACH ROW EXECUTE PROCEDURE public."calisanAlmaTR4"();


--
-- TOC entry 2825 (class 2620 OID 42257)
-- Name: kitaplar kitapEklendiginde; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "kitapEklendiginde" AFTER INSERT ON public.kitaplar FOR EACH ROW EXECUTE PROCEDURE public."kitapEklemeTR5"();


--
-- TOC entry 2826 (class 2620 OID 42304)
-- Name: kitaplar kitapOduncAlanDegistiginde; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "kitapOduncAlanDegistiginde" AFTER UPDATE ON public.kitaplar FOR EACH ROW EXECUTE PROCEDURE public."oduncAlmaTR1"();


--
-- TOC entry 2827 (class 2620 OID 42306)
-- Name: kitaplar kitapRezervEdildiginde; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "kitapRezervEdildiginde" AFTER UPDATE ON public.kitaplar FOR EACH ROW EXECUTE PROCEDURE public."rezervYapmaTR6"();


--
-- TOC entry 2830 (class 2620 OID 34389)
-- Name: kitaprezervasyon kitaprezervEdildiginde; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "kitaprezervEdildiginde" AFTER INSERT ON public.kitaprezervasyon FOR EACH ROW EXECUTE PROCEDURE public."rezervYapmaTR2"();


--
-- TOC entry 2828 (class 2620 OID 34391)
-- Name: uyeler uyeKayitiOldugunda; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "uyeKayitiOldugunda" AFTER INSERT ON public.uyeler FOR EACH ROW EXECUTE PROCEDURE public."uyeOlmaTR3"();


--
-- TOC entry 2820 (class 2606 OID 42294)
-- Name: bagisyapanlar bagisYapanlar_kisiNo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bagisyapanlar
    ADD CONSTRAINT "bagisYapanlar_kisiNo_fkey" FOREIGN KEY ("kisiNo") REFERENCES public.kisiler("kisiNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2822 (class 2606 OID 42289)
-- Name: calisanlar calisanlar_kisiNo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calisanlar
    ADD CONSTRAINT "calisanlar_kisiNo_fkey" FOREIGN KEY ("kisiNo") REFERENCES public.kisiler("kisiNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2816 (class 2606 OID 42368)
-- Name: katalogkitap katalogkitap_yazar_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.katalogkitap
    ADD CONSTRAINT katalogkitap_yazar_fkey FOREIGN KEY (yazar) REFERENCES public.yazarlar("yazarNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2819 (class 2606 OID 42363)
-- Name: kitapkategori kitapKategori_katalogNo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitapkategori
    ADD CONSTRAINT "kitapKategori_katalogNo_fkey" FOREIGN KEY ("katalogNo") REFERENCES public.katalogkitap("katalogNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2818 (class 2606 OID 42358)
-- Name: kitapkategori kitapKategori_kategoriNo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitapkategori
    ADD CONSTRAINT "kitapKategori_kategoriNo_fkey" FOREIGN KEY ("kategoriNo") REFERENCES public.kategoriler("kategoriNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2817 (class 2606 OID 42348)
-- Name: kitaplar kitaplar_katalogNo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitaplar
    ADD CONSTRAINT "kitaplar_katalogNo_fkey" FOREIGN KEY ("katalogNo") REFERENCES public.katalogkitap("katalogNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2824 (class 2606 OID 42322)
-- Name: kitaprezervasyon kitaprezervasyon_kisiNo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitaprezervasyon
    ADD CONSTRAINT "kitaprezervasyon_kisiNo_fkey" FOREIGN KEY ("kisiNo") REFERENCES public.kisiler("kisiNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2823 (class 2606 OID 42317)
-- Name: kitaprezervasyon kitaprezervasyon_kitapNo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitaprezervasyon
    ADD CONSTRAINT "kitaprezervasyon_kitapNo_fkey" FOREIGN KEY ("kitapNo") REFERENCES public.kitaplar("kitapNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2821 (class 2606 OID 42284)
-- Name: uyeler uyeler_kisiNo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uyeler
    ADD CONSTRAINT "uyeler_kisiNo_fkey" FOREIGN KEY ("kisiNo") REFERENCES public.kisiler("kisiNo") ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2018-12-16 20:04:59

--
-- PostgreSQL database dump complete
--

