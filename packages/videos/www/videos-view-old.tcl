ad_page_contract {
  This is a index to list videos

  @author Alessandro Landim

  $Id: site-master.tcl,v 1.22.2.7 2007/07/18 10:44:06 emmar Exp $
} {
  video_id 
} 

permission::require_permission -party_id [ad_conn user_id] -object_id $video_id -privilege read

set url [site_node::get_url_from_object_id -object_id [ad_conn package_id]]
set return_url [ad_return_url]

template::head::add_javascript -src "/resources/videos/swfobject.js" 



set package_id [ad_conn package_id]
set video_in_queue [db_string select_video {select item_id from videos_queue where item_id = :video_id} -default ""]
set cont 1
if {![string equal $video_in_queue ""]} {
	set cont 0 
}

set image_size [parameter::get -package_id $package_id -parameter ImageSize]
set widthxheight [split $image_size "x"]
set width [lindex $widthxheight 0]
set height [lindex $widthxheight 1]
if {$width > 500} {
	set width [expr $width - 200]
}

db_1row select_video {select video_name, video_description from videos where video_id = :video_id} -column_array video
set admin_p [permission::permission_p -party_id [ad_conn user_id] -object_id $video_id -privilege admin]
set comment_p [permission::permission_p -party_id [ad_conn user_id] -object_id $video_id -privilege general_comments_create]

set context [list "" $video(video_name)]

set title $video(video_name)
#set context $video(video_name)

set user_id [ad_conn user_id]

set package_url [apm_package_url_from_id $package_id]

set general_comments_package_url [general_comments_package_url]
general_comments_get_comments -print_content_p 1 $video_id



set comment_add_url [export_vars -base "${general_comments_package_url}comment-add" { { object_id $video_id } { object_name $title } { return_url } }]

set category_id [lindex [category::get_mapped_categories $video_id] 0]

