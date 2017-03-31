-- /packages/1c-mandat/sql/postgresql/upgrade/upgrade-0.5d-0.6d.sql
-- creation script
--
-- @author Iuri Sampaio (iuri@iurix.com)
-- @cvs-id &Id:$
--

ALTER TABLE mandats DROP CONSTRAINT mandats_customer_id_un;
ALTER TABLE mandats DROP CONSTRAINT mandats_guarantor_id_un;
ALTER TABLE mandats DROP CONSTRAINT mandats_cotenant_id_un;
