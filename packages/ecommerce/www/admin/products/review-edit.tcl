#  www/[ec_url_concat [ec_url] /admin]/products/review-edit.tcl
ad_page_contract {
  Edit a review.

  @author Eve Andersson (eveander@arsdigita.com)
  @creation-date Summer 1999
  @cvs-id $Id: review-edit.tcl,v 1.3 2008/04/21 14:18:29 marka Exp $
  @author ported by Jerry Asher (jerry@theashergroup.com)

  @author Mark Aufflick (mark@aufflick.com) removed unused page_validation block
  @revision-date 22 April 2008

} {
  product_id:integer,notnull
  publication
  author_name
  review_date:array,date
  display_p
  review:html
  review_id:integer,notnull
}

ad_require_permission [ad_conn package_id] admin

# TODO: validate review_date field

# we need them to be logged in
set user_id [ad_get_user_id]

set peeraddr [ns_conn peeraddr]

db_dml product_review_update "
update ec_product_reviews
set product_id=:product_id,
    publication=:publication,
    author_name=:author_name,
    review_date=[ec_datetime_sql review_date],
    review=:review,
    display_p=:display_p,
    last_modified=sysdate,
    last_modifying_user=:user_id,
    modified_ip_address=:peeraddr
where review_id=:review_id
"

ad_returnredirect "review.tcl?[export_url_vars review_id]"
