-- /packages/1c-mandat/sql/postgresql/1c-mandat-create.sql
-- creation script
--
-- @author Iuri Sampaio (iuri@iurix.com)
-- @cvs-id &Id:$
--

CREATE TABLE mandats (
       mandat_id		integer,
       type_of_transaction 	varchar(10),		-- (1) purchase or (2) rent 
       type_of_property 	varchar(10),	 	-- (1) commerce or (2) residence
       subtype_of_property   varchar(10),
       code 			varchar(50),		
       rooms_qty 		integer,			
       bathrooms_qty 		integer,			
       toilets_qty 		integer,			
       floors_qty 		integer,			
       surface 			numeric,
       budget_min 		numeric,
       budget_max 		numeric,
       selected_regions		text,
       selected_routes		text,
       unwanted_areas		text,
       charac_required		varchar(255),
       charac_opt_gen		varchar(255),
       charac_opt_arc		varchar(255),
       charac_opt_vic		varchar(255),
       extra_info		text,
       status 			varchar(10),
       customer_id		integer
  				CONSTRAINT mandats_customer_id_fk
  				REFERENCES users ON DELETE CASCADE
       guarantor_id		integer
				CONSTRAINT mandats_guarantor_id_fk
  				REFERENCES users ON DELETE CASCADE
       cotenant_id 		integer
         			CONSTRAINT mandats_cotenant_id_fk
  				REFERENCES users ON DELETE CASCADE
);





-- CREATE SEQUENCE mandat_id_seq cache 1000; 

SELECT content_type__create_type(
'mandat_object',	-- content_type
'content_revision',	-- supertype
'Mandat Object',	-- pretty_name,
'Mandat Objects',	-- pretty_plural
NULL,			-- table_name
NULL,			-- id_column
'mandat__get_code'	-- name_method
);
-- necessary to work around limitation of content repository:
SELECT content_folder__register_content_type(-100,'mandat_object','t');




CREATE OR REPLACE FUNCTION mandat__new(
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
  text,
  varchar,
  varchar,
  varchar,
  varchar,
  text,
  varchar,
  integer,
  integer,
  integer
) RETURNS integer AS '
DECLARE
  p_mandat_id		ALIAS FOR $1;
  p_type_of_transaction ALIAS FOR $2;
  p_type_of_property 	ALIAS FOR $3;
  p_subtype_of_property  ALIAS FOR $4;
  p_code 		ALIAS FOR $5;
  p_rooms_qty 		ALIAS FOR $6;
  p_bathrooms_qty 	ALIAS FOR $7;
  p_toilets_qty 	ALIAS FOR $8;
  p_floors_qty 		ALIAS FOR $9;
  p_surface 		ALIAS FOR $10;
  p_budget_min 		ALIAS FOR $11;
  p_budget_max 		ALIAS FOR $12;
  p_selected_regions	ALIAS FOR $13;
  p_selected_routes	ALIAS FOR $14;
  p_unwanted_areas 	ALIAS FOR $15;
  p_charac_required 	ALIAS FOR $16;
  p_charac_opt_gen 	ALIAS FOR $17;
  p_charac_opt_arc 	ALIAS FOR $18;
  p_charac_opt_vic 	ALIAS FOR $19;
  p_extra_info 	   	ALIAS FOR $20;
  p_status 		ALIAS FOR $21;
  p_customer_id 	ALIAS FOR $22;
  p_guarantor_id 	ALIAS FOR $23;
  p_cotenant_id 	ALIAS FOR $24;
  
 
BEGIN
  INSERT INTO mandats (
  	 mandat_id,	
	 type_of_transaction,
	 type_of_property,
   	 subtype_of_property,
	 code,
	 rooms_qty,
	 bathrooms_qty,
	 toilets_qty,
	 floors_qty,
	 surface,
	 budget_min,
	 budget_max,
	 selected_regions,
	 selected_routes,
	 unwanted_areas,
	 charac_required,
	 charac_opt_gen,
	 charac_opt_arc,
	 charac_opt_vic,
	 extra_info,
	 status,
	 customer_id,
	 guarantor_id,
	 cotenant_id
  ) VALUES (
 	 p_mandat_id,	
	 p_type_of_transaction,
	 p_type_of_property,
   	 p_subtype_of_property,
	 p_code,
	 p_rooms_qty,
	 p_bathrooms_qty,
	 p_toilets_qty,
	 p_floors_qty,
	 p_surface,
	 p_budget_min,
	 p_budget_max,
	 p_selected_regions,
	 p_selected_routes,
	 p_unwanted_areas,
	 p_charac_required,
	 p_charac_opt_gen,
	 p_charac_opt_arc,
	 p_charac_opt_vic,
	 p_extra_info,
	 p_status,
	 p_customer_id,
	 p_guarantor_id,
	 p_cotenant_id
  );

  RETURN 0;  

END; ' LANGUAGE 'plpgsql';






CREATE OR REPLACE FUNCTION mandat__delete(integer) RETURNS integer AS '
DECLARE 
    p_mandat_id alias for $1;
    v_item_id cr_items.item_id%TYPE;
    v_mandat_file_item_id cr_items.item_id%TYPE;

BEGIN
    v_item_id := p_mandat_id; 
    -- dbms_output.put_line(''Deleting associated comments...'');
    -- delete acs_messages, images, comments to news item
    

    SELECT c.item_id into v_mandat_file_item_id
    FROM acs_rels a, cr_items c
    WHERE a.object_id_two = c.item_id
    AND a.object_id_one = v_item_id
    AND a.rel_type = ''mandat_file_rel''
    AND c.live_revision is not null;


    DELETE FROM mandats WHERE mandat_id = p_mandat_id;

    PERFORM content_item__delete(v_item_id);
    PERFORM content_item__delete(v_mandat_file_item_id);

    RETURN 0;
END;' LANGUAGE 'plpgsql' VOLATILE;

