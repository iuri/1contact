ad_page_contract {
}

template::multirow create \
    announcements \
    item_id \
    title \
    ref_code \
    type_of_transaction \
    type_of_property \
    price \
    taxes \
    room_qty \
    lavatory_qty \
    bathroom_qty \
    floor_qty \
    inner_surface \
    outer_surface \
    charac_required \
    neighborhood \
  


db_foreach announcements {

    SELECT
    cr.item_id,
    cr.title,
    a.ref_code,
    CASE a.type_of_transaction
      WHEN '1' THEN 'Rent'
      WHEN '2' THEN 'Purchase'
    END AS type_of_transaction,
    CASE r.type_of_property
      WHEN '1' THEN 'Residential'
      WHEN '2' THEN 'Commercial'
    END AS type_of_property,
    a.price,
    a.taxes,
    r.room_qty,
    r.lavatory_qty,
    r.bathroom_qty,
    r.floor_qty,
    r.inner_surface,
    r.outer_surface,
    r.charac_required,
    r.neighborhood
    FROM annonces a
    LEFT JOIN realties r ON r.realty_id = a.realty_id
    LEFT JOIN cr_revisions cr ON cr.item_id = a.annonce_id
    
} {

    ns_log Notice "$item_id \n"
   
    template::multirow append \
	announcements \
	$item_id \
	$title \
	$ref_code \
	$type_of_transaction \
	$type_of_property \
	$price \
	$taxes \
	$room_qty \
	$lavatory_qty \
	$bathroom_qty \
	$floor_qty \
	$inner_surface \
	$outer_surface \
	$charac_required \
	$neighborhood \

}
