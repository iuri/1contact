# /www/register/logout.tcl

ad_page_contract {
    Logs a user out

    @cvs-id $Id: logout.tcl,v 1.4.12.1 2015/09/10 08:21:52 gustafn Exp $

} {
    {return_url ""}
}

if { $return_url eq "" } {
    if { [permission::permission_p -object_id [subsite::get_element -element package_id] -party_id 0 -privilege read] } {
        set return_url [subsite::get_element -element url]
    } else {
        set return_url /
    }
}

ad_user_logout 
db_release_unused_handles

ad_returnredirect $return_url


# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
