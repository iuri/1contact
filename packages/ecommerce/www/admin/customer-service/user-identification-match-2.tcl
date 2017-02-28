# user-identification-match-2.tcl

ad_page_contract {
    @param user_identification_id
    @param d_user_id

    @author
    @creation-date
    @cvs-id $Id: user-identification-match-2.tcl,v 1.3 2005/02/24 13:33:14 jeffd Exp $
    @author ported by Jerry Asher (jerry@theashergroup.com)
} {
    user_identification_id
    d_user_id
}

ad_require_permission [ad_conn package_id] admin

db_dml update_user_id_set_new_uid "update ec_user_identification set user_id=:d_user_id where user_identification_id=:user_identification_id"
db_release_unused_handles

# complete the workflow loop, get ready for next interaction
ad_returnredirect "index"
