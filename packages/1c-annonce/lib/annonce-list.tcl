
set actions {
    "#1c-annonce.Add_annonce#" "annonce-edit?return_url=/1c-annonce" "#1c-annonce.Add_a_new_annonce#"
    "#1c-annonce.Import_CSV_file#" "import-csv-file?return_url=/1c-annonce" "#1c-annonce.Import_csv_file#"
}

set bulk_actions [list]


set where_clause ""

if {[exists_and_not_null keyword]} {
    if {[string length $keyword] ne 17} {
	ad_return_complaint 1 "Annonce Invalid"
    }

    set where_clause "WHERE cv.vin = :keyword"
}



template::list::create \
    -name annonces \
    -multirow annonces \
    -actions $actions \
    -key annonce_id \
    -row_pretty_plural "annonces" \
    -elements {
	ref_code {
	    label "[_ 1c-annonce.Refence_Code]"
	    display_template {
		<a href="@annonces.annonce_url@">@annonces.ref_code;noquote@</a>
	    }
	}
    } 

db_multirow -extend {annonce_url delete_url} annonces select_annonces {
    SELECT ci.item_id, a.ref_code, a.type_of_transaction, a.type_of_property FROM cr_items ci, annonces a WHERE a.annonce_id =  ci.item_id
   
} {
    set annonce_url [export_vars -base "annonce-edit" {item_id}]
    set annonce_delete ""
}

