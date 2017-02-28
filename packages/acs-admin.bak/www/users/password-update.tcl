ad_page_contract {
    Let's the admin change a user's password.

    @version $Id: password-update.tcl,v 1.4.2.1 2015/09/10 08:21:10 gustafn Exp $
} {
    {user_id:naturalnum,notnull}
    {return_url ""}
    {password_old ""}
}

acs_user::get -user_id $user_id -array userinfo
set context [list [list "./" "Users"] [list "user.tcl?user_id=$user_id" $userinfo(email)] "Update Password"]

set site_link [ad_site_home_link]

ad_return_template
# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
