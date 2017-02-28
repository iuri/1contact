ad_page_contract {}

ns_log Notice "Running website monitor"



set mainpage_status [util_get_http_status "http://www.natopia.com" 1 30]


ns_log Notice " STATUS $mainpage_status"

if {![string equal $mainpage_status "200"]} {

    set subject "Natopia is down!"
    set msg "HTTP GET STATUS RETURNS $mainpage_status"

    acs_mail_lite::send -subject $subject -mime_type "text/html" \
	-body $msg -to_addr "iuri.sampaio@gmail.com" \
	-from_addr "iurix@iurix.com" -send_immediately
}



# ad_script_abort



