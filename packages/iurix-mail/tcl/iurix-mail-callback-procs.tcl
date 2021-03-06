# packages/iurix-mail/tcl/iurix-mail-callback-procs.tcl
ad_library {

    Callback implementations fir iurix-mail package

    @author Iuri Sampaio (iuri.sampaio@iurix.com)
    @creation-date 2011-09-27
}




namespace eval iurix_mail {}

ad_proc -public -callback acs_mail_lite::incoming_email -impl iurix-mail {
    {-array:required}
    {-package_id ""}
} {
    
    Read emails

    @author Iuri Sampaio (iuri.sampaio@iurix.com)
    @creation_date 2011-09-30
} {
    

    ns_log Notice "Running ad_proc iurix_mail::incoming_email"
    

    upvar $array email

    #ns_log Notice "[parray email]"
    
 
    set user_id [party::get_by_email -email $email(from)]
    set package_id [iurix_mail::get_package_id]

    ns_log Notice "USER ID: $user_id"

    ns_log Notice "$email(to)"

    if {[string equal $user_id ""]} {
	ns_log Error "#### Error: user_id is empty!"
	#spam control
	return ""
    } elseif {![permission::permission_p -party_id $user_id -object_id $package_id -privilege create -no_login]} {
	#no rights
	ns_log Error "#### Error: User has no permission!"
	return ""
    }
    
    foreach element [array names email] {
	ns_log Notice "ELEM $element $email($element)"
	lappend largs "-$element [list $email($element)]"
    }
    
    iurix_mail::new -user_id $user_id -largs $largs 
}