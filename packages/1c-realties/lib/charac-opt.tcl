ad_page_contract {
}

# find out a way to make package_id and tree_id dynamic
set package_id 2393
set tree_id_gen 1907
set tree_id_arc 1929
set tree_id_vic 1935

multirow create charac_opt_gen id name
foreach {cat_id cat_name} [1c_annonce::get_categories -package_id $package_id -tree_id $tree_id_gen] {
	multirow append charac_opt_gen $cat_id $cat_name
}

multirow create charac_opt_arc id name
foreach {cat_id cat_name} [1c_annonce::get_categories -package_id $package_id -tree_id $tree_id_arc] {
	multirow append charac_opt_arc $cat_id $cat_name
}

multirow create charac_opt_vic id name
foreach {cat_id cat_name} [1c_annonce::get_categories -package_id $package_id -tree_id $tree_id_vic] {
	multirow append charac_opt_vic $cat_id $cat_name
}