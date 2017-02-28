# /packages/tags/www/popular-tags.tcl

ad_page_contract {

    Shows the popular tags.

    @author cpasolini@oasisoftware.com
    @creation-date 2009-05-02

} {
    {return_url ""}
}

# Authorization 
set user_id    [ad_conn user_id]
set package_id [ad_conn package_id]
permission::require_permission \
    -party_id $user_id \
    -object_id $package_id \
    -privilege read

set title "[_ tags.Popular_tags]"
set context [list $title]

set tags_url [tags::package_url]

ad_return_template
