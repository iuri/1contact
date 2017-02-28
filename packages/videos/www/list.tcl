ad_page_contract {
    This is a index to list videos
    
    @author Alessandro Landim
    @author iuri sampaio

    $Id: site-master.tcl,v 1.22.2.7 2007/07/18 10:44:06 emmar Exp $
} {
    {keyword ""}
} 
set user_id [ad_conn user_id]
set package_id [ad_conn package_id]
set object_id [ad_conn object_id]



# String search
if {$keyword ne ""} {
        set query "and v.video_id in (select item_id from tags_tags where tag = :keyword)"
} else {
        set query ""
}



permission::require_permission -party_id [ad_conn user_id] -object_id $package_id -privilege read

set form_action_url "/videos/"
set admin_p [permission::permission_p -party_id [ad_conn user_id] -object_id [ad_conn package_id] -privilege admin]
set action_list ""

if {$admin_p eq 1} {
      set action_list {"#videos.New#" videos-new "#videos.New#"}
}

set image_size [parameter::get -package_id $package_id -parameter ImageSize]
set widthxheight [split $image_size "x"]
set width [lindex $widthxheight 0]
set height [lindex $widthxheight 1]
if {$width > 500} {
    set width [expr $width - 200]
}

set video_category_options [list Governo Empresa]

set list_elements {
    image {
	label " "
	    display_template {
		<a href="@videos.url@videos-view?video_id=@videos.video_id@">
		<img  width="100px" height="75px" src="@videos.url@@videos.video_id@.jpg"></a>
	    }
    }
    name {
	label "#videos.Name#"
	display_template {
	    <a href="@videos.url@videos-view?video_id=@videos.video_id@">
	    @videos.video_name@</a>
	}
    }
    autor {
	label "#videos.Author#"
	display_template {
	    @videos.autor@
	}
    }
    description {
	label "#videos.Description#"
	display_template {
	    @videos.video_description@
	}
    }
}


ns_log Notice "ELEMENTS: $list_elements"
ns_log Notice "$package_id | [videos::get_categories -package_id $package_id]"

#variable lists to db_multirow
set extend_list [list]

foreach {category_id category_name } [videos::get_categories -package_id $package_id] {
    ns_log Notice "ITEM: $category_id - $category_name"

    lappend list_elements cat_${category_id} [list \
	  label [category::get_name $category_id] \
	  display_col cat_$category_id]


    lappend extend_list "cat_${category_id}"

}

ns_log Notice "ELEMENTS: $list_elements"




template::list::create \
    -name videos \
    -multirow videos \
    -key video_id \
    -actions $action_list \
    -pass_properties {
    } -elements $list_elements \
    -orderby {
	name {
            label "[_ videos.Name]"
            orderby_desc "v.video_name desc"
            orderby_asc "v.video_name"
            default_direction "desc"
        }
	autor {
	    label "[_ videos.Author]"
	    orderby "v.autor desc"
	}
    }



db_multirow -extend $extend_list videos select_videos {} {
    foreach {category_id category_name} [videos::get_categories -package_id $package_id] {
	ns_log Notice "$category_id | $category_name"
	set cat_${category_id} [category::get_name [videos::get_category_child_mapped -category_id $category_id -object_id $video_id]]
	
    }
}

# User's search form 
                                                                                                                                       
ad_form -name search -export {} -action [ad_conn url] -form {
    {keyword:text(text),optional {label "[_ videos.Search]"} }
}

