ad_page_contract {
    A chunked version of a folder

    @author Jeff Davis (davis@xarg.net)
    @creation-date 17 June 2003
    @cvs-id $Id: album-chunk.tcl,v 1.2 2006/08/08 21:27:09 donb Exp $
} {
}




set query select_videos

set user_id [ad_conn user_id]
template::head::add_css -href "/resources/videos/videos-slider.css"

db_multirow videos $query {} {
	set video_date_splited [split $date "-"]
	set videos_date "[lindex $video_date_splited 2]/[lindex $video_date_splited 1]"
}


ah::requires -sources "jquery"

template::head::add_javascript -src "http://paramoreredd.com/js/pr-plugins.js" -order 5 
template::head::add_javascript -src "http://paramoreredd.com/js/pr-global.js" -order 6


