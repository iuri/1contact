ad_page_contract {
    Returns required characteristics

    @author Iuri Sampaio (iuri@iurix.com)
    @creation-date 2017-03-17

}



set package_id 2393
set tree_id 1067


set chars_html ""

foreach {cat_id cat_name} [1c_annonce::get_categories -package_id $package_id -tree_id $tree_id] {

    
    append chars_html "

      <div class='box2' >
  	<b>$cat_name</b><br> 
    "
    set options_html ""
    
    foreach option [1c_annonce::category_get_options -parent_id $cat_id] {
	
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
    
}

