ad_page_contract {

    State Add/Edit

    @author        Jeff Wang (jeff@ctrl.ucla.edu)
    @creation-date 3/17/2005

    @cvs-id  $Id: state-ae.tcl,v 1.4 2014/08/06 16:34:02 gustafn Exp $
} {
    {return_url [get_referrer]}
    {state_id:naturalnum,optional}
    {workflow_id:naturalnum,notnull}
}

set title "State Add or Edit"

set context [list [list $return_url "Workflow Edit"] "State AE"]


ad_form -name "add-edit" -form {
    state_id:key
    {short_name:text(text) {label {Short Name:}}}
    {pretty_name:text(text) {label {Pretty Name:}}}
    {sub:text(submit) {label {Submit}}}
} -new_data {
    set update_array(short_name) $short_name
    set update_array(pretty_name) $pretty_name
      
    workflow::state::fsm::edit \
	    -operation "insert" \
	    -workflow_id $workflow_id \
	    -array "update_array"

} -edit_data {
    set update_array(short_name) $short_name
    set update_array(pretty_name) $pretty_name


    workflow::state::fsm::edit \
	    -state_id $state_id \
	    -array "update_array"

} -edit_request {

    workflow::state::fsm::get \
	    -state_id $state_id \
	    -array "state_info"

    set short_name $state_info(short_name)
    set pretty_name      $state_info(pretty_name)
    

} -after_submit {
    ad_returnredirect -allow_complete_url $return_url
    ad_script_abort
} -export {return_url workflow_id} 
