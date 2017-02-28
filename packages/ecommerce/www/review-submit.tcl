ad_page_contract {
    @param product_id
    @param usca_p

    @author
    @creation-date
    @cvs-id $Id: review-submit.tcl,v 1.9 2008/08/11 13:01:10 torbenb Exp $
    @author ported by Jerry Asher (jerry@theashergroup.com)
    @author revised by Bart Teeuwisse (bart.teeuwisse@thecodemill.biz)
    @revision-date April 2002

} {
    product_id:integer
    usca_p:optional
}

# we need them to be logged in

set user_id [ad_conn user_id]
if {$user_id == 0} {
    set return_url "[ad_conn url]?[export_url_vars product_id usca_p]"
    ad_returnredirect "/register?[export_url_vars return_url]"
    ad_script_abort
}

# user session tracking

set user_session_id [ec_get_user_session_id]
ec_create_new_session_if_necessary [export_entire_form_as_url_vars]
ec_log_user_as_user_id_for_this_session

set product_name [db_string get_product_name "
    select product_name 
    from ec_products 
    where product_id=:product_id"]

# Not clear where this is used, but I'll leave it in because it's not
# really clear how this code is put together.

lappend altered_prev_args_list $product_name
set rating_widget [ec_rating_widget]
set title "Write Your Own Review"
set context [list $title]
set ec_system_owner [ec_system_owner]

db_release_unused_handles
ad_return_template


