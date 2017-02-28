<?xml version="1.0"?>

<queryset>
   <rdbms><type>postgresql</type><version>7.1</version></rdbms>

<fullquery name="ec_subcat_insert">      
      <querytext>
      insert into ec_subcategories
    (category_id, subcategory_id, subcategory_name, sort_key, last_modified, last_modifying_user, modified_ip_address)
    values
    (:category_id, :subcategory_id, :subcategory_name, :sort_key, current_timestamp, :user_id, :address)
      </querytext>
</fullquery>

 
</queryset>
