-- /packages/1c-mandat/sql/postgresql/1c-mandat-create.sql
-- creation script
--
-- @author Iuri Sampaio (iuri@iurix.com)
-- @cvs-id &Id:$
--

CREATE TABLE mandats (
       mandat_id integer,
       type_of_transaction varchar(10),		-- (p) purchase or (r) rent 
       type_of_property varchar(10),	 	-- (c) commerce or (r) residence
       type_of_residence varchar(10),		-- (a) appartament, (m) maison-villa
       type_of_commerce varchar(10),		-- (a) arcade, (l) locaux, (d) depot
       code varchar(50),		
       room_qty integer,			
       surface_min numeric,
       budget_min numeric,
       budget_max numeric,
       searching_motive text,
       remarks1 text,
       remarks2 text,
       confirmation text,
       origin varchar(10),
       origin_other varchar(255),
       payment_p boolean,
       status varchar(10),
       lchars text,
       other_chars text,
       terms_conditions_p boolean
);





-- CREATE SEQUENCE mandat_id_seq cache 1000; 

SELECT content_type__create_type(
'mandat_object',	-- content_type
'content_revision',	-- supertype
'Mandat Object',		-- pretty_name,
'Mandat Objects',		-- pretty_plural
'mandats',		-- table_name
'mandat_id',		-- id_column
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
  varchar,
  integer,
  numeric,
  numeric,
  numeric,
  text,
  text,
  text,
  text,
  varchar,
  varchar,
  boolean,
  varchar,
  text,
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
  p_searching_motive ALIAS FOR $11;
  p_remarks1 ALIAS FOR $12; 
  p_remarks2 ALIAS FOR $13; 
  p_confirmation ALIAS FOR $14;
  p_origin ALIAS FOR $15;
  p_origin_other ALIAS FOR $16;
  p_payment_p ALIAS FOR $17;
  p_status ALIAS FOR $18;
  p_lchars ALIAS FOR $19;
  p_other_chars ALIAS FOR $20;
  p_terms_conditions_p ALIAS FOR $21;
 
BEGIN

  INSERT INTO mandats (
    mandat_id,
    type_of_transaction,
    type_of_property,
    type_of_residence,
    type_of_commerce,
    code,
    room_qty,
    surface_min,
    budget_min,
    budget_max,
    searching_motive,
    remarks1,
    remarks2,
    confirmation,
    origin,
    origin_other,
    payment_p,
    status,
    lchars,
    other_chars,
    terms_conditions_p
  ) VALUES (
    p_mandat_id,
    p_type_of_transaction,
    p_type_of_property,
    p_type_of_residence,
    p_type_of_commerce,
    p_code,
    p_room_qty,
    p_surface_min,
    p_budget_min,
    p_budget_max,
    p_searching_motive,
    p_remarks1,
    p_remarks2,
    p_confirmation,
    p_origin,
    p_origin_other,
    p_payment_p,
    p_status,
    p_lchars,
    p_other_chars,
    p_terms_conditions_p
  );

  RETURN 0;  

END; ' LANGUAGE 'plpgsql';




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
  text,
  varchar,
  varchar,
  boolean,
  varchar,
  text,
  text,
  boolean
) RETURNS integer AS '
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
  p_searching_motive ALIAS FOR $11;
  p_remarks1 ALIAS FOR $12; 
  p_remarks2 ALIAS FOR $13; 
  p_confirmation ALIAS FOR $14;
  p_origin ALIAS FOR $15;
  p_origin_other ALIAS FOR $16;
  p_payment_p ALIAS FOR $17;
  p_status ALIAS FOR $18;
  p_lchars ALIAS FOR $19;
  p_other_chars ALIAS FOR $20;
  p_terms_conditions_p ALIAS FOR $21;
 
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
    searching_motive = p_searching_motive,
    remarks1 = p_remarks1,
    remarks2 = p_remarks2,
    confirmation = p_confirmation,
    origin = p_origin,
    origin_other = p_origin_other,
    payment_p = payment_p,
    status = p_status,
    lchars = p_lchars,
    other_chars = p_other_chars,
    terms_conditions_p = p_terms_conditions_p
  WHERE mandat_id = p_mandat_id;

  RETURN 0;  

END;' LANGUAGE 'plpgsql';



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

