ad_page_contract {
    This script shows confirmation page & shipping address.

    @author Eve Andersson (eveander@arsdigita.com)
    @creation-date Summer 1999
    @author ported by Jerry Asher (jerry@theashergroup.com)
    @author revised by Bart Teeuwisse (bart.teeuwisse@thecodemill.biz)
    @revision-date April 2002

} {
    order_id:integer,notnull
    all_items_p:optional
    item_id:multiple,optional,integer
    shipment_date:array,date
    shipment_time:array,time
    expected_arrival_date:optional,array,date
    expected_arrival_time:optional,array,time
    {carrier ""}
    {carrier_other ""}
    {tracking_number ""}
}

ns_set print [ns_getform]

ad_require_permission [ad_conn package_id] admin

auth::require_login

set customer_service_rep [ad_get_user_id]

if { ![empty_string_p $carrier_other] } {
    set carrier $carrier_other
}

set temp_shipment_date $shipment_date(date)
if { [exists_and_not_null shipment_time(time)] } {
    set shipment_time(time) [ec_timeentrywidget_time_check $shipment_time(time)]
    append temp_shipment_date " $shipment_time(time)$shipment_time(ampm)"
} else {
    append temp_shipment_date " 12:00:00AM"
}

set temp_expected_arrival_date ""
if { [exists_and_not_null expected_arrival_date(date)] } {
    append temp_expected_arrival_date $expected_arrival_date(date)
    if { [exists_and_not_null expected_arrival_time(time)] } {
        set expected_arrival_time(time) [ec_timeentrywidget_time_check $expected_arrival_time(time)]
        append temp_expected_arrival_date " $expected_arrival_time(time)$expected_arrival_time(ampm)"
    } else {
        append temp_expected_arrival_date " 12:00:00AM"
    }
}

set shippable_p [ec_decode [db_string shipping_method_select "select shipping_method
    from ec_orders
    where order_id=:order_id"] "no shipping" 0 1]
if { $shippable_p } {
    if { ![empty_string_p $carrier_other] } {
        set carrier $carrier_other
    }
}

set exception_count 0
set exception_text ""

# Customer rep must have either checked "All items" and none of the
# rest, or at least one of the rest and not "All items". Shipment_date
# must be filled in too.

if { [info exists all_items_p] && [info exists item_id] } {
    incr exception_count
    append exception_text "<li>Please check either \"All items\" or some of the items, but not both.</li>"
}
if { ![info exists all_items_p] && ![info exists item_id] } {
    incr exception_count
    append exception_text "<li>Please check either \"All items\" or some of the items, but not both.</li>"
}

if { $exception_count > 0 } {
    ad_return_complaint 1 $exception_text
    return
}

set title "Confirm that these item(s) have been [ec_decode $shippable_p 1 "shipped" "fulfilled"]"
set context [list [list index "Orders / Shipments / Refunds"] $title]

set shipment_id [db_nextval ec_shipment_id_sequence]

if { [info exists item_id] && ![empty_string_p $item_id] } {
    set selected_items [join $item_id ", "]
    set sql  [db_map selected_items_select]
} else {
    set sql [db_map all_items_select]
}

# Generate a list of the items even if "All items" has been selected
# because, regardless of what happens elsewhere on the site (e.g. an
# item is added to the order, thereby causing the query for all items
# to return one more item), only the items that they confirm here to
# be recorded should become part of this shipment.

if { [info exists all_items_p] } {
    set item_id_list [list]
}

set items_to_print ""
db_foreach get_items_to_ship $sql {

    if { [info exists all_items_p] } {
        lappend item_id_list $item_id
    }

    set option_list [list]
    if { ![empty_string_p $color_choice] } {
        lappend option_list "Color: $color_choice"
    }
    if { ![empty_string_p $size_choice] } {
        lappend option_list "Size: $size_choice"
    }
    if { ![empty_string_p $style_choice] } {
        lappend option_list "Style: $style_choice"
    }
    set options [join $option_list ", "]

    append items_to_print "<li> $product_name; [ec_decode $options "" "" "$options; "]$price_name: [ec_pretty_pure_price $price_charged]</li>"
}

if { [info exists all_items_p] } {
    set item_id $item_id_list
}

set export_form_vars_html [export_form_vars shipment_id order_id item_id carrier tracking_number]

set temp_shipment_date_html [ec_formatted_date $temp_shipment_date]

if { $shippable_p } {
    set shipment_date_html "[ec_formatted_date $temp_shipment_date]
	      [ec_decode $temp_expected_arrival_date "" "" "<li>Expected arrival date: [ec_formatted_date $temp_expected_arrival_date]</li>"]
	      [ec_decode $carrier "" "" "<li>Carrier: $carrier</li>"]
	      [ec_decode $tracking_number "" "" "<li>Tracking Number: $tracking_number</li>"]"
    set shipment_to_html "[ec_display_as_html [ec_pretty_mailing_address_from_ec_addresses \
	     [db_string get_pretty_mailing_address "select shipping_address from ec_orders where order_id=:order_id"]]]"
}

db_release_unused_handles

