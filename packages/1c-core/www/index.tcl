ad_page_contract {} {
    {url "http://www.google.com/maps/d/kml?forcekml=1&mid=1vhl1snn5KUNES0aG-nIHAN2UxBM"}
    {return_url ""}
}

    

if {$url ne ""} {
    
    
    set return_url ""

 #   set url [export_vars -base "https://graph.facebook.com/oauth/access_token" \
#		 {{client_id $appid} {redirect_uri $return_url} {client_secret $appkey} {code $code}}]



    #   set queryHeaders [ns_set create]
    #ns_set update $queryHeaders Host https://www.evex.co


    # ns_log Notice "$url"

    #https://naviserver.sourceforge.io/n/naviserver/files/ns_http.html#section3



set data "
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
  <Document>
    <name>GE</name>
    <description/>
    <NetworkLink>
      <name>GE</name>
      <Link>
        <href><![CDATA[http://www.google.com/maps/d/kml?forcekml=1&mid=1vhl1snn5KUNES0aG-nIHAN2UxBM]]></href>
      </Link>
    </NetworkLink>
  </Document>
</kml>"


    ns_log Notice "TEST"
    if {[file exists  "/resources/1c-core/GE.kml"]} {
	
	#set xmlFile [open "/resources/1c-core/GE.kml"]

	#set data [read $xmlFile]

	ns_log Notice "DATA $data"
    }  
#    set form [ns_set new]
#    ns_set put $data Name John
#    ns_set put $data Action Add


    set page [ns_httppost ] "" $data
    

 #   set page [ns_http run -headers $queryHeaders -timeout 10.0 -method POST $url]
    

    # FAB LOGIN WORKFLOW CASE
    #https://developers.facebook.com/docs/facebook-login/manually-build-a-login-flow#confirm
    #https://developers.facebook.com/docs/facebook-login/manually-build-a-login-flow#checktoken

 #   ns_log Notice "$page"
    
}
