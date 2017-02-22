# /packages/1c-mandat/tcl/1c-mandat-api-procs.tcl
ad_library {
    Library to support the 1Contact procs

     @author Iuri Sampaio [iuri@iurix.com]
     @creation-date Mon Sep 12 17:35:01 2016
     @cvs-id $Id: ix-ndc-procs.tcl,v 0.1d 
}


namespace eval 1c_mandat {}

namespace eval 1c_mandat::mandat {}



ad_proc -public 1c_mandat::mandat::delete {
    mandat_id
} {
    Delete a mandat
} {

    db_transaction {
	db_exec_plsql 1c_mandat__delete {
	    SELECT mandat__delete (
				   :mandat_id
				  );
	}
    }
    
    return 
}



ad_proc -public 1c_mandat::get_categories {
    {-package_id ""}
} {
    Returns cateogories
} {

    ns_log Notice "Running ad_proc 1c_mandat::get_categories"
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


ad_proc -public 1c_mandat::category_get_options {
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





ad_proc -public 1c_mandat::mandat::edit {
    {-mandat_id ""}
    {-type_of_transaction ""}
    {-type_of_property ""}
    {-type_of_commerce ""}
    {-type_of_residence ""}
    {-code ""}
    {-room_qty ""}
    {-surface_min ""}
    {-budget_min ""}
    {-budget_max ""}
    {-searching_motive ""}
    {-remarks1 ""} 
    {-remarks2 ""}
    {-confirmation ""}
    {-origin ""}
    {-origin_other ""}
    {-payment_p ""}
    {-status ""}
    {-lchars ""}
    {-other_chars ""}
    {-terms_conditions_p ""}
} {
    Edits mandat info
} {

    db_transaction {

	content::revision::new \
	    -item_id $mandat_id \
	    -title $code \
	    -description "$remarks1\nremarks2\n\n$searching_motive"
	

	db_exec_plsql mandat_edit {

	    SELECT mandat__edit(
			       :mandat_id,
			       :type_of_transaction,
			       :type_of_property,
			       :type_of_commerce,
			       :type_of_residence,
			       :code,
			       :room_qty,
			       :surface_min,
			       :budget_min,
			       :budget_max,
			       :searching_motive,
			       :remarks1,
			       :remarks2,
			       :confirmation,
			       :origin,
			       :origin_other,
			       :payment_p,
			       :status,
			       :lchars,
			       :other_chars,
			       :terms_conditions_p);
	    
	}
	
    }

    
    return 0
    
    
}



ad_proc 1c_mandat::mandat::publish {
    It publishes a mandat
} {
    {-item_id:required}
    {-revision_id:optional}
} {
    
    item::publish -item_id $item_id -revision_id $revision_id
}


ad_proc 1c_mandat::mandat::add {
    {-mandat_id ""}
    {-type_of_transaction ""}
    {-type_of_property ""}
    {-type_of_residence ""}
    {-type_of_commerce ""}
    {-code ""}
    {-room_qty ""}
    {-surface_min ""}
    {-budget_min ""}
    {-budget_max ""}
    {-searching_motive ""}
    {-remarks1 ""} 
    {-remarks2 ""}
    {-confirmation ""}
    {-origin ""}
    {-origin_other ""}
    {-payment_p ""}
    {-status ""}
    {-lchars ""}
    {-other_chars ""}
    {-terms_conditions_p:required}
    {-creation_user ""}
    {-creation_ip ""}
    {-context_id ""}
} {
    ad_proc to add a new mandat 

    @author Iuri Sampaio
} {



#    set link [util_text_to_url -replacement "" -text $link]
   

    if {$creation_ip == ""} {
	set creation_ip [ad_conn peeraddr]
    }
    
    if {$creation_user == ""} {
	set creation_user [ad_conn user_id]
    }
     
    if {$context_id == ""} {
	set context_id [ad_conn package_id]
    }

    db_transaction {
	if {![exists_and_not_null mandat_id]} {
	    set mandat_id [db_nextval "acs_object_id_seq"]
	    content::item::new \
		-item_id $mandat_id \
		-name "mandat-$mandat_id" \
		-parent_id $context_id \
		-content_type "mandat_object" \
		-package_id $context_id \
		-creation_user $creation_user \
		-creation_ip $creation_ip 
	}
	
	db_exec_plsql insert_mandat {
	    SELECT mandat__new(
			       :mandat_id,
			       :type_of_transaction,
			       :type_of_property,
			       :type_of_residence,
			       :type_of_commerce,
			       :code,
			       :room_qty,
			       :surface_min,
			       :budget_min,
			       :budget_max,
			       :searching_motive,
			       :remarks1,
			       :remarks2,
			       :confirmation,
			       :origin,
			       :origin_other,
			       :payment_p,
			       :status,
			       :lchars,
			       :other_chars,
			       :terms_conditions_p);
	}
    }
    
    
    return $mandat_id
}

