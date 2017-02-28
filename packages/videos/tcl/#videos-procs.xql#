<?xml version="1.0"?>
<queryset>

    <fullquery name="videos::video_queue.insert_video_queue">
        <querytext>
            insert into videos_queue (item_id)
	    values (:item_id) 
        </querytext>
    </fullquery>
    
    <fullquery name="videos::delete_video_queue.delete_video_queue">
        <querytext>
            delete from videos_queue
	    where item_id = :item_id
        </querytext>
    </fullquery>

	<fullquery name="videos::convert.write_file_content">
      	<querytext>
                   select :path || content
		   from cr_revisions
		   where revision_id = :revision_id
	          </querytext>
	</fullquery>

	<fullquery name="videos::convert.get_live_revision">
      		<querytext>
		       select revision_id
		       from cr_revisions
		       where item_id = :item_id
		       order by revision_id asc
		       limit 1
	        </querytext>
	</fullquery>
	<fullquery name="videos::get_image_id.select_item_image">
      		<querytext>
		  select c.item_id
		  from acs_rels a, cr_items c
		  where a.object_id_two = c.item_id
		  and a.object_id_one = :item_id
		  and a.rel_type = 'video_image_thumbnail_rel'
		  and c.live_revision is not null
		</querytext>
	</fullquery>
	<fullquery name="videos::new.video_insert">
      	  <querytext>
	    select video__new (:item_id, :name, :description, :package_id, :video_date, :user_id)
	  </querytext>
	</fullquery>
	
	<fullquery name="videos::new_flv.video_insert">
      	  <querytext>
	    select video__new (:item_id, :name, :description, :package_id, :video_date, :user_id)
	  </querytext>
	</fullquery>
	
	
	<fullquery name="videos::get.videos_select">
      	  <querytext>
	    select  ci.item_id,
            v.video_description,
            v.video_name,
            v.package_id,
	    ao.creation_user,
	    ao.creation_ip
            from    cr_items ci,
            videos v,
	    acs_objects ao
            where   ci.item_id = :item_id
            and     v.video_id = ci.item_id
	    and     ao.object_id = ci.item_id
       	  </querytext>
	</fullquery>
	
	<fullquery name="videos::new.create_rel_image">
      	  <querytext>
 	    select acs_rel__new (
	    null,
            'video_image_thumbnail_rel',
            :item_id,
            :image_item_id,
            null,
            null,
            null
            )
       	  </querytext>
	</fullquery>
	<fullquery name="videos::new_flv.create_rel_image">
      	  <querytext>
 	    select acs_rel__new (
	    null,
            'video_image_thumbnail_rel',
            :item_id,
            :image_item_id,
            null,
            null,
            null
            )
       	  </querytext>
	</fullquery>
	
	<fullquery name="videos::reload_image.create_rel_image">
      	  <querytext>
	    select acs_rel__new (
	    null,
            'video_image_thumbnail_rel',
            :item_id,
            :image_item_id,
            null,
            null,
            null
            )
       	  </querytext>
	</fullquery>
	<fullquery name="videos::reload_image.write_file_content">
      	  <querytext>
            select :path || content
	    from cr_revisions
	    where revision_id = :revision_id
	  </querytext>
	</fullquery>
	
	<fullquery name="videos::reload_image.get_live_revision">
      	  <querytext>
	    select revision_id
	    from cr_revisions
	    where item_id = :item_id
	    order by revision_id asc
	    limit 1
	  </querytext>
	</fullquery>
	
	
	<fullquery name="videos::get_keywords_not_cached.select_package_keywords">
	  <querytext>
            select child.keyword_id as child_id,
            child.heading as child_heading,
            parent.keyword_id as parent_id,
            parent.heading as parent_heading
            from   bt_projects p,
            cr_keywords parent,
            cr_keywords child
            where  p.project_id = :package_id
            and    parent.parent_id = p.root_keyword_id
            and    child.parent_id = parent.keyword_id
            order  by parent.heading, child.heading
	  </querytext>
	</fullquery>


	<fullquery name="video::clear_tags">      
	  <querytext>
	    delete from tags_tags
	    where item_id = :item_id
	    and user_id = :user_id
	  </querytext>
	</fullquery>
	
	<fullquery name="videos::new.create_tag">      
	  <querytext>
	    insert into tags_tags ( 
            item_id,
	    user_id,
	    package_id,
	    tag,
	    time
	    ) values (
            :item_id,
	    :user_id,
	    :package_id,
	    :tag,
	    current_timestamp
	    )
	  </querytext>
	</fullquery>
	
	<fullquery name="videos::notification::get_url.select_object_type">
	  <querytext>	
	    select object_type 
	    from acs_objects
	    where object_id = :object_id
	  </querytext>
	</fullquery>


        <fullquery name="videos::notification::get_url.select_videos_package_url">
          <querytext>
            select site_node__url(node_id)
            from site_nodes
	    where object_id = (select package_id
                               from videos v
                               where v.video_id = :object_id)
          </querytext>
        </fullquery>


	<fullquery name="videos::new_link.video_insert">
      	  <querytext>
	    select videos__new (:extlink_id, :name, :description, :package_id, :video_date, :user_id)
	  </querytext>
	</fullquery>
	
	<fullquery name="videos::new_link.create_tag">      
	  <querytext>
	    insert into tags_tags ( 
	    item_id,
	    user_id,
	    package_id,
	    tag,
	    time
	    ) values (
            :extlink_id,
	    :user_id,
	    :package_id,
	    :tag,
	    current_timestamp
	    )
	  </querytext>
	</fullquery>


</queryset>
