#  www/[ec_url_concat [ec_url] /admin]/products/toggle-no-shipping-avail-p.tcl
ad_page_contract {

  @author Rafael Schloming (rhs@mit.edu)
  @creation-date Summer 2000
  @cvs-id $Id: toggle-present-p.tcl,v 1.1 2008/08/14 11:21:47 torbenb Exp $
  @author ported by Jerry Asher (jerry@theashergroup.com)
} {
  product_id:integer,notnull
}

ad_require_permission [ad_conn package_id] admin

# we need them to be logged in
set peeraddr [ns_conn peeraddr]
set user_id  [ad_conn user_id]

db_dml toggle_present_p_update "
update ec_products 
set present_p = logical_negation(present_p),
    last_modified = sysdate, 
    last_modifying_user = :user_id,
    modified_ip_address = :peeraddr
where product_id = :product_id
"

ad_returnredirect "one.tcl?[export_url_vars product_id]"
