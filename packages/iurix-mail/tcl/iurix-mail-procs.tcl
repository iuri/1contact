ad_library {

    iurix-mail package API

    @author Iuri Sampaio (iuri.sampaio@iurix.com)
    @creation-date 2011-09-30
}


namespace eval iurix_mail {}
namespace eval iurix_mail::account {}



ad_proc -public iurix_mail::account::new {} {
    It adds an user's email account 

} {
    ns_log Notice "Running ad_proc iurix_mail::account::new"


    return account_id
}


ad_proc -public iurix_mail::get_emails {} {
    It retrieves emails from user's email account 

} {
    ns_log notice "Running ad_proc iurix_mail::get_emails"
    #SAVE temp file ithin /tmp
    set user_id [ad_conn user_id]
    set address "pop.secureserver.net"
    set proto "POP3"
    set user_email "contact@iurix.com"
    set user_pwd "!contact!"
    set filename "/tmp/fetchmailrc-$user_id"

    if {![file exists $filename]} {
	set f [open $filename w]
	puts $f "
	    set daemon 3600
	    set logfile /home/iurix/.fetchmail.log
	    set no bouncemail
	    poll $address proto $proto user $user_email password $user_pwd;
	    mda \"/usr/bin/procmail -d %T\"
	"
	close $f
    }


    # Change permission to 700 
    if {[catch {exec chmod 700 $filename} errmsg]} {
                ns_log notice "ERRO: $errmsg"
    } else {
                ns_log notice "Fetch ok"
    }


    #RUN fetchamil comoand with file as its argument -f 
    if {[catch {exec fetchmail -s -k -p $proto -f $filename} errmsg]} {
                ns_log notice "ERRO: $errmsg"
    } else {
                ns_log notice "Fetch ok"
    }


    #call load emails 

    return 0
}


ad_proc -public iurix_mail::get_package_id {} {

    Returns iurix-mail package_id

} {

    return [db_string select_package_id {
	SELECT package_id FROM apm_packages WHERE package_key = 'iurix-mail'
    }]
}


namespace eval iurix_mail::email {}

ad_proc -public iurix_mail::email::delete {
    {-mail_id}
} {
} {
    
    db_transaction {
	set item_id [content::revision::item_id -revision_id $mail_id]

	content::item::delete -item_id $item_id

	db_exec_plsql delete_email {
	    SELECT iurix_mails__delete ( :mail_id )
	}
	
    }

    return
}

ad_proc -public iurix_mail::new {
    {-user_id ""}
    {-largs}
    {-type "new"}
    {-subject ""}
    {-bodies ""}
    {-files ""}
    {-date ""}
    {-to ""}
    {-from ""}
    {-delivered_to ""}
    {-importance ""}
    {-dkim_signature ""}
    {-headers ""}
    {-message_id ""}
    {-received ""} 
    {-return_path ""}
    {-x_mailer ""}
    {-x_original_to ""}
    {-x_original_arrival_time ""}
    {-x_originating_ip ""}
    {-x_priority ""}
} {
    
    Create a new message
} {
    ns_log Notice "Running ad_proc iurixmail::new_"

    foreach arg $largs {
	ns_log Notice "ARG $arg"
	set [string map {- _} [string trimleft [lindex $arg 0] "-"]] "[lindex $arg 1]"	
	
    }

    ns_log Notice "RECEIVED $received"

    if {[string equal bodies "text/html"]} {
	set body [ad_html_to_text -- [lindex $bodies(1)]]
    } else {
	set body [lindex $bodies 1]
    }
#    set mail_id [db_nextval acs_object_id_seq]
    set package_id [iurix_mail::get_package_id]
  

    ns_log Notice "DATE $date"
#    set date [clock scan $date -base $t -gmt t]
#    set pos [expr [llength $date] - 1]
    
#    set date [string map {\{ "" \} ""} [lreplace $date $pos $pos ""]]
    set date [string map {\{ "" \} ""} $date]
#   set date [clock format [clock scan $date -gmt 1] -format "%D %H:%M:%S" -gmt t]
#    set date [clock format [clock scan $date] -format "%D %T"]

    ns_log Notice "DATE 2 $date"    
    set mail_exists_p [db_0or1row select_mail "
	SELECT item_id FROM cr_items WHERE name = 'mail: $message_id'
    "]

	ns_log Notice "AME $message_id"
	ns_log Notice "EXISTS MAIL P $mail_exists_p"
    if {! $mail_exists_p} {
	ns_log Notice "FROM: $from"
	if {$from == "announcements@forexpeacearmy.com"} {
	    
	    ns_log Notice "FPA EMAIL ARRIVED"
	   
	} 

	db_transaction {
	    set mail_item_id [content::item::new \
				  -name "mail: $message_id" \
				  -parent_id $package_id \
				  -content_type "mail_object" \
				  -package_id $package_id \
				  -creation_user $user_id \
				  -creation_ip "0.0.0.0" \
				  -title $subject \
				  -text $bodies]
	    
	    
	    if {[exists_and_not_null files]} {
		ns_log Notice "FILE ATTACHED $files"
		
		# Email's Attachments 
		foreach f $files {
		    set mime_type [lindex $f 0]
		    #set file_size [lindex $f 1]
		    set filename [lindex $f 2]
		    set fcontent [lindex $f 3]
		    
		    set tmp_file [ns_tmpnam]
		    
		    ns_log Notice "TMP-FILE $tmp_file"
		    
		    set fd [open $tmp_file w]
		    puts $fd $fcontent
		    close $fd
		    
		    set file_size [file size $tmp_file]

		    ns_log Notice "$filename"

		    set file_item_id [content::item::new \
					  -name "$filename" \
					  -title "$filenmame" \
					  -parent_id $mail_item_id \
					  -package_id $package_id \
					  -storage_type "file" \
					  -content_type "content_revision" \
					  -creation_user $user_id \
					  -creation_ip "0.0.0.0" \
					  -mime_type $mime_type \
				     ]

		    ns_log Notice "$file_item_id"

		    set file_revision_id [cr_import_content \
					      -item_id $file_item_id \
					      -storage_type file \
					      -description "attachment: $message_id" \
					      -creation_user $user_id \
					      -creation_ip "0.0.0.0" \
					      -package_id $package_id \
					      $mail_item_id \
					      $tmp_file \
					      $file_size \
					      $mime_type \
					      $filename]
		    
		    ns_log Notice "REVISION $file_revision_id"

		    item::publish -item_id $file_item_id -revision_id $file_revision_id
		}
	    }
	    


	    set mail_revision_id [content::item::get_latest_revision -item_id $mail_item_id]
	    ns_log Notice "TO ADDRESS: $to"
	    db_exec_plsql update_mail {
		SELECT iurix_mails__update (
					    :mail_revision_id,
					    :package_id,
					    :user_id,
					    :type,
					    :subject,
					    :bodies,
					    :date,
					    :to,
					    :from,
					    :delivered_to,
					    :importance,
					    :dkim_signature,
					    :headers,
					    :message_id,
					    :received,
					    :return_path,
					    :x_mailer,
					    :x_original_to,
					    :x_original_arrival_time,
					    :x_originating_ip,
					    :x_priority
					    );	    
	    }
	}	

	return $mail_revision_id
    }

    return 
}
    
    