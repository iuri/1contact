ad_page_contract {

} {
    {mode ""}
    
} 

auth::require_login


set userinfo [list]

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
    

if {[lindex $mode 0] eq "search"} {
    ns_log Notice "Searching for user ...[lindex $mode 3]"

    set user_type [lindex $mode 1]
    set user_attrib [lindex $mode 2]
    set attrib_value [lindex $mode 3]

    switch $user_attrib {
	email {
	    set user_id [party::get_by_email -email [lindex $mode 3]]
	    set fullname [party::name -email [lindex $mode 3]]
	    
	    set name [lindex $fullname 0] 
	    set surname [lindex $fullname 1] 
	    set email [lindex $mode 3]
	    
	}
	phonenumber {
	}
	mobilenumber {
	}
    }
    
    
    db_1row select_userinfo {
	SELECT
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
	job,
	noexpirecontract_p,
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
	mortgage
	FROM user_ext_info
	WHERE user_id = :user_id
	


    }

    
    set userinfo [list "
	\"name\": \"$name\",
	\"surname\": \"$surname\",
	\"email\": \"$email\",	    
	\"entitlement\": \"$entitlement\",
	\"birthday\": \"$birthday\",
	\"nationality\": \"$nationality\",	    
	\"civilstate\": \"$civilstate\",
	\"children_qty\": \"$children_qty\",
	\"children_ages\": \"$children_ages\",
	\"animal_p\": \"$animal_p\",
	\"animals_type\": \"$animals_type\",
	\"animals_qty\": \"$animals_qty\",
	\"mobilenumber\": \"$mobilenumber\",
	\"phonenumber\": \"$phonenumber\",
	\"email\": \"$email\",
	\"job\": \"$job\",
	\"noexpirecontract_p\": \"$noexpirecontract_p\",
	\"jobactivity\": \"$jobactivity\",
	\"datestartjob\": \"$datestartjob\",
	\"salary\": \"$salary\",
	\"salary_month\": \"$salary_month\",
	\"independentjob_p\": \"$independentjob_p\",
	\"jobother\": \"$jobother\",
	\"otherincoming\": \"$otherincoming\",
	\"address\": \"$address\",
	\"houseproperty\": \"$houseproperty\",
	\"houseproprietary\": \"$houseproprietary\",
	\"mortgage\": \"$mortgage\"
    "]
    

}
