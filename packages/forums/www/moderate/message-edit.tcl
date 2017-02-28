ad_page_contract {
    
    Form to edit a message

    @author Ben Adida (ben@openforce.net)
    @creation-date 2002-05-25
    @cvs-id $Id: message-edit.tcl,v 1.9 2014/10/27 16:41:40 victorg Exp $

} {
    message_id:naturalnum,notnull
    {return_url "../message-view"}
}

forum::message::get -message_id $message_id -array message
forum::get -forum_id $message(forum_id) -array forum

ad_return_template
