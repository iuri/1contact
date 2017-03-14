ad_page_contract {
} {
    {return_url ""}

}

set return_url [ad_return_url]

template::head::add_css -href "/resources/1c-theme/css/header.css"


if { ![info exists main_content_p] } {
    set main_content_p 1
}

#
# Set some basic variables
#
set system_name [ad_system_name]
set subsite_name [lang::util::localize [subsite::get_element -element instance_name]]

if {[ad_conn url] eq "/"} {
    set system_url ""
} else {
    set system_url [ad_url]
}

if {![info exists title]} {
    # TODO: decide how best to set the lang attribute for the title
    set title [ad_conn instance_name]
}

# 
# User information and top level navigation links
#
set user_id [ad_conn user_id]
set untrusted_user_id [ad_conn untrusted_user_id]
set sw_admin_p 0

if { $untrusted_user_id == 0 } {
    # The browser does NOT claim to represent a user that we know about
    set login_url [ad_get_login_url -return]
} else {
    set logout_url [ad_get_logout_url]
}
