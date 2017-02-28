#  www/[ec_url_concat [ec_url] /admin]/products/link-add-3.tcl
ad_page_contract {

  @author Eve Andersson (eveander@arsdigita.com)
  @creation-date Summer 1999
  @cvs-id $Id: link-add-3.tcl,v 1.2 2002/09/10 22:22:45 jeffd Exp $
  @author ported by Jerry Asher (jerry@theashergroup.com)
} {
  action
  product_id:integer,notnull
  link_product_id:integer,notnull
}

ad_require_permission [ad_conn package_id] admin

set product_name [ec_product_name $product_id]
set link_product_name [ec_product_name $link_product_id]

# we need them to be logged in
set user_id [ad_get_user_id]

set peeraddr [ns_conn peeraddr]

db_transaction {

  if { $action == "both" || $action == "to" } {
    # see if it's already in there
    if { 0 == [db_string both_or_to_duplicate_check "select count(*) from ec_product_links where product_a=:link_product_id and product_b=:product_id"] } {
      db_dml to_link_insert "insert into ec_product_links
      (product_a, product_b, last_modified, last_modifying_user, modified_ip_address)
      values
      (:link_product_id, :product_id, sysdate, :user_id, :peeraddr)
      "
    }
  }

  if { $action == "both" || $action == "from" } {
    if { 0 == [db_string both_or_from_duplicate_check "select count(*) from ec_product_links where product_a=:product_id and product_b=:link_product_id"] } {
      db_dml from_link_insert "insert into ec_product_links
      (product_a, product_b, last_modified, last_modifying_user, modified_ip_address)
      values
      (:product_id, :link_product_id, sysdate, :user_id, :peeraddr)
      "
    }
  }
}

ad_returnredirect "link.tcl?[export_url_vars product_id]"
