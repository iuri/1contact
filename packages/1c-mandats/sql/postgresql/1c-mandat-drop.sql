-- drop script
--
-- @author joel@aufrecht.org
-- @cvs-id &Id:$
--


DROP FUNCTION mandat__new(
  integer,
  varchar,
  varchar,
  varchar,
  varchar,
  integer,
  integer,
  integer,
  integer,
  numeric,
  numeric,
  numeric,
  text,
  text,
  varchar,
  varchar,
  varchar,
  varchar,
  text,
  varchar,
  integer,
  integer,
  integer);




DROP FUNCTION mandat__delete(integer);


select content_folder__unregister_content_type(-100, 'mandat_object', 't');
select content_type__drop_type('mandat_object', 't', 't');


DROP TABLE mandats CASCADE;

     
