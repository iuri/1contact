-- This is a organization implementation of the FtsContentProvider
-- service contract

select acs_sc_impl__new(
    'FtsContentProvider',	-- impl_contract_name
    'video_object',			-- impl_name 
    'videos'			-- impl_owner_name
);

select acs_sc_impl_alias__new(
    'FtsContentProvider',	-- impl_contract_name
    'video_object',			-- impl_name
    'datasource',		-- impl_operation_name
    'video__datasource',	-- impl_alias
    'TCL'			-- impl_pl
);

select acs_sc_impl_alias__new(
    'FtsContentProvider',	-- impl_contract_name
    'video_object',			-- impl_name
    'url',			-- impl_operation_name
    'video__url',		-- impl_alias
    'TCL'			-- impl_pl
);


create function videos__itrg ()
returns opaque as '
begin
    perform search_observer__enqueue(new.video_id,''INSERT'');
    return new;
end;' language 'plpgsql';

create function videos__dtrg ()
returns opaque as '
begin
    perform search_observer__enqueue(old.video_id,''DELETE'');
    return old;
end;' language 'plpgsql';

create function videos__utrg ()
returns opaque as '
begin
    perform search_observer__enqueue(old.video_id,''UPDATE'');
    return old;
end;' language 'plpgsql';


create trigger videos__itrg after insert on videos
for each row execute procedure videos__itrg ();

create trigger videos__dtrg after delete on videos
for each row execute procedure videos__dtrg ();

create trigger videos__utrg after update on videos
for each row execute procedure videos__utrg ();

-- Add the binding

select acs_sc_binding__new ('FtsContentProvider', 'video_object');
