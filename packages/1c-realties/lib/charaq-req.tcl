ad_page_contract {

}


ad_proc -public category_get_options {
    {-parent_id:required}
} {
    @return Returns the category types for this instance as an
    array-list of { parent_id1 heading1 parent_id2 heading2 ... }
} {

    set children_ids [category::get_children -category_id $parent_id]

    set children [list]
    foreach child_id $children_ids {
	set child_name [category::get_name $child_id]
	set temp "\"$child_name\" $child_id"
	lappend children $temp
    }
    
    lappend children ""

    return $children
}



set package_id 2372
set tree_id 1067


set chars_html ""

foreach {cat_id cat_name} [1c_annonce::get_categories -package_id $package_id -tree_id $tree_id] {

    
    append chars_html "

      <div class='box2' >
  	<b>$cat_name</b><br> 
    "
    
    set options_html ""
    
    ns_log Notice "$cat_id $cat_name"
    
    foreach option [category_get_options -parent_id $cat_id] {
	
	ns_log Notice "[lindex $option 0]"
	set option [lindex $option 0]
	append options_html "
	    <label class='input-control radio small-check' >
	    <input type='radio' name='charreq_$cat_id' id='$cat_id' />
	    <span class='check' ></span>
	    <span class='caption' >$option</span>
	    </label>
	    
	"
    }

    append chars_html "$options_html </div>"

    ns_log Notice "$options_html"
    
}

