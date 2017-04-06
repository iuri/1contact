# www/test_ws.tcl
ns_log Notice "Running TCL script test_ws.tcl"

set package_id [ad_conn package_id]



#catch {xmlrpc::remote_call http://1c.1contact.ch/RPC2  1c_annonces.loginUser  -string "iuri@iurix.com" -string "jacare" } result

#catch {xmlrpc::remote_call http://1c.1contact.ch/RPC2 1c_annonces.soma  -int 3 -int 3 } result

set package_id [ad_conn package_id]

catch {xmlrpc::remote_call http://evex.co/RPC2 blogger.newPost -string "dsdsddfrerevgrtere" -int 1197 -string "iuri@iurix.com" -string "jacare" -string "text body" -boolean true} result


# References
#http://philip.greenspun.com/doc/proc-one?proc_name=ns_httpopen
#https://aolserver.am.net/docs/3.0/tapi-135.htm
# http://1c.1contact.ch:8000/api-doc/proc-view?proc=util%3a%3ahttp%3a%3apost&source_p=1


ns_log Notice "$result"
