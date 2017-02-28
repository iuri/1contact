ad_page_contract {

    @author alessandro.landim@gmail.com
    @creation-date 15 May 2009
} {
	banner_id:optional
}


permission::require_permission -party_id [ad_conn user_id] -object_id [ad_conn package_id] -privilege create

ad_form -name banner_new -html {enctype multipart/form-data} -form {
    {banner_id:key}
    {name:text(text)}
    {url:text(textarea),nospell}
	{sort_order:integer}
	{imgfile:file {label "#banners.Image#"} }
} -new_request {

} -edit_request {
	permission::require_permission -party_id [ad_conn user_id] -object_id $banner_id -privilege write

	db_1row get_banner {}
 
} -on_submit {

} -new_data {
    set banner_id [banners::new -name $name -url $url -sort_order $sort_order]

	if {[exists_and_not_null imgfile]} {
	    ImageMagick::util::create_image_item -file [template::util::file::get_property tmp_filename $imgfile] \
								-parent_id $banner_id 
	}

} -edit_data {
    
	banners::edit -banner_id $banner_id -name $name -url $url -sort_order $sort_order

	if {[exists_and_not_null imgfile]} {
			set image_id [ImageMagick::util::get_image_id -item_id $banner_id]
			if {$image_id != ""} {
				set image_item_id [content::revision::item_id -revision_id $image_id]
				ImageMagick::util::revise_image -file [template::util::file::get_property tmp_filename $imgfile] \
												-item_id $image_item_id 
			} else {
				ImageMagick::util::create_image_item -file [template::util::file::get_property tmp_filename $imgfile] \
													 -parent_id $banner_id 
			}
	}

} -after_submit {
	ad_returnredirect "."
}


