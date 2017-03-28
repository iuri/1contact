ad_page_contract {}


#set queryHeaders [ns_set create]
#ns_set update $queryHeaders Host https://1c.1contact.ch
#ns_set update $queryHeaders Content-Type HTML
#set url http://1c.1contact.ch:8000/file/5348/Geneve_Centre_Rive-Droite.kml
#set xmlFile [ns_http run -headers $queryHeaders -timeout 10.0 -method GET $url]


set xmlFile [open "/var/www/1contact/packages/1c-core/www/resources/Geneve-Centre-Rive-Droite.kml" r]

set xmlData [read $xmlFile]

close $xmlFile
#	ns_log Notice "DATA $xmlData"

set doc [dom parse $xmlData]

# ns_log Notice "DOC $doc"
if {[catch {set root [$doc documentElement]} err]} {
    error "Error parsing XML: $err"
}

#ns_log Notice "$root | [$root nodeName]"

if {[$root hasChildNodes]} {
    set documentNode [$root childNodes]
 #   ns_log Notice "$documentNode | [$documentNode nodeName]"

    
    if {[$documentNode hasChildNodes]} {
	set nodes [$documentNode childNodes]
	#ns_log Notice "$nodes"

	set PlacemarkNodes [$documentNode getElementsByTagName Placemark]

	set result_json "\{\"Polygons\": \["
	
#	ns_log Notice "$PlacemarkNodes"
	foreach node $PlacemarkNodes {
	    #ns_log Notice "[$node nodeName]"
	    set nodes [$node childNodes]
	    #ns_log Notice "$nodes"

	    foreach node1 $nodes {
		set name [$node1 nodeName]
		switch $name {
		    name {
			set value [[$node1 firstChild] nodeValue]
			set value [string trim [string map "- \" \"" [lindex [split $value "h"] 0]] " "]
			append result_json " \{\"$name\":\"$value\","
			
		    }
		    description {
			set value [[$node1 firstChild] nodeValue]
			append result_json "\"$name\":\"$value\","
		    }
		    Polygon {
			set polygonNodes [[[$node1 firstChild] firstChild] childNodes]
			set coordinates [[[lindex $polygonNodes 1] firstChild] nodeValue]
			append result_json  "\"coords\":\""
			foreach row $coordinates {
			    set elems [split $row ,]
			    append result_json "\{ lng: [lindex $elems 0], lat: [lindex $elems 1] \},"

			    #ns_log Notice "\{ lng: [lindex $elems 0], lat: [lindex $elems 1] \},"
			}
			append result_json "\"\},"
		    }		    
		}
	    }
	}
	set result_json [string trim $result_json ","]
	append result_json "\]\}"

	#ns_log Notice "$result_json"
    }    
}


$doc delete




ns_return 200 text/html "$result_json"



