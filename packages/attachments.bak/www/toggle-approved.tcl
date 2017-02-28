ad_page_contract {

    @author yon@openforce.net
    @creation-date 2002-08-29
    @cvs-id $Id: toggle-approved.tcl,v 1.2.22.1 2014/07/29 11:24:01 gustafn Exp $

} -query {
    {object_id:naturalnum,notnull}
    {item_id:naturalnum,notnull}
    {approved_p ""}
    {return_url:notnull}
}

attachments::toggle_approved -object_id $object_id -item_id $item_id -approved_p $approved_p

ad_returnredirect $return_url
