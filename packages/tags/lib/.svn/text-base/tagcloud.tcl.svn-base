set tags_url   [tags::package_url]
set return_url [ad_return_url]
set max_tag_no [parameter::get_from_package_key -package_key tags -parameter max_tag_no -default 100]

# get min and max tag count
if {[db_0or1row minmax {}]} {

    #  calc tags distribution
    set distribution [expr ($max - $min) / 3]

    db_multirow -extend {class} tags tags {} {

        # set tag class based on its frequency
	if {$tag_count == $min} {
	    set class smallestTag
	} elseif {$tag_count == $max} {
	    set class largestTag
	} elseif {$tag_count > [expr $min + $distribution * 2]} {
	    set class largeTag
	} elseif {$tag_count > [expr $min + $distribution]} {
	    set class mediumTag
	} else {
	    set class smallTag
	}
    }
} else {
    # creo una multirow fittizia 
    template::multirow create tags dummy
}

