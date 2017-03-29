ad_page_contract {
    Returns required characteristics

    @author Iuri Sampaio (iuri@iurix.com)
    @creation-date 2017-03-17
}

set package_id [ad_conn package_id]

set tree_id [category_tree::get_id "Required Chars" "en_US"]

set chars_html ""


# Change all the code to core
set package_key [apm_package_key_from_id $package_id]
switch $package_key {	
    1c-annonces {
	set flag a
    }
    1c-mandats {
	set flag m
    }
    default {
	
    }
}


foreach {cat_id cat_name} [1c_annonces::get_categories -package_id $package_id -tree_id $tree_id] {
    
    append chars_html "
    <div class='box2' >
        <b>$cat_name</b><br>
    "
    
    set options_html ""
    
    foreach option [1c_annonces::category_get_options -parent_id $cat_id] {
	set option_name [lindex $option 0]
	set option_id [lindex $option 1]
	
	if {$flag eq "a"} {
	    if {![string equal [category::get_name [lindex $option 1] "en_US" ] "Indifferent"]} {	
	   	append options_html "
		    	<label class='input-control radio small-check' >
		    	<input type='radio' name='charac_req_$cat_id' id='$option_id' value='$option_id' />
		    	<span class='check' ></span>
		    	<span class='caption' for='charac_req_$option_id' >$option_name</span>
		    	</label>"	    
	    }
	} elseif {$flag eq "m"} {
	    if {![string equal [category::get_name [lindex $option 1] "en_US" ] "Not Indicated"] && ![string equal [category::get_name [lindex $option 1] "en_US" ] "On Demand"] } {
		
		append options_html "
		    	<label class='input-control radio small-check' >
		    	<input type='radio' name='charac_req_$cat_id' id='$option_id' value='$option_id' />
		    	<span class='check' ></span>
		    	<span class='caption' for='charac_req_$option_id' >$option_name</span>
		    	</label>"	    
	    } 
	}
    }
    append chars_html " $options_html </div>"
}
