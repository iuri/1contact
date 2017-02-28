ad_page_contract {
    @cvs-id $Id: index.tcl,v 1.4 2008/08/19 11:29:03 torbenb Exp $
    @author ported by Jerry Asher (jerry@theashergroup.com)
} {
}

ad_require_permission [ad_conn package_id] admin

set title "Mailing Lists"
set context [list $title]

set mailing_list_widget_html "[ec_mailing_list_widget "f"]"

set category_widget_html "[ec_category_widget]"
