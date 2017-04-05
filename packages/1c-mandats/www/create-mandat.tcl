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

    {guarantor_id ""}
    {guarantor_entitlement ""}
    {guarantor_name ""}
    {guarantor_surname ""}
    {guarantor_username ""}
    {guarantor_birthday ""}
    {guarantor_nationality ""}
    {guarantor_civilstate ""}
    {guarantor_children_qty ""}
    {guarantor_children_ages ""}
    {guarantor_animals ""}
    {guarantor_animals_type ""}
    {guarantor_animals_qty ""}
    {guarantor_mobilenumber ""}
    {guarantor_phonenumber ""}
    {guarantor_email ""}
    {guarantor_noexpirecontract ""}
    {guarantor_job ""}
    {guarantor_jobactivity ""}
    {guarantor_datestartjob ""}
    {guarantor_salary ""}
    {guarantor_salary_month ""}
    {guarantor_independentjob ""}
    {guarantor_jobother ""}
    {guarantor_otherincoming ""}
    {guarantor_address ""}
    {guarantor_houseproperty ""}
    {guarantor_houseproprietary ""}
    {guarantor_mortgage ""}

    {cotenant_id ""}
    {cotenant_entitlement ""}
    {cotenant_name ""}
    {cotenant_surname ""}
    {cotenant_username ""}
    {cotenant_birthday ""}
    {cotenant_nationality ""}
    {cotenant_civilstate ""}
    {cotenant_children_qty ""}
    {cotenant_children_ages ""}
    {cotenant_animals ""}
    {cotenant_animals_type ""}
    {cotenant_animals_qty ""}
    {cotenant_mobilenumber ""}
    {cotenant_phonenumber ""}
    {cotenant_email ""}
    {cotenant_noexpirecontract ""}
    {cotenant_job ""}
    {cotenant_jobactivity ""}
    {cotenant_datestartjob ""}
    {cotenant_salary ""}
    {cotenant_salary_month ""}
    {cotenant_independentjob ""}
    {cotenant_jobother ""}
    {cotenant_otherincoming ""}
    {cotenant_address ""}
    {cotenant_houseproperty ""}
    {cotenant_houseproprietary ""}
    {cotenant_mortgage ""}

    {type_of_transaction ""}
    {type_of_property ""}
    {subtype_of_property ""}
    {rooms_qty ""}
    {bathrooms_qty ""}
    {toilets_qty ""}
    {floors_qty ""}
    {surface ""}
    {budget ""}
    {budgetmin ""}
    {budgetmax ""}
    {unwanted_areas ""}
    {selected_regions ""}
    {charac_required ""}
    {charac_opt_gen ""}
    {charac_opt_arc ""}
    {charac_opt_vic ""}
    {extra_info ""}
    {status ""}
    {terms_p ""}
}

auth::require_login

set page_title "Create Mandat [ad_conn instance_name]"
set context [list [list "." "Mandat"] "Create"]

