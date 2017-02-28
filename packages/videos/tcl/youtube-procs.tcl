ad_library {}


namespace eval videos {}


ad_proc -public videos::convert_xml_to_html {
    {-xml:required}
} {
    Iuri Sampaio (iuri.sampaio@iurix.com)
} {
    
    package require tdom
 
#    ns_log Notice "$xml"
    set doc [dom parse $xml]

 #   ns_log Notice "DOC $doc"
   
    if {[catch {set root [$doc documentElement]} err]} {
	error "Error parsing XML: $err"
    } else {
	set tracks [videos::get_track_list $root]
    }

    
    # Here it starts the layout chunk of code.   
    ns_log Notice "URLS $tracks"
    set html ""
    set i 0
    foreach element $tracks {
#	ns_log Notice "$url"

	set id [lindex [lindex $tracks $i] 0]
	set url [lindex [lindex $tracks $i] 1]
	set height [lindex [lindex $tracks $i] 2]
	set width [lindex [lindex $tracks $i] 3]
	set title [lindex [lindex $tracks $i] 4]
	set average [lindex [lindex $tracks $i] 5]
	set numlikes [lindex [lindex $tracks $i] 6]
	
	set elem_url [export_vars -base one {
	    {url "http://www.youtube.com/watch?v=${id}"}
	    {img $url}
	    {id $id}
	    {title $title}
	    {width $width}
	    {height $height}
	    {average $average}
	    {numlikes $numlikes}
	}]

	append html " 
           <td>
	    <a class=\"lightview\" href=\"$elem_url\">
                <img src=\"${url}\" style=\"width:305px;\" alt=\"Submit Button\">
                <br>$title<br>$average | $numlikes
	        <br>$height | $width</a></td>
	"

	if {[expr [expr $i + 1] % 4] == 0} {
	    append html "</tr><tr>"
	}

	incr i
   }
 #   ns_log Notice "HTML $html"
    return $html
}


ad_proc -public videos::explore_xml {
    {parent}
} {
    @author Iuri Sampaio (iuri.sampaio@iurix.com)
    @date 2013-12-08
} {
    
 #   ns_log Notice "Explore NODE $parent"

    ns_log Notice "Running videos:explore_xml..."
    
    set type [$parent nodeType]
    set name [$parent nodeName]
#    ns_log Notice "parent type  $type  | name $name"
   
    set results [list]
    set element [list]
    set id ""
    set numlikes ""
    set title ""
    set thumb_url ""
    


    if {$type != "ELEMENT_NODE"} { return } 
    
    if {$name == "openSearch:totalResults"} {
	set value [[$parent firstChild] nodeValue]
	lappend [list "totalresults" "$value"]
	ns_log Notice "TOTAL RESULTS $value"
    }

 

    # Entry's Nodes
    set entries [$parent getElementsByTagName entry]
    foreach entry $entries {

	set type [$entry nodeType]
	set name [$entry nodeName]
    	set attribs [join [$entry attributes] ", "]
#	ns_log Notice "#entry type  $type  | name $name"
#	ns_log Notice "ATRIBS $attribs"
      

#	set title [$entry getElementsByTagName title]
#	set title_value [[$title firstChild] nodeValue]
#	ns_log Notice "$title | $title_value"
	foreach child [$entry childNodes] {
	    set type [$child nodeType]
	    set name [$child  nodeName]
#	    ns_log Notice "##child type  $type  | name $name"
	    if {[$child hasChildNodes]} {
		set value [[$child firstChild] nodeValue]
#		ns_log Notice "##child type  $type  | name $name | value $value"
		
		if {$name == "id"} {
		    set id $value
		    set id [lindex [split $value ":"] [expr [llength [split $value ":"]]-1]]
		    lappend element $id
		} 
		
		foreach child2 [$child childNodes] {
		    set name2 [$child2  nodeName]
		    set type2 [$child2  nodeType]
		    if {[$child2 hasChildNodes]} {
			set value2 [[$child2 firstChild] nodeValue]
#			ns_log Notice "###child2 type  $type2  | name $name2 | value2 $value"
			if {$name2 == "media:title"} {
			    set title $value2
			    lappend element $title
			}
		    } else {
			set attribs [join [$child2 attributes] ", "]
#			ns_log Notice "###child2 type  $type2  | name $name2 | $attribs"
			if {$name2 == "mqdefault"} {
			    set thumb_url [$child2 getAttribute "url"]
			    lappend element $thumb_url 
			}
		    }
		}    
	    } else {
		if {$name == "yt:rating"} {
		    set numlikes [$child getAttribute "numLikes"]
		    lappend element $numlikes
		}
				
		if {$name == "gd:rating"} {
		    set average [$child getAttribute "average"]
		    lappend element $average
		}
		    
	       
		
		set attribs [join [$child attributes] ", "]
#		ns_log Notice "##child type $type | name $name | ATRIBS $attribs"
	    }
	}
#	ns_log Notice "$element"
	lappend results $element  
	set element ""
	
    }
    
  
    set i 1
    foreach element $results {
	#ns_log Notice "* $element"
	set i 0
	#ns_log Notice "#"
	foreach subelement $element {
	#    ns_log Notice "** $subelement"
	 #   ns_log Notice "##"
	    
	    incr i
	}
    }
#    ns_log Notice "i $i"
  
#    ns_log Notice "[lindex [lindex $results 1] 0]"
#    ns_log Notice "[lindex [lindex $results 5] 0]"
    
    set odd 0
    for {set i 0} {$i<[llength $results]} {incr i} {
#	ns_log Notice "[lindex $results $i]"
	set j 0 
	
	if {[llength [lindex $results $i]] != 4} {
	    if {$j<4||$j>4} {
		set odd 1
		ns_log Notice "[lindex $results $i]"
	    }
	    incr j
	}
    }
    ns_log Notice "ODD $odd"
    #ns_log Notice "THUMBS $results"
    set thumb_urls ""
    return $thumb_urls
}
























