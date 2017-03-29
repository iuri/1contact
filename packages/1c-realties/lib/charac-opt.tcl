ad_page_contract {
}

# find out a way to make package_id and tree_id dynamic
set package_id [ad_conn package_id]

set tree_id_gen [category_tree::get_id "General Chars" "en_US"]
		
set tree_id_arc [category_tree::get_id "Architecture Chars" "en_US"]

set tree_id_vic [category_tree::get_id "Vicinity Chars" "en_US"]

multirow create charac_opt_gen id name
foreach {cat_id cat_name} [1c_annonces::get_categories -package_id $package_id -tree_id $tree_id_gen] {
	multirow append charac_opt_gen $cat_id $cat_name
}

multirow create charac_opt_arc id name
foreach {cat_id cat_name} [1c_annonces::get_categories -package_id $package_id -tree_id $tree_id_arc] {
	multirow append charac_opt_arc $cat_id $cat_name
}

multirow create charac_opt_vic id name
foreach {cat_id cat_name} [1c_annonces::get_categories -package_id $package_id -tree_id $tree_id_vic] {
	multirow append charac_opt_vic $cat_id $cat_name
}
