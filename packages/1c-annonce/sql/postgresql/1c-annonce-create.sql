-- /package/c1-annonce/sql/postgresql/c1-annonce-create.sql

-- Property datamodel. I nust decide later where I place this chunk: in a new package or keep it here



--
-- The C1 Annonce Package
--
-- @author Iuri Sampaio (iuri@iurix.com)
-- @creation-date 2016-11-16
--


------------------------------------
-- Table c1_annonce
------------------------------------
CREATE TABLE annonces(
       annonce_id		integer 
       				CONSTRAINT c1_annonce_annonce_id_pk PRIMARY KEY,
       ref_code			varchar(255),
       type_of_transaction	varchar(10),
       type_of_property		varchar(10),
       type_of_residence	varchar(10),
       type_of_commerce		varchar(10),
       type_of_activity		varchar(50),	
       other_property		varchar(255),
       type_of_announcer	varchar(10),
       available_date		timestamptz,
       room_qty			integer,
       lavatory_qty		integer,
       bathroom_qty		integer,
       floor			integer,
       rent_price		numeric,		
       rent_taxes		numeric,		
       surface			numeric,
       auto_commission_p	boolean,
       on_demand_p		boolean,
       status			varchar(10),
       lchars			text,
       category_1		varchar(255),
       category_2		varchar(255),
       category_3		varchar(255),
       category_4		varchar(255),
       category_5		varchar(255),
       category_6		varchar(255),
       category_7		varchar(255),
       category_8		varchar(255),
       category_9		varchar(255),
       terms_conditions_p	boolean
);

CREATE SEQUENCE annonce_id_seq cache 1000; 




select content_type__create_type(
'annonce_object',		-- content_type
'content_revision',	-- supertype
'Annonce',		-- pretty_name,
'Annonces',		-- pretty_plural
'annonces',		-- table_name
'annonce_id',		-- id_column
'annonce__get_code'	-- name_method
);
-- necessary to work around limitation of content repository:
SELECT content_folder__register_content_type(-100,'annonce_object','t');



CREATE OR REPLACE FUNCTION annonce__new (
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
       boolean		   -- terms_conditions_p
) RETURNS integer AS '
  DECLARE
	p_annonce_id		ALIAS FOR $1;
	p_ref_code		ALIAS FOR $2;
	p_type_of_transaction	ALIAS FOR $3;
	p_type_of_property	ALIAS FOR $4;
	p_type_of_residence	ALIAS FOR $5;
	p_type_of_commerce	ALIAS FOR $6;
	p_type_of_activity	ALIAS FOR $7;
	p_other_property	ALIAS FOR $8;
	p_type_of_announcer	ALIAS FOR $9;
	p_available_date	ALIAS FOR $10;
	p_room_qty		ALIAS FOR $11;
	p_lavatory_qty		ALIAS FOR $12;
	p_bathroom_qty		ALIAS FOR $13;
	p_floor			ALIAS FOR $14;
	p_rent_price		ALIAS FOR $15;
	p_rent_taxes		ALIAS FOR $16;
	p_surface		ALIAS FOR $17;
	p_auto_commission_p	ALIAS FOR $18;
       	p_on_demand_p		ALIAS FOR $19;
	p_status		ALIAS FOR $20;
	p_lchars		ALIAS FOR $21;
	p_terms_conditions_p	ALIAS FOR $22;

  BEGIN

	INSERT INTO annonces (
	       annonce_id,
	       ref_code,
	       type_of_transaction,
	       type_of_property,
	       type_of_residence,
	       type_of_commerce,
	       type_of_activity,
	       other_property,
	       type_of_announcer,
	       available_date,
	       room_qty,
	       lavatory_qty,
	       bathroom_qty,
	       floor,
	       rent_price,
	       rent_taxes,
	       surface,
	       auto_commission_p,
	       on_demand_p,
	       status,
	       lchars,
	       terms_conditions_p
	) VALUES (
	       p_annonce_id,
	       p_ref_code,
	       p_type_of_transaction,
	       p_type_of_property,
	       p_type_of_residence,
	       p_type_of_commerce,
	       p_type_of_activity,
	       p_other_property,
	       p_type_of_announcer,
	       p_available_date,
	       p_room_qty,
	       p_lavatory_qty,
	       p_bathroom_qty,
	       p_floor,
	       p_rent_price,
	       p_rent_taxes,
	       p_surface,
	       p_auto_commission_p,
	       p_on_demand_p,
	       p_status,
	       p_lchars,
	       p_terms_conditions_p
 	);


	RETURN 0;
  END;' language 'plpgsql';


