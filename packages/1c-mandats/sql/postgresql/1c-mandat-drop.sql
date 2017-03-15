-- drop script
--
-- @author joel@aufrecht.org
-- @cvs-id &Id:$
--
select content_folder__unregister_content_type(-100, 'mandat_object', 't');
select content_type__drop_type('mandat_object', 't', 't');


DROP FUNCTION mandat__new(integer, character varying, character varying, character varying, character varying, character varying, integer, numeric, numeric, numeric, text, text, text, text, character varying, character varying, boolean, character varying, text, text, boolean);



DROP FUNCTION mandat__edit(
  integer,
  varchar,
  varchar,
  varchar,
  varchar,
  varchar,
  integer,
  numeric,
  numeric,
  numeric,
  text,
  text,
  text,
  text,
  varchar,
  varchar,
  boolean,
  varchar,
  text,
  text,
  boolean
);

DROP FUNCTION mandat__delete(integer);

DROP TABLE mandats CASCADE;

     
