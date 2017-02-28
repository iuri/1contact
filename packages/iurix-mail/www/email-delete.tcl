
ad_page_contract {
    Delete emails
} {
    mail_id:notnull
    {return_url ""}
    {cancel.x:optional}
}


if {![info exists cancel.x]} {

    
    foreach element $mail_id {    
#	ad_require_permission $element order_delete
	if { [catch {	iurix_mail::email::delete -mail_id $element } errmsg] } {
	    ad_return_complaint 1 "[_ cn-order.Delete_email_failed]: $errmsg"
	} 
    }
}
ad_returnredirect $return_url


