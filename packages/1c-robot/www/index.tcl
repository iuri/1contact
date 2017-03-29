ad_page_contract {}



set url "http://anibis.ch"

if {[catch {set json [ns_httpget $url 60 0]} result]} {
    set json ""
} 


ns_log Notice "$json" 
