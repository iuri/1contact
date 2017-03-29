-- /packages/1c-users/sql/postgresql/upgrade/upgrade-0.1d-0.2d.sql
-- 1C Users datamodel
--
-- @author Iuri Sampaio (iuri@iurix.com)
-- @creation-date 2016-11-16
--
CREATE OR REPLACE FUNCTION userinfo__update (
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
    
    UPDATE user_ext_info SET 
      entitlement = p_entitlement,
      birthday = p_birthday,
      nationality = p_nationality,
      civilstate = p_civilstate,
      children_qty = p_children_qty,
      children_ages = p_children_ages,
      animal_p = p_animal_p,
      animals_type = p_animals_type,
      animals_qty = p_animals_qty,
      mobilenumber = p_mobilenumber,
      phonenumber = p_phonenumb.er,
      email = p_email,
      noexpirecontract_p = noexpirecontract_p,
      job = p_job,
      jobactivity = p_jobactivity,
      datestartjob = p_datestartjob,
      salary = p_salary,
      salary_month = p_salary_month,
      independentjob_p =  p_independentjob_p,
      jobother =  p_jobother,
      otherincoming = p_otherincoming,
      address =  p_address,
      houseproperty = p_houseproperty,
      houseproprietary = p_houseproprietary,
      mortgage = mortgage
      WHERE user_id = p_user_id;

  RETURN 0;
END;' language 'plpgsql';

