-- /packages/videos/sql/postgresql/upgrade/upgrade-0.5d-0.6d.sql

SELECT acs_log__debug ('/packages/videos/sql/postgresql/upgrade/upgrade-0.5d-0.6d.sql','');
 

ALTER TABLE videos DROP COLUMN autor  CASCADE;
ALTER TABLE videos DROP COLUMN coautor CASCADE;
ALTER TABLE videos DROP COLUMN video_source CASCADE;
ALTER TABLE videos DROP COLUMN community_id CASCADE;

DROP FUNCTION videos__new(int4, "varchar", "varchar", int4, timestamptz, int4, "varchar", "varchar", "varchar", int4);

CREATE OR REPLACE FUNCTION videos__new(int4, "varchar", "varchar", int4, timestamptz, int4)
  RETURNS int4 AS
$BODY$
declare
    p_video_id 			alias for $1;
    p_video_name 		alias for $2;
    p_video_description		alias for $3;
    p_package_id		alias for $4;
    p_date			alias for $5;
    p_creator_id		alias for $6;
begin
 	--insert into videos a new video
	insert into videos (video_id, 
			    video_name, 
			    video_description,
			    package_id,
			    video_date,
			    creator_id
        ) values (
			    p_video_id, 
			    p_video_name, 
			    p_video_description,
			    p_package_id,
			    p_date,
			    p_creator_id
        );
	
      
        return 0;
end;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE;
