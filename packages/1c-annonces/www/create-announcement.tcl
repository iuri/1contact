ad_page_contract {
} {
    {return_url "/"}
    {mode ""}
    {title ""}
    {available_date ""}
    {type_of_transaction ""}
    {type_of_property ""}
    {price ""}
    {taxes ""}
    {room_qty ""}
    {lavatory_qty ""}
    {bathroom_qty ""}
    {floors_qty ""}
    {inner_surface ""}
    {outer_surface ""}
    {address ""}
    {street_number ""}
    {route ""}
    {complement ""}
    {sublocality ""}
    {locality ""}
    {administrative_area_level_1 ""}
    {country ""}
    {postal_code ""} 
    {announcer ""}
    {description ""}
    {charac_required ""}
    {charac_opt_arc ""}
    {charac_opt_vic ""}
    {charac_opt_gen ""}
    {status ""}
    upload_file:trim,multiple,optional
    upload_file.content-type:trim,multiple,optional
    upload_file.tmpfile:tmpfile,multiple,optional
}


template::head::add_javascript -src "resources/js/create_annonce_form.js" -order 1

auth::require_login

set page_title "Create Annonce [ad_conn instance_name]"
set context [list [list "." "Annonces"] "Create"]

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
  
    set available_date  "[string trim $available_date]"
    set available_date "[string map {. -} $available_date]"
    set available_date "[template::util::date::get_property year $available_date] [template::util::date::get_property month $available_date] [template::util::date::get_property day $available_date]"

    if {$type_of_transaction ne ""} {
	set annonce_id [1c_annonces::annonce::add \
			    -title $title \
			    -type_of_transaction $type_of_transaction \
			    -type_of_property $type_of_property \
			    -price $price \
			    -taxes $taxes \
			    -available_date $available_date \
			    -room_qty $room_qty \
			    -lavatory_qty $lavatory_qty \
			    -bathroom_qty $bathroom_qty \
			    -floors_qty $floors_qty \
			    -inner_surface $inner_surface \
			    -outer_surface $outer_surface \
			    -address $address \
			    -street_number $street_number \
			    -route $route \
			    -complement $complement \
			    -neighborhood $sublocality \
			    -locality $locality \
			    -state $administrative_area_level_1 \
			    -country $country \
			    -postal_code $postal_code \
			    -type_of_announcer $announcer \
			    -description $description \
			    -charac_req $charac_required \
			    -charac_opt_gen $charac_opt_gen \
			    -charac_opt_arc $charac_opt_arc \
			    -charac_opt_vic $charac_opt_vic \
			    -status $status]	
    }

    ns_log Notice "$annonce_id"
    
    if {![info exists annonce_id]} {
	    ns_log notice "AIGH! something bad happened! $errmsg"
	    ad_return_complaint 1 [_ file-storage.lt_Either_there_is_alrea [list folder_name $folder_name directory_url "index?folder_id=$parent_id"]]	    
	    ad_script_abort
    }

    
    # Handle upload files
    if {[info exists annonce_id] && [info exists upload_file]} {
	# Create folder for annonce
	db_transaction {
	    set parent_id [1c_annonces::get_folder_id]
	    set folder_name "annonce-${annonce_id}"
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
	    -object_id $annonce_id \
	    -folder_id $folder_id \
	    -tmpfiles ${upload_file.tmpfile} \
	    -filenames $upload_file \
	    -filetypes ${upload_file.content-type}	
    }
       
    # Semd email to parties         
    set user_email [party::email -party_id [ad_conn user_id] ]
    set body "Bonjour, Un nouveau bien vient d'être créé sur"
    
    #    ns_log Notice "$body"
    acs_mail_lite::send -subject "1Contact Sàrl - Annonce Confirmation" \
	-mime_type "text/html" \
	-body $body \
	-to_addr $user_email \
	-from_addr "no-reply@1contact.ch" \
	-send_immediately  
    
    ad_returnredirect $return_url
    ad_script_abort
    
}
