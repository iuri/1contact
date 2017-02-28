################## KLUDGE BY STAS ###############
# Try and look up the item in the content repository
#################################################
ad_page_contract {
   
    @author Unknown
    @creation-date Unknown
    @cvs-id $Id: index.vuh,v 1.3 2006/08/08 21:26:49 donb Exp $
} {    
}

set user_id [ad_conn user_id]
set package_id [ad_conn package_id]
permission::require_permission -party_id [ad_conn user_id] -object_id $package_id -privilege read



set xmlfile [ns_mktemp /tmp/xml-XXXXXX]
set fd [open $xmlfile w]
puts $fd [encoding convertto utf-8 "<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>"]
puts $fd [encoding convertto utf-8 "<playlist version=\"1\" xmlns=\"http://xspf.org/ns/0/\">"]
puts $fd [encoding convertto utf-8 "<trackList>"]


db_multirow videos select_videos {
	    select video_id,
		   package_id,
		   video_name,
		   video_description as hr,
            acs_object__name(apm_package__parent_id(v.package_id)) as parent_name,
            (select site_node__url(site_nodes.node_id)
            from site_nodes
            where site_nodes.object_id = v.package_id) as url
            from videos v
	    where v.package_id = :package_id
            and 't' = acs_permission__permission_p(v.video_id, :user_id, 'read')
            order by video_id desc
} {

	append rss "
		<track>
			<annotation>$video_name</annotation>
			<creator></creator>
			<location>${url}${video_id}.flv</location>
			<image>${url}$video_id.jpg</image>
			<info>${url}videos-view?video_id=$video_id</info>
		</track>
	"




      
}

append rss {	</trackList>
</playlist>
}
puts $fd $rss 
close $fd

ns_returnfile 200 text/xml $xmlfile
file delete $xmlfile
ad_script_abort


