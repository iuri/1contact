set page_title [ad_conn instance_name]
set context [list]



set package_id [ad_conn package_id]
set cat_admin_link [export_vars -base "/categories/cadmin/one-object" {{object_id $package_id}}]
