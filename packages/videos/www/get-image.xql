<?xml version="1.0"?>
<queryset>

   <fullquery name="get_item_id">
      <querytext>
         select c.item_id
         from acs_rels a, cr_items c
         where a.object_id_two = c.item_id
           and a.object_id_one = :video_id
           and a.rel_type = 'video_image_thumbnail_rel'
	   and c.live_revision is not null
      </querytext>
   </fullquery>

</queryset>
