ad_page_contract {

    Add/Edit email acccount
} {
    {return_url ""}
    {account_id ""}
}

if {[exists_and_not_null account_id]} {
    set title "[_ iurix-mail.Edit_account]"
    set context [list $title]
} else {
    set title "[_ iurix-mail.Add_account]"
    set context [list $title]
}


ad_form -name account_ae -form {
    {account_id:key}
    {proto:text(select)
	{label "[_ iurix-mail.Protocol]"}
	{options { {"POP3" "POP3"} {"IMAP" "IMAP"}}}
    }
    {address:text(text)
	{label "[_ iurix-mail.Address]"}
	{html {size 50} }
    }
    {user:text(text)
	{label "[_ iurix-mail.User]"}
	{html {size 30} }
    }
    {pwd:text(password)
	{label "[_ iurix-mail.Password]"}
	{html {size 30} }
    }
} -on_submit {


} -new_data {
    set acccount_id [iurix_mail::account::new \
                         -proto $proto \
			 -address $address \
			 -user $user \
			 -pwd $pwd \
			 -creation_ip [ad_conn peeraddr] \
			 -creation_user [ad_conn user_id] \
			 -context_id [ad_conn package_id]
		     ]


} -edit_request {


} -edit_data {


} -after_submit {

    ad_returnredirect $return_url
    ad_script_abort
}