ad_proc -public videos::get_track_list {
    {parent}
} {
    @author Iuri Sampaio (iuri.sampaio@iurix.com)
    @date 2013-12-08
} {
    
 #   ns_log Notice "Explore NODE $parent"
    
    
    set type [$parent nodeType]
    set name [$parent nodeName]
#    ns_log Notice "parent type  $type  | name $name"
   
    set results [list]
    set element [list]
    set id ""
    set numlikes ""
    set title ""
    set thumb_url ""
    


    if {$type != "ELEMENT_NODE"} { return } 
    
    if {$name == "openSearch:totalResults"} {
	set value [[$parent firstChild] nodeValue]
	lappend [list "totalresults" "$value"]
	ns_log Notice "TOTAL RESULTS $value"
    }

 

    # Entry's Nodes
    set entries [$parent getElementsByTagName entry]
    foreach entry $entries {

	set type [$entry nodeType]
	set name [$entry nodeName]
    	set attribs [join [$entry attributes] ", "]
#	ns_log Notice "#entry type  $type  | name $name"
#	ns_log Notice "ATRIBS $attribs"
      

#	set title [$entry getElementsByTagName title]
#	set title_value [[$title firstChild] nodeValue]
#	ns_log Notice "$title | $title_value"
	foreach child [$entry childNodes] {
	    set type [$child nodeType]
	    set name [$child  nodeName]
#	    ns_log Notice "##child type  $type  | name $name"
	    if {[$child hasChildNodes]} {
		set value [[$child firstChild] nodeValue]
		ns_log Notice "##child type  $type  | name $name | value $value"
		
		if {$name == "id"} {
		    set id $value
		    set id [lindex [split $value ":"] [expr [llength [split $value ":"]]-1]]
		    lappend element $id
		} 
		
		foreach child2 [$child childNodes] {
		    set name2 [$child2  nodeName]
		    set type2 [$child2  nodeType]
		    if {[$child2 hasChildNodes]} {
			set value2 [[$child2 firstChild] nodeValue]
						ns_log Notice "###child2 type  $type2  | name $name2 | value2 $value"
			if {$name2 == "media:title"} {
			    set title $value2
			    lappend element $title
			}
		    } else {
			set attribs [join [$child2 attributes] ", "]
			ns_log Notice "###child2 type  $type2  | name $name2 | $attribs"
			if {$name2 == "media:thumbnail"} {
			    if {[$child2 getAttribute yt:name] == "mqdefault"} {
				
				set thumb_url [$child2 getAttribute "url"]
				lappend element $thumb_url 
				set height [$child2 getAttribute "height"]
				lappend element $height
				set width [$child2 getAttribute "width"]
				lappend element $width
			    }
			  	
			  
			}
		    }
		}    
	    } else {
		if {$name == "yt:rating"} {
		    set numlikes [$child getAttribute "numLikes"]
		    lappend element $numlikes
		}
				
		if {$name == "gd:rating"} {
		    set average [$child getAttribute "average"]
		    lappend element $average
		}
		    
	       
		
		set attribs [join [$child attributes] ", "]
#		ns_log Notice "##child type $type | name $name | ATRIBS $attribs"
	    }
	}
#	ns_log Notice "$element"
	lappend results $element  
	set element ""
	
    }
    
  
    set i 1
    foreach element $results {
	#ns_log Notice "* $element"
	set i 0
	#ns_log Notice "#"
	foreach subelement $element {
	#    ns_log Notice "** $subelement"
	 #   ns_log Notice "##"
	    
	    incr i
	}
    }
#    ns_log Notice "i $i"
  
#    ns_log Notice "[lindex [lindex $results 1] 0]"
#    ns_log Notice "[lindex [lindex $results 5] 0]"
    
    set odd 1
    for {set i 0} {$i<[llength $results]} {incr i} {
#	ns_log Notice "[lindex $results $i]"
	set j 0 
	
	if {[llength [lindex $results $i]] != 5} {
	    if {$j<5||$j>5} { ### if $j != 5 ####
 		set odd 0
		ns_log Notice "[lindex $results $i]"
	    }
	    incr j
	}
    }
    ns_log Notice "ODD $odd"
    #ns_log Notice "THUMBS $results"
    set thumb_urls ""
    return $results
}










