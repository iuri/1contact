ad_page_contract {
  Delete one banner

  @author Alessandro Landim
} {
	banner_id
}

permission::require_permission -party_id [ad_conn user_id] -object_id $banner_id -privilege admin

ad_form -export {banner_id} -name banner-del -form {
	{option:text(radio) {options {{"#banners.Yes#" 1} {"#banners.No#" 0}}}  {label "#banners.Choose_Option_to_delete#"}}
} -on_submit {

	if {$option eq 1} {
		set image_id [ImageMagick::util::get_image_id -item_id $banner_id]
		if {$image_id != ""} {
				set item_id [content::revision::item_id -revision_id $image_id]
				ImageMagick::util::delete_item $item_id
		}
		banners::delete -banner_id $banner_id
	}
	
	ad_returnredirect "."

} 

