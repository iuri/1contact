#  www/[ec_url_concat [ec_url] /admin]/sales-tax/clear-2.tcl
ad_page_contract {

  @author
  @creation-date
  @cvs-id $Id: clear-2.tcl,v 1.2 2002/09/10 22:22:48 jeffd Exp $
  @author ported by Jerry Asher (jerry@theashergroup.com)
} {
}

ad_require_permission [ad_conn package_id] admin

# delete all tax settings
db_transaction {
    db_foreach clear_sales_taxes_audit "
        select usps_abbrev
          from ec_sales_tax_by_state
    " {
        ec_audit_delete_row $usps_abbrev usps_abbrev ec_sales_tax_by_state_audit
    }
    db_dml clear_sales_taxes "delete from ec_sales_tax_by_state"
}

db_release_unused_handles

ad_returnredirect index.tcl
