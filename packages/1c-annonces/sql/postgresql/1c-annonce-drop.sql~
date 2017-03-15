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

DROP FUNCTION 1c_annonce__edit (
       integer,		   -- annonce_id
       integer,            -- annonce_status
       timestamptz	   -- annonce_date
);

DROP FUNCTION 1c_annonce__new(
       integer,		   -- annonce_number
       timestamptz,	   -- annonce_date
       varchar,		   -- creation_ip
       integer,		   -- creation_user
       integer		   -- context_id	   
);

SELECT acs_object_type__drop_type (
    '1c_annonce', 	 -- object_type
    't'
);


DROP SEQUENCE 1c_annonce_id_seq;

DROP TABLE 1c_annonces;
