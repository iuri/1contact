ad_page_contract {
    
    Create a Forum

    @author Ben Adida (ben@openforce.net)
    @creation-date 2002-05-25
    @cvs-id $Id: forum-new.tcl,v 1.15 2004/05/17 15:15:17 jeffd Exp $

} -query {
    {name ""}
}

set context [list [_ forums.Create_New_Forum]]

ad_return_template
