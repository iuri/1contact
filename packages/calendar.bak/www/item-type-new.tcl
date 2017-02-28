
ad_page_contract {

    Add an item type
    
    @author Ben Adida (ben@openforce.net)
    
    @creation-date Mar 16, 2002
    @cvs-id $Id: item-type-new.tcl,v 1.2.22.2 2014/08/05 13:07:00 gustafn Exp $
} {
    calendar_id:naturalnum,notnull
    type:notnull
}

# Permission check
permission::require_permission -object_id $calendar_id -privilege calendar_admin

# Add the type
calendar::item_type_new -calendar_id $calendar_id -type $type

ad_returnredirect "calendar-item-types?calendar_id=$calendar_id"


