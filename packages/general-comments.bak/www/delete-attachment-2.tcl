# /packages/general-comments/www/delete-attachment-2.tcl

ad_page_contract {
    Deletes an attachment
    
    @param attach_id The id of the attachment to delete
    @param parent_id The id of the comment this attachment refers to
    @param submit    Determines the action to take

    @author Phong Nguyen (phong@arsdigita.com)
    @author Pascal Scheffers (pascal@scheffers.net)
    @creation-date 2000-10-12
    @cvs-id $Id: delete-attachment-2.tcl,v 1.5.8.4 2014/07/29 11:24:07 gustafn Exp $
} {
    attach_id:naturalnum,notnull
    parent_id:naturalnum,notnull
    submit:notnull
    { return_url {} }
}

# check for permissions
permission::require_permission -object_id $attach_id -privilege delete

# all of this messy code will be replaced by
# a single content_item.delete after the bug fix
# is released

#Commented out during i18n convertion, Steffen
#if { $submit eq "Proceed" } {


    # get the type of the attachment
    db_1row get_type {
        select content_type
          from cr_items
         where item_id = :attach_id
    }    
    if { $content_type eq "content_revision" } {
        # get the mime_type
        db_1row get_mime_type {
            select mime_type
              from cr_revisions
             where item_id = :attach_id
               and revision_id = content_item.get_latest_revision (:attach_id)
        }
        if { $mime_type eq "image/jpeg" || $mime_type eq "image/gif" } {
            # delete row from images table, we should only have one row
            # this is only temporary until CR provides a delete image function
            db_dml delete_image_row {
                delete from images
                 where image_id = content_item.get_latest_revision(:attach_id)
            }
            db_exec_plsql delete_image {
                begin
                    acs_message.delete_image(:attach_id);
                end;
            }
        } else {
            db_exec_plsql delete_attachment {
                begin
                   acs_message.delete_file(:attach_id);
                end;
            }
        }
    } elseif { $content_type eq "content_extlink" } {
        db_exec_plsql delete_extlink {
            begin
                content_extlink.del(:attach_id);
            end;
        }
    } 

#/ i18n
#}

ad_returnredirect "view-comment?comment_id=$parent_id&[export_vars -url {return_url}]"








