#
#  Copyright (C) 2001, 2002 MIT
#
#  This file is part of dotLRN.
#
#  dotLRN is free software; you can redistribute it and/or modify it under the
#  terms of the GNU General Public License as published by the Free Software
#  Foundation; either version 2 of the License, or (at your option) any later
#  version.
#
#  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
#  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
#  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
#  details.
#

# banner-portlet/www/banner-portlet.tcl

ad_page_contract {
    The logic for the banner portlet.
} -query {

}


set user_id [ad_conn user_id]
set base_url [site_node::get_url_from_object_id -object_id $package_id]
template::head::add_css -href "/resources/banners/banners.css"


db_multirow -extend {publish_image} banners select_banners {} {

	set image_id [ImageMagick::util::get_image_id -item_id $banner_id]
	if {![empty_string_p $image_id]} { 
	  set publish_image "${base_url}/image/$image_id"
	} else {
	  set publish_image ""
	}

}

