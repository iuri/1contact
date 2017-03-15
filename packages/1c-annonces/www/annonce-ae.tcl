ad_page_contract {
    
    Add/Edit Annonce Requirement
    
} {
    {annonce_id ""}
    {title ""}
    {reference ""}
    {status ""}
    {new.x:optional}
    {edit.x:optional}
    {return_url ""}
}
	

if { [exists_and_not_null annonce_id] } {
    set page_title [_ 1c-annonce.Edit_annonce]
    #set ad_form_mode display
} else {
    set page_title [_ 1c-annonce.Add_annonce]
    #set ad_form_mode edit
}


if {[info exists new.x]} { 

#    set date "$announce_date(year) $announce_date(month) $announce_date(day)"
    
    set annonce_id [1c_annonce::new \
			  -annonce_title $title \
			  -creation_ip  [ad_conn peeraddr] \
			  -creation_user [ad_conn user_id] \
			  -context_id [ad_conn package_id] \
			 ]
    
    ad_returnredirect [export_vars -base "annonce-ae-2" {return_url announce_id}]
    
}




if {$annonce_id != ""} {
    set submit_name "edit"
    set submit_value "#1c-annonce.Edit#"
} else {

    set submit_name "new"
    set submit_value "#1c-annonce.New#"
}





