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
    
    
    # Pre-generate user_id for double-click protection
    set user_id [db_nextval acs_object_id_seq]
    
    array set creation_info [auth::create_user \
				 -user_id $user_id \
				 -email $email \
				 -first_names $first_names \
				 -last_name $last_name]
    
    
    ns_log Notice "ARRAY [parray creation_info]"

    # Handle registration problems
    if {$creation_info(creation_status) eq "data_error"} {
	return $creation_info(creation_status)
    }

	
    
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

