-- /packages/1c-users/sql/postgresql/1c-users-create.sql
-- 1C Users datamodel
--
-- @author Iuri Sampaio (iuri@iurix.com)
-- @creation-date 2016-11-16
--

DROP FUNCTION userinfo_update (
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
);

DROP  FUNCTION userinfo__new (
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
);




DROP FUNCTION userinfo__delete(integer);

DROP SEQUENCE user_info_id_seq;
DROP TABLE user_ext_info;

