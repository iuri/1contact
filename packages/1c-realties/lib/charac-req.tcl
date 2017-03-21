ad_page_contract {
    Returns required characteristics

    @author Iuri Sampaio (iuri@iurix.com)
    @creation-date 2017-03-17

}

# find out a way to make package_id and tree_id dynamic
set package_id 2393
set tree_id 1067

set chars_html ""

foreach {cat_id cat_name} [1c_annonces::get_categories -package_id $package_id -tree_id $tree_id] {

    
    append chars_html "
    <div class='box2' >
        <b>$cat_name</b><br>
    "

    set options_html ""
    
    foreach option [1c_annonces::category_get_options -parent_id $cat_id] {
	
	   set option_name [lindex $option 0]
       set option_id [lindex $option 1]

	   append options_html "
            <label class='input-control radio small-check' >
            <input type='radio' name='charac_req_$cat_id' id='$option_id' value='$option_id' required />
            <span class='check' ></span>
            <span class='caption' for='charac_req_$option_id' >$option_name</span>
            </label>
	"
    }

    append chars_html "$options_html </div>"
    
}