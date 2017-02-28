ad_page_contract {

    Moderate a Forum

    @author Ben Adida (ben@openforce.net)
    @creation-date 2002-05-24
    @cvs-id $Id: forum.tcl,v 1.6 2014/10/27 16:41:40 victorg Exp $

} {
    forum_id:naturalnum,notnull
}

# Check that the user can moderate the forum
forum::security::require_moderate_forum -forum_id $forum_id

# Get forum data
forum::get -forum_id $forum_id -array forum

ad_return_template
