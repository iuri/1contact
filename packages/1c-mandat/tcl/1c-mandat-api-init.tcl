# /packages/1c-mandat/tcl/1c-mandat-init.tcl
ad_library {
    Init ad_procs for the 1Contact  API

     @author Iuri Sampaio [iuri@iurix.com]
     @creation-date Mon Nov 12 17:35:01 2016
     @cvs-id $Id: 1c-mandat-api-init.tcl,v 0.1d 
}

xmlrpc::register_proc 1c_mandat.set_new_mandat_req