template::head::add_css -href "/resources/1c-theme/css/metro.css" -order 0
template::head::add_css -href "/resources/1c-theme/css/metro-icons.css" -order 0
template::head::add_css -href "/resources/1c-theme/css/metro-responsive.css" -order 0
template::head::add_css -href "/resources/1c-theme/css/metro-schemes.css" -order 0
template::head::add_css -href "/resources/1c-theme/css/select2.css" -order 0
template::head::add_css -href "/resources/1c-theme/css/stylesheet.css" -order 1


template::head::add_javascript -src "https://code.jquery.com/jquery-2.2.4.min.js" -order 0
template::head::add_javascript -src "/resources/1c-theme/js/metro.js" -order 1
template::head::add_javascript -src "/resources/1c-theme/js/select2.js" -order 1


       
template::head::add_javascript -src "https://maps.googleapis.com/maps/api/js?key=AIzaSyDzF7IlGi2Ue-EI6E6bizGVZ69NhFU7yGI&signed_in=true&callback=initMap"
		    


if {![info exists skip_link]} {
    set skip_link "#content-wrapper"
}
