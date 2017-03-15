ad_page_contract {

    Moderate a Forum

    @author Ben Adida (ben@openforce.net)
    @creation-date 2002-05-24
    @cvs-id $Id: pending-list-chunk.tcl,v 1.2 2014/10/27 16:41:36 victorg Exp $

}

# Get the threads that need approval
db_multirow pending_threads select_pending_threads {}

if {([info exists alt_template] && $alt_template ne "")} {
  ad_return_template $alt_template
}
