ad_page_contract {
  Remove video by video_id

  @author Alessandro Landim

  $Id: site-master.tcl,v 1.22.2.7 2007/07/18 10:44:06 emmar Exp $
} {
	video_id
}


permission::require_permission -party_id [ad_conn user_id] -object_id $video_id -privilege admin

ad_form -export {video_id} -name video-delete -form {
	{confirm:text(radio)
		{label "[_ videos.Confirme_remove_Videos]"} 
		{options {
				{"[_ videos.No]" "0"} 
				{"[_ videos.Yes]" "1"}}
		}
	}
} -on_submit {
	
	set message1 "[_ videos.Video_dont_removed]"
	if {$confirm == 1} {
		db_exec_plsql remove_video { select video__delete(:video_id)}
		set message1 "[_ videos.Videos_removed]"
	}
	
	ad_returnredirect -message $message1 "."
        ad_script_abort
}
