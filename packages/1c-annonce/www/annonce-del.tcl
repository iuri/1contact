ad_page_contract {

    Deletes a category

    @author Timo Hentschel (timo@timohentschel.de)
    @cvs-id $Id:
} {
    annonce_id:naturalnum,multiple
} -properties {
    page_title:onevalue
    context_bar:onevalue
    delete_url:onevalue
    cancel_url:onevalue
}


set user_id [auth::require_login]
set package_id [ad_conn package_id]
permission::require_permission -object_id $package_id -privilege admin

multirow create annonces annonce_id ref_code view_url
foreach id $annonce_id {
    multirow append annonces \
	$id \
        [db_string select_ref_code {SELECT ref_code FROM annonces WHERE annonce_id = :id}] \
        [export_vars -no_empty -base annonce-edit {{annonce_id $id}}]
}

multirow sort annonces -dictionary ref_code

set delete_url [export_vars -no_empty -base annonce-del-2 { annonce_id:multiple }]
set cancel_url [export_vars -no_empty -base anonnces {}]
set page_title "Delete Annonces"

lappend context_bar "Delete annonces"

template::list::create \
    -name annonces \
    -no_data "None" \
    -elements {
	ref_code {
	    label "Ref. Code"
	    display_template {
		<a href="@annonces.view_url@">@annonces.ref_code@</a>
	    }
	}
    }

ad_return_template 

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
