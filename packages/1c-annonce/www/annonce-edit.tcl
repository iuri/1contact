ad_page_contract {
    This is the view-edit page for Mandats.
    @author Iuri Sampaio (iuri@iurix.com)
    @cvs-id $Id: note-edit.tcl,v 1.2 2017/01/30 16:47:34 joela Exp $
    @param item_id If present, assume we are editing that note. Otherwise, we show the option to add a new note
} {
    file_id:naturalnum,optional,notnull
    {folder_id 1432}
    fileupload:trim,optional
    fileupload.tmpfile:tmpfile,optional
    annonce_id:optional
    {type_of_property:multiple,optional ""}
    {other_property ""}
    {type_of_residence ""}
    {type_of_commerce ""}
    {type_of_activity ""}
    {category_1:multiple,optional ""}
    {category_2:multiple,optional ""}
    {category_3:multiple,optional ""}
    {category_4:multiple,optional ""}
    {category_5:multiple,optional ""}
    {category_6:multiple,optional ""}
    {category_7:multiple,optional ""}
    {category_8:multiple,optional ""}
    {category_9:multiple,optional ""}    
    {return_url ""}
} -properties {
    folder_id:onevalue
    context:onevalue
    title:onevalue
} -validate {
    file_id_or_folder_id {
	if {[info exists file_id] && ![info exists folder_id]} {
	    set folder_id [content::item::get_parent_folder -item_id $file_id]
	    if {$folder_id eq ""} {
		ad_complain "The specified file_id is not valid."
		return
	    }
	}
        if {![info exists folder_id] || ![fs_folder_p $folder_id]} {
	    ad_complain "The specified parent folder is not valid."
	}
    }
    max_size -requires {fileupload} {
	set n_bytes [file size ${fileupload.tmpfile}]
#	set max_bytes [parameter::get -parameter "MaximumFileSize"]
	set max_bytes 100000000
	if { $n_bytes > $max_bytes } {
	    ad_complain "Your file is larger than the maximum file size allowed on this system ([util_commify_number $max_bytes] bytes)"
	}
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


ad_form -html { enctype multipart/form-data } -has_submit 1  -name annonce -form {
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
    
}



# Implement a dynamic solution using tree_id. Ex. For each mapped tree run one only for statement and do not repeat the ad_form static elements
# Field Optional Characteristics
set i 1
foreach tree [category_tree::get_mapped_trees $package_id] {
    set tree_id [lindex $tree 0]
    set tree_name [lindex $tree 1]

    
    if {$tree_id eq 1067} {
	ad_form -extend -name annonce -form {
	    {inform2:text(inform) {label "<h2>#1c-annonce.Required_characteristics#</h2>"}}
	}
	
	
	foreach {category_id category_name} [1c_annonce::get_categories -package_id $package_id -tree_id $tree_id] {
	    
	    if {[string equal $category_name "Garage"] } {
		
		ad_form -extend -name annonce -form [list \
							 [list "cat_$category_id:integer(radio)" \
							      [list label "${category_name}"] \
							      [list options [1c_annonce::category_get_options -parent_id $category_id]] \
							      [list value  ""]  \
							      [list html "onChange \"showForm($category_id);\""] \
							     ] \
							]
	    } else { 
		
		ad_form -extend -name annonce -form [list \
							 [list "cat_$category_id:integer(radio)" \
							      [list label "${category_name}"] \
							      [list options [1c_annonce::category_get_options -parent_id $category_id]] \
							      [list value  ""]  \
							     ]]
	    }
	}
    } else {
	
	set category_options [list]
	foreach {category_id category_name} [1c_annonce::get_categories -package_id $package_id -tree_id $tree_id] {
	    lappend category_options  "\"$category_name\" $category_id"
	}
	
	ad_form -extend -name annonce -form {
	    {category_$i:integer(checkbox),optional
		{label "<h3>$tree_name</h3>"}
		{options $category_options}
	    }
	}
	incr i
    }    
}







ad_form -extend -name annonce -form {
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
    {fileupload:file,optional
	{label \#1c-annonce.Upload_a_file\#}
	{after_html "<div id=\"files\" class=\"files\"></div>"}
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
    {cancel_p:text(submit)
	{label "[_ 1c-annonce.Cancel]"} {value "cancel"}
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
    permission::require_write_permission -object_id $annonce_id

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
	    a.lchars,
	    a.category_1,
	    a.category_2,
	    a.category_3,
	    a.category_4,
	    a.category_5,
	    a.category_6,
	    a.category_7,
	    a.category_8,
	    a.category_9,
	    a.terms_conditions_p
	    FROM annonces a, cr_revisions cr, cr_items ci
	    WHERE a.annonce_id = cr.item_id
	    AND ci.latest_revision = cr.revision_id
	    AND cr.item_id = :annonce_id; 
	} 

	set available_date [calendar::from_sql_datetime -sql_date $available_date  -format "YYY-MM-DD"]

	foreach elem $lchars {
	    set catid [lindex $elem 0]
	    set subcatid [lindex $elem 1]
	    set cat_${catid} $subcatid
	}	


	ns_log Notice "$category_1"
	set category_1 [split $category_1]
	ns_log Notice "$category_1"
	
	
	
    }

} -new_data {
    
    
    set available_date "[template::util::date::get_property year $available_date] [template::util::date::get_property month $available_date] [template::util::date::get_property day $available_date]"
    #        set start_date [calendar::to_sql_datetime -date $date -time $start_time -time_p $time_p]
    
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
    

    
    
    set annonce_id [1c_annonce::annonce::add \
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
			-lchars $lchars \
			-terms_conditions_p $terms_conditions_p]
    

    1c_annonce::annonce::update_categories \
	-annonce_id $annonce_id \
	-category_1 $category_1 \
	-category_2 $category_2 \
	-category_3 $category_3 \
	-category_4 $category_4 \
	-category_5 $category_5 \
	-category_6 $category_6 \
	-category_7 $category_7 \
	-category_8 $category_8 \
	-category_9 $category_9 \
	
    if {$fileupload ne ""} {     
	
	ns_log Notice "$fileupload"
	
	if {(![info exists unpack_p] || $unpack_p eq "")} {
	    set unpack_p f
	}
	if { $unpack_p
	     && $unpack_binary ne ""
	     && [file extension [template::util::file::get_property filename $fileupload]] eq ".zip"
	 } {
	    
	    set path [ad_tmpnam]
	    file mkdir $path
	    
	    
	    catch { exec $unpack_binary -jd $path ${fileupload.tmpfile} } errmsg
	    
	    # More flexible parameter design could be:
	    # zip {unzip -jd {out_path} {in_file}} tar {tar xf {in_file} {out_path}} tgz {tar xzf {in_file} {out_path}} 
	    
	    set upload_files [list]
	    set upload_tmpfiles [list]
	    
	    foreach file [glob -nocomplain "$path/*"] {
		lappend upload_files [file tail $file]
		lappend upload_tmpfiles $file
	    }
	    
	} else {
	    set upload_files [list [template::util::file::get_property filename $fileupload]]
	    set upload_tmpfiles [list [template::util::file::get_property tmp_filename $fileupload]]
	}
	set mime_type ""
	if { [lindex $upload_files 0] eq ""} {
	    if {[parameter::get -parameter AllowTextEdit -default 0] && [template::util::richtext::get_property html_value $content_body] eq "" } {
		ad_return_complaint 1 "You have to upload a file or create a new one"
		ad_script_abort
	    }
	    # create a tmp file to import from user entered HTML
	    set content_body [template::util::richtext::get_property html_value $content_body]
	    set mime_type text/html
	    set tmp_filename [ad_tmpnam]
	    set fd [open $tmp_filename w] 
	    puts $fd $content_body
	    close $fd
	    set upload_files [list $title]
	    set upload_tmpfiles [list $tmp_filename]
	}	
	# ns_log notice "file_add mime_type='${mime_type}'"	    
	set i 0
	set number_upload_files [llength $upload_files]
	ns_log Notice "$number_upload_files"
	foreach upload_file $upload_files tmpfile $upload_tmpfiles {
	    set this_file_id $file_id
	    set this_title $title
	    set mime_type [cr_filename_to_mime_type -create -- $fileupload]
	    
	    # upload a new file
	    # if the user choose upload from the folder view
	    # and the file with the same name already exists
	    # we create a new revision
	    if {$this_title eq ""} {
		set this_title $fileupload
	    }
	    
	    if {$name ne ""} {
		set fileupload $name
	    }
	    
	    set existing_item_id [fs::get_item_id -name $fileupload -folder_id $folder_id]
	    
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
		    set extension [file extension $fileupload]
		    set root [string trimright $fileupload $extension]
		    append new_name $root "-$this_file_id" $extension
		    set fileupload $new_name
		}
	    }

	    
	    # Next task is to create the source code within 1c-annoce pkg installation script to create the folder for annonces.
	    # Annoces e mandats should have a homedir under Root
	    # Create API to get folder_id for annonces 
	    fs::add_file \
		-name $fileupload \
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
	
	file delete $fileupload.tmpfile
    }
    
    
    
    
    
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
		lappend $varname "\"$varvalue\"" 
	    }
	    
	}

    }
    
	    
    set available_date "[template::util::date::get_property year $available_date] [template::util::date::get_property month $available_date] [template::util::date::get_property day $available_date]"
    #        set start_date [calendar::to_sql_datetime -date $date -time $start_time -time_p $time_p]
	
    
    
    # Edits annonces
    1c_annonce::annonce::edit \
	-annonce_id $annonce_id \
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
	-lchars $lchars \
	-terms_conditions_p $terms_conditions_p
    
    

    1c_annonce::annonce::update_categories \
	-annonce_id $annonce_id \
	-category_1 $category_1 \
	-category_2 $category_2 \
	-category_3 $category_3 \
	-category_4 $category_4 \
	-category_5 $category_5 \
	-category_6 $category_6 \
	-category_7 $category_7 \
	-category_8 $category_8 \
	-category_9 $category_9 
    
    
    if {$upload_file ne ""} {     
	
	ns_log Notice "UPLOAD $upload_file"
	
	if {(![info exists unpack_p] || $unpack_p eq "")} {
	    set unpack_p f
	}


	ns_log Notice "INSIDE UPDALOD file"
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

	    ns_log Notice "ELSE"
	    set upload_files [list [template::util::file::get_property filename $upload_file]]
	    set upload_tmpfiles [list [template::util::file::get_property tmp_filename $upload_file]]
	}



	ns_log Notice "TEST $upload_files $upload_tmpfiles" 
	set mime_type ""
	if { [lindex $upload_files 0] eq ""} {
	    if {[parameter::get -parameter AllowTextEdit -default 0] && [template::util::richtext::get_property html_value $content_body] eq "" } {
		ad_return_complaint 1 "You have to upload a file or create a new one"
		ad_script_abort
	    }
	    # create a tmp file to import from user entered HTML
	    set content_body [template::util::richtext::get_property html_value $content_body]
	    set mime_type text/html
	    set tmp_filename [ad_tmpnam]
	    set fd [open $tmp_filename w] 
	    puts $fd $content_body
	    close $fd
	    set upload_files [list $title]
	    set upload_tmpfiles [list $tmp_filename]
	}
	# ns_log notice "file_add mime_type='${mime_type}'"	    
	set i 0
	set number_upload_files [llength $upload_files]
	foreach upload_file $upload_files tmpfile $upload_tmpfiles {
	    ns_log Notice "INSIDE FOR"
	    set file_id [db_nextval "acs_object_id_seq"]
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
	    set folder_id 1432
	    
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


	    
	    ns_log Notice "FILE $tmpfile"
	    fs::add_file \
		-name $upload_file \
		-item_id $this_file_id \
		-parent_id $folder_id \
		-tmp_filename $tmpfile\
		-creation_user $user_id \
		-creation_ip [ad_conn peeraddr] \
		-title $this_title \
		-description $description \
		-package_id [1c_annonce::get_fs_package_id] \
		-mime_type $mime_type
	    
	    
	    
	    
	    
	    
	    file delete $tmpfile
	    incr i
	}
	file delete $upload_file.tmpfile
    }
    
    
    # The chunk bellow is to remind to implement the notification package soon
    #if {[string is false $suppress_notify_p]} {
    #    fs::do_notifications -folder_id $parent_id -filename $title -item_id $revision_id -action "new_version" -package_id $package_id }
    
    
    





} -after_submit {
    ad_returnredirect "."
    ad_script_abort
}




