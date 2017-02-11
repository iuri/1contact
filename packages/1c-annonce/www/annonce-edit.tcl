ad_page_contract {
    This is the view-edit page for Mandats.
    @author Iuri Sampaio (iuri@iurix.com)
    @cvs-id $Id: note-edit.tcl,v 1.2 2017/01/30 16:47:34 joela Exp $
    @param item_id If present, assume we are editing that note. Otherwise, we show the option to add a new note
} {
    {return_url ""}
    {item_id ""}
    {type_of_transaction:multiple ""}
    {type_of_property:multiple ""}
    {other_property ""}
    {type_of_commerce ""}
    {type_of_activity ""}
    {type_of_residence ""}
    {type_of_announcer ""}
    {-available_date ""}
    {-title ""}
    {-ref_code ""}
    {-room_qty ""}
    {-lavatory_qty ""}
    {-bathroom_qty ""}
    {-floor ""}
    {-rent_price ""}
    {-rent_taxes ""}
    {-surface ""}
    {-auto_commission_p ""}
    {-on_demand_p ""}
    {-description ""}
    {-status ""}
    {-terms_conditions_p ""}
    {-creation_ip ""}
    {-creation_user ""}
    {-context_id ""}   
    file_id:naturalnum,optional,notnull
    upload_file:trim,optional
    return_url:localurl,optional
    upload_file.tmpfile:tmpfile,optional

} -properties {
    context:onevalue
    title:onevalue
} -validate {
    max_size -requires {upload_file} {
	set n_bytes [file size ${upload_file.tmpfile}]
	set max_bytes [parameter::get -parameter "MaximumFileSize"]
	if { $n_bytes > $max_bytes } {
	    ad_complain "Your file is larger than the maximum file size allowed on this system ([util_commify_number $max_bytes] bytes)"
	}
    }
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


permission::require_permission -party_id [ad_conn user_id] -object_id [ad_conn package_id] -privilege write


set user_id [ad_conn user_id]
set package_id [ad_conn package_id]
#set unpack_binary [string trim [parameter::get -parameter UnzipBinary]]
set unpack_binary unzip

set page_title [ad_conn instance_name]
set context [list]



template::head::add_css -href "/resources/1c-annonce/css/estilo.css"

template::head::add_javascript -src "https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" -order 0


ns_log Notice "$item_id"


ad_form -name annonce -form {
    {item_id:key}
    {inform1:text(inform) {label "<h1>#1c-annonce.Add_Edit_Annonce#</h1>"}}
    {title:text(text) {label "#1c-annonce.Title#"}}
    {ref_code:text(text) {label "1c-annonce.Reference_code#"}}
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
	    {label "#1c-annonce.Type_of_residence#"}
	    {options {
		{"[_ 1c-annonce.Appartment]" "a"}
		{"[_ 1c-annonce.House]" "m"}
	    }}
	}
    }
} elseif {$type_of_property eq "c"} {
    ad_form -extend -name annonce -form {
	{type_of_commerce:text(checkbox) {label "#1c-annonce.Type_of_commerce#"}
	    {options {
		{"[_ 1c-annonce.Arcade]" "a"}
		{"[_ 1c-annonce.Office]" "l"}
		{"[_ 1c-annonce.Depot]" "d"}
	    }}
	}	
	{type_of_activity:text(checkbox) {label "#1c-annonce.Type_of_Activity#"}
	    {options {
		{"[_ 1c-annonce.Groceries]" "groceries"}
		{"[_ 1c-annonce.Coiffeur]" "coiffeur"}
		{"[_ 1c-annonce.Bar]" "bar"}
		{"[_ 1c-annonce.Garage]" "garage"}
		{"[_ 1c-annonce.Epicerie]" "epicerie"}
		{"[_ 1c-annonce.Restaurant]" "restaurant"}
		{"[_ 1c-annonce.Remise_de_bail]" "remise"}
	    }}
	}	
    }
} elseif {$type_of_property eq "o"} {
    ad_form -extend -name annonce -form {
	{other_property:text(text),optional {label "#1c-annonce.Other_type#"}}	
    }
} elseif {$type_of_property ne ""} {
    ad_form -extend -name annonce -form {
	{type_of_residence:text(checkbox),multiple,optional
	    {label "#1c-annonce.Type_of_residence#"}
	    {options {
		{"[_ 1c-annonce.Appartment]" "1"}
		{"[_ 1c-annonce.Maison_Vila]" "2"}
	    }}
	}
	{type_of_commerce:text(checkbox),multiple
	    {label "#1c-annonce.Type_of_commerce#"}
	    {options {
		{"[_ 1c-annonce.Arcade]" "1"}
		{"[_ 1c-annonce.Locaux]" "2"}
		{"[_ 1c-annonce.Depot]" "3"}
	    }}
	}
    }
}




ad_form -extend -name annonce -form {
    {type_of_announcer:text(select) {label "#1c-annonce.Type_of_announcer#"}
	{options { {"[_ 1c-annonce.Select]" ""} {"[_ 1c-annonce.Tenant]" "i"} {"[_ 1c-annonce.Owner]" "o"} {"[_ 1c-annonce.Agent]" "a" }}}
    }    
    {available_date:date
	{label "[_ 1c-annonce.Availability]"}
	{format "DD MM YYYY"}
	{after_html {<input type="button" style="height:20px; width:20px; background: url('/resources/acs-templating/calendar.gif');" onclick ="return showCalendarWithDateWidget('available_date', 'dd-mm-yyyy');" > \[<b>[_ 1c-annonce.d-m-y]</b>\]}}
    }
}


