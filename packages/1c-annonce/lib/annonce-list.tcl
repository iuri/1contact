
set actions {
    "#c1-annonce.Add_annonce#" "annonce-edit?return_url=/1c-annonce" "#1c-annonce.Add_a_new_annonce#"
    "#c1-annonce.Import_CSV_file#" "import-csv-file?return_url=/1c-annonce" "#1c-annonce.Import_csv_file#"
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
	annonce_number {
	    label "[_ 1c-annonce.Number]"
	    display_template {
		<a href="@annonces.annonce_url@">@annonces.annonce_number;noquote@
	    }
	}
    } 

db_multirow -extend {annonce_url delete_url annonce_number} annonces select_annonces {
    SELECT ci.item_id, m.code AS annonce_number, m.type_of_transaction FROM cr_items ci, mandats m  WHERE m.mandat_id = ci.item_id
    limit 10
} {
    set annonce_url ""
    set annonce_delete ""
}

