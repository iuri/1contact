ad_library {

    Videos Library

    @creation-date 2006-09-21
    @author Alessandro Landim <alessandro.landim@gmail.com>
    @creation-date 2010-06-15
    @author Iuri Sampaio <iuri.sampaio@gmail.com>
    @cvs-id $Id: videos-procs.tcl,v 1.21 2006/08/08 21:26:52 donb Exp $

}

namespace eval videos {}

ad_proc -public videos::new_link {
    {-link_id ""}
    {-url:required}
} {
    Cretes an embed link. No files, just the link
} {
    
    ns_log Notice "$url"
    set extlink_id [db_nextval acs_object_id_seq]
    set package_id [ad_conn package_id]
    set user_id [ad_conn user_id] 
    ns_log Notice "$extlink_id"
    
    

    content::extlink::new \
	-extlink_id $extlink_id \
	-url $url \
	-parent_id $package_id \
	-name "youtube-video-address" \
        -description "youtube video address to be embeded and displayed " \
	-package_id $package_id
    
    
    #db_exec_plsql video_insert {}
    

    permission::grant -party_id $user_id -object_id $extlink_id -privilege admin

    #lappend tags $name
#    ns_log Notice "TAGS: $tags"
    
    
    # deletes user's tags associated to item_id
    #db_dml clear_tags {}
    
    # Add Tags
   # foreach tag $tags {
	#create tag
#	db_dml create_tag {}
  #  }
    
    return 
}

