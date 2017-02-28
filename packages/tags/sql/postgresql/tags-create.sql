-- 
-- @author Claudio Pasolini (cpasolini@oasisoftware.it)
-- @creation-date 2009-05-04
--

CREATE TABLE tags_tags (
	item_id	 integer CONSTRAINT tags_tags_item_id_fkey REFERENCES acs_objects (object_id),
	package_id	 integer,
	user_id	 integer CONSTRAINT tags_tags_user_id_fkey REFERENCES users (user_id),
	tag	 varchar(3000),
	time	 timestamp
);

CREATE INDEX tags_tags_package_id_idx ON tags_tags (package_id);
CREATE INDEX tags_tags_tag_package_id_idx ON tags_tags (tag, package_id);
CREATE INDEX tags_tags_user_id_item_id_idx ON tags_tags (user_id, item_id);
CREATE INDEX tags_tags_user_id_package_id_idx ON tags_tags (user_id, package_id);

