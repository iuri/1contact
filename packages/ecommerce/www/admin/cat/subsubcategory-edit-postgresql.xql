<?xml version="1.0"?>

<queryset>
   <rdbms><type>postgresql</type><version>7.1</version></rdbms>

<fullquery name="update_subsubcategory">      
      <querytext>
      update ec_subsubcategories
set subsubcategory_name=:subsubcategory_name,
last_modified=current_timestamp,
last_modifying_user=:user_id,
modified_ip_address=:address
where subsubcategory_id=:subsubcategory_id
      </querytext>
</fullquery>

 
</queryset>
