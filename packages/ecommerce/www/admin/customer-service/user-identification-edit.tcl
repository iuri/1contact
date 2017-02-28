# user-identification-edit.tcl

ad_page_contract { 
    @param user_identification_id
    @param first_names
    @param last_name
    @param email
    @param postal_code
    @param other_id_info

    @author
    @creation-date
    @cvs-id $Id: user-identification-edit.tcl,v 1.2 2002/09/10 22:22:41 jeffd Exp $
    @author ported by Jerry Asher (jerry@theashergroup.com)
} {
    user_identification_id
    first_names
    last_name
    email
    postal_code
    other_id_info
}

ad_require_permission [ad_conn package_id] admin

db_dml unused "update ec_user_identification
set first_names=:first_names,
last_name=:last_name,
email=:email,
postal_code=:postal_code,
other_id_info=:other_id_info
where user_identification_id=:user_identification_id"
db_release_unused_handles

ad_returnredirect "user-identification.tcl?[export_url_vars user_identification_id]"