CREATE OR REPLACE FUNCTION annonce__edit (
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
       text,		   -- lchars
       boolean	   	   -- terms_conditions_p
) RETURNS integer AS '
  DECLARE
    p_annonce_id		ALIAS FOR $1;
    p_type_of_transaction	ALIAS FOR $2;
    p_type_of_property		ALIAS FOR $3;
    p_other_property		ALIAS FOR $4;
    p_type_of_commerce		ALIAS FOR $5;
    p_type_of_residence		ALIAS FOR $6;
    p_type_of_activity		ALIAS FOR $7;
    p_type_of_announcer		ALIAS FOR $8;
    p_ref_code			ALIAS FOR $9;
    p_available_date		ALIAS FOR $10;
    p_room_qty			ALIAS FOR $11;
    p_lavatory_qty		ALIAS FOR $12;
    p_bathroom_qty		ALIAS FOR $13;
    p_floor			ALIAS FOR $14;
    p_rent_price		ALIAS FOR $15;
    p_rent_taxes		ALIAS FOR $16;
    p_surface			ALIAS FOR $17;
    p_auto_commission_p		ALIAS FOR $18;
    p_on_demand_p		ALIAS FOR $19;
    p_status			ALIAS FOR $20;
    p_lchars			ALIAS FOR $21;
    p_terms_conditions_p	ALIAS FOR $22;
			     
  BEGIN
  	UPDATE annonces SET
	       type_of_transaction = p_type_of_transaction,
	       type_of_property	   = p_type_of_property,
	       other_property = p_other_property,
	       type_of_commerce = p_type_of_commerce,
	       type_of_residence = p_type_of_residence,
	       type_of_activity = p_type_of_activity,
	       type_of_announcer = p_type_of_announcer,
	       ref_code = p_ref_code,
	       available_date = p_available_date,
	       room_qty = p_room_qty,
	       lavatory_qty = p_lavatory_qty,
	       bathroom_qty = p_bathroom_qty,
	       floor = p_floor,
	       rent_price = p_rent_price,
	       rent_taxes = p_rent_taxes,
	       surface = p_surface,
	       auto_commission_p = p_auto_commission_p,
	       on_demand_p = p_on_demand_p,
	       status = p_status,
	       lchars = p_lchars,
	       terms_conditions_p = p_terms_conditions_p
	WHERE annonce_id = p_annonce_id;


	RETURN 0;
  END;' language 'plpgsql';




CREATE OR REPLACE FUNCTION annonce__delete(integer) RETURNS integer AS '
DECLARE 
    p_item_id alias for $1;
    v_item_id cr_items.item_id%TYPE;
    v_file_item_id cr_items.item_id%TYPE;

BEGIN
    v_item_id := p_item_id;
    -- dbms_output.put_line(''Deleting associated comments...'');
    -- delete acs_messages, images, comments to news item


    SELECT c.item_id into v_file_item_id
    FROM acs_rels a, cr_items c
    WHERE a.object_id_two = c.item_id
    AND a.object_id_one = v_item_id
    AND a.rel_type = ''annonce_file_rel''
    AND c.live_revision is not null;


  DELETE FROM annonces WHERE annonce_id = v_item_id;

  PERFORM content_item__delete(v_item_id);
  PERFORM content_item__delete(v_file_item_id);

  RETURN 0;

END;' LANGUAGE 'plpgsql';




CREATE OR REPLACE FUNCTION annonce__update_categories (
       integer,	  	   -- annonce_id      
       varchar,		   -- category 1
       varchar,		   -- category 2
       varchar,		   -- category 3
       varchar,		   -- category 4
       varchar,		   -- category 5
       varchar,		   -- category 6
       varchar,		   -- category 7
       varchar,		   -- category 8
       varchar		   -- category 9
) RETURNS integer AS '
  DECLARE
    p_annonce_id		ALIAS FOR $1;
    p_category_1		ALIAS FOR $2;
    p_category_2		ALIAS FOR $3;
    p_category_3		ALIAS FOR $4;
    p_category_4		ALIAS FOR $5;
    p_category_5		ALIAS FOR $6;
    p_category_6		ALIAS FOR $7;
    p_category_7		ALIAS FOR $8;
    p_category_8		ALIAS FOR $9;
    p_category_9		ALIAS FOR $10;
			     
  BEGIN
    UPDATE annonces SET
      category_1 = p_category_1,
      category_2 = p_category_2,
      category_3 = p_category_3,
      category_4 = p_category_4,
      category_5 = p_category_5,
      category_6 = p_category_6,
      category_7 = p_category_7,
      category_8 = p_category_8,
      category_9 = p_category_9
    WHERE annonce_id = p_annonce_id;
	
    RETURN 0;
  END;' language 'plpgsql';



