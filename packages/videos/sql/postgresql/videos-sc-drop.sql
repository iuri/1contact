-- Drop the lars blogger implementation of the FtsContentProvider
-- service contract

select acs_sc_binding__delete(
    'FtsContentProvider',   -- impl_contract_name
    'video_object'    		    -- impl_name
);

select acs_sc_impl__delete(
    'FtsContentProvider',   -- impl_contract_name
    'video_object'	    -- impl_name
);

select acs_sc_impl_alias__delete(
    'FtsContentProvider',   -- impl_contract_name
    'video_object',    	    -- impl_name
    'datasource'            -- impl_operation_name
);

select acs_sc_impl_alias__delete(
    'FtsContentProvider',   -- impl_contract_name
    'video_object',	    -- impl_name
    'url'                   -- impl_operation_name
);

-- Drop the database triggers on video

drop trigger videos__utrg on videos;
drop trigger videos__dtrg on videos;
drop trigger videos__itrg on videos;

drop function videos__utrg ();
drop function videos__dtrg ();
drop function videos__itrg ();

