ad_page_contract {
    list of videos
    
    @author Alessandro Landim
    @author iuri sampaio

    $Id: site-master.tcl,v 1.22.2.7 2007/07/18 10:44:06 emmar Exp $
} {
    {ytid "9ogF49H5Oc4"}
    {ytlist "RDYjSmdZnUncw"}
    {q ""}
} -properties {
    context:onevalue
}



#### ytlists: 
####
### Maldives 
##
## v=JiPkDbjbN8w
####
### ChillOut best rap songs (Best Cypress Hill Songs)
## https://www.youtube.com/watch?v=HlW43hGSIIs#t=156
## v=HlW43hGSIIs
####
### DJ SASHA - New Emissions of Light And Sound
## https://www.youtube.com/watch?v=9ogF49H5Oc4&hd=1
# v=9ogF49H5Oc4  
####
### Sasha - Lonely place [HD] 
## https://www.youtube.com/watch?v=BALTAJdPdso&list=RDYjSmdZnUncw
# BALTAJdPdso&list=RDYjSmdZnUncw
### Liquid Soul - Revolution 
## https://www.youtube.com/watch?v=uzlrRLk2sYk
# uzlrRLk2sYk
####
#### go with it tokimonsta
### https://www.youtube.com/watch?v=D3kQHZmQmVI
## D3kQHZmQmVI
#
####
### Miles Davis - Red China Blues 
## https://www.youtube.com/watch?v=EuKhccJi_GI&list=RDuPyJLRFk_UY
# v=EuKhccJi_GI&list=RDuPyJLRFk_UY
####
### Black Satin by Miles Davis
## https://www.youtube.com/watch?v=4iOG_ZSEMUs&list=RDuPyJLRFk_UY
# v=4iOG_ZSEMUs&list=RDuPyJLRFk_UY
####
### Miles Davis - Budo 
## https://www.youtube.com/watch?v=_555G6j4PLE&list=RDuPyJLRFk_UY
# v=_555G6j4PLE&list=RDuPyJLRFk_UY
####
### Relax Music 2013 Chill-out & Trip Hop Selected Mix 2
## https://www.youtube.com/watch?v=MSQxQ7OuNlA 
# MSQxQ7OuN1A
####
### MoodShifter - Blue Moon Mix (Downtempo/Progressive/Psychill 
## https://www.youtube.com/watch?v=_m7eJwJDGmA
# m7eJwJDGmA
####
### Martin Roth - Make Love To Me Baby (Original Mix)
## https://www.youtube.com/watch?v=s1Vjzyjz6cw#aid=P95SSmNmiEY
# video_id s1Vjzyjz6cw
####
### Chill Out Music / Liquid Trap Mix + Rick Vinsanto Guest Mix 
## https://www.youtube.com/watch?feature=player_embedded&v=xUF_15OaChU
# video_id xUF_15OaChU
####
### TOKiMONSTA - Go With It (CRNKN Remix)
## video_id sLyqiN7kwH0
# https://www.youtube.com/watch?v=sLyqiN7kwH0
####
## http://www.youtube.com/watch?v=DkI7LaJ7ncQ#aid=P9Dv4qV_pP4
# video_id DkI7LaJ7ncQ

### Majestic Casual vs The Sound You Need 
## https://www.youtube.com/watch?v=rSMi_BU6h9M
# video_id rSMi_BU6h9M list_id
## http://www.youtube.com/watch?list=RD1K77FzNSi1s&v=sFB3SS9-qa0  
# sFB3SS9-qa0  RD1K77FzNSi1s
### MALDIVES Relaxing
## http://www.youtube.com/watch?v=JiPkDbjbN8w&hd=1
# JiPkDbjbN8w  FLzrG8hmVpf_zg9Aoy_wq30Q
### AMBIENTAL TRANCE MIX 
## https://www.youtube.com/watch?v=mrYpqc244s8&hd=1
# mrYpqc244s8
###
## http://www.youtube.com/watch?list=FLzrG8hmVpf_zg9Aoy_wq30Q&v=ooeED5Xy55s#t=5897
#

set context [list]
set user_id [ad_conn user_id]
set package_id [ad_conn package_id]
set object_id [ad_conn object_id]

permission::require_permission -party_id [ad_conn user_id] -object_id $package_id -privilege read

set admin_p [permission::permission_p -party_id [ad_conn user_id] -object_id [ad_conn package_id] -privilege admin]
set action_list ""

if {$admin_p eq 1} {
      set action_list {"#videos.New#" videos-new "#videos.New#"}
}

set image_size [parameter::get -package_id $package_id -parameter ImageSize]
set widthxheight [split $image_size "x"]
set width [lindex $widthxheight 0]
set height [lindex $widthxheight 1]
if {$width > 500} {
    set width [expr $width - 200]
}


#variable lists to db_multirow
set extend_list [list]

db_multirow -extend $extend_list recent_videos select_recent_videos {} { }

db_multirow -extend $extend_list popular_videos select_popular_videos {} { }


###########
## It needs to implement internal videos search
###########
# Video's search form 
#ad_form -name search -export {} -action list -form {
#    {keyword:text(text),optional {label "[_ videos.Search]"} }
#}



set notification_chunk [notification::display::request_widget \
    -type videos_video_notif \
    -object_id $package_id \
    -pretty_name "Videos" \
    -url [ad_conn url]?object_id=$package_id \
]

#ns_log Notice "$notification_chunk"

set type_id [notification::type::get_type_id -short_name videos_video_notif]
#ns_log Notice "TYPEID $type_id"
set notification_count [notification::request::request_count \
			    -type_id $type_id \
			    -object_id $package_id]



# General search link

set general_search_url [export_vars -base /search/search {{q $q} {t "Search"}}]