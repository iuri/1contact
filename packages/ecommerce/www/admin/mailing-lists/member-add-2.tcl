# member-add-2.tcl

ad_page_contract { 
    @param user_id
    @param category_id
    @param subcategory_id:optional
    @param subsubcategory_id:optional

    @author
    @creation-date
    @cvs-id $Id: member-add-2.tcl,v 1.4 2005/03/01 00:01:32 jeffd Exp $
    @author ported by Jerry Asher (jerry@theashergroup.com)
} {
    user_id
    category_id
    subcategory_id:optional
    subsubcategory_id:optional
}

ad_require_permission [ad_conn package_id] admin

# we need them to be logged in
set admin_user_id [ad_conn user_id]

if {$admin_user_id == 0} {
    
    set return_url "[ad_conn url]?[export_entire_form_as_url_vars]"

    ad_returnredirect "/register.tcl?[export_url_vars return_url]"
    ad_script_abort
}



if { ![info exists subcategory_id] || [empty_string_p $subcategory_id] } {
    set check_string "select count(*) from ec_cat_mailing_lists where user_id=:user_id and category_id=:category_id and subcategory_id is null"
    set insert_string "insert into ec_cat_mailing_lists (user_id, category_id) values (:user_id, :category_id)"
} elseif { ![info exists subsubcategory_id] || [empty_string_p $subsubcategory_id] } {
    set check_string "select count(*) from ec_cat_mailing_lists where user_id=:user_id and subcategory_id=:subcategory_id and subsubcategory_id is null"
    set insert_string "insert into ec_cat_mailing_lists (user_id, category_id, subcategory_id) values (:user_id, :category_id, :subcategory_id)"
} elseif { [info exists subsubcategory_id] && ![empty_string_p $subsubcategory_id] } {
    set check_string "select count(*) from ec_cat_mailing_lists where user_id=:user_id and subsubcategory_id=:subsubcategory_id"
    set insert_string "insert into ec_cat_mailing_lists (user_id, category_id, subcategory_id, subsubcategory_id) values (:user_id, :category_id, :subcategory_id, :subsubcategory_id)"
} else {
    set check_string "select count(*) from ec_cat_mailing_lists where user_id=:user_id and category_id is null"
    set insert_string "insert into ec_cat_mailing_lists (user_id) values (:user_id)"
}

if { [db_string check_mailing_list_existence $check_string] == 0 } {
    db_dml insert_into_mailing_lists $insert_string
}
db_release_unused_handles

ad_returnredirect "one.tcl?[export_url_vars category_id subcategory_id subsubcategory_id]"
