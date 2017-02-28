
set user_id [ad_conn user_id]


set admin_p [permission::permission_p -party_id $user_id -object_id $package_id -privilege admin]

if {$admin_p} {
#    set admin_banner_url [export_vars -base "/banners" {}]
    set admin_banner_url [apm_package_url_from_id $package_id]
}

set base_url [site_node::get_url_from_object_id -object_id $package_id]

set list_options ""

db_multirow -extend {publish_image} banners select_banners {} {

	set image_id [ImageMagick::util::get_image_id -item_id $banner_id]
	if {![empty_string_p $image_id]} { 
	  set publish_image "${base_url}image/$image_id"
	} else {
	  set publish_image ""
	}

	append list_options "{image: \"$publish_image\", url:\"$url\", title: \"$name\"},"

}




