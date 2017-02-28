ad_library {

    Banners Library

    @creation-date 2009-05-27
    @author Alessandro Landim <alessandro.landim@gmail.com>

}

namespace eval banners {}

ad_proc -public banners::new {
    {-name:required}
    {-url:required}
	{-sort_order:required}
} {
    create banner
} {
	set user_id [ad_conn user_id]
	set creation_ip [ad_conn peeraddr]
	set package_id [ad_conn package_id]
	set context_id $package_id
	set banner_id [db_string create_banner {}]
		
	return $banner_id
}

ad_proc -public banners::edit {
	{-banner_id:required}
    {-name:required}
    {-url:required}
	{-sort_order:required}
} {
    edit banner
} {
	return [db_string update_banner {}]
}

ad_proc -public banners::delete {
	{-banner_id:required}
} {
    delete banner
} {
	return [db_string delete_banner {}]
}
