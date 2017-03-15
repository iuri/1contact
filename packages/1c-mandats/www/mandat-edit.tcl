ad_page_contract {
    This is the view-edit page for Mandats.
    @author Iuri Sampaio (iuri@iurix.com)
    @cvs-id $Id: note-edit.tcl,v 1.2 2017/01/30 16:47:34 joela Exp $
    @param item_id If present, assume we are editing that note. Otherwise, we show the option to add a new note
} {
    {return_url ""}
    mandat_id:integer,optional
    {type_of_transaction:multiple ""}
    {type_of_property:multiple,optional ""}
    {type_of_residence:multiple,optional ""}
    {type_of_commerce:multiple,optional ""}    
}

set myform [ns_getform]
if {[string equal "" $myform]} {
    ns_log Notice "No Form was submited"
} else {
    ns_log Notice "FORM"
    ns_set print $myform
    for {set i 0} {$i < [ns_set size $myform]} {incr i} {
	set varname [ns_set key $myform $i]
	set varvalue [ns_set value $myform $i]

	ns_log Notice " $varname - $varvalue"
    }
}


set page_title [ad_conn instance_name]
set context [list]



template::head::add_css -href "/resources/1c-mandat/css/estilo.css"

template::head::add_javascript -src "https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" -order 0





set package_id [ad_conn package_id]

ad_form -name mandat -form {
    {mandat_id:key}
    {inform1:text(inform) {label "<h1>#1c-mandat.Add_Edit_Mandat#</h1>"}}
    {type_of_transaction:text(checkbox) {label "#1c-mandat.Type_of_Transaction#"}
	{options { {"#1c-mandat.Purchase#" "p"} {"#1c-mandat.Rent#" "r" }}}
	{html {onchange "javascript:showForm('transaction');"}}
    }
    {type_of_property:text(checkbox),multiple {label "#1c-mandat.Type_de_property#"}
	{options { {"#1c-mandat.Commerce#" "c"} {"#1c-mandat.Residence#" "r"} }}
	{html {onchange "document.mandat.__refreshing_p.value='1';document.mandat.submit()"}} 		
    }
}



if {$type_of_property eq "r"} {
    ad_form -extend -name mandat -form {
	{type_of_residence:text(checkbox),optional
	    {label "#1c-annonce.Type_of_residence#"}
	    {options {
		{"[_ 1c-annonce.Appartment]" "a"}
		{"[_ 1c-annonce.House]" "m"}
	    }}
	}
    }
} elseif {$type_of_property eq "c"} {
    ad_form -extend -name mandat -form {
 	{type_of_commerce:text(checkbox),optional {label "#1c-annonce.Type_of_commerce#"}
	    {options {
		{"[_ 1c-annonce.Store]" "s"}
		{"[_ 1c-annonce.Office]" "o"}
		{"[_ 1c-annonce.Depot]" "d"}
	    }}
	}	
	{type_of_activity:text(checkbox),optional {label "#1c-annonce.Type_of_Activity#"}
	    {options {
		{"[_ 1c-annonce.Chocolaterie]" "chocolaterie"}
		{"[_ 1c-annonce.Coiffeur]" "coiffeur"}
		{"[_ 1c-annonce.Bar]" "bar"}
		{"[_ 1c-annonce.Garage]" "garage"}
		{"[_ 1c-annonce.Grocery]" "grocery"}
		{"[_ 1c-annonce.Restaurant]" "restaurant"}
		{"[_ 1c-annonce.Theater]" "theater"}
	    }}
	}	
    }
} elseif {$type_of_property eq "o"} {
    ad_form -extend -name mandat -form {
	{other_property:text(text),optional {label "#1c-annonce.Other_type#"}}	
    }
} elseif {$type_of_property ne ""} {
    ad_form -extend -name annonce -form {
	{type_of_residence:text(checkbox),multiple,optional
	    {label "#1c-annonce.Type_of_residence#"}
	    {options {
		{"[_ 1c-annonce.Appartment]" "a"}
		{"[_ 1c-annonce.House]" "h"}
	    }}
	}
	{type_of_commerce:text(checkbox),multiple,optional
	    {label "#1c-annonce.Type_of_commerce#"}
	    {options {
		{"[_ 1c-annonce.Store]" "s"}
		{"[_ 1c-annonce.Office]" "o"}
		{"[_ 1c-annonce.Depot]" "d"}
	    }}
	}
	{type_of_activity:text(checkbox),optional {label "#1c-annonce.Type_of_Activity#"}
	    {options {
		{"[_ 1c-annonce.Chocolaterie]" "chocolaterie"}
		{"[_ 1c-annonce.Coiffeur]" "coiffeur"}
		{"[_ 1c-annonce.Bar]" "bar"}
		{"[_ 1c-annonce.Garage]" "garage"}
		{"[_ 1c-annonce.Grocery]" "grocery"}
		{"[_ 1c-annonce.Restaurant]" "restaurant"}
		{"[_ 1c-annonce.Theater]" "theater"}
	    }}
	}	
    }
}



