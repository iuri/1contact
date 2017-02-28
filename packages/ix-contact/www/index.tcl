ad_page_contract {}

# 
# User information and top level navigation links
#
set user_id [ad_conn user_id]
set untrusted_user_id [ad_conn untrusted_user_id]


set return_url [ad_return_url]
set login_url [export_vars -base "/register" {return_url}]
set register_url [export_vars -base "[subsite::get_url]register/user-new" { return_url }]


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

if {[template::util::is_nil title]} {
    # TODO: decide how best to set the lang attribute for the title
    set title [ad_conn instance_name]
}


template::head::add_css -href "/resources/ix-contact/ix-contacts.css"
#template::head::add_style -style "
