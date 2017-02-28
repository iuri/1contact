-- /packages/iurix-mail/sql/postgresql/upgrade/upgrade-0.1d-0.2d.sql

SELECT acs_log__debug('/packages/iurix-mail/sql/postgresql/upgrade/upgrade-0.1d-0.2d.sql','');

ALTER TABLE iurix_mails ADD COLUMN x_mailer varchar(255);
ALTER TABLE iurix_mails ADD COLUMN x_priority varchar(255);



CREATE OR REPLACE FUNCTION iurix_mails__new (
       integer,	  	   -- mail_id
       integer,	  	   -- package_id
       integer,	    	   -- user_id
       varchar,	    	   -- type
       varchar,	    	   -- subject
       text,	    	   -- bodies
       timestamptz, 	   -- date
       varchar(255),	   -- to
       varchar(255),	   -- from
       varchar(255),	   -- delivered_to
       varchar(255),	   -- importance
       text,		   -- dkim_signature
       text,		   -- headers
       text,		   -- message_id
       text,		   -- received
       varchar(255),	   -- return_path
       varchar(255),	   -- x_mailer
       varchar(255),	   -- x_original_to
       timestamptz,	   -- x_arrival_time
       varchar(255),	   -- x_originating_ip
       varchar(255)	   -- x_priority
) RETURNS integer AS '
  DECLARE
	p_mail_id		ALIAS FOR $1;
	p_package_id		ALIAS FOR $2;
       	p_user_id		ALIAS FOR $3;
	p_type			ALIAS FOR $4;
	p_subject	      	ALIAS FOR $5;
	p_bodies	      	ALIAS FOR $6;
	p_date		      	ALIAS FOR $7;
	p_to		      	ALIAS FOR $8;
	p_from		      	ALIAS FOR $9;
	p_delivered_to	      	ALIAS FOR $10;
	p_importance	      	ALIAS FOR $11;
	p_dkim_signature      	ALIAS FOR $12;
	p_headers		ALIAS FOR $13;
	p_message_id		ALIAS FOR $14;
	p_received		ALIAS FOR $15;
	p_return_path		ALIAS FOR $16;
	p_x_mailer		ALIAS FOR $17;
	p_x_original_to		ALIAS FOR $18;
	p_x_arrival_time	ALIAS FOR $19;
       	p_x_originating_ip	ALIAS FOR $20;
	p_x_priority		ALIAS FOR $21;
	
  BEGIN
	
  	INSERT INTO iurix_mails (
	       mail_id,
	       package_id,
	       user_id,
	       type,
	       subject,
	       bodies,
	       date,
	       to_address,
	       from_address,
	       delivered_to,
	       importance,
	       dkim_signature,
	       headers,
	       message_id,
	       received,
	       return_path,
	       x_mailer,
	       x_original_to,
	       x_arrival_time,
	       x_originating_ip,
	       x_priority
  	) VALUES (
	       p_mail_id,
	       p_package_id,
	       p_user_id,
	       p_type,
	       p_subject,
	       p_bodies,
	       p_date,
	       p_to,
	       p_from,
	       p_delivered_to,
	       p_importance,
	       p_dkim_signature,
	       p_headers,
	       p_message_id,
	       p_received,
	       p_return_path,
	       p_x_mailer,
	       p_x_original_to,
	       p_x_arrival_time,
	       p_x_originating_ip,
	       p_x_priority
	);


	RETURN 0;

  END' language 'plpgsql';


CREATE OR REPLACE FUNCTION iurix_mails__delete (
       integer	  	   -- mail_id
) RETURNS integer AS '

  DECLARE
	p_mail_id	ALIAS FOR $1;
  BEGIN

	DELETE FROM iurix_mails WHERE mail_id = p_mail_id;
  
	RETURN 0;

  END' language 'plpgsql';