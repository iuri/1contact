<?xml version="1.0"?>

<queryset>

<fullquery name="tags::my_tags.my_tags">      
  <querytext>
    select tag 
    from tags_tags
    where item_id = :item_id
      and user_id = :user_id
    group by tag
    order by tag
  </querytext>
</fullquery>

<fullquery name="tags::item_tags.item_tags">      
  <querytext>
    select tag 
    from tags_tags
    where item_id = :item_id
    group by tag
    order by tag
  </querytext>
</fullquery>

</queryset>
