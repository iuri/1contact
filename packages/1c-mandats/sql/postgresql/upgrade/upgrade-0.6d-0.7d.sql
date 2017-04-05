DROP FUNCTION mandat__new(
  integer,
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
  p_unwanted_areas 	ALIAS FOR $14;
  p_charac_required 	ALIAS FOR $15;
  p_charac_opt_gen 	ALIAS FOR $16;
  p_charac_opt_arc 	ALIAS FOR $17;
  p_charac_opt_vic 	ALIAS FOR $18;
  p_extra_info 	   	ALIAS FOR $19;
  p_status 		ALIAS FOR $20;
  p_customer_id 	ALIAS FOR $21;
  p_guarantor_id 	ALIAS FOR $22;
  p_cotenant_id 	ALIAS FOR $23;
  
 
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