# Bootstrap styles
 template::head::add_css -href "http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"

# Generic page styles
 template::head::add_css -href "/resources/css/style.css"

# CSS to style the file input field as button and adjust the Bootstrap progress bars 
 template::head::add_css -href "/resources/1c-annonce/css/jquery.fileupload.css"


#template::head::add_javascrip
template::head::add_javascript -src "http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" -order 0

# The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
template::head::add_javascript -src "/resources/1c-annonce/js/jquery.ui.widget.js" -order 1

# The Load Image plugin is included for the preview images and image resizing functionality -->
template::head::add_javascript -src "http://blueimp.github.io/JavaScript-Load-Image/js/load-image.all.min.js" -order 2

# The Canvas to Blob plugin is included for image resizing functionality -->
template::head::add_javascript -src "http://blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js" -order 3

# Bootstrap JS is not required, but included for the responsive demo navigation -->
template::head::add_javascript -src "http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js" -order 4

# The Iframe Transport is required for browsers without support for XHR file uploads -->
template::head::add_javascript -src "/resources/1c-annonce/js/jquery.iframe-transport.js" -order 5

# The basic File Upload plugin 
template::head::add_javascript -src "/resources/1c-annonce/js/jquery.fileupload.js" -order 6

# The File Upload processing plugin
template::head::add_javascript -src "/resources/1c-annonce/js/jquery.fileupload-process.js" -order 7

