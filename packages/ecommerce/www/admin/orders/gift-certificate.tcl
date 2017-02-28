# /www/[ec_url_concat [ec_url] /admin]/orders/gift-certificate.tcl
ad_page_contract {

  Gift certificate page.

  @author Eve Andersson (eveander@arsdigita.com)
  @creation-date Summer 1999
  @cvs-id $Id: gift-certificate.tcl,v 1.5 2008/08/18 10:45:37 torbenb Exp $
  @author ported by Jerry Asher (jerry@theashergroup.com)
} {
  gift_certificate_id:integer,notnull
}

ad_require_permission [ad_conn package_id] admin

set title "One Gift Certificate"
set context [list [list index "Orders / Shipments / Refunds"] $title]

set found_p [db_0or1row gift_certificate_select "
select c.*, i.first_names || ' ' || i.last_name as issuer, i.user_id as issuer_user_id, p.first_names || ' ' || p.last_name as purchaser, p.user_id as purchaser_user_id, gift_certificate_amount_left(c.gift_certificate_id) as amount_left, decode(sign(sysdate-expires),1,'t',0,'t','f') as expired_p, v.first_names as voided_by_first_names, v.last_name as voided_by_last_name, o.first_names || ' ' || o.last_name as owned_by
from ec_gift_certificates c, cc_users i, cc_users p, cc_users v, cc_users o
where c.issued_by=i.user_id(+)
and c.purchased_by=p.user_id(+)
and c.voided_by=v.user_id(+)
and c.user_id=o.user_id(+)
and c.gift_certificate_id=:gift_certificate_id
"]

if { $found_p } {
set doc_body ""
    if { ![empty_string_p $issuer_user_id] } {
        append doc_body "<tr><td>Issued By</td><td><a href=\"[ec_acs_admin_url]users/one?user_id=$issuer_user_id\">$issuer</a> on [util_AnsiDatetoPrettyDate $issue_date]</td></tr>
    <tr><td>Issued To</td><td><a href=\"[ec_acs_admin_url]users/one?user_id=$user_id\">$owned_by</a></td><tr>"
    } else {
        append doc_body "<tr><td>Purchased By</td><td><a href=\"[ec_acs_admin_url]users/one?user_id=$purchaser_user_id\">$purchaser</a> on [util_AnsiDatetoPrettyDate $issue_date]</td></tr>
    <tr><td>Sent To</td><td>$recipient_email</td></tr>"

        if { ![empty_string_p $user_id] } {
            append doc_body "<tr><td>Claimed By</td><td><a href=\"[ec_acs_admin_url]users/one?user_id=$user_id\">$owned_by</a> on [util_AnsiDatetoPrettyDate $claimed_date]</td></tr>"
        }

    }
    append doc_body "<tr><td>[ec_decode $expired_p "t" "Expired" "Expires"]</td><td>[ec_decode $expires "" "never" [util_AnsiDatetoPrettyDate $expires]]</td></tr>"

    if { $gift_certificate_state == "void" } {
        append doc_body "<tr><td>Voided</td><td>[util_AnsiDatetoPrettyDate $voided_date] by <a href=\"[ec_acs_admin_url]users/one?user_id=$voided_by\">$voided_by_first_names $voided_by_last_name</a> because: $reason_for_void</td></tr>"
    }

    if { $expired_p == "f" && $amount_left > 0 && $gift_certificate_state != "void"} {
        append doc_body "<tr><td colspan=2>(<a href=\"gift-certificate-void?[export_url_vars gift_certificate_id]\">void this</a>)</td></tr>"
    }
}

