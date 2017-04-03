# /packages/1c-realties/tcl/1c-annonce-procs.tcl
ad_library {
    Library to support the 1Contact procs
    
    @author Iuri Sampaio [iuri@iurix.com]
    @creation-date Mon Sep 12 17:35:01 2016
    @cvs-id $Id: 1c-realties-procs.tcl,v 0.1d 
} 
    
    
    
    
    
namespace eval 1c_annonces {}

namespace eval 1c_annonces::annonce {}

ad_proc -public 1c_annonces::get_folder_id {
} {
    It returns Annonces folder
} {    
    
    return [fs::get_folder -name "annonces" -parent_id 965]

}

ad_proc -public 1c_annonces::nuke_annonces {
} {
    Erase all annonces and their dependencies 
} {

    set l_ids [db_list select_items "SELECT item_id FROM cr_items WHERE content_type = 'annonce_object' "]
    
    foreach id $l_ids {
	content::item::delete -item_id $id
    }
    
    set package_id [apm_package_id_from_key 1c-annonces]
    set l_ids [db_list select_items "SELECT object_id FROM acs_objects WHERE object_type = 'cr_item_child_rel' AND package_id = :package_id"]
    
    foreach id $l_ids {
	::xo::db::sql::acs_object delete -object_id $id
    }
    
    return 0
}




ad_proc -public 1c_annonces::annonce::delete {
    annonce_id
} {
    Deletes annonces
} {
       
    content::item::delete -item_id $annonce_id

    ::xo::db::sql::acs_object delete -object_id $annonce_id

    db_transaction {
	db_exec_plsql delete_annonce {
	    SELECT annonce__delete(:annonce_id);
	}
    }

    return 0
}


ad_proc -public 1c_annonces::get_categories {
    {-package_id}
    {-tree_id}
} {
    Returns cateogories
} {

#    ns_log Notice "Running ad_proc 1c_annonce::get_categories"
    set locale [ad_conn locale]
    set category_trees [category_tree::get_mapped_trees $package_id]

    if {[exists_and_not_null category_trees]} {

	set cat_ids [category_tree::get_categories -tree_id $tree_id]
	set categories [list]
	foreach cat_id $cat_ids {
	    set cat_name [category::get_name $cat_id]
	    lappend categories $cat_id
	    lappend categories $cat_name
	}
	return $categories
    }
    return
}


ad_proc -public 1c_annonces::category_get_options {
    {-parent_id:required}
} {
    @return Returns the category types for this instance as an
    array-list of { parent_id1 heading1 parent_id2 heading2 ... }
} {

    set children_ids [category::get_children -category_id $parent_id]

    set children [list]
    foreach child_id $children_ids {
	set child_name [category::get_name $child_id]
	set temp "\"$child_name\" $child_id"
	lappend children $temp
    }

    return $children
}



ad_proc -public 1c_annonces::annonce::add {
    {-item_id ""}
    {-title ""}
    {-type_of_transaction ""}
    {-type_of_property ""}
    {-price ""}
    {-taxes ""}
    {-available_date ""}
    {-room_qty ""}
    {-lavatory_qty ""}
    {-bathroom_qty ""}
    {-floors_qty ""}
    {-surface ""}
    {-address ""}
    {-street_number ""}
    {-route ""}
    {-complement ""}
    {-neighborhood ""}
    {-locality ""}
    {-state ""}
    {-country ""}
    {-postal_code ""} 
    {-type_of_announcer ""}
    {-description ""}
    {-charac_req ""}
    {-charac_opt_gen ""}
    {-charac_opt_arc ""}
    {-charac_opt_vic ""}
    {-status ""}    
    {-creation_ip ""}
    {-creation_user ""}
    {-context_id ""}    
} {
    Adds Annonce as a content item
    
} {
    
    if {$creation_ip == ""} {
	set creation_ip [ad_conn peeraddr]
    }
    
    if {$creation_user == ""} {
	set creation_user [ad_conn user_id]
    }
     
    if {$context_id == ""} {
	set context_id [ad_conn package_id]
    }
    
    if {![exists_and_not_null item_id]} {
	set item_id [db_nextval "acs_object_id_seq"]
	
	set type_of_transaction [string trimright $type_of_transaction ","]
	set type_of_property [string trimright $type_of_property ","]
	
	set ref_code "${type_of_transaction}${type_of_property}${room_qty}${item_id}"


	db_transaction {
	    
	    set realty_id [1c_realties::realty::add \
			       -type_of_property $type_of_property \
			       -room_qty $room_qty \
			       -lavatory_qty $lavatory_qty \
			       -bathroom_qty $bathroom_qty \
			       -floors_qty $floors_qty \
			       -surface $surface \
			       -address $address \
			       -street_number $street_number \
			       -route $route \
			       -complement $complement \
			       -neighborhood $neighborhood \
			       -locality $locality \
			       -state $state \
			       -country $country \
			       -postal_code $postal_code \
			       -charac_req $charac_req \
			       -charac_opt_gen $charac_opt_gen \
			       -charac_opt_arc $charac_opt_arc \
			       -charac_opt_vic $charac_opt_vic \
			       -creation_ip $creation_ip \
			       -creation_user $creation_user \
			       -context_id $context_id]    

	    
	   # ns_log Notice "$item_id $title $description $realty_id $context_id $creation_user $creation_ip"
	    content::item::new \
		-item_id $item_id \
		-name "annonce-$item_id" \
		-title $title \
		-description $description \
		-parent_id $context_id \
		-content_type "annonce_object" \
		-package_id $context_id \
		-creation_user $creation_user \
		-creation_ip $creation_ip 


	    
	    set type_of_transaction [string trimright $type_of_transaction ","]
	    	    
	    db_exec_plsql insert_annonce {
		SELECT annonce__new(
				    :item_id,
				    :ref_code,
				    :type_of_transaction,
				    :price,
				    :taxes,
				    :available_date,
				    :type_of_announcer,
				    :status,
				    :realty_id);
	    }
	} on_error {
	    ns_log notice "AIGH11! something bad happened! $errmsg"
	    ad_return_complaint 1 "ERROR"

	    return 
	}
    }	
    
    return $item_id
}


    

