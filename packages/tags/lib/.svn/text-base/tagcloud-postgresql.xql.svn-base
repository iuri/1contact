<?xml version="1.0"?>

<queryset>
   <rdbms><type>postgresql</type><version>7.2</version></rdbms>

<fullquery name="minmax">      
  <querytext>
    select coalesce(min(tag_count), 0) as min, 
           coalesce(max(tag_count), 0) as max
    from (select count(tag) as tag_count from tags_tags group by tag) t
  </querytext>
</fullquery>

<fullquery name="tags">      
  <querytext>
    select * from (
        select count(tag) as tag_count, tag 
        from tags_tags 
        group by tag 
        order by count(tag) desc 
        limit $max_tag_no) t 
    order by tag
  </querytext>
</fullquery>

</queryset>
