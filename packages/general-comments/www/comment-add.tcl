# /packages/general-comments/www/comment-add.tcl

ad_page_contract {
    Displays a form for adding a commment to a page

    @author Phong Nguyen <phong@arsdigita.com>
    @author Pascal Scheffers (pascal@scheffers.net)
    @creation-date 2000-10-12
    @cvs-id $Id: comment-add.tcl,v 1.6.2.2 2016/05/21 10:15:38 gustafn Exp $
} { 
    object_id:naturalnum,notnull
    { object_name "[acs_object_name $object_id]" }
    { context_id:naturalnum "$object_id" }
    { category "" }
    { return_url:localurl "" }
} -properties {
    page_title:onevalue
    context:onevalue
    target:onevalue
    title:onevalue
    content:onevalue
    comment_mime_type:onevalue
    object_id:onevalue
    object_name:onevalue
    context_id:onevalue
    category:onevalue
    return_url:onevalue
}

# check to see if the user can create comments on this object
permission::require_permission -object_id $object_id -privilege general_comments_create

# ad_page_contract does not set object_name to
# [acs_object_name $object_id] if object_name is passed
# in as an empty string.
if { $object_name eq "" } {
    set object_name [acs_object_name $object_id]
}

set page_title "[_ general-comments.Add_a_comment_to]: $object_name"
set context "\"[_ general-comments.Add_comment]\""
set target "comment-add-2"
set title ""
set content ""
set comment_mime_type "text/plain"

ad_return_template "comment-ae"







# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
