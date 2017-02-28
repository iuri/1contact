ad_page_contract {
  This is a form to upload video 

  @author Alessandro Landim
  @mode 0 file 1 link (embeded video) 


  $Id: site-master.tcl,v 1.22.2.7 2007/07/18 10:44:06 emmar Exp $
} {
    {video_id:optional}
    {video:trim,optional}
    {mode:integer 0}
}

permission::require_permission -party_id [ad_conn user_id] -object_id [ad_conn package_id] -privilege write
set queue 1
set package_id [ad_conn package_id]

ad_form -html { enctype multipart/form-data } -name video -form {
    {video_id:key}
    {mode:integer(radio)
	{label "[_ videos.Mode]"}
	{options {{File 0} {Link 1}}}
		{html {onChange "document.video.__refreshing_p.value='1';document.video.submit()"}}
    }
}

switch $mode {
    0 {
  	ad_form -extend -name video -form {	    
	    {name:text {label "[_ videos.name]"}}
	    {creator:text(text) {label "[_ videos.creator]"}}
	    {description:text(textarea),optional 
		{label "[_ videos.description]"}
		{html {size 100}}
	    }
	    {video:file {label "[_ videos.file]"}}
	    
	    {tags:text(text) {
		{label "#videos.keywords#"}
		{html size 60}
		{help_text "[_ videos.Use_spaces]"}
	    }}
	}
    }
    1 {
  	ad_form -extend -name video -form {
	    {video:text {label "[_ videos.Embed]"}}
	}
	
    }
    default { continue }
}



if {[exists_and_not_null video]} {
    ad_form -extend -name video  -validate {
	{video 
	    {![string equal $video ""]}
	    "#videos.This_file_isnt_video_file#"
        }
    }
}

ad_form -extend -name video -form {} -new_request {
    set creator [videos::get_user_name -user_id [ad_conn user_id]]
    
    set read_term 0
} -edit_request {
    
    db_1row get_video_info {select video_name as name, video_description as description, video_date as publish_date_select from videos where video_id = :video_id}
    
} -on_submit {
    
    set user_id [ad_conn user_id]
    set package_id [ad_conn package_id]
    set creation_ip [ad_conn peeraddr]
    
} -edit_data {
    
    videos::edit -video_id $video_id -name $name -description $description -video_date $publish_date_select
    
    if {![empty_string_p $video]} {
	set tmp_filename [template::util::file::get_property tmp_filename $video] 
	set filename [template::util::file::get_property filename $video] 
	
	videos::new -tmp_filename $tmp_filename \
	    -filename $filename \
	    -item_id $video_id \
	    -description $description \
	    -name $name \
	    -tags $tags \
	    -package_id $package_id \
	    -user_id $user_id \
	    -creation_ip $creation_ip \
	}
    
} -new_data {


    switch $mode { 
	
	0 {
	    
	    db_transaction {
		set tmp_filename [template::util::file::get_property tmp_filename $video] 
		set filename [template::util::file::get_property filename $video] 
		set publish_date_select "[lindex $publish_date_select 0]-[lindex $publish_date_select 1]-[lindex $publish_date_select 2]"
		
		set video_id [videos::new -filename $filename \
				  -tmp_filename $tmp_filename \
				  -name $name \
				  -description $description \
				  -video_date $publish_date_select \
				  -tags $tags \
				  -user_id $user_id \
				  -package_id $package_id \
				  -creation_ip $creation_ip]   
	    }
	}
	1 {
	    db_transaction {
		set video_id [videos::new_link -url [util_text_to_url -text $video]]   
	    }
	}
	default {}
    }
	
	
} -after_submit {
	ad_returnredirect "."
    ad_script_abort
}	
