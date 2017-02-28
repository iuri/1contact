# /packages/tags/tcl/tag-procs.tcl

ad_library {
    TCL library for the COP package

    @author cpasolini@oasisoftware.com

    @creation-date 2009-05-03
}

namespace eval tags {}

ad_proc -public tags::my_tags {
    -item_id
    {-user_id ""}
} {
    Returns the user's tags associated to item_id.
} {
    
    if {$user_id eq ""} {
	set user_id [ad_conn user_id]
    }

    return [db_list my_tags {}]

}

ad_proc -public tags::item_tags {
    -item_id
} {
    Returns the tags associated to item_id.
} {
    
    return [db_list item_tags {}]

}

ad_proc -public tags::create_link {
    -item_id
    { -link_text #tags.Add_tag# }
    { -link_attributes "" }
    {-return_url {}} 
} {
    Generates an html link to add a tag to a content item.

    @param item_id          The item to tag.
    @param return_url       A url for the user to return to 
    @param link_text        The text to display for the link.
    @param link_attributes  Some additional parameters for the link. Could be used
			    to set the link title and other things like that. Ex. -link_attributes
			    <i>{ title="My link title" }</i>
} {
    # get the package url
    set package_url [tags::package_url]

    set html "<a href=\"[ad_quotehtml [export_vars -base ${package_url}edit {item_id context return_url}]]\" $link_attributes>$link_text</a>"

    return $html
}

ad_proc -public tags::package_url {} {
    Returns a url pointing to the mounted tags package.
} {
    return [site_node::get_package_url -package_key "tags"]
}