ad_form -extend -name mandat -form {
    {code:text {label "#1c-mandat.Code#"}}    
    {room_qty:integer(select)
	{label "[_ 1c-mandat.Room_qty]"}	
	{options { {"[_ 1c-mandat.Select]" ""} {1 1} {2 2} {3 3} {4 4} {5 5} {6 6} {7 7} {8 8} {9 9}}}
    }
    {surface_min:text(text)
	{label "#1c-mandat.Surface_min#"}
	{help_text "m2"}
    }
    {budget_min:text(text) {label "#1c-mandat.Budget_min#"}}
    {budget_max:text(text) {label "#1c-mandat.Budget_max#"}}

}





foreach {category_id category_name} [1c_mandat::get_categories -package_id $package_id] {
    
    if {[string equal $category_name "Garage"] } {
	ad_form -extend -name mandat -form [list \
						[list "cat_$category_id:integer(radio)" \
						     [list label "${category_name}"] \
						     [list options [1c_mandat::category_get_options -parent_id $category_id]] \
						     [list value  ""]  \
						     [list html "onChange \"showorm($category_id);\""] \
						    ] \
					       ]
	
    } else { 
	
	
	
	
	ad_form -extend -name mandat -form [list \
						[list "cat_$category_id:integer(radio)" \
						     [list label "${category_name}"] \
						     [list options [1c_mandat::category_get_options -parent_id $category_id]] \
						     [list value  ""]  \
						     ]]
	
    }
    
    
}

