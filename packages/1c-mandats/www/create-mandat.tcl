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

auth::require_login

set page_title "Create Mandat [ad_conn instance_name]"
set context [list [list "." "Mandat"] "Create"]

ns_log Notice "Running create-mandat..."

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
    



        set housemate_id [1c_users::user::add \
			 -entitlement $housemate_entitlement \
			 -first_names $housemate_name \
			 -last_name $housemate_surname \
			 -birthday $housemate_birthday \
			 -nationality $housemate_nationality \
			 -civilstate $housemate_civilstate \
			 -children_qty $housemate_children_qty \
			 -children_ages $housemate_children_ages \
			 -animal_p $housemate_animals \
			 -animals_type $housemate_animals_type \
			 -animals_qty $housemate_animals_qty \
			 -mobilenumber $housemate_mobilenumber \
			 -phonenumber $housemate_phonenumber \
			 -email $housemate_email \
			 -noexpirecontract_p $housemate_noexpirecontract \
			 -job $housemate_job \
			 -jobactivity $housemate_jobactivity \
			 -datestartjob $housemate_datestartjob \
			 -salary $housemate_salary \
			 -salary_month $housemate_salary_month \
			 -independentjob $housemate_independentjob \
			 -jobother $housemate_jobother \
			 -otherincoming $housemate_otherincoming \
			 -address $housemate_address \
			 -houseproperty $housemate_houseproperty \
			 -houseproprietary $housemate_houseproprietary \
			 -mortgage $housemate_mortgage] 



    set guarantor_id [1c_users::user::add \
			 -entitlement $guarantor_entitlement \
			 -first_names $guarantor_name \
			 -last_name $guarantor_surname \
			 -birthday $guarantor_birthday \
			 -nationality $guarantor_nationality \
			 -civilstate $guarantor_civilstate \
			 -children_qty $guarantor_children_qty \
			 -children_ages $guarantor_children_ages \
			 -animal_p $guarantor_animals \
			 -animals_type $guarantor_animals_type \
			 -animals_qty $guarantor_animals_qty \
			 -mobilenumber $guarantor_mobilenumber \
			 -phonenumber $guarantor_phonenumber \
			 -email $guarantor_email \
			 -noexpirecontract_p $guarantor_noexpirecontract \
			 -job $guarantor_job \
			 -jobactivity $guarantor_jobactivity \
			 -datestartjob $guarantor_datestartjob \
			 -salary $guarantor_salary \
			 -salary_month $guarantor_salary_month \
			 -independentjob $guarantor_independentjob \
			 -jobother $guarantor_jobother \
			 -otherincoming $guarantor_otherincoming \
			 -address $guarantor_address \
			 -houseproperty $guarantor_houseproperty \
			 -houseproprietary $guarantor_houseproprietary \
			 -mortgage $guarantor_mortgage] 













}





template::head::add_javascript -src "resources/js/create_mandat_form.js" -order 1
