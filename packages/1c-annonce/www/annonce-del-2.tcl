ad_page_contract {

    Deletes Annonces

    @author Iuri Sampaio (iuri@iurix.com)
    @cvs-id $Id:
} {
    annonce_id:naturalnum,multiple
}


set user_id [auth::require_login]
permission::require_permission -object_id [ad_conn package_id] -privilege category_tree_write

db_transaction {
    foreach annonce_id [db_list order_annonces_for_delete "
        SELECT annonce_id FROM annonces WHERE annonce_id IN ([join :annonce_id ,]) ORDER BY ref_code DESC

    "] {
        
        ns_log Notice "BEFORE ad_proc"
        1c_annonce::annonce::delete $annonce_id
    }
} on_error {
    ad_return_complaint 1 {{Error deleting annonce. An annonce probably still contains dependencies. If you really want to delete those annonces, please remove the dependencies them first. Thank you.}}
    return
}

ad_returnredirect [export_vars -no_empty -base /annonces/ ]

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
