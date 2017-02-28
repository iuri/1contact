<?xml version="1.0"?>

<queryset>
   <rdbms><type>postgresql</type><version>7.1</version></rdbms>

<fullquery name="product_insert">      
      <querytext>

	select ec_product__new(
	:product_id,
	:user_id,
	:context_id,
	:product_name, 
	:price, 
	:sku,
	:one_line_description, 
	:detailed_description, 
	:search_keywords, 
	:present_p, 
	:stock_status,
	:dirname, 
	to_date(:available_date, 'YYYY-MM-DD'), 
	:color_list, 
	:size_list, 
	:peeraddr
	);
   
      </querytext>
</fullquery>


<fullquery name="product_update">
      <querytext>

      update ec_products set style_list = :style_list,
      email_on_purchase_list = :email_on_purchase_list,
      url = :url,
      no_shipping_avail_p = :no_shipping_avail_p,
      shipping = :shipping,
      shipping_additional = :shipping_additional,
      weight = :weight,
      active_p = 't',
      template_id = :template_id
      where product_id = :product_id;

      </querytext>
</fullquery>

 
<fullquery name="audit_info_sql">
      <querytext>

      now(), :user_id, :peeraddr

      </querytext>
</fullquery>

 
</queryset>
