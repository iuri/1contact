ad_page_contract {

}

set package_id 2393
set tree_id 1067

multirow create characs cat_id cat_name

foreach {cat_id cat_name} [1c_annonce::get_categories -package_id $package_id -tree_id $tree_id] {

    if {[template::multirow exists options]} {
	template::multirow unset options
    }

    template::multirow extend options value
   

    
    ns_log Notice "$cat_id $cat_name"
    
    multirow extend  -unclobber options select_options [1c_annonce::category_get_options -parent_id $cat_id] {
	
	set value [lindex $elem 0]
		
    }
    
    multirow append characs $cat_id $cat_name
    
}

