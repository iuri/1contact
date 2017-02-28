--
-- upgrade-0.7d-0.8.sql
-- 
-- @author Lars Pind
-- @author Bart Teeuwisse (bart.teeuwisse@thecodemill.biz)
-- 
-- @cvs-id $Id: upgrade-0.7d-0.8.sql,v 1.3 2003/08/28 09:41:55 lars Exp $
--

-- added notifications

\i ../notifications-init.sql

-- Index the existing published blog entries

\i lars-blogger-sc-index.sql
