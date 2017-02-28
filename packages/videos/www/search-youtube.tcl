ad_page_contract {} {
    {q "Rock Rage Against Relax Chill-out & Trip Hop Selected Mix 2 XS"}
    {type ""}
}




#Mozart Vivaldi 
#http://www.youtube.com/watch?v=ORtUbZTLBI8
set myform [ns_getform]
if {[string equal "" $myform]} {
    ns_log Notice "No Form was submited"
} else {
    ns_log Notice "FORM"
    ns_set print $myform    
}
ad_form -name search -form {
    {q:text
	{label ""}
    }
} -on_submit {
    ns_log Notice "ON SUBMIT"
   # ns_log Notice "$search_query $search_type"


}



#set url [export_vars -base "http://www.youtube.com/results" {q type }] 



#set html_page_result [ns_httpget $url] 
#ns_log notice "$html_page_result"


ns_log Notice "$q"

set q [string map {" " +} $q]

set feeds_url "http://gdata.youtube.com/feeds/api/videos?q=${q}&start-index=21&max-results=36&v=2"

set feed [ns_httpget $feeds_url]
ns_log Notice "FEED"

ns_log Notice "$feed"

set html_result_from_xml [videos::convert_xml_to_html -xml $feed]


#set html_result_from_xml ""


#ns_log Notice "$feed"




# Lightview Javascript Library
template::head::add_javascript -src "/resources/videos/js/jquery-1.9.1.min.js" -order 0
template::head::add_javascript -src "/resources/videos/js/excanvas.js" -order 2
template::head::add_javascript -src "/resources/videos/js/spinners.min.js" -order 3
template::head::add_javascript -src "/resources/videos/js/lightview.js" -order 4

template::head::add_css -href "/resources/videos/css/lightview.css"




#ad_return_template $

