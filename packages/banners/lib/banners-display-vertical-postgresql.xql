<?xml version="1.0"?>

<queryset>
    <rdbms><type>postgresql</type><version>7.1</version></rdbms>

    <fullquery name="select_banners">
        <querytext>
       select banner_id,
		   name,
		   url,
           acs_permission__permission_p(banner_id, :user_id, 'admin') as admin_p
           from banners b,
				acs_objects ao
	    where b.banner_id = ao.object_id
		and   ao.package_id = :package_id	
        and 't' = acs_permission__permission_p(banner_id, :user_id, 'read')
	order by sort_order 
        </querytext>
    </fullquery>

</queryset>
