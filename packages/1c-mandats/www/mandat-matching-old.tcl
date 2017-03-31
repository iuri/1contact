ad_page_contract {
    This is the matching script.
    It displays all annonces matching with the mandat
    @author Iuri Sampaio (iuri@iurix.com)
    @cvs-id $Id: index.tcl,v 1.2 2017/01/30 16:47:34 joela Exp $
} {
    mandat_id
}

set page_title [ad_conn instance_name]
set context [list]



db_1row select_mandat {
    SELECT charac_required AS mandat_chars FROM mandats m WHERE m.mandat_id = :mandat_id
}

ns_log Notice "MANDAT CHARS $mandat_chars"
set annonce_ids [list]
    
db_foreach select_realties {
    SELECT realty_id, charac_required FROM realties 
} {
    
    ns_log Notice "Start $realty_id"
    set matching_p t
    ns_log Notice "ANNONCE $charac_required"


    
    
} if_no_rows {
    
    ns_write "No rows"
}


ns_log Notice "MATCHING IDS $annonce_ids"










set add_annonce_url [export_vars -base "annonce-edit" {return_url}] 

set actions {
    "#1c-annonce.Add_annonce#" "annonce-edit?return_url=/annonces" "#1c-annonce.Add_a_new_annonce#"
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


db_multirow -extend { annonce_url delete_url creation_user_url creation_user_name status_pretty} -unclobber annonces select_annonces "
" {

    ns_log Notice "ANNONCE $lchars"

    

    
    set annonce_url [export_vars -base "/annonces/annonce-edit" {{annonce_id $item_id}}]
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

