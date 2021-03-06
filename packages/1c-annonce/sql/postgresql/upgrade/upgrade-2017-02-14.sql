ALTER TABLE annonces ADD COLUMN lchars varchar(225);


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
       boolean		   -- terms_conditions_p
);
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
       boolean	   	   -- terms_conditions_p
);



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
       varchar,		   -- lchars
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
       varchar,		   -- lchars
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
	       lchars = lchars,
	       terms_conditions_p = p_terms_conditions_p
	WHERE annonce_id = p_annonce_id;


	RETURN 0;
  END;' language 'plpgsql';
