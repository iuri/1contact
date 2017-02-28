# /www/[ec_url_concat [ec_url] /admin]/orders/gift-certificate-void.tcl
ad_page_contract {

  Void a gift certificate.

  @author Eve Andersson (eveander@arsdigita.com)
  @creation-date Summer 1999
  @cvs-id $Id: gift-certificate-void.tcl,v 1.4 2008/08/18 10:45:37 torbenb Exp $
  @author ported by Jerry Asher (jerry@theashergroup.com)
} {
  gift_certificate_id:integer,notnull
}

ad_require_permission [ad_conn package_id] admin

set title "Void Gift Certificate"
set context [list [list index "Orders / Shipments / Refunds"] $title]

set export_form_vars_html [export_form_vars gift_certificate_id]