ad_proc -public videos::new {
    {-item_id ""}
    {-filename ""}
    {-tmp_filename ""}
    {-name:required}
    {-description ""}
    {-video_date "now"}
    {-tags ""}
    {-user_id:required}
    {-package_id:required}
    {-creation_ip:required}
} {
    create or update  video
} {


    ns_log Notice "Running ad_proc videos::new"

    ns_log notice "$tmp_filename | $filename"
    if {[string equal $creation_ip ""]} {
	set creation_ip [ad_conn peeraddr]
    }
    
    set new_video 0
    set suggest_name [lang::util::suggest_key $name]
    set guessed_file_type [ns_guesstype $filename]

    if {![exists_and_not_null item_id]} {
	set new_video 1
	set item_id [db_nextval "acs_object_id_seq"]
	content::item::new \
	    -item_id $item_id \
	    -name "video$item_id-$filename" \
	    -parent_id $package_id \
	    -content_type video_object \
	    -package_id $package_id \
	    -creation_user $user_id \
	    -creation_ip $creation_ip 
    }
    

    ###
    ## add video to cr_revisions
    ###

    ns_log Notice "TMP FILE $tmp_filename"
    if {[exists_and_not_null tmp_filename]} {
	
	set n_bytes [file size $tmp_filename]
	ns_log Notice "$n_bytes"
	set revision_id [cr_import_content \
			     -item_id $item_id \
			     -storage_type file \
			     -creation_user $user_id \
			     -creation_ip $creation_ip \
			     -description $description \
			     -package_id $package_id \
			     $package_id \
			     $tmp_filename \
			     $n_bytes \
			     $guessed_file_type \
			     video-$package_id-$user_id-$suggest_name-$n_bytes]

	ns_log Notice "RVID $revision_id"
	
	item::publish -item_id $item_id -revision_id $revision_id
	
	###
	## get a video image if video file is FLV
	###
	switch $guessed_file_type {
	    {video/x-flv} - {video/mp4} - {video/x-msvideo} - {video/quicktime} - {text/plain} {
		set image_tmp_filename "/tmp/image-videos-[ns_rand 1000000].jpeg"
		set image_tmp "/tmp/image-videos-2[ns_rand 1000000].jpeg"
		
		set image_size [parameter::get -package_id $package_id -parameter ImageSize]
		set film_image_to_composite [parameter::get -package_id $package_id -parameter ImageToComposite]
		ns_log Notice "IMAGE: $film_image_to_composite | "
		
		if {![catch {[exec ffmpeg -an -y -i $tmp_filename -f mjpeg -s $image_size -ss 10 -vframes 1 $image_tmp_filename]} errorMsg]} {
		    ns_log Notice "Erro na conversao da imagem" 
		    # do nothing
		} else {
		    set image_tmp $image_tmp_filename
		    if {$film_image_to_composite != ""} {
			ns_log Notice "ROOT DIR: [acs_root_dir]"
			ns_log Notice "$image_tmp_filename - $film_image_to_composite - $image_tmp"
			catch {exec convert -composite $tmp_filename "[acs_root_dir]$film_image_to_composite" $image_tmp} aux
		    }
		    ns_log Notice "IMAGE1: $image_tmp - $image_tmp_filename"
		    
		}
	    }
	}
	
	###
	##add image 
	###
    
	if {[exists_and_not_null image_tmp]} {
	    ns_log Notice "FLAG 1"
	    set image_guessed_file_type [ns_guesstype $image_tmp] 
	    
	    ns_log Notice "FLAG 2: $image_guessed_file_type"
	    set image_item_id [videos::get_image_id \
				   -item_id $item_id \
				   -package_id $package_id \
				   -creation_user $user_id \
				   -creation_ip $creation_ip]
	    ns_log Notice "FLAG 3: $image_item_id"
	    
	    set image_tmp_size [file size $image_tmp]
	    ns_log Notice "FLAG 4: $image_tmp_size"
	    
	    set image_revision_id [cr_import_content \
				       -item_id $image_item_id \
				       -image_only \
				       -storage_type file \
				       -creation_user $user_id \
				       -creation_ip $creation_ip \
				       -description $description \
				       -package_id $package_id \
				       $package_id \
				       $image_tmp \
				       $image_tmp_size \
				       $image_guessed_file_type \
				       video-image-$item_id-$revision_id]
	    
	    ns_log Notice "FLAG 5: $image_revision_id"
	    
	    item::publish -item_id $image_item_id -revision_id $image_revision_id
	    ns_log Notice "FLAG 6: "
	    
	    set video_image_rel_id [relation::get_id -object_id_one $item_id \
					-object_id_two $image_item_id \
					-rel_type "video_image_thumbnail_rel"]
	    
	    if {[empty_string_p $video_image_rel_id]} {
		db_exec_plsql create_rel_image {}
	    }
	    
	    file delete $image_tmp
	    file delete $tmp_filename
	    file delete $filename
	}
    } else {
	#if the video is a link
    }
	
	
	

    ## insert if it's a new video
    if {$new_video} {
	db_exec_plsql video_insert {}
	permission::grant -party_id $user_id -object_id $item_id -privilege admin
    } else {
	#do nothing
    }
    
    # put video in queue to convert to a flash format (flv) 
    if {$guessed_file_type != "video/x-flv" && $guessed_file_type != "video/mp4"} {
	videos::video_queue -item_id $item_id
    }
    
    
    ns_log Notice "TAGS: $tags"
    lappend tags $name
    ns_log Notice "TAGS: $tags"
    

    # deletes user's tags associated to item_id
    #db_dml clear_tags {}
    
    # Add Tags
    foreach tag $tags {
	#create tag
	db_dml create_tag {}
    }
    
    return $item_id
}

ad_proc -public videos::convert {
    {-item_id:required}
} {
    convert video to flv
} {

	#try a different bitrate if the previous convert didn't work
	set convert_time_bit_rate [nsv_incr videos convert_time 20]
	set bitrate [expr 320 - $convert_time_bit_rate]
	ns_log notice "bitrate complete!!"

	
	ns_log Notice "BIT RATE: $convert_time_bit_rate - $bitrate"

	set path [cr_fs_path CR_FILES]
	set revision_id [db_string get_live_revision ""]
	set filename [db_string write_file_content ""]

	set video_filename "videos-[ns_rand 1000000].mp4"
	set video_tmp_filename "/tmp/$video_filename"

	videos::get -item_id $item_id -array orig_video

	
	if {![catch {exec ffmpeg -i $filename -acodec libfaac -ab 32k -vcodec libx264 -vpre hq -b "${bitrate}k" -threads 0 $video_tmp_filename} errorMsg]} {
			# delete a temporary video file
			file delete $video_tmp_filename
	} else {
				
				#start insert video
			
				#exec flvtool2 -U $video_tmp_filename	
			       	videos::new -tmp_filename $video_tmp_filename \
				-filename $video_filename \
		    		-item_id $item_id \
		    		-description $orig_video(video_description) \
		    		-name $orig_video(video_name) \
		    		-package_id $orig_video(package_id) \
		    		-user_id $orig_video(creation_user) \
		    		-creation_ip $orig_video(creation_ip)

	}

	file delete $video_tmp_filename

	videos::delete_video_queue -item_id $item_id	
	nsv_incr videos convert_time $bitrate
}

