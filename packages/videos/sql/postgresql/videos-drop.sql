-- delete  videos schema

CREATE OR REPLACE FUNCTION video_categories__delete() 
RETURNS int4 AS ' 

	DECLARE 
	  row RECORD;
	  
	  video_package_id      integer;
	  video_object_id	integer;
	  video_tree_id		integer;

	BEGIN
	  SELECT package_id INTO video_package_id FROM apm_packages WHERE package_key = ''videos'';
	  SELECT object_id INTO video_object_id FROM acs_objects WHERE object_type = ''apm_package'' AND package_id = video_package_id;
	  SELECT tree_id INTO video_tree_id FROM category_object_map_tree WHERE object_id = video_object_id; 

	  PERFORM category_tree__unmap(video_object_id,video_tree_id);
	  PERFORM category_tree__del(video_tree_id); 
	  
	  DELETE FROM cr_child_rels WHERE parent_id = video_object_id;
	  
	  DELETE FROM acs_objects WHERE context_id = video_object_id AND object_type = ''cr_item_child_rel'';


	RETURN 0;

END;' language 'plpgsql';

PERFORM video_categories__delete();
DROP FUNCTION video_categories__delete();

CREATE OR REPLACE FUNCTION video_data__delete() 
RETURNS int4 AS ' 
       DECLARE 
         row   RECORD;
       
       BEGIN 
       	     FOR row IN 
	     	 select video_id from videos
	     LOOP

		PERFORM video__delete(row.video_id);

	     END LOOP;
             
	     RETURN 0;

END;' language 'plpgsql';

		
PERFORM video_data__delete();
DROP FUNCTION video_data__delete();


DROP FUNCTION video__delete(int4);
DROP FUNCTION video__new (int4, "varchar", "varchar", int4, timestamptz, int4, "varchar", "varchar", "varchar", int4);

PERFORM acs_rel_type__drop_type('video_image_thumbnail_rel','t');
PERFORM acs_rel_type__drop_role('video_object');
PERFORM acs_object_type__drop_type('video_image_thumbnail_rel','t');


PERFORM content_type__drop_type('video_object','t','t','t');
PERFORM content_type__drop_type('video_image_object','t','t','t');


PERFORM content_folder__unregister_content_type(-100,'video_object','t');
PERFORM content_folder__unregister_content_type(-100,'video_image_object','t');



drop table videos_queue;
drop table videos cascade;