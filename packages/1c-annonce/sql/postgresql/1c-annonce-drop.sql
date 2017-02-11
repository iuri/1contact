-- /package/c1-annonce/sql/postgresql/c1-annonce-drop.sql

--
-- The C1 Annonce Package
--
-- @author Iuri Sampaio (iuri@iurix.com)
-- @creation-date 2016-11-16
--



------------------------------------
-- Table c1_annonce
------------------------------------
-- drop script
--
-- @author joel@aufrecht.org
-- @cvs-id &Id:$
--
select content_folder__unregister_content_type(-100, 'annonce_object', 't');
select content_type__drop_type('annonce_object', 't', 't');


DROP FUNCTION annonce__new(integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, timestamptz, integer, integer, integer, integer, character varying, character varying, character varying, boolean, boolean, character varying, boolean
);

DROP FUNCTION annonce__edit(integer, character varying, character varying, integer);

DROP FUNCTION annonce__delete(integer);

DROP SEQUENCE annonce_id_seq; 

DROP TABLE annonces CASCADE;

     
