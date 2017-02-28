ad_page_contract {
  List data banner for this package_id 

  @author Alessandro Landim

} 




set package_id [ad_conn package_id]
set user_id [ad_conn user_id]

permission::require_permission -party_id [ad_conn user_id] -object_id [ad_conn package_id] -privilege read
set admin_p [permission::permission_p -party_id [ad_conn user_id] -object_id [ad_conn package_id] -privilege admin]
set action_list ""

if {$admin_p eq 1} {
	set action_list {"#banners.Banner_new#" banner-ae "#banners.New#"}
}


template::list::create -name banners  -multirow banners -actions $action_list -pass_properties {
} -elements {
	image {
        label "Image"
		display_template {
			<if @banners.image_id@ not eq "">
				<a href="@banners.url@"><img src="./image/@banners.image_id@"></a>
			</if>
		}

	}
    name {
        label "Name"
        display_template {
	        <a href="banner-ae?banner_id=@banners.banner_id@">
				@banners.name@
			</a>
        }
    }
	actions {
        label ""
        display_template {
			<if @banners.admin_p@>
	        <a class="button" href="banner-del?banner_id=@banners.banner_id@">
				#banners.Delete#
			</a> 
	        <a class="button" href="banner-ae?banner_id=@banners.banner_id@">
				#banners.Edit#
			</a>
			</if>

        }
    }
}

db_multirow -extend {image_id} banners select_banners {
    select banner_id,
    name,
    url,
    acs_permission__permission_p(banner_id, :user_id, 'admin') as admin_p
    from banners b,
    acs_objects ao
    where b.banner_id = ao.object_id
    and   ao.package_id = :package_id	
    and 't' = acs_permission__permission_p(banner_id, :user_id, 'read')
} {
    set image_id [ImageMagick::util::get_image_id -item_id $banner_id]
}
