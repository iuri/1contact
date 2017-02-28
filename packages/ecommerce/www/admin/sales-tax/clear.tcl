#  www/[ec_url_concat [ec_url] /admin]/sales-tax/clear.tcl
ad_page_contract {

  @author
  @creation-date
  @cvs-id $Id: clear.tcl,v 1.4 2008/08/18 21:01:27 torbenb Exp $
  @author ported by Jerry Asher (jerry@theashergroup.com)
} {
}

ad_require_permission [ad_conn package_id] admin

set title "Clear Sales Tax Settings"
set context [list [list index "Sales Tax"] $title]

