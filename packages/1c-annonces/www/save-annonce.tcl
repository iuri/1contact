ad_page_contract {
} {
    {return_url "/"}
    {available_date ""}
}


ns_log Notice "Running script SAVE ANNONCE"



template::head::add_javascript -src "resources/js/create_annonce_form.js" -order 1

set myform [ns_getform]
if {[string equal "" $myform]} {
    ns_log Notice "No Form was submited"
} else {
    ns_log Notice "FORM"
    ns_set print $myform
    for {set i 0} {$i < [ns_set size $myform]} {incr i} {
	set varname [ns_set key $myform $i]
	set varvalue [ns_set value $myform $i]
	if {[string match {cat_*} $varname]} {
	    set varname [lindex [split $varname "_"] 1]  
	    lappend lchars "$varname $varvalue"
	}
    }
}





    set available_date "[template::util::date::get_property year $available_date] [template::util::date::get_property month $available_date] [template::util::date::get_property day $available_date]"


    set annonce_id [1c_annonce::annonce::add \
			-title $title \
			-type_of_transaction $business \
			-type_of_property $type \
			-rent_price $price \
			-rent_taxes $taxes \
			-available_date $available_date \
			-room_qty $room_qty \
			-lavatory_qty $lavatory_qty \
			-bathroom_qty $bathroom_qty \
			-floor_qty $floors_qty \
			-surface $surface \
			-type_of_announcer $announcer \
		    	-description $description \
			-charac_req $charac_required \
			-charac_opt_gen $charac_opt_gen \
			-charac_opt_arc $charac_opt_arc \
		        -charac_opt_vic $charac_opt_vic \
			-status $status]





# SAved form


ad_returnredirect $return_url
ad_script_abort
