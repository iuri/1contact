ad_page_contract {
  This is the highest level site specific master template.

  Properties allowed
  doc(title) HTML title
  head code to be entered into head of document
  body 
  focus HTML id of form element to focus
  skip_link href of link to skip to. Should be of format #skip_link
  main_content_p if true wrap in the main content divs (if false, provide your own
    page structure, for instance two or three columns of content per page)

  @author Lee Denison (lee@xarg.co.uk)
  @author Don Baccus (dhogaza@pacifier.com)

  $Id: plain-master.tcl,v 1.5.2.1 2015/09/12 19:00:43 gustafn Exp $
}



#<!-- Início da importação de estilos -->
template::head::add_css -href "/resources/1c-theme/styles/metro.css" -order 0
template::head::add_css -href "/resources/1c-theme/styles/metro-icons.css" -order 2
template::head::add_css -href "/resources/1c-theme/styles/metro-responsive.css" -order 2
template::head::add_css -href "/resources/1c-theme/styles/metro-schemes.css" -order 2
template::head::add_css -href "/resources/1c-theme/styles/select2.css" -order 2
template::head::add_css -href "/resources/1c-theme/styles/stylesheet.css" -order 3
#<!-- Fim da importação de estilos -->


template::head::add_javascript -src "https://code.jquery.com/jquery-2.2.4.min.js" -order 0
template::head::add_javascript -src "/resources/1c-theme/js/metro.js" -order 1
template::head::add_javascript -src "/resources/1c-theme/js/select2.js" -order 2



if {![info exists skip_link]} {
    set skip_link "#content-wrapper"
}

# 
# Set acs-lang urls
#
set acs_lang_url [apm_package_url_from_key "acs-lang"]
set num_of_locales [llength [lang::system::get_locales]]

if {$acs_lang_url eq ""} {
    set lang_admin_p 0
} else {
    set lang_admin_p [permission::permission_p \
        -object_id [site_node::get_element \
            -url $acs_lang_url \
            -element object_id] \
        -privilege admin \
        -party_id [ad_conn untrusted_user_id]]
}

set toggle_translator_mode_url [export_vars \
    -base ${acs_lang_url}admin/translator-mode-toggle \
    {{return_url [ad_return_url]}}]

set package_id [ad_conn package_id]
if { $num_of_locales > 1 } {
    set change_locale_url [export_vars -base $acs_lang_url {package_id}]
}

#
# Change locale link
#
if {[llength [lang::system::get_locales]] > 1} {
    set change_locale_url [export_vars -base "/acs-lang/" {package_id}]
}
