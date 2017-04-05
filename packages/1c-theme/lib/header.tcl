ad_page_contract {} {
    {error ""}
    {error_code ""}
    {error_description ""}
    {error_reason ""}
    {locale ""}
    {return_url ""}
    
}


# ns_log Notice "$error \n $error_code \n $error_description \n $error_reason"
if {$error ne ""} {
    ad_returnredirect [export_vars -base "/users/login" {error_description} ]

}


if {$locale ne ""} {
    lang::user::set_locale $locale

    ad_returnredirect $return_url
    ad_script_abort
}


set return_url "[ad_return_url]"


set system_name [ad_system_name]

if {[ad_conn url] eq "/"} {
    set system_url ""
} else {
    set system_url [ad_url]
}


set subsite_name [lang::util::localize [subsite::get_element -element instance_name]]
set user_id [ad_conn user_id]
set untrusted_user_id [ad_conn untrusted_user_id]
set sw_admin_p 0

if { $untrusted_user_id == 0 } {

    set login_url [ad_get_login_url -return]
} else {

    set logout_url [ad_get_logout_url]

}


template::head::add_css -href "/resources/1c-theme/css/header.css" -media "screen" -order 1

template::head::add_javascript -script "
    function change_locale(l) {
        var return_url = '$return_url';
        var url = window.location.href + '?locale='+l+'&return_url='+return_url;
        top.location.href=url;
    }
"


