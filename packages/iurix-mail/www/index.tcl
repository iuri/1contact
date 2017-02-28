
ad_page_contract {
    
    @author Iuri Sampaio (iuri.sampaio@iurix.com)
} {
    {page ""}
    {orderby "date,asc"}
 
}
auth::require_login

set user_id [ad_conn user_id]

set action [list]
set bulk_actions [list]

set return_url [ad_return_url]

lappend actions "#iurix-mail.Compose_mail#" compose-mail "#iurix-mail.Compose_mail#"

lappend actions "#iurix-mail.Refresh_inbox#" index "#iurix-mail.Refresh_inbox#"

lappend bulk_actions "#iurix-mail.Delete_emails#" "email-bulk-delete" "#iurix-mail.Delete_emails#"

lappend bulk_actions "#iurix-mail.Send_to_Finance#"  "send-finance" "#iurix-mail.Send_to_Finance#"

template::list::create \
    -name emails \
    -multirow emails \
    -key mail_id \
    -actions $actions \
    -bulk_actions $bulk_actions \
    -bulk_action_export_vars {return_url} \
    -page_flush_p t \
    -page_size 30 \
    -page_query_name emails_pagination \
    -elements {
	attachment_img {
	    label ""
	    display_template {
		<if @emails.mail_attachment_p@>
		  <img src="/resources/iurix-mail/images/attachment-icon.png" border="0" width="15px">
		</if>
	    }
	}
	from_address {
	    label "[_ iurix-mail.From]"
	}
	subject {
	    label "[_ iurix-mail.Subject]"
	    display_template {
		<a href="@emails.mail_url@">@emails.subject;noquote@</a>
	    }
	}
	date {
	    label "[_ iurix-mail.Date]"
	}
    } -orderby {
	date {
	    label "[_ iurix-mail.Date]"
	    orderby "lower(im.date)"
	}
	subject {
	    label "[_ iurix-mail.Subject]"
	    orderby "lower(im.subject)"
	}
	from_address {
	    label "[_ iurix-mail.From]"
	    orderby "lower(im.from_address)"
	}
    }


db_multirow -extend {mail_url mail_attachment_p} emails select_emails {} {

    set mail_url [export_vars -base mail-one {return_url mail_id}]
    set subject [lindex $subject 0] 

    set mail_attachment_p [db_list select_items {
	SELECT item_id FROM cr_items WHERE parent_id = :mail_item_id
    } ]

}



#if $refresh { iurix_mail::get_emails }





