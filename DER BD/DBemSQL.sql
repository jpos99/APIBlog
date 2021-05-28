-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.4-alpha
-- PostgreSQL version: 13.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: "DBBlogAPI" | type: DATABASE --
-- DROP DATABASE IF EXISTS "DBBlogAPI";
CREATE DATABASE "DBBlogAPI"
	ENCODING = 'UTF8'
	LC_COLLATE = 'C'
	LC_CTYPE = 'C'
	TABLESPACE = pg_default
	OWNER = postgres;
-- ddl-end --


-- object: public.auth_user_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.auth_user_id_seq CASCADE;
CREATE SEQUENCE public.auth_user_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.auth_user_id_seq OWNER TO postgres;
-- ddl-end --

-- object: auth_user_username_6821ab7c_like | type: INDEX --
-- DROP INDEX IF EXISTS public.auth_user_username_6821ab7c_like CASCADE;
CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user
	USING btree
	(
	  username
	)
	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: public.appapi_autor_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.appapi_autor_id_seq CASCADE;
CREATE SEQUENCE public.appapi_autor_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.appapi_autor_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.appapi_postagem_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.appapi_postagem_id_seq CASCADE;
CREATE SEQUENCE public.appapi_postagem_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.appapi_postagem_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.appapi_log_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.appapi_log_id_seq CASCADE;
CREATE SEQUENCE public.appapi_log_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.appapi_log_id_seq OWNER TO postgres;
-- ddl-end --

-- object: appapi_autor_nome_autor_c457033a_like | type: INDEX --
-- DROP INDEX IF EXISTS public.appapi_autor_nome_autor_c457033a_like CASCADE;
CREATE INDEX appapi_autor_nome_autor_c457033a_like ON public.appapi_autor
	USING btree
	(
	  nome_autor
	)
	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: appapi_autor_usuario_autor_id_ed23e378 | type: INDEX --
-- DROP INDEX IF EXISTS public.appapi_autor_usuario_autor_id_ed23e378 CASCADE;
CREATE INDEX appapi_autor_usuario_autor_id_ed23e378 ON public.appapi_autor
	USING btree
	(
	  usuario_autor_id
	)
	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: appapi_postagem_titulo_postagem_46d2fc2a_like | type: INDEX --
-- DROP INDEX IF EXISTS public.appapi_postagem_titulo_postagem_46d2fc2a_like CASCADE;
CREATE INDEX appapi_postagem_titulo_postagem_46d2fc2a_like ON public.appapi_postagem
	USING btree
	(
	  titulo_postagem
	)
	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: appapi_postagem_autor_postagem_id_17a272cd | type: INDEX --
-- DROP INDEX IF EXISTS public.appapi_postagem_autor_postagem_id_17a272cd CASCADE;
CREATE INDEX appapi_postagem_autor_postagem_id_17a272cd ON public.appapi_postagem
	USING btree
	(
	  autor_postagem_id
	)
	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: appapi_log_usuario_log_id_b262faf0 | type: INDEX --
-- DROP INDEX IF EXISTS public.appapi_log_usuario_log_id_b262faf0 CASCADE;
CREATE INDEX appapi_log_usuario_log_id_b262faf0 ON public.appapi_log
	USING btree
	(
	  usuario_log_id
	)
	WITH (FILLFACTOR = 90);
-- ddl-end --

-- object: public.auth_user | type: TABLE --
-- DROP TABLE IF EXISTS public.auth_user CASCADE;
CREATE TABLE public.auth_user (
	id integer NOT NULL DEFAULT nextval('public.auth_user_id_seq'::regclass),
	password character varying(128) NOT NULL,
	last_login timestamp with time zone,
	is_superuser boolean NOT NULL,
	username character varying(150) NOT NULL,
	first_name character varying(150) NOT NULL,
	last_name character varying(150) NOT NULL,
	email character varying(254) NOT NULL,
	is_staff boolean NOT NULL,
	is_active boolean NOT NULL,
	date_joined timestamp with time zone NOT NULL,
	CONSTRAINT auth_user_pkey PRIMARY KEY (id),
	CONSTRAINT auth_user_username_key UNIQUE (username)

);
-- ddl-end --
ALTER TABLE public.auth_user OWNER TO postgres;
-- ddl-end --

