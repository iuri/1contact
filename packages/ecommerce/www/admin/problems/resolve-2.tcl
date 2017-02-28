#  www[ec_url_concat [ec_url] /admin]/problems/resolve-2.tcl
ad_page_contract {
  This page confirms that a problems in the problem log is resolved.

  @author Jesse (jkoontz@arsdigita.com)
  @creation-date July 21, 1999
  @cvs-id $Id: resolve-2.tcl,v 1.4 2005/03/01 00:01:34 jeffd Exp $
  @author ported by Jerry Asher (jerry@theashergroup.com)
} {
  problem_id:integer,notnull
}

ad_require_permission [ad_conn package_id] admin

# we need them to be logged in
set user_id [ad_conn user_id]

if {$user_id == 0} {
    
    set return_url "[ad_conn url]?[export_entire_form_as_url_vars]"

    ad_returnredirect "/register.tcl?[export_url_vars return_url]"
    ad_script_abort
}



db_dml unused "update ec_problems_log set resolved_by=:user_id, resolved_date=sysdate where problem_id = :problem_id"

ad_returnredirect index.tcl
