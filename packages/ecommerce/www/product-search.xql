<?xml version="1.0"?>

<queryset>

  <fullquery name="insert_search_text_to_session_info">      
    <querytext>
      insert into ec_user_session_info 
      (user_session_id, category_id, search_text) 
      values 
      (:user_session_id, :category_id, :search_text)
    </querytext>
  </fullquery>

  <fullquery name="get_category_name">      
    <querytext>
      select category_name 
      from ec_categories
      where category_id=:category_id
    </querytext>
  </fullquery>

  <fullquery name="get_subcategory_name">      
    <querytext>
      select category_name || ' > ' || subcategory_name 
      from ec_categories c, ec_subcategories s
      where s.subcategory_id=:subcategory_id
      and c.category_id=s.category_id
    </querytext>
  </fullquery>

</queryset>
