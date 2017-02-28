# /www/[ec_url_concat [ec_url] /admin]/cat/category-edit.tcl
ad_page_contract {

    @param category_name the category name
    @param category_id the ID of the category to edit

    @cvs-id $Id: category-edit.tcl,v 1.4 2005/03/01 00:01:32 jeffd Exp $
    @author ported by Jerry Asher (jerry@theashergroup.com)
} {
    category_name:trim,notnull
    category_id:integer,notnull
}

ad_require_permission [ad_conn package_id] admin

# we need them to be logged in
set user_id [ad_conn user_id]

if {$user_id == 0} {
    
    set return_url "[ad_conn url]?[export_url_vars category_name category_id]"

    ad_returnredirect "/register?[export_url_vars return_url]"
    ad_script_abort
}

set address [ns_conn peeraddr]

db_dml update_ec_categories "update ec_categories
set category_name=:category_name,
last_modified=sysdate,
last_modifying_user=:user_id,
modified_ip_address=:address
where category_id=:category_id"
db_release_unused_handles

ad_returnredirect "category?[export_url_vars category_id category_name]"
