<?xml version="1.0"?>

<queryset>
   <rdbms><type>postgresql</type><version>7.2</version></rdbms>

<fullquery name="tagged_items">      
  <querytext>
    select distinct 
        t.item_id as object_id
      , o.title as name
      , o.creation_date
      , o.last_modified
      , coalesce(i.content_type, o.object_type) as object_type
      , u.username
    from tags_tags t
       , acs_objects o left outer join cr_items i on o.object_id = i.item_id
       , users u
    where t.package_id = :package_id
      and t.tag        = :tag    
      and t.item_id    = o.object_id
      and u.user_id    = o.creation_user
    [template::list::filter_where_clauses -name items -and]
    [template::list::orderby_clause -name items -orderby]
  </querytext>
</fullquery>

<fullquery name="items">      
  <querytext>
    select distinct 
        o.object_id
      , o.title as name
      , o.creation_date
      , o.last_modified
      , coalesce(i.content_type, o.object_type) as content_type
      , u.username
    from acs_objects o left outer join cr_items i on o.object_id = i.item_id
       , users u
    where u.user_id = o.creation_user
    [template::list::page_where_clause -name items -and]
    [template::list::orderby_clause -name items -orderby]
  </querytext>
</fullquery>

<fullquery name="object_types">      
  <querytext>
    select distinct ot.pretty_name, coalesce(i.content_type, o.object_type) as object_type
    from tags_tags t
       , acs_objects o left outer join cr_items i on o.object_id = i.item_id
       , acs_object_types ot
    where t.item_id      = o.object_id
      and ot.object_type = coalesce(i.content_type, o.object_type)
    order by ot.pretty_name
  </querytext>
</fullquery>

<fullquery name="popular_tags">      
  <querytext>
    select * from (
        select tag as tag_description, tag 
        from tags_tags 
        group by tag 
        order by count(tag) desc 
        limit $max_tag_no) t 
    order by tag
  </querytext>
</fullquery>

</queryset>
