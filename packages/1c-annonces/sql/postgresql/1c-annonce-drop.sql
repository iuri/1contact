-- /package/c1-annonce/sql/postgresql/c1-annonce-create.sql
--
-- The C1 Annonce Package
--
-- @author Iuri Sampaio (iuri@iurix.com)
-- @creation-date 2016-11-16
--



DROP FUNCTION annonce__new (
       integer,	  	   -- annonce_id
       varchar,		   -- ref_code
       varchar,		   -- type_of_transaction
       numeric,		   -- price
       numeric,		   -- taxes
       timestamptz,	   -- available_Date
       varchar,		   -- type_of_announcer
       varchar,		   -- status
       integer		   -- parent_id 
);




DROP FUNCTION annonce__delete(integer);

SELECT content_folder__unregister_content_type(-100,'annonce_object','t');
SELECT content_type__drop_type('annonce_object', 't', 't');

DROP SEQUENCE annonce_id_seq;

DROP TABLE annonces;



