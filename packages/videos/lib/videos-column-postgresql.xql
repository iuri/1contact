<?xml version="1.0"?>

<queryset>
    <rdbms><type>postgresql</type><version>7.1</version></rdbms>
    <fullquery name="select_related_videos">
        <querytext>
	    select video_id,
		   package_id,
		   video_name,
	           video_description as hr,
            acs_object__name(apm_package__parent_id(v.package_id)) as parent_name,
            (select site_node__url(site_nodes.node_id)
            from site_nodes
            where site_nodes.object_id = v.package_id) as url
            from videos v
	    where v.package_id = :package_id
	    order by parent_name,
            v.video_name
	    limit 20
        </querytext>
    </fullquery>

</queryset>
