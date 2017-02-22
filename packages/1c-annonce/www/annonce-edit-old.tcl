ad_page_contract {
    This is the view-edit page for Mandats.
    @author Iuri Sampaio (iuri@iurix.com)
    @cvs-id $Id: note-edit.tcl,v 1.2 2017/01/30 16:47:34 joela Exp $
    @param item_id If present, assume we are editing that note. Otherwise, we show the option to add a new note
} {
    file_id:naturalnum,optional,notnull
    annonce_id:naturalnum,optional,notnull
    
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


ad_form -has_submit 1 -name annonce -form {
    {annonce_id:key}
    {inform1:text(inform) {label "<h1>#1c-annonce.Add_Edit_Annonce#</h1>"}}
    {title:text(text) {label "#1c-annonce.Title#"}}
    {ref_code:text(text) {label "#1c-annonce.Reference_code#"}}
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
	{type_of_residence:text(checkbox),optional
	    {label "#1c-annonce.Type_of_residence#"}
	    {options {
		{"[_ 1c-annonce.Appartment]" "a"}
		{"[_ 1c-annonce.House]" "m"}
	    }}
	}
    }
} elseif {$type_of_property eq "c"} {
    ad_form -extend -name annonce -form {
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
    ad_form -extend -name annonce -form {
	{other_property:text(text),optional {label "#1c-annonce.Other_type#"}}	
    }
} elseif {$type_of_property ne ""} {
    ad_form -extend -name annonce -form {
	{type_of_residence:text(checkbox),multiple,optional
	    {label "#1c-annonce.Type_of_residence#"}
	    {options {
		{"[_ 1c-annonce.Appartment]" "1"}
		{"[_ 1c-annonce.House]" "2"}
	    }}
	}
	{type_of_commerce:text(checkbox),multiple,optional
	    {label "#1c-annonce.Type_of_commerce#"}
	    {options {
		{"[_ 1c-annonce.Store]" "1"}
		{"[_ 1c-annonce.Office]" "2"}
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


ad_form -extend -html { enctype multipart/form-data } -name annonce -form {
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
	{options {{"[_ 1c-annonce.Select]" ""} {"[_ 1c-annonce.Yes]" "t"} {"[_ 1c-annonce.No]" "f"}}}
    }
    {on_demand_p:boolean(checkbox),optional
	{label ""}
	{options {{"[_ 1c-annonce.On_demand]" "t"}}}
    }	
    {description:text(textarea) {label "Description"}
	{html {rows 4 cols 50}}
    }
    {upload_file:file,optional
	{label \#1c-annonce.Upload_a_file\#}
	{html "size 30"
	    {onclick "javascript:showUploadPopup();"}
	}
    }

}






if [catch {set binary [exec $unpack_binary]} errormsg] {
    set unpack_bin_installed 0
} else {
    set unpack_bin_installed 1
}

if { $unpack_bin_installed } { 
    ad_form -extend -name annonce -form {
	{unpack_p:boolean(checkbox),optional
	    {label \#1c-annonce.Multiple_files\#}
	    {html {onclick "javascript:UnpackChanged(this);"}} {options { {\#1c-annonce.lt_This_is_a_ZIP\# t} }} }
    }
}

ad_form -extend -name annonce -form {
    {status:text(select)
	{label "#1c-annonce.Status#"}
	{options { {"[_ 1c-annonce.Select]" ""} {"[_ 1c-annonce.Inactive]" "i"} {"[_ 1c-annonce.Active]" "a"} {"[_ 1c-annonce.Closed]" "c" }}}
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
    {delete_p:text(submit)
	{label "[_ 1c-annonce.Delete]"} {value "del"}
    }

    
} -new_request {
    

    
    set page_title "#1c-annonce.Add_Annonce#"
    set context [list $page_title]


    auth::require_login
    permission::require_permission -object_id [ad_conn package_id] -privilege create


} -edit_request {
    auth::require_login
    set page_title "#1c-annonce.Edit_Annonce#"
    set context [list $page_title]
    
    if {$annonce_id ne ""} {
	permission::require_write_permission -object_id $annonce_id

	
	db_1row select_annonce {
	    SELECT 
	    a.type_of_transaction,
	    a.type_of_property,
	    a.type_of_residence,
	    a.type_of_commerce,
	    a.other_property,
	    a.type_of_activity,
	    a.type_of_announcer,
	    cr.title,
	    a.ref_code,
	    a.available_date,
	    a.room_qty,
	    a.lavatory_qty,
	    a.bathroom_qty,
	    a.floor,
	    a.rent_price,
	    a.rent_taxes,
	    a.surface,
	    a.auto_commission_p,
	    a.on_demand_p,
	    cr.description,
	    a.status,
	    a.terms_conditions_p
	    FROM annonces a, cr_revisions cr, cr_items ci
	    WHERE a.annonce_id = cr.item_id
	    AND ci.latest_revision = cr.revision_id
	    AND cr.item_id = :annonce_id; 
	} 

	set available_date [calendar::from_sql_datetime -sql_date $available_date  -format "YYY-MM-DD"]
    }
    

    ns_log Notice "AUTO CPOMMISION: $auto_commission_p"
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

	ns_log Notice "$upload_file"
	
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
	set i 0
	set number_upload_files [llength $upload_files]
	foreach upload_file $upload_files tmpfile $upload_tmpfiles {
	    set this_file_id $file_id
	    set this_title $title
	    set mime_type [cr_filename_to_mime_type -create -- $upload_file]
	    
	    # upload a new file
	    # if the user choose upload from the folder view
	    # and the file with the same name already exists
	    # we create a new revision
	    if {$this_title eq ""} {
		set this_title $upload_file
	    }
	    
	    if {$name ne ""} {
		set upload_file $name
	    }
	    
	    set existing_item_id [fs::get_item_id -name $upload_file -folder_id $folder_id]
	    
	    if {$existing_item_id ne ""} {
		# file with the same name already exists in this folder
		if { [parameter::get -parameter "BehaveLikeFilesystemP" -package_id [ad_conn package_id]] } {
		    # create a new revision -- in effect, replace the existing file
		    set this_file_id $existing_item_id
		    permission::require_permission \
                    -object_id $this_file_id \
			-party_id $user_id \
			-privilege write
		} else {
		    # create a new file by altering the filename of the
                # uploaded new file (append "-1" to filename)
		    set extension [file extension $upload_file]
		    set root [string trimright $upload_file $extension]
		    append new_name $root "-$this_file_id" $extension
		    set upload_file $new_name
		}
	    }

	    # Next task is to create the source code within 1c-annoce pkg installation script to create the folder for annonces.
	    # Annoces e mandats should have a homedir under Root
	    # Create API to get folder_id for annonces 
	    set folder_id 1432
	    fs::add_file \
		-name $upload_file \
		-item_id $this_file_id \
		-parent_id $folder_id \
		-tmp_filename $tmpfile\
		-creation_user $user_id \
		-creation_ip [ad_conn peeraddr] \
		-title $this_title \
		-description $description \
		-package_id $package_id \
		-mime_type $mime_type
	    
	    
	    
	    
	    
	    
	    file delete $tmpfile
	    incr i
	    if {$i < $number_upload_files} {
		set file_id [db_nextval "acs_object_id_seq"]
	    }   
	}
	file delete $upload_file.tmpfile
    }
    
	



} -edit_data {

    db_transaction {
	

	content::revision::new \
	    -item_id $annonce_id \
	    -title $title \
	    -description $description
	
	set available_date "[template::util::date::get_property year $available_date] [template::util::date::get_property month $available_date] [template::util::date::get_property day $available_date]"
	#        set start_date [calendar::to_sql_datetime -date $date -time $start_time -time_p $time_p]
	
	
	1c_annonce::annonce::edit \
	    -item_id $annonce_id \
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
	    -terms_conditions_p $terms_conditions_p
	
	
	# The chunk bellow is to remind to implement the notification package soon
	#if {[string is false $suppress_notify_p]} {
	#    fs::do_notifications -folder_id $parent_id -filename $title -item_id $revision_id -action "new_version" -package_id $package_id }
	
	
	if { [parameter::get -parameter CategoriesP -package_id $package_id -default 0] } {
	   category::map_object -remove_old -object_id $file_id [category::ad_form::get_categories \
								      -container_object_id $package_id \
								      -element_name category_id]
	}	
	
    }
    
    
    
    
} -after_submit {
    ad_returnredirect "."
    ad_script_abort
}
