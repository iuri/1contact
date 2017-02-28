#  www/[ec_url_concat [ec_url] /admin]/templates/make-default.tcl
ad_page_contract {
    @param template_id
  @author
  @creation-date
  @cvs-id $Id: make-default.tcl,v 1.4 2008/08/19 05:41:47 torbenb Exp $
  @author ported by Jerry Asher (jerry@theashergroup.com)
} {
    template_id:integer
}

ad_require_permission [ad_conn package_id] admin

db_1row get_template_info "select template_name, template from ec_templates where template_id=:template_id"

set title "Set Default Template"
set context [list [list index "Product Templates"] $title]

set export_form_vars_html [export_form_vars template_id]
