ad_page_contract {
    This is the main page for the package.
    It displays all of the Mandats and pro
    @author Iuri Sampaio (iuri@iurix.com)
    @cvs-id $Id: index.tcl,v 1.2 2017/01/30 16:47:34 joela Exp $
}
set page_title [ad_conn instance_name]
set context [list]



set package_id [ad_conn package_id]
set cat_admin_link [export_vars -base "/categories/cadmin/one-object" {{object_id $package_id}}]



set return_url [ad_return_url]
