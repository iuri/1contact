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
    {surface ""}
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

auth::require_login

set page_title "Create Annonce [ad_conn instance_name]"
set context [list [list "." "Annonces"] "Create"]


template::head::add_javascript -src "resources/js/create_annonce_form.js" -order 1

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
       
    
    set available_date1 "[string trim $available_date]"
    set available_date2 "[string map {. -} $available_date1]"
    set available_date3 "[template::util::date::get_property year $available_date2] [template::util::date::get_property month $available_date2] [template::util::date::get_property day $available_date2]"

    
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
			-surface $surface \
			-type_of_announcer $announcer \
			-description $description \
			-charac_req $charac_required \
			-charac_opt_gen $charac_opt_gen \
			-charac_opt_arc $charac_opt_arc \
			-charac_opt_vic $charac_opt_vic \
			-status $status]
    




    
    if {[lindex $upload_file 0] ne ""} {	



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

	    ns_log Notice "BEFORE $upload_tmpfiles"
	    set upload_files [list [template::util::file::get_property filename $upload_file]]
	    set upload_tmpfiles [list [template::util::file::get_property tmp_filename $upload_file]]
	    ns_log Notice "AFTER $upload_tmpfiles"





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
	    
	    if { [parameter::get -parameter CategoriesP -package_id $package_id -default 0] } {
		category::map_object -remove_old -object_id $this_file_id [category::ad_form::get_categories \
									       -container_object_id $package_id \
									       -element_name category_id]
	    }
	    
	    file delete $tmpfile
	    incr i
	    if {$i < $number_upload_files} {
		set file_id [db_nextval "acs_object_id_seq"]
	    }
	}
	file delete $upload_file.tmpfile
	
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
