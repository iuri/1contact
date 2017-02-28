ad_page_contract {

    Page write an email to be sent right after conclusion
    @author Iuri Sampaio (iuri.sampaio@iurix.com)
    @creation-date 2011-11-19
    
} {
    {msg ""}
}


auth::require_login

ad_form -name send-email -form {
    {from_address:text(text) 
	{label "#iurix-mail.From#"}
	{html {size 70}}
	{mode display}
    }
    {to_address:text(text)
	{label "<a href='select_email'>#iurix-mail.To#</a>"}
	{html {size 70}}
    }
    {subject:text(text)
	{label "#iurix-mail.Subject#"}
	{html {size 70}}
    }
    {body:richtext(richtext)
	{label "#iurix-mail.Body#"}
	{html {cols 60 rows 30}}
    }
} -on_request {

    set from_address [party::email -party_id [ad_conn user_id]]

} -on_submit {
        
    ns_log Notice "Sent -subject $subject -mime_type [lindex $body 0] \n
	-body [lindex $body 1] -to_addr $to_address \n
	-from_addr $from_address \n"

    acs_mail_lite::send -subject $subject -mime_type "[lindex $body 0]" \
	-body "[lindex $body 1]" -to_addr $to_address \
	-from_addr $from_address -send_immediately

    set msg "Your message has been sent! <br> $to_address <br><br><br> $subject"
    ad_returnredirect [export_vars -base . {msg}]
  //  ad_script_abort
}