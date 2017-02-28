ad_page_contract {
  Sends push messages to Android

    GIT Repos
    @https://github.com/hollyschinsky/PushNotificationSampleApp
    @https://gist.github.com/prime31/5675017

    Auxilliary docs
    @http://tcl.tk/man/tcl8.4/TclCmd/array.htm



    #Google Cloud messagin
    @https://developers.google.com/cloud-messaging/?hl=pt-Br
    @https://developers.google.com/cloud-messaging/downstream?hl=pt-Br




    # GEt registraton ids
    @http://stackoverflow.com/questions/10812433/how-can-i-get-my-registration-id-device
}

ns_log Notice "Running scrit send-push.tcl"






# Get google's api key
set API_ACCESS_KEY "598031210127"


set registration_ids ""


set url "https://gcm-http.googleapis.com/gcm/send"


set rqset [ns_set new rqset]
ns_set put $rqset "Authorization: key= $API_ACCESS_KEY" "Content-Type: application/json"

set body ""

if {[catch {[ns_httpspost $url "" $rqset]} result]} {
    ns_log debug "SEND PUSH returned: $result"
}

ns_log Notice "RESULT \n  $result"