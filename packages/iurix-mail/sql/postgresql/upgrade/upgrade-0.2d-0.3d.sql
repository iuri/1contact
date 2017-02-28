-- /packages/iurix-mail/sql/postgresql/upgrade/upgrade-0.2d-0.3d.sql

SELECT acs_log__debug('/packages/iurix-mail/sql/postgresql/upgrade/upgrade-0.2d-0.3d.sql','');

ALTER TABLE iurix_mails ADD COLUMN x_arrival_time timestamptz;

