ad_page_contract {
  This is a index to list videos

  @author Alessandro Landim

  $Id: site-master.tcl,v 1.22.2.7 2007/07/18 10:44:06 emmar Exp $
}
 
set user_id [ad_conn user_id]
set category_where_clause ""
set one_category_view 0

if {![exists_and_not_null package_id]} {
	set package_id [ad_conn package_id]
}

if {[exists_and_not_null category_id]} {
	set category_where_clause "and exists (select 1 from category_object_map where category_id = :category_id and object_id = video_id)"
	set one_category_view 1
}
 
template::head::add_css -href "/resources/videos/videos.css"
template::head::add_javascript -src "/resources/videos/swfobject.js"

permission::require_permission -party_id [ad_conn user_id] -object_id $package_id -privilege read

set admin_p [permission::permission_p -party_id [ad_conn user_id] -object_id [ad_conn package_id] -privilege admin]
set action_list ""

db_multirow -extend {category_name} videos select_videos "
	    select video_id,
		   package_id,
		   video_name,
		    to_char(video_date, 'DD-MM-YYYY') as date,
		   video_description as hr,
            acs_object__name(apm_package__parent_id(v.package_id)) as parent_name,
            (select site_node__url(site_nodes.node_id)
            from site_nodes
            where site_nodes.object_id = v.package_id) as url
            from videos v
	    where v.package_id = :package_id
            $category_where_clause
            and 't' = acs_permission__permission_p(v.video_id, :user_id, 'read')
            order by video_date desc
" {
	set category_id [category::get_mapped_categories $video_id]
	set category_name [category::get_name [lindex $category_id 0]]
	if {$category_name == ""} {	
		set category_name 0
	}
        set hr [ad_html_to_text $hr]
        set hr [util_close_html_tags $hr "90" "90" "..." ""]
        set hr [string trimleft $hr "*"]

       if {${videos:rowcount} eq 0} {
		set latest_video_id $video_id
		set latest_video_name $video_name
		set latest_hr $hr
		set latest_video_date $date
		set url $url
       }	
}

template::multirow sort videos -dictionary -decreasing category_name
