# /packages/1c-realties/tcl/1c-realties-procs.tcl
ad_library {
    Library to support the 1Contact procs

     @author Iuri Sampaio [iuri@iurix.com]
     @creation-date Mon Sep 12 17:35:01 2016
     @cvs-id $Id: 1c-realties-procs.tcl,v 0.1d 
}


namespace eval 1c_realties {}

namespace eval 1c_realties::realty {}



ad_proc -public 1c_realties::realty::delete {
    realty_id
} {
    Deletes realty
} {
    

    content::item::delete -item_id $realty_id
    db_transaction {
	db_exec_plsql delete_realty {
	    SELECT realty__delete(:realty_id);
	}
    }

    return 0
}


ad_proc -public 1c_realties::realty::add {
    {-type_of_property ""}
    {-room_qty ""}
    {-lavatory_qty ""}
    {-bathroom_qty ""}
    {-floors_qty ""}
    {-surface ""}
    {-charac_req ""}
    {-charac_opt_gen ""}
    {-charac_opt_arc ""}
    {-charac_opt_vic ""}
    {-creation_ip ""}
    {-creation_user ""}
    {-context_id ""}    
} {
    Adds Realty as a content item
    
} {



    if {$creation_ip == ""} {
	set creation_ip [ad_conn peeraddr]
    }
    
    if {$creation_user == ""} {
	set creation_user [ad_conn user_id]
    }
     
    if {$context_id == ""} {
	set context_id [ad_conn package_id]
    }


    set realty_id [db_nextval "acs_object_id_seq"]
    
    set code "${type_of_property}${room_qty}${realty_id}"

    set type_of_property [string trimright $type_of_property ","]
    set charac_required [string trimright $charac_required ","]
    set charac_opt_gen [string trimright $charac_opt_gen ","]
    set charac_opt_arc [string trimright $charac_opt_arc ","]
    set charac_opt_vic [string trimright $charac_opt_vic ","]


    ns_log Notice "
	$realty_id \n
	$code \n
	$type_of_property  \n
	$room_qty  \n
	$lavatory_qty  \n
	$bathroom_qty  \n		
	$floors_qty	  \n	
	$surface   \n
	$charac_req  \n
	$charac_opt_gen  \n
	$charac_opt_arc  \n
	$charac_opt_vic  \n
	$creation_ip  \n
	$creation_user  \n
	$context_id   \n
    "
    
    db_exec_plsql insert_realty {
	SELECT realty__new(
			   :realty_id,
			   :code,
			   :type_of_property,
			   :room_qty,
			   :lavatory_qty,
			   :bathroom_qty,		
			   :floors_qty,		
			   :surface,
			   :charac_req,
			   :charac_opt_gen,
			   :charac_opt_arc,
			   :charac_opt_vic,
			   :creation_ip,
			   :creation_user,
			   :context_id );
	
    }
   

    return $realty_id
    
}