ad_form -extend -name annonce -form {
    {room_qty:integer(select)
	{label "[_ 1c-annonce.Room_qty]"}	
	{options { {"[_ 1c-annonce.Select]" ""} {1 1} {2 2} {3 3} {4 4} {5 5} {6 6} {7 7} {8 8} {9 9}}}
    }
    {lavatory_qty:integer(select)
	{label "[_ 1c-annonce.Lavatory_qty]"}	
	{options { {"[_ 1c-annonce.Select]" ""} {1 1} {2 2} {3 3} {4 4} {5 5} {6 6} {7 7} {8 8} {9 9}}}
    }
    {bathroom_qty:integer(select)
	{label "[_ 1c-annonce.Bathroom_qty]"}	
	{options { {"[_ 1c-annonce.Select]" ""} {1 1} {2 2} {3 3} {4 4} {5 5} {6 6} {7 7} {8 8} {9 9}}}
    }
    {floor:integer(select)
	{label "#1c-annonce.Floor#"}
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
    {auto_commission_p:boolean(select) {label "#1c-annonce.Auto_Commision#"}
	{options {{"[_ 1c-annonce.Select]" ""} {"#1c-annonce.Yes#" "1"} {"#1c-annonce.No#" "0"}}}
    }
    {on_demand_p:boolean(checkbox)
	{label ""}
	{options {{"[_ 1c-annonce.On_demand]" "1"}}}
    }	
    {description:text(textarea) {label "Description"}
	{html {rows 4 cols 50}}
    }
}


ad_form -extend -html { enctype multipart/form-data } -name annonce -form {
    {upload_file:file,optional {label \#1c-annonce.Upload_a_file\#} {html "size 30"}}
}






if [catch {set binary [exec $unpack_binary]} errormsg] {
    set unpack_bin_installed 0
} else {
    set unpack_bin_installed 1
}

if { $unpack_bin_installed } { 
    ad_form -extend -name annonce -form {
	{unpack_p:boolean(checkbox),optional {label \#1c-annonce.Multiple_files\#} {html {onclick "javascript:UnpackChanged(this);"}} {options { {\#1c-annonce.lt_This_is_a_ZIP\# t} }} }
    }
}

ad_form -extend -name annonce -form {
    {status:text(select)
	{label "#1c-annonce.Status#"}
	{options { {"[_ 1c-annonce.Select]" ""} {"[_ 1c-annonce.Inactive]" "i"} {"[_ 1c-annonce.Active]" "a"} {"[_ 1c-annonce.Closed]" "c" }}}
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

    
    db_1row select_annonce {
	SELECT cr.title, a.status FROM annonces a, cr_revisions cr
	WHERE a.annonce_id = cr.item_id
	AND item_id = :item_id; 
    }

    
    

    set page_title "Edit a Mandat"
    set context [list $page_title]

} -new_data {



    set available_date "[template::util::date::get_property year $available_date] [template::util::date::get_property month $available_date] [template::util::date::get_property day $available_date]"
#        set start_date [calendar::to_sql_datetime -date $date -time $start_time -time_p $time_p]


    
    set annonce_id [1c_annonce::announce::add \
			-type_of_transaction $type_of_transaction \
			-type_of_property $type_of_property \
			-other_property $other_property \
			-type_of_commerce $type_of_commerce \
			-type_of_residence $type_of_residence \
			-type_of_activity $type_of_activity \
			-type_of_announcer $type_of_announcer \
			-title $title \
			-ref_code $ref_code \
			-available_date $available_date \
			-room_qty $room_qty \
			-lavatory_qty $lavatory_qty \
			-bathroom_qty $bathroom_qty \
			-floor $floor \
			-rent_price $rent_price \
			-rent_taxes $rent_taxes \
			-surface $surface \
			-auto_commission_p $auto_commission_p \
			-on_demand_p $on_demand_p \
			-description $description \
			-status $status \
			-terms_conditions_p $terms_conditions_p]
    
    if {$upload_file ne ""} { 
    
    
	if {(![info exists unpack_p] || $unpack_p eq "")} {
	    set unpack_p f
	}
	if { $unpack_p
	     && $unpack_binary ne ""
	     && [file extension [template::util::file::get_property filename $upload_file]] eq ".zip"
	 } {
	    
	    set path [ad_tmpnam]
	    file mkdir $path
	    
	    
	    catch { exec $unpack_binary -jd $path ${upload_file.tmpfile} } errmsg
	    
	    # More flexible parameter design could be:
	    # zip {unzip -jd {out_path} {in_file}} tar {tar xf {in_file} {out_path}} tgz {tar xzf {in_file} {out_path}} 
	    
	    set upload_files [list]
	    set upload_tmpfiles [list]
	    
	    foreach file [glob -nocomplain "$path/*"] {
		lappend upload_files [file tail $file]
		lappend upload_tmpfiles $file
	    }
	    
	} else {
	    set upload_files [list [template::util::file::get_property filename $upload_file]]
	    set upload_tmpfiles [list [template::util::file::get_property tmp_filename $upload_file]]
	}
	set mime_type ""
	# ns_log notice "file_add mime_type='${mime_type}'"	    
	
	set number_upload_files [llength $upload_files]
	foreach upload_file $upload_files tmpfile $upload_tmpfiles {
	    set mime_type [cr_filename_to_mime_type -create -- $upload_file]
	    
	    
	    # Add ad_proc to add file
	    
	    1c_announce::announce::add_file \
		-tmp_filename $tmpfile \
		-parent_id $annonce_id
	    
	    
	    
	    file delete $tmpfile
	    
	    
	}
	file delete $upload_file.tmpfile
    }
    
	



} -edit_data {
    1c_mandat::mandat::edit \
	-item_id $item_id \
	-title $title
} -after_submit {
    ad_returnredirect "."
    ad_script_abort
}
