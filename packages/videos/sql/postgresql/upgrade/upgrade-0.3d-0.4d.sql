create table videos (
    -- ID for this package instance
    video_id  	      integer
            constraint videos_video_id_fk
            references cr_items on delete cascade
            constraint videos_video_id_pk
            primary key,	
    package_id        integer	
            constraint videos_package_id_fk
	    references apm_packages on delete cascade,
    video_name        text
    	    constraint videos_video_name_nn   not null,
    video_description text,
    video_date        timestamptz,
    creator 	      integer,
    autor	      varchar(255),
    coautor_id	      varchar(255),
    video_source      varchar(255), 
    community_id      integer
             constraint dotlrn_community_id_fk not null
);



select content_type__create_type (
       'videos_object',    	-- content_type
       'content_revision',      -- supertype. We search revision content 
       'Videos Object',    	-- pretty_name
       'Videos Objects',   	-- pretty_plural
       'videos',        	-- table_name
       'video_id',		-- id_column
       'videos__get_title' 	-- name_method
);

select content_type__create_type (
       'videos_image_object',   -- content_type
       'content_revision',      -- supertype. We search revision content
       'Videos image Object',   -- pretty_name
       'Videos image Objects',  -- pretty_plural
       'videos_images',         -- table_name
       'image_id',              -- id_column
       'videos_image__get_title' -- name_method
);


create table videos_queue (
    item_id                         integer
                                    constraint videos_queue_item_id_fk
                                    references cr_items (item_id)
);

select content_folder__register_content_type(-100,'videos_object','t');
select content_folder__register_content_type(-100,'videos_image_object','t');

select acs_rel_type__create_role(
       'videos_object',		--role
       'Video',			--pretty_name
       'Videos'			--pretty_plural
);



select acs_rel_type__create_type(
       'videos_image_thumbnail_rel',		--rel_type
       '#acs-subsite.Videos_Image_Thumbnail#',	--pretty_name
       '#acs-subsite.Videos_Image_Thumbnails#', --pretty_plural
       'relationship',				--supertype
       'videos_image_thumbnail',		--table_name
       'image_id',				--id_column
       'videos_image_thumbnail_rel',		--package_name
       'content_item',				--object_type_one
       'videos_object',				--role_one
       1,					--min_n_rels_one
       1,					--max_n_rels_one
       'content_item',				--object_type_two
       null,					--role_two
       0,					--min_n_rels_two
       1					--max_n_rels_two
);				




CREATE OR REPLACE FUNCTION videos__delete(int4)
  RETURNS int4 AS
$BODY$
declare
    p_item_id alias for $1;
    v_item_id cr_items.item_id%TYPE;
    v_image_item_id cr_items.item_id%TYPE;
begin
    v_item_id := p_item_id;
    -- dbms_output.put_line('Deleting associated comments...');
    -- delete acs_messages, images, comments to news item

    select c.item_id into v_image_item_id
    from acs_rels a, cr_items c
    where a.object_id_two = c.item_id
    and a.object_id_one = v_item_id
    and a.rel_type = 'videos_image_thumbnail_rel'
    and c.live_revision is not null;

    delete from videos_queue where item_id = v_item_id;
    delete from videos where video_id = v_item_id;

    PERFORM content_item__delete(v_item_id);
    PERFORM content_item__delete(v_image_item_id);
    return 0;
end;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE;


CREATE OR REPLACE FUNCTION videos__new(int4, "varchar", "varchar", int4, timestamptz, int4, "varchar", "varchar", "varchar", int4)
  RETURNS int4 AS
$BODY$
declare
    p_video_id 			alias for $1;
    p_video_name 		alias for $2;
    p_video_description		alias for $3;
    p_package_id		alias for $4;
    p_date			alias for $5;

    p_creator_id		alias for $6;
    p_autor			alias for $7;
    p_coautor			alias for $8;
    p_source			alias for $9;
    p_community_id		alias for $10;
        
    
begin
 	--insert into videos a new video
	insert into videos (video_id, 
			    video_name, 
			    video_description,
			    package_id,
			    video_date,
			    creator_id,
			    autor,
			    coautor,
			    video_source,
			    community_id
        ) values (
			    p_video_id, 
			    p_video_name, 
			    p_video_description,
			    p_package_id,
			    p_date,
			    p_creator_id,
			    p_autor,
			    p_coautor,
			    p_source,
			    p_community_id
        );
	
      
        return 0;
end;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE;
