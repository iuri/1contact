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

set mandat_chars [string map ", \" \"" [lsort -increasing $mandat_chars]]


set realty_ids [list]


db_foreach select_realties {
    SELECT realty_id, charac_required AS realty_chars FROM realties 
} {
    
    # ns_log Notice "Start $realty_id"
    set matching_p f

    set realty_chars [string map ", \" \"" [lsort -increasing $realty_chars]]

    ns_log Notice "REALTY $realty_id"
    foreach mchar $mandat_chars rchar $realty_chars {
	ns_log Notice "COMPARE $mchar $rchar"

	ns_log Notice "[category::get_name [lindex [split $mchar "-"] 1]]"
    	if {[string equal [category::get_name [lindex [split $mchar "-"] 1]] "Indifferent"]} {
	    ns_log Notice "MATCHED"
	    set matching_p t
	} elseif {[lindex [split $rchar "-"] 1] eq [lindex [split $mchar "-"] 1]} {
	    ns_log Notice "MATCHED"
	    set matching_p t
	} else {
	    ns_log Notice "NOT MATCHED"
	    set matching_p f
	}      
    }
    
    if {$matching_p} {
	lappend realty_ids $realty_id
    }
    
    
} if_no_rows {
    
    ns_write "No rows"
}


ns_log Notice "MATCHING IDS $realty_ids"











set add_annonce_url [export_vars -base "annonce-edit" {return_url}] 

set actions {
    "#1c-annonces.Add_annonce#" "annonce-edit?return_url=/annonces" "#1c-annonces.Add_a_new_annonce#"
    "#1c-annonces.Import_CSV_file#" "import-csv-file?return_url=/1c-annonce" "#1c-annonces.Import_csv_file#"
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
	    label "[_ 1c-annonces.Refence_Code]"
	    display_template {
		<a href="@annonces.annonce_url@">@annonces.ref_code;noquote@</a>
	    }
	}
	title {
	    label "[_ 1c-annonces.Title]"
	    display_template {
		@annonces.title;noquote@
	    }
	}
	available_date {
	    label "[_ 1c-annonces.Availability]"
	}
	status_pretty {
	    label "[_ 1c-annonces.Status]"
	}
	creation_user_name {
	    label "[_ 1c-annonces.Creation_user]"
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


db_multirow -extend { annonce_url delete_url creation_user_url creation_user_name status_pretty } -unclobber annonces select_annonces "
    SELECT a.ref_code, a.ref_code AS title, a.available_date FROM annonces a, cr_items ci 
    WHERE a.annonce_id = ci.item_id
    AND a.parent_id IN ([join :realty_ids ,]) 

" {
}

