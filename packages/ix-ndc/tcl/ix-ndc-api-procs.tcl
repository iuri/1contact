# /packages/ix-ndc/tcl/ix-ndc-procs.tcl
ad_library {
    Support the NDC  API

     @author Iuri Sampaio [iuri@iurix.com]
     @creation-date Mon Sep 12 17:35:01 2016
     @cvs-id $Id: ix-ndc-procs.tcl,v 0.1d 
}



ad_proc ix_ndc_auth_for_xmlrpc {
    -username
    -password
} {
    Authenticate a user based on info from XML-RPC client. Not sure if we're
    getting email or username, so test for @ and decide.

    @return user_id if successful authentication. errors if unsuccesful.
    @author Iuri Sampaio
} {
    if { [string first "@" $username] != -1 } {
        # use email auth
        array set auth [auth::authenticate -email $username \
                            -password $password]
    } else {
        # use username auth
        array set auth [auth::authenticate -username $username \
                            -password $password]
    }

    if { $auth(auth_status) != "ok" } {
        return -code error $auth(auth_message)
    }

    return $auth(user_id)
}

ad_proc -public ix_ndc.seat_availability_rq {
    appkey
    package_id
    username
    password
    message
} {
    It returns the seat availability offers

} {
    ns_log Notice "Running ad_proc ws_ndc.baggage_allowance_rq..."


    return 0
}

ad_proc -public ix_ndc.baggage_allowance_rq {
    appkey
    package_id
    username
    password
    message
} {
    It returns the bag allowance offers

} {
    ns_log Notice "Running ad_proc ws_ndc.baggage_allowance_rq..."


    return 0
}
ad_proc -public ix_ndc.parse_pfs {
    appkey
    package_id
    username
    password
    message
} {
    It returns the sum result of a and b

} {
    ns_log Notice "Running ad_proc ws_ndc.parse_pfs..."

    # Authentication chunk. Security comes first. Setup HTTPS
    set user_id [ix_ndc_auth_for_xmlrpc \
                     -username $username \
                     -password $password]

    permission::require_permission -party_id $user_id \
        -object_id $package_id \
        -privilege create

    # Parsing PFS message
    foreach line $message {
	# Create acs object for pfs message
	ns_log Notice "$line"
    }

    return 0
}


ad_proc -public ix_ndc.get_result {
    appkey
    package_id
    username
    password
    a
    b
} {
    It returns the sum result of a and b

} {
    ns_log Notice "Running ad_proc ws_ndc.get_result..."

    set user_id [lars_blog_auth_for_xmlrpc \
                     -username $username \
                     -password $password]

    permission::require_permission -party_id $user_id \
        -object_id $package_id \
        -privilege create


    set result [expr ${a} + ${b}] 

    return $result
}