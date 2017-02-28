ad_page_contract {
  This is a form to upload video 

  @author Alessandro Landim

  $Id: site-master.tcl,v 1.22.2.7 2007/07/18 10:44:06 emmar Exp $
} {
	{video_id:optional}
	{video:trim,optional}
}

permission::require_permission -party_id [ad_conn user_id] -object_id [ad_conn package_id] -privilege write
set queue 1
set package_id [ad_conn package_id]

#get community and subsite options 
set community_options [videos::get_community_options]
ns_log Notice "TTTT $community_options"

ad_form -html { enctype multipart/form-data } -name video -form {
    {video_id:key}
    {name:text {label "[_ videos.name]"}}
    {creator:text(text) {label "[_ videos.creator]"}}
    {description:text(textarea),optional 
	{label "[_ videos.description]"}
	{html {size 100}}
    }
    {video:file {label "[_ videos.file]"}}
    {autor:text(text) {label "#videos.autor#"}}
    {coautor:text {label "#videos.coautor#"}}
    {source:text(text) {label "#videos.source#"}}
    {community_id:text(select)
	{label {[_ videos.community]}}
	{options {$community_options}}
    }
    {tags:text(text) {
	{label "#videos.keywords#"}
	{html size 60}
	{help_text "[_ videos.Use_spaces]"}
    }}
}


if {[exists_and_not_null video_id]} {
    set categories [category_tree::get_mapped_trees $package_id]
    if {![empty_string_p $categories]} {
	foreach category $categories {
	    ad_form -extend -name video -form {
		{category_ids:integer(category),multiple {label "[_ videos.Categories]"}
		    {html {size 3}} {value {$video_id $package_id}}
		}
	    }
	}
    }
} else {
    if {![empty_string_p [category_tree::get_mapped_trees $package_id]]} {
        ad_form -extend -name video -form {
            {category_ids:integer(category),multiple {label "[_ videos.Categories]"}
                {html {size 3}} {value {}}
            }
        }
    }
}



ad_form -extend -name video -form {
    {publish_date_select:text(text)
	{label "[_ videos.publish_date_select]"}
	{html {id sel1} }
	{after_html {<input type='button' value=' ... ' onclick=\"return showCalendar('publish_date_select', 'y-m-d');\">  <div class="form-help-text"><img src="/shared/images/info.gif" width="12" height="9" alt="\[i\]" title="Help text" border="0"> [_ calendar.ymd]</div> }}
    }
    {terms:text(inform)
	{label "[_ videos.terms]"} 
	{value " O Portal do Software Público não assume nenhuma responsabilidade pelo conteúdo dos artefatos publicados dos usuários. A responsabilidade do conteúdo das mensagens recai sobre a pessoa ou pessoas que enviaram a mensagem. A Portal do Software Público não restringe o conteúdo de mensagens a não ser que violem os termos de uso ou sejam consideradas de natureza abusiva. Reservamo-nos o direito de monitorar o conteúdo de todas as mensagens com o propósito de restringir os abusos desse serviço sem aviso prévio ou consentimento do remetente ou destinatário. Qualquer usuário que violar os termos e condições aqui listados podem ser permanentemente banidos do serviço de mensagens."}
    }
    {read_term:text(checkbox)
	{label ""}
	{options {{"[_ videos.read_term]" "checked"}}}
    }
}

if {[exists_and_not_null video]} {
    ad_form -extend -name video  -validate {
	{read_term
	    {[string equal $read_term "checked"]} 
	    "#videos.You_must_check_read_term_box#"
	}
	{video 
	    {[string equal [lindex [split [template::util::file::get_property mime_type $video] "/"] 0] "video"]}
	    "#videos.This_file_isnt_video_file#"
        }
    }
}

ad_form -extend -name video -form {
} -new_request {
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
	    -autor $autor \
	    -coautor $coautor \
	    -video_source $source \
	    -community_id $community_id \
	    -tags $tags \
	    -package_id $package_id \
	    -user_id $user_id \
	    -creation_ip $creation_ip \
	}
    
    if {[exists_and_not_null category_ids]} {
	category::map_object -remove_old -object_id $video_id $category_ids
    }
    

} -new_data {

    db_transaction {
	set tmp_filename [template::util::file::get_property tmp_filename $video] 
	set filename [template::util::file::get_property filename $video] 
	
	        
	set video_id [videos::new -filename $filename \
			  -tmp_filename $tmp_filename \
			  -name $name \
			  -description $description \
			  -video_date $publish_date_select \
			  -autor $autor \
			  -coautor $coautor \
			  -video_source $source \
			  -community_id $community_id \
			  -tags $tags \
			  -user_id $user_id \
			  -package_id $package_id \
			  -creation_ip $creation_ip]
	
	if {[exists_and_not_null category_ids]} {
	    category::map_object -object_id $video_id $category_ids
	}
    }
} -after_submit {
    ad_returnredirect "."
    ad_script_abort
}	
