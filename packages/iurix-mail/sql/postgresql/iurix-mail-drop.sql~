-- /packages/iurix-mail/sql/postgresql/iurix-mail-drop.sql
--
-- @author Iuri Sampaio (iuri.sampaio@iurix.com)
-- @creation-date 2011-10-06


DROP FUNCTION iurix_mails__new (
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
       varchar(255),	   -- x_orignial_to
       timestamptz,	   -- x_arrival_time
       varchar(255)	   -- x_originating_ip
);


SELECT content_type__drop_type ('mail_object', 't', 't', 't');

-- DROP TABLE iurix_mails CASCADE;