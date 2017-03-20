
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
       varchar,		   -- lchars
       boolean	   	   -- terms_conditions_p
);


CREATE OR REPLACE FUNCTION annonce__new (
       integer,	  	   -- annonce_id
       varchar,		   -- ref_code
       varchar,		   -- type_of_transaction
       varchar,		   -- type_of_property
       numeric,		   -- rent_price
       numeric,		   -- rent_taxes
       timestamptz,	   -- available_date
       integer,		   -- room_qty
       integer,		   -- lavatory_qty
       integer,		   -- bathroom_qty
       integer,		   -- floor_qty
       numeric,		   -- surface
       varchar,		   -- type_of_announcer
       varchar	   	   -- status
) RETURNS integer AS '
  DECLARE
    p_annonce_id		ALIAS FOR $1;
    p_ref_code			ALIAS FOR $2;
    p_type_of_transaction	ALIAS FOR $3;
    p_type_of_property		ALIAS FOR $4;
    p_rent_price		ALIAS FOR $5;
    p_rent_taxes		ALIAS FOR $6;
    p_available_date		ALIAS FOR $7;
    p_room_qty			ALIAS FOR $8;
    p_lavatory_qty		ALIAS FOR $9;
    p_bathroom_qty		ALIAS FOR $10;
    p_floor_qty			ALIAS FOR $11;
    p_surface			ALIAS FOR $12;
    p_type_of_announcer		ALIAS FOR $13;
   
			     
  BEGIN
	INSERT INTO annonces
	       ref_code = p_ref_code,
	       type_of_transaction = p_type_of_transaction,
	       type_of_property	   = p_type_of_property,
	       rent_price = p_rent_price,
	       rent_taxes = p_rent_taxes,

	       type_of_announcer = p_type_of_announcer,
	       available_date = p_available_date,
	       room_qty = p_room_qty,
	       lavatory_qty = p_lavatory_qty,
	       bathroom_qty = p_bathroom_qty,
	       floor = p_floor,
	       surface = p_surface,
	       auto_commission_p = p_auto_commission_p,
	       on_demand_p = p_on_demand_p,
	       status = p_status,
	       lchars = p_lchars,
	       terms_conditions_p = p_terms_conditions_p
	WHERE annonce_id = p_annonce_id;


	RETURN 0;
  END;' language 'plpgsql';
