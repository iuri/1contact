ad_page_contract {}



template::multirow create announcements image_url matching_index type_of_transaction type_of_property

db_multirow -extend {image_url}  announcements select_announcements {

    SELECT cr.title, cr.description, a.*, r.type_of_property
    FROM annonces a
     JOIN cr_revisions cr ON item_id = a.annonce_id
    JOIN realties r ON r.realty_id = a.annonce_id
    

    

} {

    
    
    set image_url "resources/images/house.jpg"
    
    set matching_index "95%"
    
    template::multirow append announcements $image_url $matching_index $type_of_transaction $type_of_property
    
}
