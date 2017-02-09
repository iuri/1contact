ad_page_contract {
    
    Assurance main page

} {
    {orderby "annonce_date,desc"}
    page:optional
    {keyword ""}
    {distributor ""}
    {owner ""}
} -properties {
    context:onevalue
    title:onevalue
}

set title "[_ 1c-annonce.Annonces]"
set context [list $title]

set return_url [ad_return_url]


set package_id [ad_conn package_id]
set cat_admin_link [export_vars -base "/categories/cadmin/one-object" {{object_id $package_id}}]





