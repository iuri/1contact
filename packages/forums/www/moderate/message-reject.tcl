ad_page_contract {

    Reject a Message

    @author Ben Adida (ben@openforce.net)
    @creation-date 2002-05-24
    @cvs-id $Id: message-reject.tcl,v 1.5 2014/10/27 16:41:40 victorg Exp $

} {
    message_id:naturalnum,notnull
    {return_url "../message-view"}
}

# Check that the user can moderate the forum
forum::security::require_moderate_message -message_id $message_id

# Reject the message
forum::message::reject -message_id $message_id

ad_returnredirect "$return_url?message_id=$message_id"


