ad_page_contract {}

set count 0

template::multirow create \
    announcements \
    id \
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
    count 
  


db_multirow -extend {count image_url} announcements select_announcements {

    SELECT
    cr.item_id,
    cr.title,
    a.ref_code,
    CASE a.type_of_transaction
      WHEN '1' THEN 'Rent'
      WHEN '2' THEN 'Purchase'
    END AS type_of_transaction,
    CASE r.type_of_property
      WHEN '1' THEN 'House'
      WHEN '2' THEN 'Appartment'
      WHEN '3' THEN 'Commerce'
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
    
    set matching_index "95%"

    ns_log Notice "$charac_required"

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
	$count

    if {$count > 1} {
        set count 0
    }
    incr $count

}
