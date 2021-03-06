ad_page_contract {

    @author Iuri Sampaio (iuri@iurix.com)
    @creation-date 2011-12-24
} {
    {return_url ""}
    {email ""}
    {subject ""}
    {body ""}
    {name ""}
    {phone ""}
    
}



ns_log Notice "Running file send-mail"  


ns_log Notice "EMAIL: $email "
    


ns_log Notice "[regexp all @ $email]"

if {[regexp -all @ $email] > 0} {
    set msg "A new contact has been made!<br><br> $name <br> $email <br> $phone <br><br><br> $subject <br><br> $body<br>"
    
    ns_log Notice "$msg"
    acs_mail_lite::send -subject $subject \
	-mime_type "text/html" \
	-body "$msg" \
	-to_addr "contato@evex.co, iurisampaio@evex.co" \
	-from_addr "no-reply@evex.co" \
	-send_immediately
    
    
    
    set msg "$name <br> $email <br> $phone <br><br><br> $subject <br><br> $body"
    
    set fp [open "/var/www/evex/www/main/confirmation-email.html" r]
    set body_html [read $fp]
    
    #   set html_body "st <b>HTML</b>"
    
    ns_log Notice "$body_html"
    acs_mail_lite::send -subject "EvEx.co - Email Confirmation" \
	-mime_type "text/html" \
	-body "$body_html" \
	-to_addr "$email" \
	-from_addr "no-reply@evex.co" \
	-send_immediately
    
    
    set msg "Your message has been sent. We will contact you soon. Thank You!"
}

ad_returnredirect [export_vars -base /]


