ad_page_contract {

    Display a lis of tagged items.

    @author Claudio Pasolini
    @cvs-id $Id: list.tcl

} {

    tag
    {return_url ""}
    object_type:optional
    orderby:optional
    {rows_per_page 30}
    page:optional
}

# Authorization 
set user_id    [ad_conn user_id]
set package_id [ad_conn package_id]
permission::require_permission \
    -party_id $user_id \
    -object_id $package_id \
    -privilege read

set title   [_ tags.Tagged_items]
set context [list "$title"]

set max_tag_no [parameter::get_from_package_key -package_key tags -parameter max_tag_no -default 100]

template::list::create \
    -name            items \
    -multirow        items \
    -page_size       $rows_per_page \
    -page_flush_p    t \
    -page_query_name tagged_items \
    -key             object_id \
    -elements        {
	icon {
	    display_template {<img src="/resources/tags/@items.icon@" border="0">}
	    sub_class narrow
	}
	name {
	    label "[_ tags.Document]"
	    link_url_col item_url
	}
	creation_date {
	    label "[_ tags.Creation_date]"
	    display_col creation_date_pretty
	}
	last_modified {
	    label "[_ tags.Last_modified]"
	    display_col last_modified_pretty
	}
	username {
	    label "[_ tags.Author]"
	}
    } \
    -orderby {
        default_value "name"
        creation_date {
	    label "[_ tags.Creation_date]"
	    orderby_desc "o.creation_date desc"
	    orderby_asc  "o.creation_date"
            default_direction "desc"
	}
        last_modified {
	    label "[_ tags.Last_modified]"
	    orderby_desc "o.last_modified desc"
	    orderby_asc  "o.last_modified"
            default_direction "desc"
	}
        username {
	    label "[_ tags.Author]"
	    orderby_desc "u.username desc"
	    orderby_asc  "u.username"
            default_direction "asc"
	}
        name {
	    label "[_ tags.Document]"
	    orderby_desc "o.title desc"
	    orderby_asc  "o.title"
            default_direction "asc"
	}
    } \
    -filters {
        object_type {
	    label "[_ tags.Type]"
	    values {{"[_ tags.All]" "*"} [db_list_of_lists object_types {}]}
	    where_clause {(coalesce(i.content_type, o.object_type) = :object_type or :object_type = '*')}
	    default_value "*"
	}
	tag {
	    label "[_ tags.Popular_Tags]"
	    values {[db_list_of_lists popular_tags {}]}
	    where_clause {t.tag = :tag}
	    default_value $tag
	}
	return_url {hide_p 1}
    } 

db_multirow -extend {icon item_url creation_date_pretty last_modified_pretty} items items {} {
    
    switch $content_type {
	content_item {set icon "icon-wiki-16x16.gif"}
	faq {set icon "faq.ico"}
	faq_q_and_a {set icon "faq.ico"}
	file_storage_object {set icon "folder.ico"}
        forums_forum {set icon "icon-forum-16x16.gif"}
	forums_message {set icon "icon-forum-16x16.gif"}
	news {set icon "news.ico"}
	pa_album {set icon "camera.ico"}
	pa_photo {set icon "camera.ico"}
	user {set icon "icon-people-16x16.gif"}
	::xowiki::Page {set icon "icon-wiki-16x16.gif"}
	default {set icon "icon-tag-16x16.gif"}
    }

    set item_url "/o/$object_id"
    set creation_date_pretty [lc_time_fmt $creation_date %q]
    set last_modified_pretty [lc_time_fmt $last_modified %q]

}
