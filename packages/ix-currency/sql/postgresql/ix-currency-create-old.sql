-- /packages/ix_currency/sql/postgresql/ix-currency-create.sql

--
-- IX Currency Package
--
-- @author Iuri Sampaio (iuri.sampaio@iurix.com)
-- @creation-date 2015-09-11
--



------------------------------------
-- Table: ix_rates
------------------------------------

CREATE TABLE ix_rates (
       rate_id		      integer
       			      CONSTRAINT ix_rates_rate_id_pk PRIMARY KEY
			      REFERENCES acs_objects (object_id),
       currency_code	      char(3),
       rate		      varchar(255)
);






------------------------------------
-- Object Type: ix_rate
------------------------------------

SELECT acs_object_type__create_type (
    'ix_rate',       -- object_type
    'IX Rate',   	 -- pretty_name
    'IX Rates', 	 -- pretty_plural
    'acs_object',    	 -- supertype
    'ix_rates',     	 -- table_name
    'rate_id',      	 -- id_column
    null,	     	 -- name_method
    'f',
    null,
    null
);


CREATE SEQUENCE ix_rate_id_seq cache 1000; 

CREATE OR REPLACE FUNCTION ix_rate__new (
       varchar,	  	   -- currency_code
       varchar,		   -- rate
       varchar,		   -- creation_ip
       integer,		   -- creation_user
       integer		   -- context_id	   
) RETURNS integer AS '
  DECLARE
	p_currency_code		ALIAS FOR $1;
	p_rate			ALIAS FOR $2;
	p_creation_ip		ALIAS FOR $3;
	p_creation_user		ALIAS FOR $4;
	p_context_id		ALIAS FOR $5;

       	v_id			integer;

  BEGIN
	v_id := acs_object__new (
       		  null,			-- object_id
		  ''ix_rate'',		-- object_type
		  now(),		-- creation_date
		  p_creation_user,	-- creation_user
		  p_creation_ip,	-- cretion_ip
		  p_context_id,		-- context_id
		  true			-- 
        );
	
	INSERT INTO ix_rates (
		rate_id,
		currency_code,
		rate
	) VALUES (
		v_id,
		p_currency_code,
		p_rate	
	);

	RETURN v_id;

END;' language 'plpgsql';



CREATE OR REPLACE FUNCTION ix_rate__delete (
       integer		   -- rate_id
) RETURNS integer AS '
  DECLARE
	p_rate_id			ALIAS FOR $1;

  BEGIN

  

	DELETE FROM ix_rates WHERE rate_id = p_rate_id;
	
	PERFORM acs_object__delete(p_rate_id);

	RETURN 0;
  END;' language 'plpgsql';
