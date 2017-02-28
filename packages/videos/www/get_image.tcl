ad_page_contract {
    spits out correctly MIME-typed bits for a user's portrait

    @author philg@mit.edu
    @creation-date 26 Sept 1999
    @cvs-id $Id: portrait-thumbnail-bits.tcl,v 1.2 2006/10/04 12:05:20 alessandrol Exp $
} {
    video_id:integer
}

set item_id [db_string get_item_id ""]

cr_write_content -item_id $item_id
