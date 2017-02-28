ad_page_contract {
    @author Iuri Sampaio (iuri.sampaio@iurix.com)
    @creation-date 2011-04-28
} {
    {return_url ""}
}

ad_form -name send-email \
    -cancel_url $return_url \
    -form {
	{info:text(inform)
	    {label "<h1>[_ iurix-mail.Contact_us]</h1>"}
	    {value "<center><h2>[_ iurix-mail.Contact_info]</h2></center>"}
	}
	{name:text(text)
	    {label "[_ iurix-mail.Name]"}
	}
	{email:text(text)
	    {label "[_ iurix-mail.Email]"}
	}
	{phone:text(text),optional
	    {label "[_ iurix-mail.Phone]"}
	}    
	{subject:text(text)
	    {label "[_ iurix-mail.Subject]"}
	}
	{body:richtext(richtext)
	    {label "[_ iurix-mail.Body]"}
	    {html {cols 60 rows 30}}
	}
    } -on_submit {
	


	if {$email ne ""} {
	    set msg "$name <br> $email <br> $phone <br><br><br> $subject <br><br> $body"
	    
	    
	    acs_mail_lite::send -subject $subject -mime_type "text/html" \
		-body $msg -to_addr "iuri.sampaio@iurix.com" \
		-from_addr "contact@iurix.com" -send_immediately
	    
	    acs_mail_lite::send -subject "IURIX.COM - Email Confirmation" \
		-mime_type "text/html" \
		-body "$name,<br> Your contact has been registered on our database!<br> We will give you a feedback soon.<br> Best regards,<br>#contact_info#" \
		-to_addr "$email" \
		-from_addr "contact@iurix.com" -send_immediately
	    
	    
	    set msg "Your message has been sent. We will contact you soon. Thank You!"
	}
    } -after_submit {
	
	ad_returnredirect [export_vars -base $return_url {}]
	ad_script_abort
    }