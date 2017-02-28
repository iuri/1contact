# /packages/general-comments/www/admin/toggle-approval.tcl

ad_page_contract {
    Toggles the approval state of a comment
    
    @param comment_id The id of the comment
    
    @author Phong Nguyen (phong@arsdigita.com)
    @author Pascal Scheffers (pascal@scheffers.net)
    @creation-date 2000-10-12
    @cvs-id $Id: toggle-approval.tcl,v 1.2 2001/06/14 19:52:22 pascals Exp $
} {
    comment_id:integer,notnull
    video_id:integer,notnull
    {revision_id {}}
    {return_url {}}
}


permission::require_permission -object_id $video_id -privilege admin
# get the live revision of the item for comparison
set live_revision [db_string get_live_revision \
        "select live_revision 
		 from cr_items 
		 where item_id = :comment_id"]

# if the user did not pass in a revision_id, then
# assume that the user wishes to toggle the approval
# state of the latest revision
if { [empty_string_p $revision_id] } {
    set revision_id [db_string get_latest_revision \
		{select live_revision 
		 from cr_items 
		 where item_id = :comment_id}]
}

# if the current live revision is not the same as the passed in
# revision then set the passed in revision as live
if { $live_revision != $revision_id } {
    db_dml set_live_revisions {
		update cr_items set live_revision = :revision_id where item_id = :comment_id;
    }

# if the current live revision is the same as the passed in
# revision, then unset it
} else {
    db_dml unset_live_revisions {
		update cr_items set live_revision = null where item_id = :comment_id;
    }
}

ad_returnredirect $return_url
