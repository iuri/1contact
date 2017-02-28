ad_page_contract {

    @param refund_id
    @param order_id
    @param received_back_date
    @param reason_for_return
    @param item_id_list 
    @param price_to_refund(item_id) for each item_id,
    @param shipping_to_refund(item_id) for each item_id, 
    @param base_shipping_to_refund

    @author
    @creation-date
    @author ported by Jerry Asher (jerry@theashergroup.com)
    @author revised by Bart Teeuwisse (bart.teeuwisse@thecodemill.biz)
    @revision-date April 2002

} {
    refund_id:notnull,naturalnum
    order_id:notnull,naturalnum
    received_back_datetime
    reason_for_return
    item_id_list
    price_to_refund:array
    shipping_to_refund:array
    base_shipping_to_refund
}

# The customer service rep must be logged on

ad_require_permission [ad_conn package_id] admin
set customer_service_rep [ad_get_user_id]

# Error checking: Make sure price_to_refund($item_id) is <=
# price_charged for that item same with shipping. Make sure
# base_shipping_to_refund is <= base shipping charged - refunded
# Make sure they haven't already inserted this refund

if { [db_string get_count_refunds "
	select count(*) 
	from ec_refunds 
	where refund_id=:refund_id"] > 0 } {
    ad_return_complaint 1 "
	<li>This refund has already been inserted into the database.Are you using an old form?  <a href=\"one?[export_url_vars order_id]\">Return to the order.</a>"
    return
}

set exception_count 0
set exception_text ""

# Add up the items' price/shipping/tax to refund as we go

set total_price_to_refund 0
set total_shipping_to_refund 0
set total_price_tax_to_refund 0
set total_shipping_tax_to_refund 0

db_foreach get_items_for_return "
    select i.item_id, p.product_name, nvl(i.price_charged,0) as price_charged, nvl(i.shipping_charged,0) as shipping_charged, 
        nvl(i.price_tax_charged,0) as price_tax_charged, nvl(i.shipping_tax_charged,0) as shipping_tax_charged
    from ec_items i, ec_products p
    where i.product_id=p.product_id
    and i.item_id in ([join $item_id_list ", "])" {
    
    if { [empty_string_p $price_to_refund($item_id)] } {
	incr exception_count
	append exception_text "<li>Please enter a price to refund for $product_name."
    } elseif {[regexp {[^0-9\.]} $price_to_refund($item_id)]} {
	incr exception_count
	append exception_text "<li>Please enter a purely numeric price to refund for $product_name (no letters or special characters)."
    } elseif { $price_to_refund($item_id) > $price_charged } {
	incr exception_count
	append exception_text "<li>Please enter a price to refund for $product_name that is less than or equal to [ec_pretty_pure_price $price_charged]."
    } else {
	set total_price_to_refund [expr $total_price_to_refund + $price_to_refund($item_id)]

	# Tax will be the minimum of the tax actually charged and the
	# tax that would have been charged on the price to refund (tax
	# rates may have changed in the meantime and we don't want to
	# refund more than they paid)

	set tax_price_to_refund $price_to_refund($item_id)
	set iteration_price_tax_to_refund [ec_min $price_tax_charged [db_string get_ec_tax "
	    select coalesce(ec_tax(:tax_price_to_refund,0,:order_id),0) 
	    from dual"]]
	set total_price_tax_to_refund [expr $total_price_tax_to_refund + $iteration_price_tax_to_refund]
    }

    if { [empty_string_p $shipping_to_refund($item_id)] } {
	incr exception_count
	append exception_text "<li>Please enter a shipping amount to refund for $product_name."
    } elseif {[regexp {[^0-9\.]} $shipping_to_refund($item_id)]} {
	incr exception_count
	append exception_text "<li>Please enter a purely numeric shipping amount to refund for $product_name (no letters or special characters)."
    } elseif { $shipping_to_refund($item_id) > $shipping_charged } {
	incr exception_count
	append exception_text "<li>Please enter a shipping amount to refund for $product_name that is less than or equal to [ec_pretty_pure_price $shipping_charged]."
    } else {
	set total_shipping_to_refund [expr $total_shipping_to_refund + $shipping_to_refund($item_id)]

	set iteration_shipping_tax_to_refund [ec_min $shipping_tax_charged [db_string get_it_shipping_tax_refund "
	    select coalesce(ec_tax(0,$shipping_to_refund($item_id), $order_id),0) 
	    from dual"]]
	set total_shipping_tax_to_refund [expr $total_shipping_tax_to_refund + $iteration_shipping_tax_to_refund]
    }
}

db_1row get_shipping_charged_values "
    select nvl(shipping_charged,0) - nvl(shipping_refunded,0) as base_shipping, 
	nvl(shipping_tax_charged,0) - nvl(shipping_tax_refunded,0) as base_shipping_tax 
    from ec_orders 
    where order_id=:order_id"

if { [empty_string_p $base_shipping_to_refund] } {
    incr exception_count
    append exception_text "<li>Please enter a base shipping amount to refund."
} elseif {[regexp {[^0-9\.]} $base_shipping_to_refund]} {
    incr exception_count
    append exception_text "<li>Please enter a purely numeric base shipping amount to refund (no letters or special characters)."
} elseif { $base_shipping_to_refund > $base_shipping } {
    incr exception_count
    append exception_text "<li>Please enter a base shipping amount to refund that is less than or equal to [ec_pretty_pure_price $base_shipping]."
} else {
    set total_shipping_to_refund [expr $total_shipping_to_refund + $base_shipping_to_refund]
    set iteration_shipping_tax_to_refund [ec_min $base_shipping_tax [db_string get_base_shipping_it_refund "
	select coalesce(ec_tax(0,:base_shipping,:order_id),0) 
	from dual"]]
    set total_shipping_tax_to_refund [expr $total_shipping_tax_to_refund + $iteration_shipping_tax_to_refund]
}

if { $exception_count > 0 } {
    ad_return_complaint $exception_count $exception_text
    return
}

set total_tax_to_refund [expr $total_price_tax_to_refund + $total_shipping_tax_to_refund]
set total_amount_to_refund [expr $total_price_to_refund + $total_shipping_to_refund + $total_tax_to_refund]

# Determine how much of this will be refunded in cash

set cash_amount_to_refund [db_string get_cash_refunded "
    select nvl(ec_cash_amount_to_refund(:total_amount_to_refund,:order_id),0) 
    from dual"]

# Calculate gift certificate amount and tax to refund

set certificate_amount_to_reinstate [expr $total_amount_to_refund - $cash_amount_to_refund]
if { $certificate_amount_to_reinstate < 0 } {

    # Because of rounding

    set certificate_amount_to_reinstate 0
}

# See if the credit card data is still in the database. If not the
# credit card number has to be re-entered.

if {![db_0or1row get_billing_info "
    select c.creditcard_id, c.creditcard_type, c.creditcard_last_four,
	substring(creditcard_expire for 2) as card_exp_month, substring(creditcard_expire from 4 for 2) as card_exp_year, 
	p.first_names || ' ' || p.last_name as card_name,
	a.line1 as billing_street, a.city as billing_city, a.usps_abbrev as billing_state, a.zip_code as billing_zip, a.country_code as billing_country
    from ec_orders o, ec_creditcards c, persons p, ec_addresses a 
    where o.creditcard_id = c.creditcard_id
    and c.billing_address = a.address_id 
    and c.user_id = p.person_id
    and o.order_id=:order_id"]} {
    
    set creditcard_number ""
    set creditcard_id ""
    set creditcard_type ""
    set creditcard_last_four ""
    set card_expiration ""
    set card_name ""
    set billing_street ""
    set billing_state ""
    set billing_zip ""
    set billing_country ""
}

set title "Refund Totals"
set context [list [list index "Orders / Shipments / Refunds"] $title]

set export_form_vars_html "[export_entire_form] [export_form_vars cash_amount_to_refund certificate_amount_to_reinstate]"

set total_amount_to_refund_html [ec_pretty_pure_price $total_amount_to_refund]
set total_price_to_refund_html [ec_pretty_pure_price $total_price_to_refund]
set total_shipping_to_refund_html [ec_pretty_pure_price $total_shipping_to_refund]
set total_tax_to_refund_html [ec_pretty_pure_price $total_tax_to_refund]

set certificate_amount_to_reinstate_html [ec_pretty_pure_price $certificate_amount_to_reinstate]
set cash_amount_to_refund_html [ec_pretty_pure_price $cash_amount_to_refund]

# Request the credit card number to be re-entered if it is no longer
# on file, yet there is money to refund.
set request_creditcard [expr { [empty_string_p $creditcard_number] && $cash_amount_to_refund > 0 } ] 
if { $request_creditcard } {
    set creditcard_widget_html [ec_creditcard_widget $creditcard_type disabled]
} else {
    set export_form_vars_2_html [export_form_vars creditcard_id creditcard_number]
}

set export_form_vars_cc_type_html [export_form_vars creditcard_type]
set export_form_vars_last_4_html [export_form_vars creditcard_last_four]
set ask_for_card_code [parameter::get -package_id [ec_id] -parameter PaymentCardCodeAsk -default 0]
