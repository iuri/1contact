# /www/[ec_url_concat [ec_url] /admin]/orders/gift-certificate-void-2.tcl
ad_page_contract {

  Do the work for voiding a gift certificate.

  @author Eve Andersson (eveander@arsdigita.com)
  @creation-date Summer 1999
  @cvs-id $Id: gift-certificate-void-2.tcl,v 1.2 2002/09/10 22:22:43 jeffd Exp $
  @author ported by Jerry Asher (jerry@theashergroup.com)
} {
  gift_certificate_id:integer,notnull
  reason_for_void:notnull
}

ad_require_permission [ad_conn package_id] admin

set customer_service_rep [ad_get_user_id]

db_dml gift_certificate_void "
update ec_gift_certificates
set gift_certificate_state='void',
    voided_date=sysdate,
    voided_by=:customer_service_rep,
    reason_for_void=:reason_for_void
where gift_certificate_id=:gift_certificate_id
"

ad_returnredirect "gift-certificate?[export_url_vars gift_certificate_id]"
