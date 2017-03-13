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
	    {label "<h1 style='color:#4CB2EF;font-Family: Arial, Sans-Serif; font-weight: bold;'>[_ iurix-mail.Contact_us]</h1>"}
	    {value ""}
	}
	{name:text(text)
	    {label "<span style='color:#4CB2EF;font-Family: Arial, Sans-Serif; font-weight:normal;'> [_ iurix-mail.Name]</span>"}
	}
	{email:text(text)
	    {label "<span style='color:#4CB2EF;font-Family: Arial, Sans-Serif; font-weight:normal;'>[_ iurix-mail.Email]</span>"}
	}
	{phone:text(text),optional
	    {label "<span style='color:#4CB2EF;font-Family: Arial, Sans-Serif; font-weight:normal;'> [_ iurix-mail.Phone]</span>"}
	}    
	{subject:text(text)
	    {label "<span style='color:#4CB2EF;font-Family: Arial, Sans-Serif; font-weight:normal;'> [_ iurix-mail.Subject]</span>"}
	}
	{body:richtext(richtext)
	    {label "<span style='color:#4CB2EF;font-Family: Arial, Sans-Serif; font-weight:normal;'> [_ iurix-mail.Body]</span>"}
	    {html {cols 60 rows 30}}
	}
    } -on_submit {
	


	if {$email ne ""} {
	    set msg "$name <br> $email <br> $phone <br><br><br> $subject <br><br> $body"
	    
	    
	    acs_mail_lite::send -subject $subject -mime_type "text/html" -body $msg -to_addr "silvioregis@evex.com" \
		-from_addr "contact@iurix.com" \
		-send_immediately
	    
	    acs_mail_lite::send -subject "EvEx.co - Email Confirmation" \
		-mime_type "text/html" \
		-body "Hi $name,<br><br> Your contact has been registered on our database!<br> We will give you a feedback soon.<br><br> Best regards,<br>EvEx.co Team" \
		-to_addr "$email" \
		-from_addr "contact@evex.co" \
		-send_immediately
	    
	    
	    set msg "Your message has been sent. We will contact you soon. Thank You!"
	}
    } -after_submit {
	
#	ad_returnredirect [export_vars -base $return_url {}]
	ad_returnredirect [export_vars -base /]
	ad_script_abort
    }