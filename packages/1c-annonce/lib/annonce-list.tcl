
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
	title {
	    label "[_ 1c-annonce.Title]"
	    display_template {
		@annonces.title;noquote@
	    }
	}
	available_date {
	    label "[_ 1c-annonce.Availability]"
	}
	status_pretty {
	    label "[_ 1c-annonce.Status]"
	}
	creation_user_name {
	    label "[_ 1c-annonce.Creation_user]"
	    display_template {
		<a href="@annonces.creation_user_url@">@annonces.creation_user_name;noquote@</a>
	    }
	}
       	actions {
	    link_url_col delete_url
	    display_template {
		<img src="/resources/acs-subsite/Delete16.gif" width="16" height =”16”>
	    }
	    sub_class narrow
	}
    } 

db_multirow -extend { annonce_url delete_url creation_user_url creation_user_name status_pretty} -unclobber annonces select_annonces {
    SELECT ci.item_id, a.ref_code, cr.title, a.available_date, o.creation_user, a.status, a.type_of_transaction, a.type_of_property
    FROM cr_items ci, cr_revisions cr, acs_objects o, annonces a
    WHERE ci.latest_revision = cr.revision_id
    AND o.object_id = ci.item_id
    AND a.annonce_id =  ci.item_id
   
} {
    set annonce_url [export_vars -base "annonce-edit" {{annonce_id $item_id}}]
    set delete_url [export_vars -base "annonce-del" {{annonce_id $item_id}}]
    
    acs_user::get -user_id $creation_user -array user
    
    set creation_user_name "$user(first_names) $user(last_name)"
    set creation_user_url [acs_community_member_url -user_id $creation_user]

    switch $status {
	a {
	    set status_pretty "[_ 1c-annonce.Active]"
	    
	}
    }
	
}

