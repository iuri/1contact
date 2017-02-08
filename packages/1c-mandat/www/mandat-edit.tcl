ad_page_contract {
    This is the view-edit page for Mandats.
    @author Iuri Sampaio (iuri@iurix.com)
    @cvs-id $Id: note-edit.tcl,v 1.2 2017/01/30 16:47:34 joela Exp $
    @param item_id If present, assume we are editing that note. Otherwise, we show the option to add a new note
} {
    {return_url ""}
    item_id:integer,optional
    {type_of_transaction ""}
    {type_of_property:multiple,optional ""}
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



template::head::add_css -href "/resources/1c-mandat/css/estilo.css"

template::head::add_javascript -src "https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" -order 0





set package_id [ad_conn package_id]

ad_form -name mandat -form {
    {item_id:key}
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
    ad_form -extend -name mandat -form {
	{type_of_commerce:text(checkbox) {label "#1c-mandat.Type_of_commerce#"}
	    {options {
		{"[_ 1c-mandat.Arcade]" "a"}
		{"[_ 1c-mandat.Locaux]" "l"}
		{"[_ 1c-mandat.Depot]" "d"}
	    }}
	}	
    }
} elseif {$type_of_property ne ""} {
   ad_form -extend -name mandat -form {
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


ad_form -extend -name mandat -form {
    {code:text {label "#1c-mandat.Code#"}}    
    {room_qty:text(text) {label "#1c-mandat.Room_qty#"}}
    {surface_min:text(text)
	{label "#1c-mandat.Surface_min#"}
	{help_text "m2"}
    }
    {budget_min:text(text) {label "#1c-mandat.Budget_min#"}}
    {budget_max:text(text) {label "#1c-mandat.Budget_max#"}}
    {category_ids:integer(category),multiple,optional {label "#1c-mandat.Property_Characteristics#"}
	{html {size 4}} {value {$package_id $package_id}}}

}




ad_form -extend -name mandat -form {
    {other_chars:text(textarea) {label "#1c-mandat.Other_chars#"}
	{html {rows 4 cols 50}}
    }
    {search_motive:text(textarea) {label "#1c-mandat.Search_reason"}
	{html {rows 4 cols 50}}
    }
    {file_p:boolean(select) {label "#1c-mandat.Upload_file#"}
	{options {{"[_ 1c-mandat.Select]" ""} {"#1c-mandat.Yes#" "1"} {"#1c-mandat.No#" "0"}}}
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
n<y	{options {{"[_ 1c-mandat.Select]" ""} {"[_ 1c-mandat.Yes]" "1"} {"[_ 1c-mandat.No]" "0"}}}
    }
    {status:text(select) {label "Status"}
	{options { {"[_ 1c-mandat.Select]" ""} {"[_ 1c-mandat.Inactive]" "i"} {"[_ 1c-mandat.Active]" "a"} {"[_ 1c-mandat.Closed]" "c" }}}
    }
    {terms_conditions_p:boolean(checkbox) {label "Terms and Conditions"}
	{options {{"I accept the terms and references" "1"}}}
    }
    {return_url:text(hidden)
	{value $return_url}
    }
} -new_request {


    
    set page_title "Add a Mandat"
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
