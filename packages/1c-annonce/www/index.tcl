ad_page_contract {
    
    Assurance main page

} {
} -properties {
    context:onevalue
    title:onevalue
}

set title "[_ 1c-annonce.Annonces]"
set context [list $title]

set return_url [ad_return_url]


set admin_link [export_vars -base "admin/"]







