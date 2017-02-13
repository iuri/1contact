# /packages/1c-mandat/tcl/1c-annonce-procs.tcl
ad_library {
    Library to support the 1Contact procs

     @author Iuri Sampaio [iuri@iurix.com]
     @creation-date Mon Sep 12 17:35:01 2016
     @cvs-id $Id: ix-ndc-procs.tcl,v 0.1d 
}


namespace eval 1c_annonce {}

namespace eval 1c_annonce::annonce {}



ad_proc -public 1c_annonce::annonce::delete {
    annonce_id
} {
    Deletes annonces
} {


    content::item::delete -item_id $annonce_id
    db_transaction {
	db_exec_plsql delete_annonce {
	    SELECT annonce__delete(:annonce_id);
	}
    }

    return 0
}


ad_proc -public 1c_annonce::get_categories {
    {-package_id ""}
} {
    Returns cateogories
} {

    ns_log Notice "Running ad_proc 1c_annonce::get_categories"
    set locale [ad_conn locale]
    set category_trees [category_tree::get_mapped_trees $package_id]

    if {[exists_and_not_null category_trees]} {

	set tree_id [lindex [lindex $category_trees 0] 0]
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


ad_proc -public 1c_annonce::category_get_options {
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



ad_proc -public 1c_annonce::get_fs_package_id {
} {
    Return the package_id of the filestorage instance that documents runs
} {
    
    db_1row select_package_id {
	select object_id FROM site_nodes WHERE name = 'file-storage';
    }

    return $object_id

}



ad_proc -public 1c_mandat::annonce::add_file {
    {-tmp_filename:required}
    {-parent_id:required}
} {
    Adds announce files/images 
} {

    set file_id [db_nextval "acs_object_id_seq"]
    

    ns_log Notice "TMP FILE $tmp_filename"
    if {[exists_and_not_null tmp_filename]} {
	
	set n_bytes [file size $tmp_filename]
	ns_log Notice "$n_bytes"

	set guessed_file_type [ns_guesstype $tmp_filename]
	set suggest_name [lang::util::suggest_key $name]

	set revision_id [cr_import_content \
			     -item_id $file_id \
			     -storage_type file \
			     -creation_user $user_id \
			     -creation_ip $creation_ip \
			     -description $description \
			     -package_id $package_id \
			     $parent_id \
			     $tmp_filename \
			     $n_bytes \
			     $guessed_file_type \
			     annonce-$package_id-$user_id-$suggest_name-$n_bytes]
	
	ns_log Notice "RVID $revision_id"
	
	item::publish -item_id $file_id -revision_id $revision_id
    }
    
	return 
}







ad_proc -public 1c_annonce::annonce::add {
    {-item_id ""}
    {-type_of_transaction ""}
    {-type_of_property ""}
    {-other_property ""}
    {-type_of_commerce ""}
    {-type_of_activity ""}
    {-type_of_residence ""}
    {-type_of_announcer ""}
    {-available_date ""}
    {-title ""}
    {-ref_code ""}
    {-room_qty ""}
    {-lavatory_qty ""}
    {-bathroom_qty ""}
    {-floor ""}
    {-rent_price ""}
    {-rent_taxes ""}
    {-surface ""}
    {-auto_commission_p ""}
    {-on_demand_p ""}
    {-description ""}
    {-status ""}
    {-terms_conditions_p ""}
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
	

	db_transaction {
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
	    
	    db_exec_plsql insert_annonce {
		SELECT annonce__new(
				    :item_id,
				    :ref_code,
				    :type_of_transaction,
				    :type_of_property,
				    :type_of_residence,
				    :type_of_commerce,
				    :type_of_activity,
				    :other_property,
				    :type_of_announcer,
				    :available_date,
				    :room_qty,
				    :lavatory_qty,
				    :bathroom_qty,
				    :floor,
				    :rent_price,
				    :rent_taxes,
				    :surface,
				    :auto_commission_p,
				    :on_demand_p,
				    :status,
				    :terms_conditions_p);
	    }
	}
	
	
    }	
    
    return $item_id
}


    
ad_proc -public 1c_annonce::annonce::edit {
    {-item_id ""}
    {-type_of_transaction ""}
    {-type_of_property ""}
    {-other_property ""}
    {-type_of_commerce ""}
    {-type_of_residence ""}
    {-type_of_activity ""}
    {-type_of_announcer ""}
    {-title ""}
    {-ref_code ""}
    {-available_date ""}
    {-room_qty ""}
    {-lavatory_qty ""}
    {-bathroom_qty ""}
    {-floor ""}
    {-rent_price ""}
    {-rent_taxes ""}
    {-surface ""}
    {-auto_commission_p ""}
    {-on_demand_p ""}
    {-description ""}
    {-status ""}
    {-terms_conditions_p ""}
} {
    it edits annonce
} {

    
    
    db_exec_plsql annonce_edit {

	SELECT annonce__edit(
			     :item_id,
			     :type_of_transaction,
			     :type_of_property,
			     :other_property,
			     :type_of_commerce,
			     :type_of_residence,
			     :type_of_activity,
			     :type_of_announcer,
			     :ref_code,
			     :available_date,
			     :room_qty,
			     :lavatory_qty,
			     :bathroom_qty,
			     :floor,
			     :rent_price,
			     :rent_taxes,
			     :surface,
			     :auto_commission_p,
			     :on_demand_p,
			     :status,
			     :terms_conditions_p);
    }
    
    return
}


