

CREATE OR REPLACE FUNCTION mandat__edit(
  integer,
  varchar,
  varchar,
  varchar,
  varchar,
  varchar,
  integer,
  numeric,
  numeric,
  numeric,
  text,
  text,
  text,
  varchar,
  varchar,
  boolean,
  varchar,
  text,
  boolean
) 
RETURNS integer AS '
DECLARE
  p_mandat_id ALIAS FOR $1;
  p_type_of_transaction ALIAS FOR $2;
  p_type_of_property ALIAS FOR $3;
  p_type_of_residence ALIAS FOR $4;
  p_type_of_commerce ALIAS FOR $5;
  p_code ALIAS FOR $6;
  p_room_qty ALIAS FOR $7;
  p_surface_min ALIAS FOR $8;
  p_budget_min ALIAS FOR $9;
  p_budget_max ALIAS FOR $10;
  p_remarks1 ALIAS FOR $11; 
  p_remarks2 ALIAS FOR $12; 
  p_confirmation ALIAS FOR $13;
  p_origin ALIAS FOR $14;
  p_origin_other ALIAS FOR $15;
  p_payment_p ALIAS FOR $16;
  p_status ALIAS FOR $17;
  p_lchars ALIAS FOR $18;
  p_terms_conditions_p ALIAS FOR $19;
 
BEGIN

  UPDATE mandats SET
    type_of_transaction = p_type_of_transaction,
    type_of_property = p_type_of_property,
    type_of_residence = p_type_of_residence,
    type_of_commerce = p_type_of_commerce,
    code = p_code,
    room_qty = p_room_qty,
    surface_min = p_surface_min,
    budget_min = p_budget_min,
    budget_max = p_budget_max,
    remarks1 = p_remarks1,
    remarks2 = p_remarks2,
    confirmation = p_confirmation,
    origin = p_origin,
    origin_other = p_origin_other,
    payment_p = payment_p,
    status = p_status,
    lchars = p_lchars,
    terms_conditions_p = p_terms_conditons_p
  WHERE mandat_id = p_mandat_id;

  RETURN 0;  

END; ' LANGUAGE 'plpgsql';
