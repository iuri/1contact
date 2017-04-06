-- /package/c1-realties/sql/postgresql/c1-realties-create.sql


------------------------------------
-- Table c1_annonce
------------------------------------
CREATE TABLE realties(
  realty_id		integer
			CONSTRAINT realties_realty_id_pk PRIMARY KEY,
  code			varchar(255),
  type_of_property	varchar(10),
  subtype_of_property  varchar(10),
  room_qty		integer,
  bedroom_qty    integer,
  lavatory_qty		integer,
  toilete_qty    integer,
  bathroom_qty		integer,
  floor_qty		integer,
  inner_surface		numeric,
  outer_surface		numeric,
  address		text,
  street_number		varchar(255),
  route			varchar(255),
  complement 		varchar(255),
  neighborhood 		varchar(255),
  locality		varchar(255),
  state			varchar(255),
  country		varchar(255),
  postal_code		varchar(255),
  charac_required 	text,
  charac_opt_gen	text,
  charac_opt_arc	text,
  charac_opt_vic 	text      
);



------------------------------------
-- Object Type: realty_object
------------------------------------

SELECT acs_object_type__create_type (
  'realty_object',      -- object_type
  'Realty Object',      -- pretty_name
  'Realty Objects',     -- pretty_plural
  'acs_object',    	-- supertype
  'realties',     	-- table_name
  'realty_id',      	-- id_column
  null,	     		 -- name_method
  'f',
  null,
  null);



CREATE OR REPLACE FUNCTION realty__new (
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
) RETURNS integer AS '
  DECLARE
    p_realty_id   ALIAS FOR $1;
    p_code    ALIAS FOR $2;
    p_type_of_property  ALIAS FOR $3;
    p_subtype_of_property  ALIAS FOR $4;
    p_room_qty    ALIAS FOR $5;
    p_bedroom_qty    ALIAS FOR $6;
    p_lavatory_qty  ALIAS FOR $7;
    p_toilete_qty  ALIAS FOR $8;
    p_bathroom_qty  ALIAS FOR $9;
    p_floor_qty   ALIAS FOR $10;
    p_inner_surface ALIAS FOR $11;
    p_outer_surface ALIAS FOR $12;
    p_address   ALIAS FOR $13;
    p_street_number ALIAS FOR $14;
    p_route   ALIAS FOR $15;
    p_complement  ALIAS FOR $16;
    p_neighborhood  ALIAS FOR $17; 
    p_locality    ALIAS FOR $18;
    p_state   ALIAS FOR $19;
    p_country   ALIAS FOR $20;
    p_postal_code ALIAS FOR $21;
    p_charac_required   ALIAS FOR $22;
    p_charac_opt_gen  ALIAS FOR $23;
    p_charac_opt_arc  ALIAS FOR $24;
    p_charac_opt_vic  ALIAS FOR $25;      
    p_creation_user ALIAS FOR $26;
    p_creation_ip ALIAS FOR $27;
    p_context_id  ALIAS FOR $28;

  
  BEGIN

    PERFORM acs_object__new (
       p_realty_id,   -- object_id
   ''realty_object'', -- object_type
   now(),     -- creation_date
   p_creation_ip,   -- cretion_ip
   p_creation_user, -- creation_user
   p_context_id,    -- context_id
   true     -- 
        );

  
    INSERT INTO realties (
      realty_id,
      code,
      type_of_property,
      subtype_of_property,
      room_qty,
      bedroom_qty,
      lavatory_qty,
      toilete_qty,
      bathroom_qty,   
      floor_qty,    
      inner_surface,
      outer_surface,
      address,
      street_number,
      route,
      complement,
      neighborhood, 
      locality,
      state,
      country,
      postal_code,
      charac_required,
      charac_opt_gen,
      charac_opt_arc,
      charac_opt_vic      
  ) VALUES (
    p_realty_id,
    p_code,
    p_type_of_property,
    p_subtype_of_property,
    p_room_qty,
    p_bedroom_qty,
    p_lavatory_qty,
    p_toilete_qty,
    p_bathroom_qty,   
    p_floor_qty,    
    p_inner_surface,
    p_outer_surface,
    p_address,
    p_street_number,
    p_route,
    p_complement,
    p_neighborhood, 
    p_locality,
    p_state,
    p_country,
    p_postal_code,
    p_charac_required,
    p_charac_opt_gen,
    p_charac_opt_arc,
    p_charac_opt_vic      
  );


  RETURN 0;
END;' language 'plpgsql';



CREATE OR REPLACE FUNCTION realty__delete (
       integer	  	      -- realty_id
) RETURNS integer AS '
  DECLARE
    p_realty_id			ALIAS FOR $1;

  BEGIN
  
    DELETE FROM realties WHERE realty_id = p_realty_id;
  
    PERFORM acs_object__delete(p_realty_id);
  RETURN 0;
END;' language 'plpgsql';
