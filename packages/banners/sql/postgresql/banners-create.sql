-- 
--
-- Create tables for Infographics 
--
-- Author: Alessandro Landim
-- 

BEGIN; 

CREATE TABLE banners
(
  banner_id int4 NOT NULL,
  name varchar,
  url varchar,
  sort_order int4,
  CONSTRAINT banners_banner_id_pk PRIMARY KEY (banner_id)
) 
WITH OIDS;


select acs_object_type__create_type(
        'banner',
        'Banner',
        'Banners',
        'acs_object',
        'banners',
        'banner_id',
        'banners.name',
        'f',
        null,
        'banners__title'
);

CREATE OR REPLACE FUNCTION banner__new(int4, "varchar", "varchar", int4, int4, timestamptz, int4, "varchar", int4)
  RETURNS int4 AS
'
declare
    p_banner_id                    		alias for $1;
    p_name		     		            alias for $2;
    p_url		              		    alias for $3;
    p_sort_order              		    alias for $4;
    p_package_id	               		alias for $5;
    p_creation_date             		alias for $6;
    p_creation_user             		alias for $7;
    p_creation_ip               		alias for $8;
    p_context_id                		alias for $9;
    v_banner_id               			banners.banner_id%TYPE;
begin

	v_banner_id := acs_object__new (
		p_banner_id,        	 -- object_id
		''infographic_item'',    -- object_type
		p_creation_date,         -- creation_date
		p_creation_user,         -- creation_user
		p_creation_ip,           -- creation_ip
		p_context_id,            -- context_id
        p_name,               	 -- title
        p_package_id             -- package_id
	);


    INSERT INTO banners (banner_id, name,url,sort_order)
    VALUES (v_banner_id,p_name,p_url,p_sort_order);

    return v_banner_id;
end;'
  LANGUAGE 'plpgsql' VOLATILE;                   

--edit one position in the map
CREATE OR REPLACE FUNCTION banner__edit(int4, "varchar", "varchar", int4)  RETURNS integer AS
$BODY$
declare
    p_banner_id           	 	alias for $1;
    p_name                      alias for $2;
    p_url               		alias for $3;
    p_sort_order		        alias for $4;
begin

    UPDATE banners
    SET name = p_name,
    url = p_url,
	sort_order = p_sort_order
    WHERE banner_id = p_banner_id;

    return p_banner_id;
end;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;


CREATE OR REPLACE FUNCTION banner__del(int4)
  RETURNS int4 AS
'
declare
    p_banner_id                    alias for $1;
begin

	perform acs_object__delete(p_banner_id);

	RETURN 0;

end;'
  LANGUAGE 'plpgsql' VOLATILE;                   

COMMIT;
