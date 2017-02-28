ad_page_contract {

    Virtual URL handler for file downloads

    @author Kevin Scaldeferri (kevin@arsdigita.com)
    @author Don Baccus (simplified it by using cr utility)
    @creation-date 18 December 2000
    @cvs-id $Id: index.vuh,v 1.7.2.1 2007/03/14 18:39:31 cesarc Exp $
} {
    video_id:integer
}

set user_id [ad_conn user_id]
set item_id $video_id
ad_require_permission $video_id "read"

set version_id [db_string item "select revision_id from cr_revisions where item_id = :video_id order by revision_id limit 1" -default ""]
set name [db_string item "select name from cr_items where item_id = :item_id" -default ""]

ns_set update [ns_conn outputheaders] Content-Disposition "attachment; filename=\"$name\""

cr_write_content -revision_id $version_id

