
# /www/[ec_url_concat [ec_url] /admin]/cat/category-add-2.tcl

ad_page_contract {

    @param category_name the name of the category
    @param category_id the ID of the category
    @param prev_sort_key the previous sort key
    @param next_sort_key the next sort key

    @cvs-id $Id: category-add-2.tcl,v 1.8 2005/03/01 00:01:32 jeffd Exp $
    @author ported by Jerry Asher (jerry@theashergroup.com)
} {
    category_name:trim,notnull
    category_id:notnull,integer
    prev_sort_key:notnull
    next_sort_key:notnull
}

ad_require_permission [ad_conn package_id] admin

# we need them to be logged in
set user_id [ad_conn user_id]

if {$user_id == 0} {
    
    set return_url "[ad_conn url]?[export_entire_form_as_url_vars]"

    ad_returnredirect "/register?[export_url_vars return_url]"
    ad_script_abort
}

# see first whether they already entered this category (in case they
# pushed submit twice), in which case, just redirect to 
# index.tcl



if { [db_0or1row get_category_confirmation "select category_id from ec_categories
where category_id=:category_id"]==1} {
    ad_returnredirect "index"
    ad_script_abort
}

# now make sure there's no category with that sort key already
### gilbertw - added do the calculation outside of the db.  PostgreSQL encloses
#   the bind variables in ' '
#  where sort_key = (:prev_sort_key + :next_sort_key)/2
set sort_key [expr ($prev_sort_key + $next_sort_key)/2]

set n_conflicts [db_string get_n_conflicts "select count(*)
from ec_categories
where sort_key = :sort_key"]

if { $n_conflicts > 0 } {
    ad_return_complaint 1 "<li>The category page appears to be out-of-date;
    perhaps someone has changed the categories since you last reloaded the page.
    Please go back to <a href=\"index\">the category page</a>, push
    \"reload\" or \"refresh\" and try again."
    ad_script_abort
}

set peeraddr [ns_conn peeraddr]
db_dml insert_into_ec_categories "insert into ec_categories
(category_id, category_name, sort_key, last_modified, last_modifying_user, modified_ip_address)
values
(:category_id, :category_name, :sort_key, sysdate, :user_id, :peeraddr)"
db_release_unused_handles
ad_returnredirect "index"
ad_script_abort
