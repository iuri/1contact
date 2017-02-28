# /www/[ec_url_concat [ec_url] /admin]/cat/subcategory-add-0.tcl

ad_page_contract {

    @param category_id the ID of the category
    @param category_name the name of the category
    @param prev_sort_key the previous sort key
    @param next_sort_key the next sort key

    @cvs-id $Id: subcategory-add-0.tcl,v 1.8 2008/08/20 20:37:38 torbenb Exp $
    @author ported by Jerry Asher (jerry@theashergroup.com)
} {

    category_id:integer,notnull
    category_name:trim,notnull
    prev_sort_key:notnull
    next_sort_key:notnull
}

ad_require_permission [ad_conn package_id] admin

# error checking: make sure that there is no subcategory in this category
# with a sort key equal to the new sort key
# (average of prev_sort_key and next_sort_key);
# otherwise warn them that their form is not up-to-date

### gilbertw - added do the calculation outside of the db.  PostgreSQL encloses
#   the bind variables in ' '
#  where sort_key = (:prev_sort_key + :next_sort_key)/2
set sort_key [expr ($prev_sort_key + $next_sort_key)/2]

set n_conflicts [db_string get_n_conflicts "select count(*)
from ec_subcategories
where category_id=:category_id
and sort_key = :sort_key"]

if { $n_conflicts > 0 } {
    ad_return_complaint 1 "<li>The page you came from appears to be out-of-date;
    perhaps someone has changed the subcategories since you last reloaded the page.
    Please go back to the previous page, push \"reload\" or \"refresh\" and try
    again.</li>"
    return
}

set title "Add a New Subcategory"
set context [list [list index "Product Categorization"] $title]

set export_form_vars_html [export_form_vars category_id category_name prev_sort_key next_sort_key]
