ad_page_contract {
    This page lists all the formats
    
    @author Jon Griffin (jon@jongriffin.com)
    @creation-date 2000-10-04
    @cvs-id $Id: reference-data-list.tcl,v 1.2.18.1 2015/09/10 08:21:32 gustafn Exp $
} {
} -properties {
    context_bar:onevalue
    package_id:onevalue
    user_id:onevalue
    data:multirow
}


set package_id [ad_conn package_id]
set title "List Reference Data"
set context_bar [list "$title"]
 
set user_id [ad_conn user_id]

db_multirow data data_select { 
}

ad_return_template
# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
