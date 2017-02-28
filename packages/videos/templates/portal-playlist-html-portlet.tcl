ad_page_contract {
    A chunked version of a folder

    @author Jeff Davis (davis@xarg.net)
    @creation-date 17 June 2003
    @cvs-id $Id: album-chunk.tcl,v 1.2 2006/08/08 21:27:09 donb Exp $
} {
}

set query select_videos

if {![exists_and_not_null width]} {
	set width 397 
}

if {![exists_and_not_null height]} {
	set height 247
}
permission::require_permission -object_id $package_id -privilege read
set admin_p [permission::permission_p -object_id $package_id -privilege admin]


set user_id [ad_conn user_id]

set url [apm_package_url_from_id $package_id]

template::head::add_javascript -src "/resources/videos/swfobject.js"
template::head::add_css -href "/resources/videos/videos.css"

db_multirow videos $query {} {
	set video_date_splited [split $date "-"]
	set videos_date "[lindex $video_date_splited 2]/[lindex $video_date_splited 1]"
	set hr [ad_html_to_text $hr]
	set hr [util_close_html_tags $hr "90" "90" "..." ""]
	set hr [string trimleft $hr "*"]

}

template::multirow sort videos -decreasing rownum
