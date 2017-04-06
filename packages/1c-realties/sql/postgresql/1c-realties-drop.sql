-- /package/c1-realties/sql/postgresql/c1-realties-create.sql

DROP FUNCTION realty__new (
  integer,     -- realty_id 
  varchar,     -- code
  varchar,     -- type_of_property
  varchar,     -- subtype_of_property
  integer,     -- room_qty
  integer,     -- bedroom_qty
  integer,     -- lavatory_qty
  integer,     -- toilete_qty
  integer,     -- bathroom_qty
  integer,     -- floor_qty
  numeric,     -- inner_surface
  numeric,     -- outer_surface
  text,      -- address
  varchar,     -- street_number
  varchar,     -- route
  varchar,     -- complement     
  varchar,     -- neighborhood
  varchar,     -- locality 
  varchar,     -- state
  varchar,     -- country
  varchar,     -- postal_code
  text,      -- charac_req
  text,      -- charac_opt_gen
  text,      -- charac_opt_arc
  text,      -- charac_opt_vic
  varchar,         -- creation_ip
  integer,         -- creation_user
  integer    -- context_id
);


DROP FUNCTION realty__delete (
       integer	  	      -- realty_id
);


------------------------------------
-- Object Type: realty_object
------------------------------------

SELECT acs_object_type__drop_type (
  'realty_object',      -- object_type
  't',
  't'
  );




------------------------------------
-- Table c1_annonce
------------------------------------
DROP TABLE realties CASCADE;
