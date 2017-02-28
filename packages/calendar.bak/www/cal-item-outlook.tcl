# /packages/calendar/www/cal-item.tcl

ad_page_contract {
    
    Output an item as ics for Outlook
    
    @author Ben Adida (ben@openforce.net)
    @creation-date May 28, 2002
    @cvs-id $Id: cal-item-outlook.tcl,v 1.4.8.1 2014/08/05 13:07:00 gustafn Exp $
} {
    cal_item_id:naturalnum,notnull
}

ad_returnredirect "ics/${cal_item_id}.ics"
