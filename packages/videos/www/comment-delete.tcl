# /packages/general-comments/www/admin/delete-2.tcl

ad_page_contract {
    Deletes a comment and its attachments
    
    @param comment_id The id of the comment to delete
    
    @author Phong Nguyen (phong@arsdigita.com)
    @author Pascal Scheffers (pascal@scheffers.net)
    @creation-date 2000-10-12
    @cvs-id $Id: delete-2.tcl,v 1.3 2003/09/30 12:10:07 mohanp Exp $
} {
    comment_id:integer,notnull
    video_id:integer,notnull
    { return_url {} }
}

# There is a bug in content_item.delete that results in
# referential integrity violations when deleting a content
# item that has an image attachment. This is a temporary fix
# until ACS 4.1 is released.

permission::require_permission -party_id [ad_conn user_id] -object_id $video_id -privilege admin

ad_form -export {comment_id video_id return_url} -name comment-delete -form {
	{confirm:text(radio)
		{label "[_ lars-blogger.Confirme_remove_comment]"} 
		{options {
				{"[_ lars-blogger.No]" "0"} 
				{"[_ lars-blogger.Yes]" "1"}}
		}
	}
} -on_submit {
	
	if {$confirm} {
		db_dml delete_image_attachments {
			    delete from images
			    where image_id in (select latest_revision
		                         from cr_items
		                        where parent_id = :comment_id)
		}

		# Only need to call on acs_message.delete since
		# deletion of row from general_comments table
		# relies on "on delete cascade"
		db_exec_plsql delete_comment {
			select  acs_message__delete(:comment_id);
		}
	}

	ad_returnredirect $return_url
}


