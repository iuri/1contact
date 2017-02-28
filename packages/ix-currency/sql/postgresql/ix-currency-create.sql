-- /packages/ix_currency/sql/postgresql/ix-currency-create.sql
-- https://github.com/iuri/iurix/blob/master/packages/videos/tcl/videos-procs.tcl
-- http://iurix.com/admin/object-types/#.VfYaLtTN88o
--
-- IX Currency Package
--
-- @author Iuri Sampaio (iuri.sampaio@iurix.com)
-- @creation-date 2015-09-11
--



------------------------------------
-- Table: ix_rates
------------------------------------

CREATE TABLE ix_currency_rates (
       rate_id		      integer
       			      CONSTRAINT ix_rates_rate_id_pk PRIMARY KEY,
       currency_code	      char(3),
       rate		      varchar(255),
       creation_date	      timestamptz
);





CREATE SEQUENCE ix_currency_rate_id_seq;


------------------------------------
-- Object Type: ix_rate
------------------------------------

CREATE OR REPLACE FUNCTION ix_currency_rate__new (
       varchar,	  	   -- currency_code
       varchar		   -- rate
) RETURNS integer AS '
  DECLARE
	p_currency_code		ALIAS FOR $1;
	p_rate			ALIAS FOR $2;
	
       	v_id			integer;

  BEGIN
	
	SELECT nextval(''ix_currency_rate_id_seq'') INTO v_id;

	INSERT INTO ix_currency_rates (
		rate_id,
		currency_code,
		rate,
		creation_date
	) VALUES (
		v_id,
		p_currency_code,
		p_rate,
		now()	

	);

	RETURN v_id;

END;' language 'plpgsql';



CREATE OR REPLACE FUNCTION ix_currency_rate__delete (
       integer		   -- rate_id
) RETURNS integer AS '
  DECLARE
	p_rate_id			ALIAS FOR $1;

  BEGIN

  	DELETE FROM ix_rates WHERE rate_id = p_rate_id;
	

	RETURN 0;
  END;' language 'plpgsql';
