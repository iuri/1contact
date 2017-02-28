if {![exists_and_not_null name]} {
    set name "Popular Tags"
}

set tags_url   [tags::package_url]
set return_url [ad_return_url]

# estraggo i valori min e max di count delle tag
if {[db_0or1row minmax "
    select coalesce(min(tag_count), 0) as min, 
           coalesce(max(tag_count), 0) as max
    from (select count(tag) as tag_count from tags_tags group by tag) t"]} {

    # Volendo usare 5 dimensioni di font per rappresentare la
    # frequenza delle tag devo classificarle calcolandone la
    # distribuzione.
    set distribution [expr ($max - $min) / 3]

    db_multirow -extend {class} tags tags "select count(tag) as tag_count, tag from tags_tags group by tag" {

        # calcolo la classe della tag in base alla sua frequenza
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
}

