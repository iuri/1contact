ad_page_contract {} {
    {locale ""}
    
}


set selected_lang [lang::user::locale]

if {$locale ne ""} {
    lang::user::set_locale $locale

    ad_returnredirect /
    ad_script_abort
}



set system_name [ad_system_name]
set subsite_name [lang::util::localize [subsite::get_element -element instance_name]]
set user_id [ad_conn user_id]
set untrusted_user_id [ad_conn untrusted_user_id]
set sw_admin_p 0

if { $untrusted_user_id == 0 } {

    set login_url [ad_get_login_url -return]
} else {

    set logout_url [ad_get_logout_url]

}


template::head::add_css -href "/resources/1c-theme/css/header.css"

template::head::add_javascript -script {

  function change_locale() {
      var locale = $('#select_language').val();
      var url = window.location.href + '?locale='+locale; 
      top.location.href=url;
  }

  function get_locale(x) {
      $('#select_language').val(x);
  }
  
}