# The File Upload image preview & resize plugin
template::head::add_javascript -src "/resources/1c-annonce/js/jquery.fileupload-image.js" -order 8

# The File Upload audio preview plugin
template::head::add_javascript -src "/resources/1c-annonce/js/jquery.fileupload-audio.js" -order 9

# The File Upload video preview plugin
template::head::add_javascript -src "/resources/1c-annonce/js/jquery.fileupload-video.js" -order 10

# The File Upload validation plugin
template::head::add_javascript -src "/resources/1c-annonce/js/jquery.fileupload-validate.js" -order 11


#
template::head::add_javascript -src "/resources/1c-annonce/js/file-upload.js" -order 12




template::head::add_css -href "https://fonts.googleapis.com/css?family=Roboto:300,400,500"
template::head::add_javascript -src "http://maps.googleapis.com/maps/api/js?key=AIzaSyCXIA8FKkhrZO2Iyn-gNvoPZMqqN09ZlwI&amp;sensor=false" -order 0  


template::head::add_javascript -script {
    // This example displays an address form, using the autocomplete feature
    // of the Google Places API to help users fill in the information.
    
    var placeSearch, autocomplete;
    var componentForm = {
	street_number: 'short_name',
	route: 'long_name',
	locality: 'long_name',
	administrative_area_level_1: 'short_name',
	country: 'long_name',
	postal_code: 'short_name'
    };
    
    function initAutocomplete() {
	// Create the autocomplete object, restricting the search to geographical
	// location types.
	autocomplete = new google.maps.places.Autocomplete(
							   /** @type {!HTMLInputElement} */(document.getElementById('autocomplete')),
							   {types: ['geocode']});
	
	// When the user selects an address from the dropdown, populate the address
	// fields in the form.
	autocomplete.addListener('place_changed', fillInAddress);
    }
    
    // [START region_fillform]
    function fillInAddress() {
	// Get the place details from the autocomplete object.
	var place = autocomplete.getPlace();
	
	for (var component in componentForm) {
					      document.getElementById(component).value = '';
					      document.getElementById(component).disabled = false;
					  }
	
	// Get each component of the address from the place details
	// and fill the corresponding field on the form.
	for (var i = 0; i < place.address_components.length; i++) {
								   var addressType = place.address_components[i].types[0];
								   if (componentForm[addressType]) {
								       var val = place.address_components[i][componentForm[addressType]];
								       document.getElementById(addressType).value = val;
								   }
							       }
    }
    // [END region_fillform]
    
    // [START region_geolocation]
    // Bias the autocomplete object to the user's geographical location,
    // as supplied by the browser's 'navigator.geolocation' object.
    
    function geolocate() {
	if (navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(function(position) {
		var geolocation = {
		    lat: position.coords.latitude,
		    lng: position.coords.longitude
		};
		var circle = new google.maps.Circle({
		    center: geolocation,
		    radius: position.coords.accuracy
		});
		autocomplete.setBounds(circle.getBounds());
	    });
	}
    }
    // [END region_geolocation]
}   
