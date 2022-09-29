

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


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.posts DISABLE TRIGGER ALL;

INSERT INTO public.posts (id, title, body, created_at) VALUES ('a1b4083f-99d1-4ecb-ad2f-30e55c3000e3', 'First Blog Post', 'Wow, this is so cool! this is my first blog', '2022-09-29 22:07:01.710243+00');
INSERT INTO public.posts (id, title, body, created_at) VALUES ('b47a507c-f5f7-469a-ae66-7d006a77c767', 'Second Post', 'Post numero dos', '2022-09-29 22:07:01.710243+00');


ALTER TABLE public.posts ENABLE TRIGGER ALL;


ALTER TABLE public.schema_migrations DISABLE TRIGGER ALL;

INSERT INTO public.schema_migrations (revision) VALUES (1664487617);
INSERT INTO public.schema_migrations (revision) VALUES (1664489222);


ALTER TABLE public.schema_migrations ENABLE TRIGGER ALL;


