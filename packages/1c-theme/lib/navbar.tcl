template::head::add_css -href "/resources/1c-theme/css/navbar.css"


set package_id 2393
set tree_id 1067

multirow create characs id name

foreach {id name} [1c_annonces::get_categories -package_id $package_id -tree_id $tree_id] {
    multirow append characs $id $name

}
