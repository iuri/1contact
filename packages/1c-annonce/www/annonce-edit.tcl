ad_page_contract {
    This is the view-edit page for Mandats.
    @author Iuri Sampaio (iuri@iurix.com)
    @cvs-id $Id: note-edit.tcl,v 1.2 2017/01/30 16:47:34 joela Exp $
    @param item_id If present, assume we are editing that note. Otherwise, we show the option to add a new note
} {
    {return_url ""}
    item_id:integer,optional
    {type_of_transaction:multiple ""}
    {type_of_property:multiple ""}
    {type_of_commerce ""}
    {type_of_residence ""}
    
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



template::head::add_css -href "/resources/1c-annonce/css/estilo.css"

template::head::add_javascript -src "https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" -order 0





set package_id [ad_conn package_id]

ad_form -name annonce -form {
    {item_id:key}
    {inform1:text(inform) {label "<h1>#1c-annonce.Add_Edit_Annonce#</h1>"}}
    {type_of_transaction:text(checkbox) {label "#1c-annonce.Type_of_Transaction#"}
	{options { {"#1c-annonce.Purchase#" "p"} {"#1c-annonce.Rent#" "r" }}}
	{html {onchange "document.annonce.__refreshing_p.value='1';document.annonce.submit()"}}
    }
    {type_of_property:text(checkbox),multiple {label "#1c-annonce.Type_de_property#"}
	{options { {"#1c-annonce.Commerce#" "c"} {"#1c-annonce.Residence#" "r"} {"#1c-annonce.Other#" "o"} }}
	{html {onchange "document.annonce.__refreshing_p.value='1';document.annonce.submit()"}} 		
    }
    
}


if {$type_of_property eq "r"} {
    ad_form -extend -name annonce -form {
	{type_of_residence:text(checkbox)
	    {label "#1c-mandat.Type_of_residence#"}
	    {options {
		{"[_ 1c-mandat.Select]" ""}
		{"[_ 1c-mandat.Appartment]" "a"}
		{"[_ 1c-mandat.Maison_Vila]" "m"}
	    }}
	}
    }
} elseif {$type_of_property eq "c"} {
    ad_form -extend -name annonce -form {
	{type_of_commerce:text(checkbox) {label "#1c-annonce.Type_of_commerce#"}
	    {options {
		{"[_ 1c-mandat.Arcade]" "a"}
		{"[_ 1c-mandat.Bereaux]" "l"}
		{"[_ 1c-mandat.Depot]" "d"}
	    }}
	}	
	{type_of_activity:text(checkbox) {label "#1c-annonce.Type_of_Activity#"}
	    {options {
		{"[_ 1c-mandat.Groceries]" "groceries"}
		{"[_ 1c-mandat.Coiffeur]" "coiffeur"}
		{"[_ 1c-mandat.Bar]" "bar"}
		{"[_ 1c-mandat.Garage]" "garage"}
		{"[_ 1c-mandat.Epicerie]" "epicerie"}
		{"[_ 1c-mandat.Restaurant]" "restaurant"}
		{"[_ 1c-mandat.Remise_de_bail]" "remise"}
	    }}
	}	
    }
} elseif {$type_of_property eq "o"} {
    ad_form -extend -name annonce -form {
	{other_property:text(text) {label "#1c-mandat.Other_type#"}}	
    }
} elseif {$type_of_property ne ""} {
    ad_form -extend -name annonce -form {
	{type_of_residence:text(checkbox),multiple,optional
	    {label "#1c-mandat.Type_of_residence#"}
	    {options {
		{"[_ 1c-mandat.Appartment]" "1"}
		{"[_ 1c-mandat.Maison_Vila]" "2"}
	    }}
	}
       {type_of_commerce:text(checkbox),multiple
	   {label "#1c-mandat.Type_of_commerce#"}
	   {options {
	       {"[_ 1c-mandat.Arcade]" "1"}
	       {"[_ 1c-mandat.Locaux]" "2"}
	       {"[_ 1c-mandat.Depot]" "3"}
	   }}
       }
   }
}




ad_form -extend -name annonce -form {
    {type_of_person:text(select) {label "#1c-annonce.Type_of_person#"}
	{options { {"[_ 1c-annonce.Select]" ""} {"[_ 1c-annonce.Tenant]" "i"} {"[_ 1c-annonce.Owner]" "o"} {"[_ 1c-annonce.Agent]" "a" }}}
    }    
    {available_date:date
	{label "[_ 1c-annonce.Availability]"}
	{format "DD MM YYYY"}
	{after_html {<input type="button" style="height:20px; width:20px; background: url('/resources/acs-templating/calendar.gif');" onclick ="return showCalendarWithDateWidget('available_date', 'dd-mm-yyyy');" > \[<b>[_ 1c-annonce.d-m-y]</b>\]}}
    }
    {room_qty:integer(select)
	{label "[_ 1c-annonce.Room_qty]"}	
	{options { {"[_ 1c-annonce.Select]" ""} {1 1} {2 2} {3 3} {4 4} {5 5} {6 6} {7 7} {8 8} {9 9}}}
    }
    {lavatory_qty:integer(select)
	{label "[_ 1c-annonce.Room_qty]"}	
	{options { {"[_ 1c-annonce.Select]" ""} {1 1} {2 2} {3 3} {4 4} {5 5} {6 6} {7 7} {8 8} {9 9}}}
    }
    {bathroom_qty:integer(select)
	{label "[_ 1c-annonce.Room_qty]"}	
	{options { {"[_ 1c-annonce.Select]" ""} {1 1} {2 2} {3 3} {4 4} {5 5} {6 6} {7 7} {8 8} {9 9}}}
    }
    {floor:integer(select)
	{label "#1c-mandat.Floor#"}
	{options { {"[_ 1c-annonce.Select]" ""} {1 1} {2 2} {3 3} {4 4} {5 5} {6 6} {7 7} {8 8} {9 9}}}
    }
    {rent_price:text(text)
	{label "#1c-annonce.Rent_price#"}	
    }
    {rent_taxes:text(text)
	{label "#1c-annonce.Rent_taxes#"}	
    }
    {surface:text(text)
	{label "#1c-annonce.Surface#"}
	{help_text "m2"}
    }
    {auto_commission:boolean(select) {label "#1c-mandat.Auto_Commision#"}
	{options {{"[_ 1c-annonce.Select]" ""} {"#1c-annonce.Yes#" "1"} {"#1c-annonce.No#" "0"}}}
    }
    {description:text(textarea) {label "Description"}
	{html {rows 4 cols 50}}
    }    
    {status:text(select)
	{label "#1c-annonce.Status#"}
	{options { {"[_ 1c-mandat.Select]" ""} {"[_ 1c-mandat.Inactive]" "i"} {"[_ 1c-mandat.Active]" "a"} {"[_ 1c-mandat.Closed]" "c" }}}
    }

    {terms_conditions_p:boolean(checkbox) {label "Terms and Conditions"}
	{options {{"I accept the terms and references" "1"}}}
    }
    {return_url:text(hidden)
	{value $return_url}
    }
} -new_request {
    

    
    set page_title "Add a Annonce"
    set context [list $page_title]


    auth::require_login
    permission::require_permission -object_id [ad_conn package_id] -privilege create


} -edit_request {
   auth::require_login
   permission::require_write_permission -object_id $item_id

    1c_mandat::mandat::get \
	-item_id $item_id \
	-array note_array
    
    set title $note_array(title)

    set page_title "Edit a Mandat"
    set context [list $page_title]

} -new_data {



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
    -file_p $file_p \
    -remarks1 $remarks1 \
    -remarks2 $remarks2 \
    -confirmation $confirmation \
    -origin $origin \
    -origin_other $origin_other \
    -payment_p $payment_p \
    -status $status \
    -terms_conditions_p $terms_conditions_p \
    -creation_ip [ad_conn peeraddr] \
    -creation_user [ad_conn user_id] \
    -context_id [ad_conn package_id]
]

category::map_object -remove_old -object_id $mandat_id $category_ids
    
} -edit_data {
    1c_mandat::mandat::edit \
	-item_id $item_id \
	-title $title
} -after_submit {
    ad_returnredirect "."
    ad_script_abort
}