ad_proc -public videos::video_queue {
    -item_id:required
} {
    This proc add video into queue to convert. 
} {
 	db_dml insert_video_queue {}

}

ad_proc -public videos::delete_video_queue {
    -item_id:required
} {
    This proc add video into queue to convert. 
} {
 	db_dml delete_video_queue {}

}

ad_proc -public videos::get {
    -item_id:required
    -array:required
} {
    This proc retrieves a video. 
} {
    upvar 1 $array row
    db_1row videos_select {} -column_array row
}

ad_proc -public videos::convert_queue {} {
    This proc retrieves a video. 
} {
    
    set items_id [db_list select_queue {select item_id from videos_queue}]
    foreach item_id $items_id {
	videos::convert -item_id $item_id
    }

}

ad_proc -public videos::get_image_id {
    -item_id:required
    -package_id:required
    -creation_user:required
    -creation_ip:required
} {
    This proc retrieves a video. 
} {
 
	set image_item_id [db_string select_item_image "" -default ""]

	if {[string equal "" $image_item_id]} {
		set image_item_id [content::item::new \
						-name "video-image-$item_id" \
						-parent_id $package_id \
						-content_type image \
						-package_id $package_id \
						-creation_user $creation_user \
						-creation_ip $creation_ip]
	}
	return $image_item_id
}

ad_proc -public videos::edit {
    -video_id:required
    -name:required
    -description:required
    {-video_date ""}
    {-autor ""}
    {-coautor ""}
    {-video_source ""} 
    {-community_id ""}
} {
    This proc retrieves a video. 
} {
 
    db_dml update_video {
	update videos set video_name = :name, 
	video_description = :description, 
	video_date = :video_date,
        autor = :autor,
	coautor = :coautor,
	video_source = :video_source,
	community_id = :community_id
	where video_id = :video_id
    }
}


