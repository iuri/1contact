<?xml version="1.0"?>

<queryset>

<fullquery name="system_tags">      
  <querytext>
    select tag 
    from tags_tags
    where tag not in ([join $my_exclude ,])
    group by tag
    order by tag
  </querytext>
</fullquery>

<fullquery name="clear_tags">      
  <querytext>
    delete from tags_tags
    where item_id = :item_id
      and user_id = :user_id
  </querytext>
</fullquery>

<fullquery name="create_tag">      
  <querytext>
    insert into tags_tags ( 
        item_id
      , user_id
      , package_id
      , tag
      , time 
    ) values (
        :item_id
      , :user_id
      , :package_id
      , :tag
      , current_timestamp
    )
  </querytext>
</fullquery>

</queryset>
