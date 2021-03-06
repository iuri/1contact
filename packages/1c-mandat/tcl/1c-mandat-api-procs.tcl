# /packages/1c-mandat/tcl/1c-mandat-api-procs.tcl
ad_library {
    Library to support the 1Contact API

     @author Iuri Sampaio [iuri@iurix.com]
     @creation-date Mon Sep 12 17:35:01 2016
     @cvs-id $Id: ix-ndc-procs.tcl,v 0.1d 
}



ad_proc 1c_mandat_auth_for_xmlrpc {
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



ad_proc -public 1c_mandat.set_new_mandat_req {
    appkey
    package_id
    username
    password
    a
    b
} {
    It returns the sum result of a and b

} {
    ns_log Notice "Running ad_proc 1c_mandat.set_new_mandat_req ..."

    set user_id [1c_mandat_auth_for_xmlrpc \
                     -username $username \
                     -password $password]

    permission::require_permission -party_id $user_id \
        -object_id $package_id \
        -privilege create


    set result [expr ${a} + ${b}] 

    return $result
}