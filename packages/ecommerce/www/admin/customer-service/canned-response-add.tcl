# canned-response-add.tcl

ad_page_contract {
    @author
    @creation-date
    @cvs-id $Id: canned-response-add.tcl,v 1.4 2008/08/20 20:34:33 torbenb Exp $
    @author ported by Jerry Asher (jerry@theashergroup.com)
} {
}

ad_require_permission [ad_conn package_id] admin

set title "New Prepared Response"
set context [list [list index "Customer Service"] $title]


