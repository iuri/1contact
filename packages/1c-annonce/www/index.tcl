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

set actions {
    "#c1-annonce.Add_annonce#" "annonce-ae?return_url=/1c-annonce" "#1c-annonce.Add_a_new_annonce#"
    "#c1-annonce.Import_CSV_file#" "import-csv-file?return_url=/1c-annonce" "#1c-annonce.Import_csv_file#"
}

set bulk_actions [list]


set where_clause ""

if {[exists_and_not_null keyword]} {
    if {[string length $keyword] ne 17} {
	ad_return_complaint 1 "Chassis must a string of 17 characters"
    }

    set where_clause "WHERE cv.vin = :keyword"
}



template::list::create \
    -name annonces \
    -multirow annonces \
    -actions $actions \
    -key annonce_id \
    -row_pretty_plural "annonces" \
    -bulk_actions $bulk_actions \
    -page_flush_p t \
    -page_size 50 \
    -page_query_name annonces_pagination \
    -elements {
	annonce_number {
	    label "[_ 1c-annonce.Number]"
	    display_template {
		<a href="@annonces.annonce_url@">@annonces.annonce_number;noquote@
	    }
	}
    } -orderby { 
    }


db_multirow -extend {annonce_url} annonces select_annonces {
    
} {

    set annonce_url [export_vars -base annonce-one {return_url annonce_id}]
    
    set annonce_date [split [lindex $annonce_date 0] "-"]
    set annonce_date "[lindex $annonce_date 2]/[lindex $annonce_date 1]/[lindex $annonce_date 0]"
    ns_log Notice "$annonce_date "
}

