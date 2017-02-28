ad_page_contract {
    Inform the user of an account status message.
    
    @cvs-id $Id: account-message.tcl,v 1.2.2.1 2015/09/10 08:21:51 gustafn Exp $
} {
    {message:html ""}
    {return_url ""}
}

set page_title "Logged in"
set context [list $page_title]

set system_name [ad_system_name]


# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
