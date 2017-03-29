# /packages/1c-core/tcl/1c-core-procs.tcl
ad_library {
    Library to support the 1Contact API

     @author Iuri Sampaio [iuri@iurix.com]
     @creation-date Mon Sep 12 17:35:01 2016
     @cvs-id $Id: ix-ndc-procs.tcl,v 0.1d 
}


namespace eval 1c_core::utils {}


ad_proc -public 1c_core::utils::upload_file {
    -object_id
    -folder_id
    -tmpfiles
    -filenames
    -filetypes
} {

    @author Iuri Sampaio
} {
    ns_log Notice "Running 1c_core::utils::upload_file"
#    ns_log Notice "$annonce_id \n $tmpfiles \n $filenames \n $filetypes"
    
    
    if {$tmpfiles ne ""} {



	foreach tmpfile $tmpfiles filename $filenames filetype $filetypes {
	    if {[file exists $tmpfile]} {						
		#ns_log Notice "FILE $tmpfile \n $filename \n $filetype"
		set file_id [db_nextval "acs_object_id_seq"]
		set this_file_id $file_id
		set mime_type [cr_filename_to_mime_type -create -- $filename]
		# upload a new file
		# if the user choose upload from the folder view
		# and the file with the same name already exists
		# we create a new revision
		
		set existing_item_id [fs::get_item_id -name $filename -folder_id $folder_id]
		
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
			set extension [file extension $filename]
			set root [string trimright $filename $extension]
			append new_name $root "-$this_file_id" $extension
			set filename $new_name
		    }
		}
		
		# ns_log Notice "$upload_file \ $this_file_id \n $tmpfile \n"	
		fs::add_file \
		    -name $filename \
		    -item_id $this_file_id \
		    -parent_id $folder_id \
		    -tmp_filename $tmpfile \
		    -creation_user [ad_conn user_id] \
		    -creation_ip [ad_conn peeraddr] \
		    -title  "${filename}-${object_id}-${this_file_id}" \
		    -description "${filename}-${object_id}-${this_file_id}"   \
		    -package_id 950 \
		    -mime_type $mime_type		
		
		file delete $tmpfile
	    }
	    
	}
    
	file delete $tmpfiles


	
    }
    
    return 0	
}

