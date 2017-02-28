# canned-response-delete-2.tcl

ad_page_contract {
    @param response_id

    @author
    @creation-date
    @cvs-id $Id: canned-response-delete-2.tcl,v 1.2 2002/09/10 22:22:40 jeffd Exp $
    @author ported by Jerry Asher (jerry@theashergroup.com)
} {
    response_id
}

ad_require_permission [ad_conn package_id] admin

db_dml delete_a_canned_response "delete from ec_canned_responses where response_id = :response_id"
db_release_unused_handles

ad_returnredirect "canned-responses.tcl"