<?xml version="1.0"?>

<queryset>
    <rdbms><type>postgresql</type><version>8.2</version></rdbms>

    <fullquery name="video__datasource.video_datasource">
	<querytext>
	SELECT v.video_id AS object_id,
	v.video_name AS title,
	v.video_description AS content,
	'text/html' AS mime,
	'' AS keywords,
	'text' AS storage_type
	FROM videos v
	WHERE v.video_id = :object_id
	</querytext>
    </fullquery>


    <fullquery name="video__url.get_url_stub">
	<querytext>

	  SELECT site_node__url(node_id) AS url_stub 
	  FROM site_nodes s, videos v
	  WHERE v.video_id = :object_id
	  AND s.object_id = v.package_id

	</querytext>
    </fullquery>

</queryset>
