

CREATE OR REPLACE FUNCTION annonce__delete(integer) RETURNS integer AS '
DECLARE 
    p_item_id alias for $1;
    v_item_id cr_items.item_id%TYPE;
    v_file_item_id cr_items.item_id%TYPE;

BEGIN
    v_item_id := p_item_id;
    -- dbms_output.put_line(''Deleting associated comments...'');
    -- delete acs_messages, images, comments to news item


    SELECT c.item_id into v_file_item_id
    FROM acs_rels a, cr_items c
    WHERE a.object_id_two = c.item_id
    AND a.object_id_one = v_item_id
    AND a.rel_type = ''annonce_file_rel''
    AND c.live_revision is not null;


  DELETE FROM annonces WHERE annonce_id = v_item_id;

  PERFORM content_item__delete(v_item_id);
  PERFORM content_item__delete(v_file_item_id);

  RETURN 0;

END;' LANGUAGE 'plpgsql';
