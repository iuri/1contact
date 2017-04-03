-- /package/c1-annonce/sql/postgresql/c1-annonce-create.sql
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
       				CONSTRAINT annonces_annonce_id_pk PRIMARY KEY,
       ref_code			varchar(255),
       type_of_transaction	varchar(10),
       price			numeric,		
       taxes			numeric,		
       available_date		timestamptz,
       type_of_announcer	varchar(10),
       status			varchar(10),
       realty_id		integer
       				CONSTRAINT annonces_realty_id_fk
				REFERENCES realties ON DELETE CASCADE
				CONSTRAINT annonces_realty_id_un UNIQUE 
);

CREATE SEQUENCE annonce_id_seq cache 1000; 




select content_type__create_type(
'annonce_object',		-- content_type
'content_revision',		-- supertype
'Annonce Object',		-- pretty_name,
'Annonce Objects',		-- pretty_plural
NULL,				-- table_name
NULL,				-- id_column
'annonce__get_code'		-- name_method
);
-- necessary to work around limitation of content repository:
SELECT content_folder__register_content_type(-100,'annonce_object','t');







CREATE OR REPLACE FUNCTION annonce__new (
       integer,	  	   -- annonce_id
       varchar,		   -- ref_code
       varchar,		   -- type_of_transaction
       numeric,		   -- price
       numeric,		   -- taxes
       timestamptz,	   -- available_Date
       varchar,		   -- type_of_announcer
       varchar,		   -- status
       integer		   -- realty_id 
) RETURNS integer AS '
  DECLARE
	p_annonce_id		ALIAS FOR $1;
	p_ref_code		ALIAS FOR $2;
	p_type_of_transaction	ALIAS FOR $3;
	p_price			ALIAS FOR $4;
	p_taxes			ALIAS FOR $5;
	p_available_date	ALIAS FOR $6;
	p_type_of_announcer	ALIAS FOR $7;
	p_status		ALIAS FOR $8;
	p_realty_id		ALIAS FOR $9;

  BEGIN

	INSERT INTO annonces (
	       annonce_id,
	       ref_code,
	       type_of_transaction,
	       price,
	       taxes,
	       available_date,
	       type_of_announcer,
	       status,
	       realty_id
	) VALUES (
	  p_annonce_id,
	  p_ref_code,
	  p_type_of_transaction,
	  p_price,
	  p_taxes,
	  p_available_date,
	  p_type_of_announcer,
	  p_status,
	  p_realty_id
 	);


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


