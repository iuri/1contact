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


DROP FUNCTION annonce__new(integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, timestamp with time zone, integer, integer, integer, integer, numeric, numeric, numeric, boolean, boolean, character varying, boolean);


DROP FUNCTION annonce__new (
       integer,	  	   -- annonce_id
       varchar,		   -- ref_code
       varchar,		   -- type_of_transaction
       varchar,		   -- type_of_property
       varchar,		   -- type_of_residence
       varchar,		   -- type_of_commerce
       varchar,		   -- type_of_activity
       varchar,		   -- other_property
       varchar,		   -- type_of_announcer
       timestamptz,	   -- available_Date
       integer,		   -- room_qty
       integer,		   -- lavatory_qty		   
       integer,		   -- bathroom_qty
       integer,		   -- floor
       numeric,		   -- rent_price
       numeric,		   -- rent_taxes
       numeric,		   -- surface
       boolean,		   -- auto_commision_p
       boolean,		   -- on_demand_p
       varchar,		   -- status
       text,		   -- lchars
       varchar,		   -- category 1
       varchar,		   -- category 2
       varchar,		   -- category 3
       varchar,		   -- category 4
       varchar,		   -- category 5
       varchar,		   -- category 6
       varchar,		   -- category 7
       varchar,		   -- category 8
       varchar,		   -- category 9
       boolean		   -- terms_conditions_p
);

DROP FUNCTION annonce__edit (
       integer,	  	   -- annonce_id
       varchar,		   -- type_of_transaction
       varchar,		   -- type_of_property
       varchar,		   -- other_property
       varchar,		   -- type_of_commerce
       varchar,		   -- type_of_residence
       varchar,		   -- type_of_activity
       varchar,		   -- type_of_announcer
       varchar,		   -- ref_code
       timestamptz,	   -- available_date
       integer,		   -- room_qty
       integer,		   -- lavatory_qty
       integer,		   -- bathroom_qty
       integer,		   -- floor
       numeric,		   -- rent_price
       numeric,		   -- rent_taxes
       numeric,		   -- surface
       boolean,		   -- auto_commission_p
       boolean,		   -- on_demand_p
       varchar,	   	   -- status
       boolean	   	   -- terms_conditions_p
);

DROP FUNCTION annonce__delete(integer);

DROP SEQUENCE annonce_id_seq; 

DROP TABLE annonces CASCADE;

     
