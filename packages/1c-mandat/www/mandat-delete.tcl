ad_page_contract {
    This deletes a Mandat
    @author Iuri Sampaio (iuri@iurix.com)
    @cvs-id $Id: mandat-delete.tcl,v 1.2 2004/02/04 16:47:34 joela Exp $
    @param item_id The item_id of the mandat to delete
} {
    item_id:integer
    return_url
}
permission::require_write_permission -object_id $item_id
set title [item::get_title $item_id]
1c_mandat::mandat::delete -item_id $item_id
ad_returnredirect "."
# stop running this code, since we're redirecting
ad_script_abort
