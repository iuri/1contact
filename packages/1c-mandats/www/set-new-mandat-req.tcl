ad_page_contract {}

ns_log Notice "Running page index.tcl"
set appkey [ad_conn package_key]
set package_id [ad_conn package_id]
set username iuri@iurix.com
set password jacare

set request_url http://iurix.com/RPC2 

#set method ix_ndc.get_result
set method 1c_mandat.set_new_mandat_req

set data "Hello World!"

if { ![catch {
    xmlrpc::remote_call $request_url $method -string $appkey -int $package_id -string $username -string $password -int 8 -int 9

} result]} {
    ns_log Notice "SUCCESS!!! $result"
    

}


