# /www/[ec_url_concat [ec_url] /admin]/restore-one-id.tcl
ad_page_contract { 

   Tries to restore from the audit table to the main table
   for one id in the id_column.

    @param id
    @param id_column
    @param audit_table_name
    @param main_table_name
    @param rowid

    @author Jesse 
    @creation-date 7/17
    @cvs-id $Id: restore-one-id.tcl,v 1.5 2008/08/25 12:08:39 torbenb Exp $
    @author ported by Jerry Asher (jerry@theashergroup.com)
} {
    id:integer,notnull
    id_column:notnull,sql_identifier
    audit_table_name:notnull,sql_identifier
    main_table_name:notnull,sql_identifier
    rowid:notnull
}

ad_require_permission [ad_conn package_id] admin

# we need them to be logged in
set user_id [ad_conn user_id]
if {$user_id == 0} {
    set return_url "[ad_conn url]?[export_entire_form_as_url_vars]"
    ad_returnredirect "/register?[export_url_vars return_url]"
    ad_script_abort
}

# we have to generate audit information
set audit_fields "last_modified, last_modifying_user, modified_ip_address"
set peeraddr [ns_conn peeraddr]
set audit_info "sysdate, :user_id, :peeraddr"

set sql_insert ""
set result "The $main_table_name table is not supported at this time."

# Get all values from the selected row of the audit table
db_1row get_audit_rows "select * from $audit_table_name where rowid = :rowid"

# ss_subcategory_features
if { [string compare $main_table_name "ss_subcategory_features"] == 0 } {
    set sql_insert "insert into $main_table_name (
feature_id,
subcategory_id,
feature_name,
recommended_p,
feature_description,
sort_key,
filter_p,
comparison_p,
feature_list_p,
$audit_fields
) values (
:feature_id,
:subcategory_id,
:feature_name,
:recommended_p,
:feature_description,
:sort_key,
:filter_p,
:comparison_p,
:feature_list_p,
$audit_info
)"

}

# ss_product_feature_map
if { [string compare $main_table_name "ss_product_feature_map"] == 0 } {
    set sql_insert ""
}

if { ![empty_string_p $sql_insert] } {
    if [catch { set result [db_dml restore_row $sql_insert] } errmsg] {
	set result $errmsg
    }
}

set title "Audit Restore of $id_column $id"
set context [list $title]
   
