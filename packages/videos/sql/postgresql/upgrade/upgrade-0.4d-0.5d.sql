-- /packages/videos/sql/postgresql/upgrade/upgrade-0.4d-0.5d.sql

SELECT acs_log__debug ('/packages/videos/sql/postgresql/upgrade/upgrade-0.4d-0.5d.sql','');
 

-- create table to rank videos
 create table videos_rank (
       user_id integer,
       package_id integer,
       revision_id integer,
       video_id integer,
       counter integer
);
       
       