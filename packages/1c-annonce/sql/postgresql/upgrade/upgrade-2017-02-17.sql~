ALTER TABLE annonces ADD COLUMN category_1	varchar(255);
ALTER TABLE annonces ADD COLUMN category_2	varchar(255);
ALTER TABLE annonces ADD COLUMN category_3	varchar(255);
ALTER TABLE annonces ADD COLUMN category_4	varchar(255);
ALTER TABLE annonces ADD COLUMN category_5	varchar(255);
ALTER TABLE annonces ADD COLUMN category_6	varchar(255);
ALTER TABLE annonces ADD COLUMN category_7	varchar(255);
ALTER TABLE annonces ADD COLUMN category_8	varchar(255);
ALTER TABLE annonces ADD COLUMN category_9	varchar(255);


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



