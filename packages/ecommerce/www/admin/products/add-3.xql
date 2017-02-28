<?xml version="1.0"?>
<queryset>

  <fullquery name="user_class_select">      
    <querytext>
      select user_class_id, user_class_name
      from ec_user_classes
      order by user_class_name
    </querytext>
  </fullquery>
  
  <fullquery name="custom_fields_select">      
    <querytext>
      select field_identifier, field_name, column_type
      from ec_custom_product_fields
      where active_p = 't'
    </querytext>
  </fullquery>
  
  <fullquery name="template_name_select">      
    <querytext>
      select template_name
      from ec_templates 
      where template_id=:template_id
    </querytext>
  </fullquery>
  
  <fullquery name="custom_fields_select">      
    <querytext>
      select field_identifier, field_name, column_type
      from ec_custom_product_fields
      where active_p = 't'
    </querytext>
  </fullquery>
  
  <fullquery name="user_class_select">      
    <querytext>
      select user_class_id, user_class_name 
      from ec_user_classes
      order by user_class_name
    </querytext>
  </fullquery>
  
</queryset>
