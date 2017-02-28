#  www/[ec_url_concat [ec_url] /admin]/products/delete.tcl
ad_page_contract {
  Product delete confirm.

  @author Eve Andersson (eveander@arsdigita.com)
  @creation-date Summer 1999
  @cvs-id $Id: delete.tcl,v 1.4 2008/08/14 21:53:58 torbenb Exp $
  @author ported by Jerry Asher (jerry@theashergroup.com)
} {
  product_id:integer,notnull
}

ad_require_permission [ad_conn package_id] admin

set product_name [ec_product_name $product_id]

set title "Confirm Deletion of $product_name"
set context [list [list index Products] $title]

set export_vars_html [export_form_vars product_id]
