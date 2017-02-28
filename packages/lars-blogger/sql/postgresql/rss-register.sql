--
-- rss-register.sql
-- 
-- @author Lars Pind
-- 
-- @cvs-id $Id: rss-register.sql,v 1.3 2003/08/28 09:41:55 lars Exp $
--

select acs_sc_impl__new(
       'RssGenerationSubscriber',               -- impl_contract_name
       'pinds_blog_entries',                    -- impl_name
       'lars-blogger'                           -- impl_owner_name
);

select acs_sc_impl_alias__new(
       'RssGenerationSubscriber',               -- impl_contract_name
       'pinds_blog_entries',                    -- impl_name
       'datasource',                            -- impl_operation_name
       'lars_blog__rss_datasource',             -- impl_alias
       'TCL'                                    -- impl_pl
);

select acs_sc_impl_alias__new(
       'RssGenerationSubscriber',               -- impl_contract_name
       'pinds_blog_entries',                    -- impl_name
       'lastUpdated',                           -- impl_operation_name
       'lars_blog__rss_lastUpdated',            -- impl_alias
       'TCL'                                    -- impl_pl
);

select acs_sc_binding__new (
    'RssGenerationSubscriber',                  -- contract_name
    'pinds_blog_entries'                        -- impl_name
);