#ns_log Notice "Running create-mandat..."

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
    

    if {$terms_p ne ""} {

	if {$customer_email ne ""} {
	    set customer_birthday "[string trim $customer_birthday]"
	    set customer_birthday "[string map {. -} $customer_birthday]"
	    set customer_birthday "[template::util::date::get_property year $customer_birthday] [template::util::date::get_property month $customer_birthday] [template::util::date::get_property day $customer_birthday]"
	    

	    
	    set customer_datestartjob "[string trim $customer_datestartjob]"
	    set customer_datestartjob "[string map {. -} $customer_datestartjob]"
	    set customer_datestartjob "[template::util::date::get_property year $customer_datestartjob] [template::util::date::get_property month $customer_datestartjob] [template::util::date::get_property day $customer_datestartjob]"
	    
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
	}
	
	if {$guarantor_email ne ""} {
	    set guarantor_birthday  "[string trim $guarantor_birthday]"
	    set guarantor_birthday "[string map {. -} $guarantor_birthday]"
	    set guarantor_birthday "[template::util::date::get_property year $guarantor_birthday] [template::util::date::get_property month $guarantor_birthday] [template::util::date::get_property day $guarantor_birthday]"
	    
	    set guarantor_datestartjob "[string trim $guarantor_datestartjob]"
	    set guarantor_datestartjob "[string map {. -} $guarantor_datestartjob]"
	    set guarantor_datestartjob "[template::util::date::get_property year $guarantor_datestartjob] [template::util::date::get_property month $guarantor_datestartjob] [template::util::date::get_property day $guarantor_datestartjob]"
	    
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

	
	if {$cotenant_email ne "" } { 
	    set cotenant_datestartjob  "[string trim $cotenant_datestartjob]"
	    set cotenant_datestartjob "[string map {. -} $cotenant_datestartjob]"
	    set cotenant_datestartjob "[template::util::date::get_property year $cotenant_datestartjob] [template::util::date::get_property month $cotenant_datestartjob] [template::util::date::get_property day $cotenant_datestartjob]"


	    set cotenant_id [1c_users::user::add \
				  -entitlement $cotenant_entitlement \
				  -first_names $cotenant_name \
				  -last_name $cotenant_surname \
				  -birthday $cotenant_birthday \
				  -nationality $cotenant_nationality \
				  -civilstate $cotenant_civilstate \
				  -children_qty $cotenant_children_qty \
				  -children_ages $cotenant_children_ages \
				  -animal_p $cotenant_animals \
				  -animals_type $cotenant_animals_type \
				  -animals_qty $cotenant_animals_qty \
				  -mobilenumber $cotenant_mobilenumber \
				  -phonenumber $cotenant_phonenumber \
				  -email $cotenant_email \
				  -noexpirecontract_p $cotenant_noexpirecontract \
				  -job $cotenant_job \
				  -jobactivity $cotenant_jobactivity \
				  -datestartjob $cotenant_datestartjob \
				  -salary $cotenant_salary \
				  -salary_month $cotenant_salary_month \
				  -independentjob $cotenant_independentjob \
				  -jobother $cotenant_jobother \
				  -otherincoming $cotenant_otherincoming \
				  -address $cotenant_address \
				  -houseproperty $cotenant_houseproperty \
				  -houseproprietary $cotenant_houseproprietary \
				  -mortgage $cotenant_mortgage] 	    
	}
	


	if {[exists_and_not_null customer_id]} {
	# Actual Mandat Info

	    set mandat_id [1c_mandat::mandat::add \
			       -type_of_transaction  $type_of_transaction \
			       -type_of_property $type_of_property \
			       -subtype_of_property $subtype_of_property \
			       -rooms_qty $rooms_qty \
			       -bathrooms_qty $bathrooms_qty \
			       -toilets_qty $toilets_qty \
			       -floors_qty $floors_qty \
			       -surface $surface \
			       -budget_min $budgetmin \
			       -budget_max $budgetmax \
			       -selected_regions $selected_regions \
			       -unwanted_areas $unwanted_areas \
			       -charac_required $charac_required \
			       -charac_opt_gen $charac_opt_gen \
			       -charac_opt_arc $charac_opt_arc \
			       -charac_opt_vic $charac_opt_vic \
			       -extra_info $extra_info \
			       -status $status \
			       -customer_id $customer_id \
			       -guarantor_id $guarantor_id \
			       -cotenant_id $cotenant_id \
			      ]
	} else {
	    ns_log notice "AIGH! something bad happened! Customer info is required"
	    ad_return_complaint 1 "Mandat is not created!"
	    ad_script_abort
	}

	# Handle upload files
	if {[info exists mandat_id] && [info exists upload_file]} {
	    
	    # Create folder for annonce
	    db_transaction {
		# 1432 is the folder_id of Mandats
		set parent_id 5480
		set folder_name "mandat-${mandat_id}"
		if {$title eq ""} {
		    set title $folder_name
		}
		
		set folder_id [fs::new_folder \
				   -name $folder_name \
				   -pretty_name $title \
				   -parent_id $parent_id \
				   -creation_user [ad_conn user_id] \
				   -creation_ip [ad_conn peeraddr]]
		
	    } on_error {
		ns_log notice "AIGH! something bad happened! $errmsg"
		ad_return_complaint 1 [_ file-storage.lt_Either_there_is_alrea [list folder_name $folder_name directory_url "index?folder_id=$parent_id"]]
       		ad_script_abort
	    }
	    
	    
	    1c_core::utils::upload_file \
		-object_id $mandat_id \
		-folder_id $folder_id \
		-tmpfiles ${upload_file.tmpfile} \
		-filenames $upload_file \
		-filetypes ${upload_file.content-type}
	    
	}			       	
    }        
}

template::head::add_javascript -src "https://maps.googleapis.com/maps/api/js?key=AIzaSyDzF7IlGi2Ue-EI6E6bizGVZ69NhFU7yGI&libraries=places" -order 0
template::head::add_javascript -src "resources/js/create_mandat_form.js" -order 1
template::head::add_javascript -src "resources/js/load_users_data.js" -order 1
template::head::add_javascript -src "resources/js/autocompleteAddress.js" -order 1