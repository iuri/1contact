ad_page_contract {
    It creates new mandats


    @authors: Iuri Sampaio & Luiz Valentim
    @creation_date: 2017-03-23
} {
    {mode ""}
    {customer_entitlement ""}
    {customer_name ""}
    {customer_surname ""}
    {customer_username ""}
    {customer_birthday ""}
    {customer_nationality ""}
    {customer_civilstate ""}
    {customer_children_qty ""}
    {customer_children_ages ""}
    {customer_animals ""}
    {customer_animals_type ""}
    {customer_animals_qty ""}
    {customer_mobilenumber ""}
    {customer_phonenumber ""}
    {customer_email ""}
    {customer_noexpirecontract ""}
    {customer_job ""}
    {customer_jobactivity ""}
    {customer_datestartjob ""}
    {customer_salary ""}
    {customer_salary_month ""}
    {customer_independentjob ""}
    {customer_jobother ""}
    {customer_otherincoming ""}
    {customer_address ""}
    {customer_houseproperty ""}
    {customer_houseproprietary ""}
    {customer_mortgage ""}

}

set page_title "Create Mandat [ad_conn instance_name]"
set context [list [list "." "Mandat"] "Create"]



ns_log Notice "Running create-mandat..."
ns_log Notice "$mode"

set mode "search"
if {[lindex $mode 0] eq "search"} {
    # search <type> <field>
    ns_log Notice "Searching for user ..."
    set user_type [lindex $mode 1]

    set user_attrib [lindex $mode 2]
    set attrib_value [lindex $mode 3]

    ns_log Notice "$attrib_value"
    switch ($user_attrib) {
	"email" {
	    set user_id [party::get_by_email -email [lindex $mode 3]]
	    set user_info [list \
			       [party::name -email isampaio@1contact.ch] \    
			  ]
	    
	    set user_info [db_list select_userinfo {
		SELECT userinfo_id,
		entitlement,
		birthday,
		nationality,
		civilstate,
		children_qty,
		children_ages,
		animal_p,
		animals_type,
		animals_qty,
		mobilenumber,
		phonenumber,
		email,
		noexpirecontract_p,
		job,
		jobactivity,
		datestartjob,
		salary,
		salary_month,
		independentjob_p,
		jobother,
		otherincoming,
		address,
		houseproperty,
		houseproprietary,
		mortgage,
		user_id
		FROM user_ext_info
		WHERE user_id = :user_id


	    }]
	    ns_log Notice "LIST" 
	    
	    ns_log Notice "$user_info" 
	   // util::json::array::create 

	    
	}
	mobilenumber {
	}
	phonenumber {
	    
	}
    }
}



if {[string equal $mode "save"]} {

    
    set myform [ns_getform]
    if {[string equal "" $myform]} {
	ns_log Notice "No Form was submited"
    } else {
	ns_log Notice "FORM"
	ns_set print $myform
	for {set i 0} {$i < [ns_set size $myform]} {incr i} {
	    set varname [ns_set key $myform $i]
	    set varvalue [ns_set value $myform $i]
	}
    }    

    
    
    set customer_id [1c_users::user::add \
			 -entitlement $customer_entitlement \
			 -first_names $customer_name \
			 -last_name $customer_surname \
			 -birthday $customer_birthday \
			 -nationality $customer_nationality \
			 -civilstate $customer_civilstate \
			 -children_qty $customer_children_qty \
			 -children_ages $customer_children_ages \
			 -animal_p $customer_animals \
			 -animals_type $customer_animals_type \
			 -animals_qty $customer_animals_qty \
			 -mobilenumber $customer_mobilenumber \
			 -phonenumber $customer_phonenumber \
			 -email $customer_email \
			 -noexpirecontract_p $customer_noexpirecontract \
			 -job $customer_job \
			 -jobactivity $customer_jobactivity \
			 -datestartjob $customer_datestartjob \
			 -salary $customer_salary \
			 -salary_month $customer_salary_month \
			 -independentjob $customer_independentjob \
			 -jobother $customer_jobother \
			 -otherincoming $customer_otherincoming \
			 -address $customer_address \
			 -houseproperty $customer_houseproperty \
			 -houseproprietary $customer_houseproprietary \
			 -mortgage $customer_mortgage] 
    
    
    if {$customer_id eq "data_error"} {
	ad_return_complaint 1 "<li>This email is already registered on the system. We cannot create a new user with this email."
	ad_script_abort
    }
    
    


}













