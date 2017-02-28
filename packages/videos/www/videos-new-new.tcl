ad_page_contract {
  This is a form to upload video 

  @author Alessandro Landim
  @author iuri sampaio (iuri.sampaio@gmail.com)
  @date 2010-10-17

  $Id: site-master.tcl,v 1.22.2.7 2007/07/18 10:44:06 emmar Exp $
} {
    {video_id:optional}
    {video:trim,optional}
    {mode "file"}
}


permission::require_permission -party_id [ad_conn user_id] -object_id [ad_conn package_id] -privilege write
set queue 1
set package_id [ad_conn package_id]
set progress_bar_p 0

ad_form -name video -has_submit 1 -form {
    {video_id:key}
    {name:text {label "[_ videos.Name]"}}
    {description:text(textarea),optional 
	{label "[_ videos.Description]"}
    }
    {mode:text(radio)
	{label "[_ videos.Mode]"}
	{options {{File 0} {Link 1}}}
	{value 1}
	{html {onChange "document.video.__refreshing_p.value='1';document.video.submit()"}}
    }

}

switch $mode { 
    file {
	ad_form -extend -html { enctype multipart/form-data } -name video -form {
	    {video:file {label "[_ videos.File]"}}
	}
    }
    link {
	ad_form -extend -name video -form {
	    {link:text {label "[_ videos.Embed]"}}
	}
    }
}
ad_form -extend -name video -form {
    {publish_date_select:date(date)
	{label "[_ videos.publish_date_select]"}
	{html {id sel1} }
	{format "YYYY MM DD"}
	{after_html {<input type="button" style="height:23px; width:23px; background: url('/resources/acs-templating/calendar.gif');" onclick ="return showCalendarWithDateWidget('publish_date_select', 'y-m-d');" > \[<b>[_ videos.y-m-d]</b>\]}} 
    }
    {tags:text(text),optional {
	{label "[_ videos.Keywords"}
	{html size 60}
	{help_text "[_ videos.Use_spaces]"}
    }}
}




if {[exists_and_not_null video]} {
    ad_form -extend -name video  -validate {
	{video 
	    {[string equal [lindex [split [template::util::file::get_property mime_type $video] "/"] 0] "video"]}
	    "#videos.This_file_isnt_video_file#"
	}
    }
}


ad_form -extend -name video -form {
    {submit_button:text(submit)
	{label "[_ videos.Save]"}
	{value "[_ videos.Save]"}
	{html {onClick "progress_update();"}}
    }
} -new_request {
   
    set read_term 0

} -edit_request {
    
    db_1row get_video_info {
	select video_name as name, 
	video_description as description, 
	video_date as publish_date_select, 
	author,
	from videos 
	where video_id = :video_id
    }

    set publish_date_select [videos::from_sql_datetime -sql_date $publish_date_select  -format "YYYY-MM-DD"]
    foreach {category_id category_name} [videos::get_categories -package_id $package_id] {
	
	#ns_log Notice "AAA $category_id"
	set cat_${category_id} [videos::get_category_child_mapped -category_id $category_id -object_id $video_id]
    }
   
} -on_submit {
    
   
    set user_id [ad_conn user_id]
    set package_id [ad_conn package_id]
    set creation_ip [ad_conn peeraddr]
    

} -edit_data {
    
    set publish_date_select "[lindex $publish_date_select 0]-[lindex $publish_date_select 1]-[lindex $publish_date_select 2]"
    videos::edit \
	-video_id $video_id \
	-name $name \
	-description $description \
	-video_date $publish_date_select \
	-author $author 
    
    
    if {![empty_string_p $video]} {
	set tmp_filename [template::util::file::get_property tmp_filename $video] 
	set filename [template::util::file::get_property filename $video] 
	
	videos::new -tmp_filename $tmp_filename \
	    -filename $filename \
	    -item_id $video_id \
	    -description $description \
	    -name $name \
	    -author $author \
	    -tags $tags \
	    -package_id $package_id \
	    -user_id $user_id \
	    -creation_ip $creation_ip \
	}
    



} -new_data {
    
    set publish_date_select "[lindex $publish_date_select 0]-[lindex $publish_date_select 1]-[lindex $publish_date_select 2]"
    
    switch $mode {
	file {
	    set tmp_filename [template::util::file::get_property tmp_filename $video] 
	    set filename [template::util::file::get_property filename $video] 

	    set video_id [videos::new -filename $filename \
			  -tmp_filename $tmp_filename \
			  -name $name \
			  -description $description \
			  -video_date $publish_date_select \
			  -author $author \
			  -tags $tags \
			  -user_id $user_id \
			  -package_id $package_id \
			  -creation_ip $creation_ip]
	}
	link {
	 set video_id [videos::new -filename $link \
			  -tmp_filename $tmp_filename \
			  -name $name \
			  -description $description \
			  -video_date $publish_date_select \
			  -author $author \
			  -tags $tags \
			  -user_id $user_id \
			  -package_id $package_id \
			  -creation_ip $creation_ip]
	}
    }
    

} -after_submit {
    ad_returnredirect "."
    ad_script_abort
}	