ad_form -extend -name mandat -form {
    {other_chars:text(textarea) {label "[_ 1c-mandat.Other_chars]"}
	{html {rows 4 cols 50}}
    }
    {searching_motive:text(textarea) {label "[_ 1c-mandat.Searching_motive]"}
	{html {rows 4 cols 50}}
    }
    {remarks1:text(textarea) {label "Remarks 1"}
	{html {rows 4 cols 50}}
    }
    {remarks2:text(textarea) {label "Remarks 2"}
	{html {rows 4 cols 50}}
    }
    {confirmation:text(textarea) {label "#1c-mandat.Confirmartion#"}
	{html {rows 4 cols 50}}
    }
    {origin:text(select) {label "#1c-mandat.Origin#"}
	{options { 
	    {"[_ 1c-mandat.Select]" ""} {"[_ 1c-mandat.Agent]" "1"} {"[_ 1c-mandat.Internet]" "2"} {"[_ 1c-mandat.Mailbox]" "3"} {"[_ 1c-mandat.Recommendation]" "4"} {"[_ 1c-mandat.Other]" "5"} }}
    }
    {origin_other:text(text) {label "#1c-mandat.Origin_detail#"}}
    {payment_p:boolean(select) {label "#1c-mandat.Payment#"}
	{options {{"[_ 1c-mandat.Select]" ""} {"[_ 1c-mandat.Yes]" "t"} {"[_ 1c-mandat.No]" "f"}}}
    }
    {status:text(select) {label "Status"}
	{options { {"[_ 1c-mandat.Select]" ""} {"[_ 1c-mandat.Inactive]" "i"} {"[_ 1c-mandat.Active]" "a"} {"[_ 1c-mandat.Closed]" "c" }}}
    }
    {terms_conditions_p:boolean(checkbox) {label "Terms and Conditions"}
	{options {{"I accept the terms and references" "t"}}}
    }
    {return_url:text(hidden)
	{value $return_url}
    }
    {submit_p:text(submit)
	{label "[_ 1c-annonce.Save]"} {value "save"}
    }
    {cancel_p:text(submit)
	{label "[_ 1c-annonce.Cancel]"} {value "cancel"}
    }
    {delete_p:text(submit)
	{label "[_ 1c-annonce.Delete]"} {value "del"}
    }

} -new_request {


    
    set page_title "Add a Mandat"
    set context [list $page_title]


    auth::require_login
    permission::require_permission -object_id [ad_conn package_id] -privilege create


} -edit_request {
    auth::require_login
    permission::require_write_permission -object_id $mandat_id


    
    
    db_1row select_mandat {
	SELECT * FROM mandats m, cr_items ci 
	WHERE m.mandat_id = :mandat_id AND ci.item_id = m.mandat_id
    }
    
    foreach elem $lchars {
	set catid [lindex $elem 0]
	set subcatid [lindex $elem 1]
	set cat_${catid} $subcatid
    }	
    
    
    set page_title "Edit a Mandat"
    set context [list $page_title]

} -new_data {
    
    
    
    set lchars [list]

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
	    if {[string match {category_*} $varname]} {
		lappend $varname $varvalue 
	    }
	}
    }
    
    
    set mandat_id [1c_mandat::mandat::add \
		       -type_of_transaction $type_of_transaction \
		       -type_of_property $type_of_property \
		       -type_of_commerce $type_of_commerce \
		       -type_of_residence $type_of_residence \
		       -code $code \
		       -room_qty $room_qty \
		       -surface_min $surface_min \
		       -budget_min $budget_min \
		       -budget_max $budget_max \
		       -searching_motive $searching_motive \
		       -remarks1 $remarks1 \
		       -remarks2 $remarks2 \
		       -confirmation $confirmation \
		       -origin $origin \
		       -origin_other $origin_other \
		       -payment_p $payment_p \
		       -status $status \
		       -lchars $lchars \
		       -other_chars $other_chars \
		       -terms_conditions_p $terms_conditions_p \
		       -creation_ip [ad_conn peeraddr] \
		       -creation_user [ad_conn user_id] \
		       -context_id [ad_conn package_id]
		  ]
    
    
} -edit_data {

    set lchars [list]

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
	    if {[string match {category_*} $varname]} {
		lappend $varname $varvalue 
	    }
	}
    }
    
    1c_mandat::mandat::edit \
	-mandat_id $mandat_id \
	-type_of_transaction $type_of_transaction \
	-type_of_property $type_of_property \
	-type_of_commerce $type_of_commerce \
	-type_of_residence $type_of_residence \
	-mandat_id $mandat_id \
	-code $code \
	-room_qty $room_qty \
	-surface_min $surface_min \
	-budget_min $budget_min \
	-budget_max $budget_max \
	-searching_motive $searching_motive \
	-remarks1 $remarks1 \
	-remarks2 $remarks2 \
	-confirmation $confirmation \
	-origin $origin \
	-origin_other $origin_other \
	-payment_p $payment_p \
	-status $status \
	-lchars $lchars \
	-other_chars $other_chars \
	-terms_conditions_p $terms_conditions_p


} -after_submit {
    ad_returnredirect "."
    ad_script_abort
}