-- object: public.appapi_autor | type: TABLE --
-- DROP TABLE IF EXISTS public.appapi_autor CASCADE;
CREATE TABLE public.appapi_autor (
	id bigint NOT NULL DEFAULT nextval('public.appapi_autor_id_seq'::regclass),
	nome_autor character varying(100) NOT NULL,
	classificacao_autor character varying(1) NOT NULL,
	foto_autor character varying(100),
	usuario_autor_id integer NOT NULL,
	CONSTRAINT appapi_autor_pkey PRIMARY KEY (id),
	CONSTRAINT appapi_autor_nome_autor_key UNIQUE (nome_autor)

);
-- ddl-end --
ALTER TABLE public.appapi_autor OWNER TO postgres;
-- ddl-end --

-- object: public.appapi_postagem | type: TABLE --
-- DROP TABLE IF EXISTS public.appapi_postagem CASCADE;
CREATE TABLE public.appapi_postagem (
	id bigint NOT NULL DEFAULT nextval('public.appapi_postagem_id_seq'::regclass),
	titulo_postagem character varying(100) NOT NULL,
	resumo_postagem text NOT NULL,
	corpo_postagem text NOT NULL,
	data_postagem timestamp with time zone NOT NULL,
	atualizacao_postagem timestamp with time zone,
	autor_postagem_id bigint NOT NULL,
	CONSTRAINT appapi_postagem_pkey PRIMARY KEY (id),
	CONSTRAINT appapi_postagem_titulo_postagem_key UNIQUE (titulo_postagem)

);
-- ddl-end --
ALTER TABLE public.appapi_postagem OWNER TO postgres;
-- ddl-end --

-- object: public.appapi_log | type: TABLE --
-- DROP TABLE IF EXISTS public.appapi_log CASCADE;
CREATE TABLE public.appapi_log (
	id bigint NOT NULL DEFAULT nextval('public.appapi_log_id_seq'::regclass),
	acao_log text NOT NULL,
	data_log timestamp with time zone NOT NULL,
	usuario_log_id integer NOT NULL,
	CONSTRAINT appapi_log_pkey PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.appapi_log OWNER TO postgres;
-- ddl-end --

-- object: appapi_autor_usuario_autor_id_ed23e378_fk_auth_user_id | type: CONSTRAINT --
-- ALTER TABLE public.appapi_autor DROP CONSTRAINT IF EXISTS appapi_autor_usuario_autor_id_ed23e378_fk_auth_user_id CASCADE;
ALTER TABLE public.appapi_autor ADD CONSTRAINT appapi_autor_usuario_autor_id_ed23e378_fk_auth_user_id FOREIGN KEY (usuario_autor_id)
REFERENCES public.auth_user (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED;
-- ddl-end --

-- object: appapi_postagem_autor_postagem_id_17a272cd_fk_appapi_autor_id | type: CONSTRAINT --
-- ALTER TABLE public.appapi_postagem DROP CONSTRAINT IF EXISTS appapi_postagem_autor_postagem_id_17a272cd_fk_appapi_autor_id CASCADE;
ALTER TABLE public.appapi_postagem ADD CONSTRAINT appapi_postagem_autor_postagem_id_17a272cd_fk_appapi_autor_id FOREIGN KEY (autor_postagem_id)
REFERENCES public.appapi_autor (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED;
-- ddl-end --

-- object: appapi_log_usuario_log_id_b262faf0_fk_auth_user_id | type: CONSTRAINT --
-- ALTER TABLE public.appapi_log DROP CONSTRAINT IF EXISTS appapi_log_usuario_log_id_b262faf0_fk_auth_user_id CASCADE;
ALTER TABLE public.appapi_log ADD CONSTRAINT appapi_log_usuario_log_id_b262faf0_fk_auth_user_id FOREIGN KEY (usuario_log_id)
REFERENCES public.auth_user (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY DEFERRED;
-- ddl-end --

-- object: "grant_CU_eb94f049ac" | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA public
   TO postgres;
-- ddl-end --

-- object: "grant_CU_cd8e46e7b6" | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA public
   TO PUBLIC;
-- ddl-end --