ad_proc -public videos::get_user_name {
    -user_id:required
} {
    Returns username
} {
    
    return [lindex [db_list select_user_name "select u.first_names || ' ' || u.last_name as name
	from cc_users u
	where u.user_id = :user_id
    "] 0]
}


ad_proc -public videos::get_community_options {
} { 
    Returns community and subsite options to a select widget
} {
    
    set subsites [db_list_of_lists select_subsites {
	select instance_name, package_id
	from apm_packages ap
	where package_key = 'acs-subsite'
	order by lower(instance_name)
    }]
    
    set dotlrn_p [apm_package_installed_p dotlrn]
    if {$dotlrn_p} {
	#get communities and subsites
	
	set communities [db_list_of_lists select_communities {
	    select pretty_name, community_id
	    from dotlrn_communities 
	    where archived_p = 'f'
	    order by lower(pretty_name)

	}]
			
	
	lappend $subsites $communities
    }

    return $subsites
}




ad_proc videos::get_categories {
    {-package_id ""}
} {
   Returns cateogories 
} {
    #ns_log Notice "Running videos::category_types"

    set locale [ad_conn locale]
    #ns_log Notice "LOCAL $locale"
    set category_trees [category_tree::get_mapped_trees $package_id]
    #ns_log Notice "TREES: $category_trees"


    if {[exists_and_not_null category_trees]} {
	
	set tree_id [lindex [lindex $category_trees 0] 0]
	#ns_log Notice "TREEID: $tree_id"
	set cat_ids [category_tree::get_categories -tree_id $tree_id]
	#ns_log Notice "cat $cat_ids"
	set categories [list]
	foreach cat_id $cat_ids {
	    set cat_name [category::get_name $cat_id]
	    lappend categories $cat_id
	    lappend categories $cat_name
	}
	
	return $categories
    }

    return
}




ad_proc videos::category_get_options {
    {-parent_id:required}
} {
    @return Returns the category types for this instance as an
    array-list of { parent_id1 heading1 parent_id2 heading2 ... }
} {

#    ns_log Notice "Running videos::category_get_options $parent_id"

    set children_ids [category::get_children -category_id $parent_id]
    
#    ns_log Notice "CC $children_ids"

    set children [list]
    foreach child_id $children_ids {
	set child_name [category::get_name $child_id]
#	ns_log Notice "CHILDNAME: $child_name"
	set temp "$child_name $child_id"
	lappend children $temp
    }

#    ns_log Notice  "CHILDREN $children"
    return $children
}   


ad_proc videos::get_category_child_mapped {
    {-category_id:required}
    {-object_id:required}
} {
    Return the category child  mapped to the video item 
} {

    #Get category children mapped to the object_id
    set children_ids [db_list get_child "select category_id from category_object_map where object_id = :object_id"]
    
    #Verify which child has the parent category that matches with the category_id passed as argument
    foreach child_id $children_ids {
	if {$category_id eq [category::get_parent -category_id $child_id]} {
	    return $child_id
	}
    }
    return 
}


ad_proc -public videos::from_sql_datetime {
    {-sql_date:required}
    {-format:required}
} {
    
} {
    # for now, we recognize only "YYYY-MM-DD" "HH12:MIam" and "HH24:MI". 
    set date [template::util::date::create]

    switch -exact -- $format {
        {YYYY-MM-DD} {
            regexp {([0-9]*)-([0-9]*)-([0-9]*)} $sql_date all year month day

            set date [template::util::date::set_property format $date {DD MONTH YYYY}]
            set date [template::util::date::set_property year $date $year]
            set date [template::util::date::set_property month $date $month]
            set date [template::util::date::set_property day $date $day]
        }

        {HH12:MIam} {
            regexp {([0-9]*):([0-9]*) *([aApP][mM])} $sql_date all hours minutes ampm
            
            set date [template::util::date::set_property format $date {HH12:MI am}]
            set date [template::util::date::set_property hours $date $hours]
            set date [template::util::date::set_property minutes $date $minutes]                
            set date [template::util::date::set_property ampm $date [string tolower $ampm]]
        }

        {HH24:MI} {
            regexp {([0-9]*):([0-9]*)} $sql_date all hours minutes

            set date [template::util::date::set_property format $date {HH24:MI}]
            set date [template::util::date::set_property hours $date $hours]
            set date [template::util::date::set_property minutes $date $minutes]
        }

        {HH24} {
            set date [template::util::date::set_property format $date {HH24:MI}]
            set date [template::util::date::set_property hours $date $sql_date]
            set date [template::util::date::set_property minutes $date 0]
        }
        default {
            set date [template::util::date::set_property ansi $date $sql_date]
        }
    }

    return $date
}


ad_proc -public videos::allowed_format_p {
    video
} {
    Checks if the video is in the allowed formats
} {

    ns_log Notice "Running ad_proc videos::allowed_format_p"
    
    ns_log Notice "$video"

    set mime_type [lindex $video 0]


    ns_log Notice "$mime_type " 
    set mime_type [template::util::file::get_property mime_type $mime_type]

   ns_log Notice "PROPERTY [lindex [split [template::util::file::get_property mime_type $video] "/"] 0]"

    return 0




    
}

ad_proc -public videos::download_counter {
    -user_id
    -package_id
    -revision_id
    -video_id
} {
    @author iuri sampaio (iuri.sampaio@gmail.com)
    @creation-date 2010-10-19
} {

    set total [db_list count_video_id {
	select count(*) from videos_rank where video_id = :video_id and user_id = :user_id
    }]

   if {![exists_and_not_null total]} { 
       incr $total
   }

    db_dml count_download "
	    insert into videos_rank (
				     user_id,
				     package_id,
				     revision_id,
				     video_id,
				     counter)
	    values (
		    :user_id,
		    :package_id,
		    :revision_id,
		    :video_id,
		    :total)
	    
        "
}

namespace eval videos::notification {}

ad_proc -public videos::notification::get_url {
    object_id
} {
    returns a full url to the object_id.
    handles videos and video item.
} { 
    
    db_1row select_object_type {
	select object_type from acs_objects where object_id = :object_id
    }
    

    if {[string equal $object_type "apm_package"]} {
	set package_url [db_list select_url {
	    select site_node__url(node_id) from site_nodes where object_id  = :object_id
	}]
	
	return ${package_url}
    }

    if {[string equal $object_type "content_item"]} {
	set package_url [db_exec_plsql select_videos_package_url {}]
	return ${package_url}videos-view?video_id=$object_id
    }
    
	
    
}


