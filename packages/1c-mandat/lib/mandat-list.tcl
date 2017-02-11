

template::list::create \
    -name mandats \
    -multirow mandats \
    -actions { "Add a Mandat" mandat-edit} \
    -elements {
	edit {
	    link_url_col edit_url
	    display_template {
		<img src="/resources/acs-subsite/Edit16.gif" width="16" height="16">
	    }
	    sub_class narrow
	}
	code {
	    label "#1c-mandat.Code#"
	}
	type_of_transaction {
	    label "#1c-mandat.Type_of_Transaction#"
	}
       	actions {
	    link_url_col delete_url
	    display_template {
		<img src="/resources/acs-subsite/Delete16.gif" width="16" height =”16”>
	    }
	    sub_class narrow
	}
    }


db_multirow  -extend {
    mandat_url
    delete_url
} mandats mandats_select {
    SELECT ci.item_id, m.code, m.type_of_transaction FROM cr_items ci, mandats m  WHERE m.mandat_id = ci.item_id
} {
    set edit_url [export_vars -base "mandat-edit" {item_id}]
    set delete_url [export_vars -base "mandat-delete" {item_id return_url}]

    
}
