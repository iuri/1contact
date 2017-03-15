ad_page_contract {
    
    Disable a Forum

    @author Ben Adida (ben@openforce.net)
    @creation-date 2002-05-28
    @cvs-id $Id: forum-disable.tcl,v 1.7 2014/10/27 16:41:39 victorg Exp $

} {
    forum_id:naturalnum,notnull
}

forum::disable -forum_id $forum_id

ad_returnredirect "."



