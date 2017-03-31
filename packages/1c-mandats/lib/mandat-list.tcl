

template::list::create \
    -name mandats \
    -multirow mandats \
    -actions { "#1c-mandats.Add_Mandat#" mandat-edit} \
    -elements {
	edit {
	    link_url_col edit_url
	    display_template {
		<img src="/resources/acs-subsite/Edit16.gif" width="16" height="16">
	    }
	    sub_class narrow
	}
	code {
	    label "[_ 1c-mandats.Code]"
	}
	type_of_transaction_pretty {
	    label "[_ 1c-mandats.Type_of_Transaction]"
	}
       	actions {
	    label "[_ 1c-mandats.Actions]"
	    display_template {
		<a href="@mandats.delete_url@"><img src="/resources/acs-subsite/Delete16.gif" width="16" height =”16”></a>
		<a href="@mandats.matching_url@">Matching</a>
	    }
	    sub_class narrow
	}
    }


db_multirow  -extend {
    edit_url
    delete_url
    matching_url
    type_of_transaction_pretty
    type_of_property_pretty    
} -unclobber mandats mandats_select {
    SELECT m.mandat_id, m.code, m.type_of_transaction, m.type_of_property FROM cr_items ci, mandats m  WHERE m.mandat_id = ci.item_id
} {
    set edit_url [export_vars -base "mandat-edit" {mandat_id}]
    set delete_url [export_vars -base "mandat-delete" {mandat_id return_url}]
    set matching_url [export_vars -base "mandat-matching" {mandat_id return_url}]

    
    switch $type_of_transaction_pretty {
	"a" {
	    set type_of_transaction_pretty [lang::util::localize "[_ 1c-mandats.Achat]"] 
	}

	"p" {
	    set type_of_transaction_pretty [lang::util::localize "[_ 1c-mandats.Purchase]"] 
	}
	default {
	    set type_of_transaction_pretty [lang::util::localize "[_ 1c-mandats.No_message]"] 
	}
    }
    
    switch $type_of_property {
	c {
	    set type_of_property_pretty [lang::util::localize "1c-mandats.Commerce"] 
	}
	r {
	    set type_of_property_pretty [lang::util::localize "Residence"] 
	}
    }
}
