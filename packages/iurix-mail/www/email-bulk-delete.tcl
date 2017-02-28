ad_page_contract {
} {
    mail_id:multiple,notnull
    {return_url ""}
}



set context_bar [list "[_ iurix-mail.Delete_emails]"]

set delete_p 1
#[permission::permission_p -object_id [ad_conn package_id] -privilege "order_delete"]

if {$delete_p eq 0} {
    ad_returnredirect unauthorized-delete
    ad_script_abort
}

set mail_ids $mail_id
foreach element $mail_ids {
    lappend mail_ids "'[DoubleApos $element]'"
}

set mail_ids [join $mail_ids ","]

db_multirow emails select_emails "
        SELECT mail_id, subject, from_address FROM iurix_mails
        WHERE mail_id IN ($mail_ids)
    "

set hidden_vars [export_form_vars mail_id return_url]

