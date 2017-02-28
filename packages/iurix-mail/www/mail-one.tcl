ad_page_contract {
} {
    {mail_id}
}



db_1row select_mail {
    SELECT from_address, date, subject, bodies FROM iurix_mails WHERE mail_id = :mail_id
}