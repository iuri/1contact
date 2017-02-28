# /packages/general-comments/www/url-edit-2.tcl

ad_page_contract {
    Creates a new revision of the url comment.

    @author Phong Nguyen (phong@arsdigita.com)
    @author Pascal Scheffers (pascal@scheffers.net)
    @creation-date 2000-10-12
    @cvs-id $Id: url-edit-2.tcl,v 1.3.14.3 2014/07/29 11:24:08 gustafn Exp $
} {
    attach_id:naturalnum,notnull
    parent_id:naturalnum,notnull
    label:notnull
    url:notnull
    { return_url {} }
}

# authenticate the user
set user_id [ad_conn user_id]

# check to see if the user can edit this attachment
permission::require_permission -object_id $attach_id -privilege write

db_dml edit_url {
    update cr_extlinks
       set label = :label,
           url = :url
     where extlink_id = :attach_id
}

ad_returnredirect "view-comment?comment_id=$parent_id&[export_vars -url {return_url}]"


