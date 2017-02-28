-- UPGRADE VIDEOS PACKAGE FROM 0.2d to 0.3d 

-- THIS UPGRADE ADD NEW COLUMN VIDEO DATE. 

BEGIN;
ALTER TABLE videos ADD COLUMN video_date timestamptz;
DROP FUNCTION videos__new(int4, "varchar", "varchar", int4);
CREATE OR REPLACE FUNCTION videos__new(int4, "varchar", "varchar", int4, timestamptz)
  RETURNS int4 AS
$BODY$
declare
    p_video_id 			alias for $1;
    p_video_name 		alias for $2;
    p_video_description		alias for $3;
    p_package_id		alias for $4;
    p_date				alias for $5;
begin
 	--insert into videos a new video
	insert into videos (video_id, 
			    video_name, 
			    video_description,
			    package_id,
				video_date
        ) values (
			    p_video_id, 
			    p_video_name, 
			    p_video_description,
			    p_package_id,
				p_date
        );
	
      
        return 0;
end;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE;

COMMIT;
