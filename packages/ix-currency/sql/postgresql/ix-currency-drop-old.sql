-- /packages/ix-currency/sql/postgresql/ix-currency-drop.sql

--
-- IX Currency Package
--
-- @author Iuri Sampaio (iuri.sampaio@iurix.com)
-- @creation-date 2015-09-11
--



DROP FUNCTION ix_rate__new (
       varchar,	  	   -- code
       varchar,		   -- rate
       varchar,		   -- creation_ip
       integer,		   -- creation_user
       integer		   -- context_id
);

DROP FUNCTION ix_rate__delete (
       integer		   -- rate_id
);




CREATE OR REPLACE FUNCTION inline_0 () 
RETURNS integer AS '
DECLARE

	v_object	RECORD;
BEGIN
	FOR v_object IN
	  SELECT object_id FROM acs_objects WHERE object_type = ''ix_rate''
	LOOP
	  PERFORM acs_object__delete(v_object.object_id);
	END LOOP;

	return 0;
      
END;' language 'plpgsql';

SELECT inline_0 ();
DROP FUNCTION inline_0 ();



------------------------------------
-- Object Type: ix_rate
------------------------------------

SELECT acs_object_type__drop_type (
    'ix_rate',      -- object_type
    't'
);



------------------------------------
-- Table: ix_rates
------------------------------------

DROP TABLE ix_rates CASCADE;


