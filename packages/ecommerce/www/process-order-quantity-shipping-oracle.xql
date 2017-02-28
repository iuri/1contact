<?xml version="1.0"?>

<queryset>
  <rdbms>
    <type>oracle</type>
    <version>8.1.6</version>
  </rdbms>

  <fullquery name="get_items_in_cart">      
    <querytext>
      select i.item_id, i.product_id, u.offer_code
      from ec_items i,
      (select * from ec_user_session_offer_codes usoc where usoc.user_session_id=:user_session_id) u
      where i.product_id=u.product_id(+)
      and i.order_id=:order_id
    </querytext>
  </fullquery>

  <fullquery name="get_base_ship_cost">      
    <querytext>
      select nvl(base_shipping_cost,0) 
      from ec_admin_settings
    </querytext>
  </fullquery>

  <fullquery name="get_exp_base_cost">      
    <querytext>
      select nvl(add_exp_base_shipping_cost,0) 
      from ec_admin_settings
    </querytext>
  </fullquery>

  <fullquery name="get_shipping_tax">      
    <querytext>
      select ec_tax(0,:order_shipping_cost,:order_id) 
      from dual
    </querytext>
  </fullquery>

</queryset>
