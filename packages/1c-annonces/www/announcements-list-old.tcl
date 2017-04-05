ad_page_contract {}

set count 0

template::multirow create \
    announcements \
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
    count \
    transact


db_multirow -extend {count image_url transact} announcements select_announcements {

    SELECT
    cr.title,
    a.ref_code,
    a.type_of_transaction,
    r.type_of_property,
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
    JOIN realties r ON r.realty_id = a.realty_id
    JOIN cr_revisions cr ON cr.item_id = a.annonce_id

} {

    set image_url "resources/images/house.jpg"

    set matching_index "95%"

    switch type_of_transaction {
        1 { set transact "Rent" }
        2 { set transact "Sell" }
    }

    template::multirow append \
	announcements \
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
