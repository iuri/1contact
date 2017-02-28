ad_page_contract {
    A chunked version of a folder

    @author Jeff Davis (davis@xarg.net)
    @creation-date 17 June 2003
    @cvs-id $Id: album-chunk.tcl,v 1.2 2006/08/08 21:27:09 donb Exp $
} {
}


set query select_videos

if {![exists_and_not_null width]} {
	set width 100% 
}

if {![exists_and_not_null height]} {
	set height 270
}

if {![exists_and_not_null playlist_size]} {
	set playlist_size 133
}







set user_id [ad_conn user_id]
if {[exists_and_not_null package_id]} {
	set url [apm_package_url_from_id $package_id]
	set file_path "${url}/playlist.xml"
}

if {[exists_and_not_null video_id] && [exists_and_not_null package_id]} {
	set url [apm_package_url_from_id $package_id]
	set file_path "${url}/${video_id}.flv"
	set image_path "${url}/${video_id}.jpg"
}

template::head::add_javascript -src "/resources/videos/swfobject.js" 
