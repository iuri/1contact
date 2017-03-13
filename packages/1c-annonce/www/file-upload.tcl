# file /packages/1c-annonces/www/file-upload.tcl
ad_page_contract {
    Uploads files to annonces
    
}


set myform [ns_getform]
if {[string equal "" $myform]} {
    ns_log Notice "No Form was submited"
} else {
    ns_log Notice "FORM"
    ns_set print $myform
    for {set i 0} {$i < [ns_set size $myform]} {incr i} {
	set varname [ns_set key $myform $i]
	set varvalue [ns_set value $myform $i]

	ns_log Notice "$varname $varvalue"
    }
}



# Bootstrap styles
 template::head::add_css -href "http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"

# Generic page styles
 template::head::add_css -href "/resources/css/style.css"

# CSS to style the file input field as button and adjust the Bootstrap progress bars 
 template::head::add_css -href "/resources/1c-annonce/css/jquery.fileupload.css"


#template::head::add_javascrip
template::head::add_javascript -src "http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" -order 0

# The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
template::head::add_javascript -src "/resources/1c-annonce/js/jquery.ui.widget.js" -order 1

# The Load Image plugin is included for the preview images and image resizing functionality -->
template::head::add_javascript -src "http://blueimp.github.io/JavaScript-Load-Image/js/load-image.all.min.js" -order 2

# The Canvas to Blob plugin is included for image resizing functionality -->
template::head::add_javascript -src "http://blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js" -order 3

# Bootstrap JS is not required, but included for the responsive demo navigation -->
template::head::add_javascript -src "http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js" -order 4

# The Iframe Transport is required for browsers without support for XHR file uploads -->
template::head::add_javascript -src "/resources/1c-annonce/js/jquery.iframe-transport.js" -order 5

# The basic File Upload plugin 
template::head::add_javascript -src "/resources/1c-annonce/js/jquery.fileupload.js" -order 6

# The File Upload processing plugin
template::head::add_javascript -src "/resources/1c-annonce/js/jquery.fileupload-process.js" -order 7

# The File Upload image preview & resize plugin
template::head::add_javascript -src "/resources/1c-annonce/js/jquery.fileupload-image.js" -order 8

# The File Upload audio preview plugin
template::head::add_javascript -src "/resources/1c-annonce/js/jquery.fileupload-audio.js" -order 9

# The File Upload video preview plugin
template::head::add_javascript -src "/resources/1c-annonce/js/jquery.fileupload-video.js" -order 10

# The File Upload validation plugin
template::head::add_javascript -src "/resources/1c-annonce/js/jquery.fileupload-validate.js" -order 11


#
template::head::add_javascript -src "/resources/1c-annonce/js/file-upload.js" -order 12
