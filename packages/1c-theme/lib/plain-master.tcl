template::head::add_css -href "/resources/1c-theme/css/metro.css" -media "screen" -order 0
template::head::add_css -href "/resources/1c-theme/css/metro-icons.css" -media "screen" -order 0
template::head::add_css -href "/resources/1c-theme/css/metro-responsive.css" -media "screen" -order 0
template::head::add_css -href "/resources/1c-theme/css/metro-schemes.css" -media "screen" -order 0
template::head::add_css -href "/resources/1c-theme/css/select2.css" -media "screen" -order 0
template::head::add_css -href "/resources/1c-theme/css/stylesheet.css" -media "screen" -order 1
template::head::add_css -href "/resources/1c-theme/css/print.css" -media "print" -order 2


template::head::add_javascript -src "https://code.jquery.com/jquery-2.2.4.min.js" -order 0
template::head::add_javascript -src "/resources/1c-theme/js/metro.js" -order 1
template::head::add_javascript -src "/resources/1c-theme/js/select2.js" -order 1

if {![info exists skip_link]} {
    set skip_link "#content-wrapper"
}
