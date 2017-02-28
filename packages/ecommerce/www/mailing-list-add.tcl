ad_page_contract {

    This page either redirects them to log on or asks them to confirm that
    they are who we think they are.

    @param category_id
    @param subcategory_id:optional
    @param subsubcategory_id:optional
    @param usca_p:optional

    @author
    @creation-date
    @author ported by Jerry Asher (jerry@theashergroup.com)
    @author revised by Bart Teeuwisse (bart.teeuwisse@thecodemill.biz)
    @revision-date April 2002

} {
    category_id:integer
    subcategory_id:optional
    subsubcategory_id:optional
    usca_p:optional
}

set user_id [ad_conn user_id]
set return_url "[ec_url]mailing-list-add-2?[export_url_vars category_id subcategory_id subsubcategory_id]"
if {$user_id == 0} {
    ad_returnredirect "/register?[export_url_vars return_url]"
    ad_script_abort
}

# user session tracking

set user_session_id [ec_get_user_session_id]
ec_create_new_session_if_necessary [export_entire_form_as_url_vars]
ec_log_user_as_user_id_for_this_session
set user_name [db_string get_user_name "select first_names || ' ' || last_name as user_name from cc_users where user_id=:user_id"]

if { ![info exists subcategory_id] || [empty_string_p $subcategory_id] } {
    set mailing_list_name [db_string get_cat_name "
	select category_name 
	from ec_categories 
	where category_id=:category_id"]
} elseif { ![info exists subsubcategory_id] || [empty_string_p $subsubcategory_id] } {
    set mailing_list_name "[db_string get_cat_name "
	select category_name 
	from ec_categories 
	where category_id=:category_id"]: [db_string get_subcat_name "
	select subcategory_name 
	from ec_subcategories 
	where subcategory_id=:subcategory_id"]"
} elseif { [info exists subsubcategory_id] && ![empty_string_p $subsubcategory_id] } {
    validate_integer "subsubcategory_id" $subsubcategory_id
    validate_integer "subcategory_id" $subcategory_id
    set mailing_list_name "[db_string get_cat_name "
	select category_name 
	from ec_categories 
	where category_id=:category_id"]: [db_string get_subcat_name "
	select subcategory_name 
	from ec_subcategories 
	where subcategory_id=:subcategory_id"]: [db_string get_subsubcat_name "
	select subsubcategory_name 
	from ec_subsubcategories 
	where subsubcategory_id=:subsubcategory_id"]"
} else {
    ad_return_complaint 1 "You haven't specified which mailing list you want to be added to."
    ad_script_abort
}

set register_link "/register?[export_url_vars return_url]"
set hidden_form_variables [export_form_vars category_id subcategory_id subsubcategory_id]
set title "Subscribe to the $mailing_list_name mailing list"
set context [list $title]
set ec_system_owner [ec_system_owner]
db_release_unused_handles
ad_return_template
