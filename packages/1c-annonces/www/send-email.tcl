ad_page_contract {

    @author Iuri Sampaio (iuri@iurix.com)
    @creation-date 2011-12-24
} {
    {return_url ""}
    {email "iuri.sampaio@gmail.com"}
    {subject "Test Email"}
    {name "Iuri Sampaio"}
    {phone "11998896571"}
    
}



ns_log Notice "Running file send-mail"  


ns_log Notice "EMAIL: $email "
    



set msg "A new annonce registered!<br><br> $name <br> $email <br> $phone <br><br><br> $subject <br>"

ns_log Notice "$msg"
acs_mail_lite::send -subject $subject \
    -mime_type "text/html" \
    -body "$msg" \
    -to_addr "cmaia@1contact.ch, isampaio@1contact.ch" \
    -from_addr "isampaio@1contact.ch" \
    -send_immediately



