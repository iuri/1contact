# /packages/1c-annonce/tcl/1c-annonce-api-init.tcl
ad_library {
    Init ad_procs for the 1Contact  API

     @author Iuri Sampaio [iuri@iurix.com]
     @creation-date Mon Nov 12 17:35:01 2016
     @cvs-id $Id: 1c-annonce-api-init.tcl,v 0.1d 
}

xmlrpc::register_proc 1c_annnonces.loginUser
xmlrpc::register_proc 1c_annnonces.soma
