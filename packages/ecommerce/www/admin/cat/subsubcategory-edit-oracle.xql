<?xml version="1.0"?>

<queryset>
   <rdbms><type>oracle</type><version>8.1.6</version></rdbms>

<fullquery name="update_subsubcategory">      
      <querytext>
      update ec_subsubcategories
set subsubcategory_name=:subsubcategory_name,
last_modified=sysdate,
last_modifying_user=:user_id,
modified_ip_address=:address
where subsubcategory_id=:subsubcategory_id
      </querytext>
</fullquery>

 
</queryset>
