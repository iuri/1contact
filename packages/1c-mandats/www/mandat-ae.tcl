ad_page_contract {
    This page allows the users to add new mandats to the system.
} {
    mandat_id:optional
    {return_url ""}
    {saddr ""}
    {daddr "Paquis-Navigation"}
    {lat ""}
    {lng ""}
    {txtLatitude ""}
    {txtLongitude ""}
    {txtEndereco ""}
    {btnEndereco ""}
}
 


template::head::add_javascript -src "http://maps.googleapis.com/maps/api/js?key=AIzaSyCXIA8FKkhrZO2Iyn-gNvoPZMqqN09ZlwI&amp;sensor=false" -order 0
template::head::add_javascript -src "/resources/1c-mandat/js/jquery.min.js" -order 1 
template::head::add_javascript -src "/resources/1c-mandat/js/jquery-ui.custom.min.js" -order 3 
template::head::add_css -href "http://fonts.googleapis.com/css?family=Open+Sans:600"
template::head::add_css -href "/resources/1c-mandat/css/estilo.css"
template::head::add_javascript -src "/resources/1c-mandat/js/mapa.js" -order 2


set page_title "Add/Edit Mandat"
set user_id [ad_conn user_id]
set package_id [ad_conn package_id]



ad_form -has_submit 1 -name mandat-ae -export { user_id } -form {
    {mandat_id:key}
    {inform1:text(inform) {label "<h1>Add/Edit Mandat</h1>"}}
    {type_of_transaction:text(select) {label "Type of Transaction"}
	{options { {"Sélectionner" ""} {"Achat" "a"} {"Location" "l" }}}
    }
    {type_of_property:text(select) {label "Type de Propriéte"}
	{options { {"Sélectionner" ""} {"Commerce" "c"} {"Logement" "l"} }}
    }
    {link:text(text) {label "Link"}}
    {file_p:boolean(select) {label "Charger un fichier?"}
	{options {{"Sélectionner" "-1"} {"Oui" "1"} {"Non" "0"}}}
    }
    {remarks1:text(textarea) {label "Remarks 1"}}
    {remarks2:text(textarea) {label "Remarks 2"}}
    {confirmation:text(textarea) {label "Confirmartion"}}
    {origin:text(select) {label "Provenance"}
	{options { 
	    {"Sélectionner" "0"} {"Agent" "1"} {"Internet" "2"} 
	    {"Boite aux Lettres" "3"} {"Recommandation" "4"} {"Autre" "5"} }}
    }
    {origin_other:text(text) {label "Détail Provenance"}}
    {payment_p:boolean(select) {label "Payment"}
	{options {{"Sélectionner" "0"} {"Oui" "1"} {"Non" "0"}}}
    }
    {status:text(select) {label "Status"}
	{options { {"Sélectionner" ""} {"Inactif" "i"} {"Actif" "a"} {"Términer" "t" }}}
    }

}


ad_form -extend -name mandat-ae -form {
    {inform2:text(inform) {label "<h2>Region de Recherche</h2>"}}
    {txtLatitude:text(hidden) {value ""} }
    {txtLongitude:text(hidden) {value ""}}
    {txtEndereco:text(text) {label "Endereço"} }
    {btnEndereco:text(button) {label ""} {value "Mostrar Mapa"}}
    {mapa:text(inform) {label ""} {value "<div id=\"mapa\"></div>"}}
}


set i 0
ad_form -extend -name mandat-ae -form {
    {inform3:text(inform) {label "<h2>#1c_mandat.Characteristics_required#</h2>"}}
    {char_req1:text(select) {label "#1c_mandat.Furniture#"}
	{options { {"#1c_mandat.Select#" ""} {"#1c_mandat.Yes#" "$i"} {"#1c_mandat.No#" "0"} {"#1c_mandat.Indifferent#" "99"}}}
    }
    {char_req2:text(select) {label "#1c_mandat.Elevator"}
	{options { {"#1c_mandat.Select#" ""} {"#1c_mandat.Yes#" "$i"} {"#1c_mandat.No#" "0"} {"#1c_mandat.Indifferent#" "99"}}}
    }
}






ad_form -extend -name mandat-ae -form {
    {return_url:text(hidden)
	{value $return_url}
    }
    {terms_conditions_p:boolean(checkbox) {label "Terms and Conditions"}
	{options {{"I accept the terms and references" "1"}}}
    }
} -on_submit {
    

} -new_data {
    
    set mandat_id [1c_mandat::mandat::new \
		       -type_of_transaction $type_of_transaction \
		       -type_of_property $type_of_property \
		       -file_p $file_p \
		       -remarks1 $remarks1 \
		       -remarks2 $remarks2 \
		       -confirmation $confirmation \
		       -origin $origin \
		       -origin_other $origin_other \
		       -payment_p $payment_p \
		       -status $status \
		       -link $link \
		       -terms_conditions_p $terms_conditions_p \
 		       -creation_ip [ad_conn peeraddr] \
		       -creation_user $user_id \
		       -context_id $package_id
		    ]

} -edit_request {

    db_1row select_mandat_info {
	SELECT m.link, m.remarks1, m.remarks2, m.payment, m.status, m.creation_user
	FROM 1c_mandats m
	WHERE 1c.mandat_id = :mandat_id
    }

} -edit_data {

'    1c_mandat::mandat::edit \
	-link $link \
	-remarks1 $remarks1 \
	-remarks2 $remarks2 \
	-payment_p $payment_p \
	-status $status \
	-terms_conditions_p $terms_conditions_p \
	-creation_ip [ad_conn peeraddr] \
	-creation_user $user_id \
	-context_id $package_id
    
    
    
} -after_submit {

    ad_returnredirect $return_url
    ad_script_abort
}







ad_form -has_submit 1 -name mcategory -form {
    {id:key}
    {category_ids:integer(category),multiple,optional {label ""}
	{html {size 4}} {value 419464 419464}}
    {return_url:text(hidden)
        {value $return_url}
    }
}
