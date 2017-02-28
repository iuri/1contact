# picklist-row-delete.tcl

ad_page_contract {
    @param table_name
    @param rowid

    @author
    @creation-date
    @cvs-id $Id: picklist-row-delete.tcl,v 1.2 2002/09/10 22:22:41 jeffd Exp $
    @author ported by Jerry Asher (jerry@theashergroup.com)
} {
    table_name
    rowid
}

ad_require_permission [ad_conn package_id] admin

db_dml telere_from_picklist_table "delete from $table_name where rowid=:rowid"
db_release_unused_handles

ad_returnredirect picklists.tcl