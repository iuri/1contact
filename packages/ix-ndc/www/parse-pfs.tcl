ad_page_contract {}


set appkey [ad_conn package_key]
set package_id [ad_conn package_id]
set username iuri.sampaio@iurix.com
set password jacare

set request_url http://www.iurix.com/RPC2 

#set method ix_ndc.get_result
set method ix_ndc.parse_pfs


# Read PFS message from a file.
set fp [open /var/www/iurix/packages/ix-ndc/www/resources/pfs.sample r]
# Retireve  PFS content to be sent
set fp_data [read $fp]
close $fp


set result [ix_ndc.parse_pfs $appkey $package_id $username $password $fp_data]

ns_log Notice "$result"


if { ![catch {
    xmlrpc::remote_call $request_url $method -string $appkey -int $package_id -string $username -string $password -string $fp_data

} result]} {
    ns_log Notice "SUCCESS!!!"
    

}


