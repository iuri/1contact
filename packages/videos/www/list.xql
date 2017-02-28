<?xml version="1.0"?>

<queryset>
    <rdbms><type>postgresql</type><version>7.1</version></rdbms>

    <fullquery name="select_videos">
      <querytext>
	select DISTINCT v.video_id,
	  v.package_id,
	  v.video_name,
	  v.video_description,
	  v.autor,
          acs_object__name(apm_package__parent_id(v.package_id)) as parent_name,
          (select site_node__url(site_nodes.node_id)
            from site_nodes
            where site_nodes.object_id = v.package_id) as url
        from videos v
	where v.package_id = :package_id
        and 't' = acs_permission__permission_p(v.video_id, :user_id, 'read')
	$query
	[template::list::page_where_clause -name videos -and]
	[template::list::orderby_clause -name videos -orderby]
      	[template::list::filter_where_clauses -and -name videos]
      </querytext>
    </fullquery>
    
</queryset>

