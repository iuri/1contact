-- /package/c1-realties/sql/postgresql/c1-realties-create.sql


------------------------------------
-- Table c1_annonce
------------------------------------
CREATE TABLE realties(
  realty_id		integer,
			CONSTRAINT realties_realty_id_pk PRIMARY KEY,
  code			varchar(255),
  type_of_property	varchar(10),
  room_qty		integer,
  lavatory_qty		integer,
  bathroom_qty		integer,
  floor_qty		integer,
  surface		numeric,
  charac_required 	text,
  charac_opt_gen	text,
  charac_opt_arc	text,
  charac_opt_vic 	text      
);



------------------------------------
-- Object Type: cn_import_order
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
  varchar,	   -- code
  varchar,	   -- type_of_property
  integer,	   -- room_qty		   
  integer,	   -- lavatory_qty
  integer,	   -- bathroom_qty
  integer,	   -- floor_qty
  numeric,	   -- surface
  text,		   -- charac_req
  text,		   -- charac_opt_gen
  text,		   -- charac_opt_arc
  text,		   -- charac_opt_vic
  varchar,         -- creation_ip
  integer,         -- creation_user
  integer	   -- context_id
) RETURNS integer AS '
  DECLARE
  
  p_code		ALIAS $1;
  p_type_of_property	ALIAS $2;
  p_room_qty		ALIAS $3;
  p_lavatory_qty	ALIAS $4;
  p_bathroom_qty	ALIAS $5;
  p_floor_qty		ALIAS $6;
  p_surface		ALIAS $7;
  p_charac_required 	ALIAS $8;
  p_charac_opt_gen	ALIAS $9;
  p_charac_opt_arc	ALIAS $10;
  p_charac_opt_vic 	ALIAS $11;      

  v_id	integer;
  
  BEGIN
    v_id := acs_object__new (
      null,  		    -- object_id
      ''realties'',	    -- object_type
      now(),		    -- creation_date
      p_creation_user,	    -- creation_user
      p_creation_ip,	    -- cretion_ip
      p_context_id,	    -- context_id
      true		    -- 
    );


	
    INSERT INTO realties (
      realty_id,
      code,
      type_of_property,
      room_qty,
      lavatory_qty,
      bathroom_qty,		
      floor_qty,		
      surface,
      charac_required,
      charac_opt_gen,
      charac_opt_arc,
      charac_opt_vic      
  ) VALUES (
    v_id,
    p_code,
    p_type_of_property,
    p_room_qty,
    p_lavatory_qty,
    p_bathroom_qty,		
    p_floor_qty,		
    p_surface,
    p_charac_required,
    p_charac_opt_gen,
    p_charac_opt_arc,
    p_charac_opt_vic      
  );

  RETURN v_id;
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
