-- /packages/1c-users/sql/postgresql/1c-users-create.sql
-- 1C Users datamodel
--
-- @author Iuri Sampaio (iuri@iurix.com)
-- @creation-date 2016-11-16
--

CREATE TABLE user_ext_info(
  userinfo_id		integer
      			CONSTRAINT uei_userinfo_id_pk PRIMARY KEY,
  entitlement		integer,
  birthday		timestamp,
  nationality		varchar(255),
  civilstate		integer,
  children_qty		integer,
  children_ages		varchar(255),
  animal_p		boolean,
  animals_type		varchar(255),
  animals_qty		varchar(255),
  mobilenumber		varchar(255),
  phonenumber		varchar(255),
  email			varchar(255),
  noexpirecontract_p	boolean,
  job			varchar(255),
  jobactivity		varchar(255),
  datestartjob  	timestamp,
  salary		numeric,
  salary_month		integer,
  independentjob_p 	boolean,
  jobother	 	varchar(255),
  otherincoming 	varchar(255),
  address		varchar(255),
  houseproperty		integer,
  houseproprietary	varchar(255),
  mortgage		varchar(255),
  user_id		integer
  			CONSTRAINT uei_user_id_fk
  			REFERENCES users ON DELETE CASCADE
			CONSTRAINT uei_user_id_un UNIQUE
);




CREATE SEQUENCE user_info_id_seq cache 1000;




CREATE OR REPLACE FUNCTION userinfo__new (
  integer,
  integer,
  timestamp,
  varchar(255),
  integer,
  integer,
  varchar(255),
  boolean,
  varchar(255),
  varchar(255),
  varchar(255),
  varchar(255),
  varchar(255),
  varchar(255),
  boolean,
  varchar(255),
  timestamp,
  numeric,
  integer,
  boolean,
  varchar(255),
  varchar(255),
  varchar(255),
  integer,
  varchar(255),
  varchar(255),
  integer
) RETURNS integer AS '
  DECLARE
    p_userinfo_id		ALIAS FOR $1;
    p_entitlement		ALIAS FOR $2;
    p_birthday 			ALIAS FOR $3;
    p_nationality 		ALIAS FOR $4;
    p_civilstate 		ALIAS FOR $5;
    p_children_qty		ALIAS FOR $6;
    p_children_ages 		ALIAS FOR $7;
    p_animal_p 			ALIAS FOR $8;
    p_animals_type		ALIAS FOR $9;
    p_animals_qty 		ALIAS FOR $10;
    p_mobilenumber 		ALIAS FOR $11;
    p_phonenumber 		ALIAS FOR $12;
    p_email 			ALIAS FOR $13;
    p_job			ALIAS FOR $14;
    p_noexpirecontract_p 	ALIAS FOR $15;
    p_jobactivity 		ALIAS FOR $16;
    p_datestartjob 		ALIAS FOR $17;
    p_salary 			ALIAS FOR $18;
    p_salary_month 		ALIAS FOR $19;
    p_independentjob_p 		ALIAS FOR $20;
    p_jobother 			ALIAS FOR $21;
    p_otherincoming 		ALIAS FOR $22;
    p_address 			ALIAS FOR $23;
    p_houseproperty 		ALIAS FOR $24;
    p_houseproprietary 		ALIAS FOR $25;
    p_mortgage 			ALIAS FOR $26;
    p_user_id			ALIAS FOR $27;

  BEGIN

	INSERT INTO user_ext_info (
	       userinfo_id,
	       entitlement,
	       birthday,
	       nationality,
	       civilstate,
	       children_qty,
	       children_ages,
	       animal_p,
	       animals_type,
	       animals_qty,
	       mobilenumber,
	       phonenumber,
	       email,
	       noexpirecontract_p,
	       job,
	       jobactivity,
	       datestartjob,
	       salary,
	       salary_month,
	       independentjob_p,
	       jobother,
	       otherincoming,
	       address,
	       houseproperty,
	       houseproprietary,
	       mortgage,
	       user_id
	) VALUES (
	  	 p_userinfo_id,	
	  	 p_entitlement,
		 p_birthday,
		 p_nationality,
		 p_civilstate,
		 p_children_qty,
		 p_children_ages,
		 p_animal_p,
		 p_animals_type,
		 p_animals_qty,
		 p_mobilenumber,
		 p_phonenumber,
		 p_email,
		 p_noexpirecontract_p,
		 p_job,
		 p_jobactivity,
		 p_datestartjob,
		 p_salary,
		 p_salary_month,
		 p_independentjob_p,
		 p_jobother,
		 p_otherincoming,
		 p_address,
		 p_houseproperty,
		 p_houseproprietary,
		 p_mortgage,
		 p_user_id
 	);

  RETURN 0;
END;' language 'plpgsql';




CREATE OR REPLACE FUNCTION userinfo__delete(integer) RETURNS integer AS '
DECLARE 
    p_user_id ALIAS FOR $1;

BEGIN

  DELETE FROM user_ext_info WHERE user_id = p_user_id;

  RETURN 0;

END;' LANGUAGE 'plpgsql';

