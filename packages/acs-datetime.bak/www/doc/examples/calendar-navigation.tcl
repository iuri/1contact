# /packages/acs-datetime/www/doc/calendar-widgets.tcl

ad_page_contract {
    
    Examples of various calendar widgets

    @author  ron@arsdigita.com
    @creation-date 2000-12-08
    @cvs-id  $Id: calendar-navigation.tcl,v 1.2.24.1 2013/09/24 08:35:23 gustafn Exp $
} {
    {view ""}
    {date ""}
} -properties {
    title:onevalue
    calendar_widget:onevalue
}

set title "Calendar Navigation"
set context [list [list . "ACS DateTime Examples"] $title]

set calendar_widget [dt_widget_calendar_navigation "" $view $date]

ad_return_template


