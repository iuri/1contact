ad_page_contract {
    @param order_id The ID of the order
    @param submit What action to take
    @param discard_confirmed_p Discard is confirmed or not
    @param usca_p User session begun or not

    @author
    @creation-date
    @author ported by Jerry Asher (jerry@theashergroup.com)
    @author revised by Bart Teeuwisse (bart.teeuwisse@thecodemill.biz)
    @revision-date April 2002

} { 
    order_id:notnull,naturalnum
    submit:notnull
    discard_confirmed_p:optional
    usca_p:optional
}

# This script performs five functions, depending on which submit
# button the user pushed.  It either displays the contents of a cart,
# retrieves a cart (no current cart to get in the way), merges a saved
# cart with a current cart, replaces a current cart with a saved cart,
# or discards a saved cart.

# We need them to be logged in

set user_id [ad_conn user_id]
if {$user_id == 0} {
    set return_url "[ad_conn url]"
    ad_returnredirect "/register?[export_url_vars return_url]"
    ad_script_abort
}

# Make sure order exists (they might have discarded it then pushed
# back)

if { 0 == [db_string get_order_exists_p "
    select count(*) 
    from ec_orders 
    where order_id=:order_id"] } {
    rp_internal_redirect shopping-cart
    ad_script_abort
}

set ec_system_owner [ec_system_owner]

# Make sure this order is theirs

set order_theirs_p [db_string get_order_is_theirs "
    select count(*) 
    from ec_orders 
    where order_id=:order_id 
    and user_id=:user_id"]

if { !$order_theirs_p } {
    set page_function "invalid_order"
    set page_title "Invalid Order"
    ad_return_template
    return
}

# Make sure the order is still a "saved shopping basket", otherwise
# they may have have gotten here by pushing "Back"

if { 0 == [db_string confirm_have_basket "
    select count(*) 
    from ec_orders 
    where order_id=:order_id 
    and order_state='in_basket' 
    and saved_p='t'"] } {
    rp_internal_redirect "shopping-cart"
    ad_script_abort
}

# End security checks

set user_session_id [ec_get_user_session_id]
ec_create_new_session_if_necessary [export_url_vars order_id submit discard_confirmed_p] shopping_cart_required

# Possible values of submit:
# View, Retrieve, Merge, Replace, Discard

if { $submit == "View" } {
    set page_title "Your Saved Shopping Cart"
    set page_function "view"
    set shopping_cart_items ""
    set hidden_form_variables [export_form_vars order_id]
    set saved_date [db_string get_saved_date "
	select to_char(in_basket_date,'Month DD, YYYY') as formatted_in_basket_date 
	from ec_orders 
	where order_id=:order_id"]
    set product_counter 0

    db_foreach get_saved_shopping_cart "
	select p.product_name, p.one_line_description, p.product_id, i.color_choice, i.size_choice, i.style_choice, count(*) as quantity
    	from ec_orders o, ec_items i, ec_products p
    	where i.product_id=p.product_id
    	and o.order_id=i.order_id
    	and o.order_id=:order_id
    	group by p.product_name, p.one_line_description, p.product_id, i.color_choice, i.size_choice, i.style_choice" {
	
	if { $product_counter == 0 } {
	    append shopping_cart_items "
		<tr bgcolor=\"cccccc\">
		  <td>Shopping Cart Items</td>
		  <td>Options</td>
		  <td>Qty.</td>
		  <td>&nbsp;</td>
		</tr>"
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
	set options [join $option_list "<br>"]
	
	append shopping_cart_items "
	   <tr>
	     <td><a href=\"product?product_id=$product_id\">$product_name</a><br>
		 $one_line_description</td>
	     <td>$options</td>
	     <td>$quantity</td>
	   </tr>"
	incr product_counter
    }

set title $page_title
set context [list $title]

    db_release_unused_handles
    ad_return_template
    return
} elseif { $submit == "Retrieve" } {

    # First see if they already have a non-empty shopping basket, in
    # which case we'll have to find out whether they want us to merge
    # the two baskets or replace the current basket with the saved one
    
    set n_current_baskets [db_string get_n_baskets "
	select count(*) 
	from ec_orders 
	where order_state='in_basket' 
	and user_session_id=:user_session_id"]
    if { $n_current_baskets == 0 } {

	# The easy case

	db_transaction {
	    db_dml update_ec_orders "
		update ec_orders 
		set user_session_id=:user_session_id, saved_p='f' 
		where order_id=:order_id"

	    # Well, the case *was* easy, but now we have to deal with
	    # special offer codes; we want to put any special offer
	    # codes the user had in a previous session into this
	    # session so that a retrieved cart doesn't end up having
	    # higher prices than it had before (it is possible that it
	    # will have lower prices).  If they have more than one
	    # offer code for the same product, I'll put the lowest
	    # priced current offer into ec_user_session_offer_codes.

	    set offer_and_product_list [list]
	    db_foreach get_special_offers "
		select o.offer_code, o.product_id
		from ec_user_sessions s, ec_user_session_offer_codes o, ec_sale_prices_current p
		where p.offer_code=o.offer_code
		and s.user_session_id=o.user_session_id
		and s.user_id=:user_id
		order by p.sale_price" {

		lappend offer_and_product_list [list $offer_code $product_id]
	    }

	    # Delete any current offer codes so no unique constraints
	    # will be violated (they'll be re-added anyway if they're
	    # the best offer the user has for the product)

	    db_dml delete_previous_offer_codes "
		delete from ec_user_session_offer_codes 
		where user_session_id=:user_session_id"

	    set old_offer_and_product_list [list "" ""]
	    foreach offer_and_product $offer_and_product_list {
		
		# Insert it if the product hasn't been inserted before

		if { [string compare [lindex $old_offer_and_product_list 1] [lindex $offer_and_product_list 1]] != 0 } {
		    set temp_pd [lindex $offer_and_product 1]
		    set offprod [lindex $offer_and_product 0]
		    db_dml insert_session_offer "
			insert into ec_user_session_offer_codes
			(user_session_id, product_id, offer_code)
			values
			(:user_session_id, :temp_pd, :offprod)"
		}
		set old_offer_and_product_list $offer_and_product_list
	    }
	}

	db_release_unused_handles
	rp_internal_redirect "shopping-cart"
        ad_script_abort
    } else {

	# The hard case, either they can merge their saved order with
	# their current basket, or they can replace their current
	# basket with the saved order

	set page_title "Merge or Replace Your Current Shopping Cart?"
	set page_function "retrieve"
	set hidden_form_variables [export_form_vars order_id]
    set title $page_title
set context [list $title]
	set ec_system_owner [ec_system_owner]

	ad_return_template
        return
    }
} elseif { $submit == "Merge" } {

    # Update all the items in the old order so that they belong to the
    # current shopping basket
    
    # Determine the current shopping basket (I use _or_null) in case
    # they got here by pushing "Back"

    set current_basket [db_string get_current_basket "
	select order_id 
	from ec_orders 
	where user_session_id=:user_session_id 
	and order_state='in_basket'" -default ""]
    if { [empty_string_p $current_basket] } {
	rp_internal_redirect shopping-cart
        ad_script_abort
    }
    db_transaction {
	db_dml update_order_basket_pr "
	    update ec_items 
	    set order_id=:current_basket 
	    where order_id=:order_id"
	set offer_and_product_list [list]

	# The same offer code iterator as above

	db_foreach get_product_offer_codes "
	    select o.offer_code, o.product_id
    	    from ec_user_sessions s, ec_user_session_offer_codes o, ec_sale_prices_current p
	    where p.offer_code=o.offer_code
	    and s.user_session_id=o.user_session_id
	    and s.user_id=:user_id
	    order by p.sale_price" {

	   lappend offer_and_product_list [list $offer_code $product_id]
       }
	
	# Delete any current offer codes so no unique constraints will
	# be violated (they'll be re-added anyway if they're the best
	# offer the user has for the product)
	
	db_dml delete_session_offer_codes "
	    delete from ec_user_session_offer_codes 
	    where user_session_id=:user_session_id"

	set old_offer_and_product_list [list "" ""]
	foreach offer_and_product $offer_and_product_list {

	    # Insert it if the product hasn't been inserted before

	    if { [string compare [lindex $old_offer_and_product_list 1] [lindex $offer_and_product_list 1]] != 0 } {
		set temp_pd [lindex $offer_and_product 1]
		set offprod [lindex $offer_and_product 0]
		db_dml insert_session_offer "
		    insert into ec_user_session_offer_codes
		    (user_session_id, product_id, offer_code)
		    values
		    (:user_session_id, :temp_pd, :offprod)"
	    }
	    set old_offer_and_product_list $offer_and_product_list
	}
    }

    db_release_unused_handles
    rp_internal_redirect shopping-cart
    ad_script_abort
} elseif { $submit == "Replace" } {

    # Delete the items in the current basket and update the items in
    # the saved order so that they're in the current basket

    # Determine the current shopping basket (I use _or_null) in case
    # they got here by pushing "Back"

    set current_basket [db_string get_current_baskey "
	select order_id 
	from ec_orders 
	where user_session_id=:user_session_id 
	and order_state='in_basket'" -default ""]
    if { [empty_string_p $current_basket] } {
	rp_internal_redirect shopping-cart
        ad_script_abort
    }

    db_transaction {
	db_dml delete_current_items "
	    delete from ec_items 
	    where order_id=:current_basket"
	db_dml update_items "
	    update ec_items 
	    set order_id=:current_basket 
	    where order_id=:order_id"
	set offer_and_product_list [list]

	# The same offer code thing as above

	db_foreach get_offer_codes "
	    select o.offer_code, o.product_id
	    from ec_user_sessions s, ec_user_session_offer_codes o, ec_sale_prices_current p
	    where p.offer_code=o.offer_code
	    and s.user_session_id=o.user_session_id
	    and s.user_id=:user_id
	    order by p.sale_price" {

	   lappend offer_and_product_list [list $offer_code $product_id]
       }
	
	# Delete any current offer codes so no unique constraints will
	# be violated (they'll be re-added anyway if they're the best
	# offer the user has for the product)
	
	db_dml delete_uc_offer_codes "
	    delete from ec_user_session_offer_codes 
	    where user_session_id=:user_session_id"
	
	set old_offer_and_product_list [list "" ""]
	foreach offer_and_product $offer_and_product_list {
	    
	    # Insert it if the product hasn't been inserted before

	    if { [string compare [lindex $old_offer_and_product_list 1] [lindex $offer_and_product_list 1]] != 0 } {
		set temp_pd [lindex $offer_and_product 1]
		set offprod [lindex $offer_and_product 0]
		db_dml insert_session_offer "
		    insert into ec_user_session_offer_codes
		    (user_session_id, product_id, offer_code)
		    values
		    (:user_session_id, :temp_pd, :offprod)"
	    }
	    set old_offer_and_product_list $offer_and_product_list
	}
    }

    db_release_unused_handles
    rp_internal_redirect shopping-cart
    ad_script_abort
} elseif { $submit == "Discard" } {
    if { [info exists discard_confirmed_p] && $discard_confirmed_p == "t" } {
	db_transaction {
	    db_dml delete_current_cart "
		delete from ec_items 
		where order_id=:order_id"
	    db_dml delete_current_cart "
		delete from ec_orders 
		where order_id=:order_id"
	}

	rp_internal_redirect "shopping-cart"
        ad_script_abort
    }

    # Otherwise I have to give them a confirmation page

    set page_title "Discard Your Saved Shopping Cart?"
    set context [list $title]
    set page_function "discard"
    set hidden_form_variables "[export_form_vars order_id]
    [ec_hidden_input discard_confirmed_p "t"]"
    set title $page_title
    set ec_system_owner [ec_system_owner]

    ad_return_template
    return
} elseif { $submit == "Save it for Later" } {
    rp_internal_redirect "shopping-cart-retrieve-2"
    ad_script_abort
}

# There shouldn't be any other cases, but log it if there are

ns_log Notice "Error: [ec_url]shopping-cart-retrieve-3.tcl was called with an unexpected value of submit: $submit"
db_release_unused_handles
rp_internal_redirect "shopping-cart"

