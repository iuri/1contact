# /packages/1c-realties/tcl/1c-annonce-procs.tcl
ad_library {
    Library to support the 1Contact procs
    
    @author Iuri Sampaio [iuri@iurix.com]
    @creation-date Mon Sep 12 17:35:01 2016
    @cvs-id $Id: 1c-realties-procs.tcl,v 0.1d 
} 
    
    
    
    
    
namespace eval 1c_users {}

namespace eval 1c_users::user {}

    

ad_proc -public 1c_users::user::add {
    {-entitlement ""}
    {-first_names ""}
    {-last_name ""}
    {-username ""}
    {-birthday ""}
    {-nationality ""}
    {-civilstate ""}
    {-children_qty 0}
    {-children_ages ""}
    {-animal_p false}
    {-animals_type ""}
    {-animals_qty ""}
    {-mobilenumber ""}
    {-phonenumber ""}
    {-email ""}
    {-noexpirecontract_p false}
    {-job ""}
    {-jobactivity ""}
    {-datestartjob ""}
    {-salary ""}
    {-salary_month ""}
    {-independentjob_p false}
    {-jobother ""}
    {-otherincoming ""}
    {-address ""}
    {-houseproperty ""}
    {-houseproprietary ""}
    {-mortgage ""}
} {
    It adds a user on OpenACS and extra personal information.
} {
    ns_log Notice "Running ad_proc 1c_users::user::add " 
        
    array set creation_info [auth::create_user \
				 -email $email \
				 -first_names $first_names \
				 -last_name $last_name]
    
    
    # Handle registration problems
    switch $creation_info(creation_status) {
        ok {
            # Continue below
	    set user_id [party::get_by_email -email $email]
        }
        default {
	    if {[lindex $creation_info(element_messages) 0] eq "email" } {
		set user_id [party::get_by_email -email $email]
	    }
        }
       
    }
    
    if {[info exists user_id]} {
	ns_log Notice "Creating userinfo"
	set userinfo_id [db_nextval "user_info_id_seq"]
	
	db_transaction {
	    
	    db_exec_plsql insert_user {
		SELECT userinfo__new(
				     :userinfo_id,
				     :entitlement,
				     :birthday,
				     :nationality,
				     :civilstate,
				     :children_qty,
				     :children_ages,
				     :animal_p,
				     :animals_type,
				     :animals_qty,
				     :mobilenumber,
				     :phonenumber,
				     :email,
				     :job,
				     :noexpirecontract_p,
				     :jobactivity,
				     :datestartjob,
				     :salary,
				     :salary_month,
				     :independentjob_p,
				     :jobother,
				     :otherincoming,
				     :address,
				     :houseproperty,
				     :houseproprietary,
				     :mortgage,
				     :user_id
				     );
		
	    }
	    
	}
	
    }
    
    return $user_id
}


ad_proc -public 1c_users::user::delete {
    user_id
} {
    Deletes annonces
} {
    

    content::item::delete -item_id $user_id
    db_transaction {
	db_exec_plsql delete_user {
	    SELECT user__delete(:user_id);
	}
    }

    return 0
}

