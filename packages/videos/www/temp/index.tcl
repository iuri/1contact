ad_page_contract {}



   #<!-- player skin -->
   template::head::add_css -href "skin/minimalist.css" 

   #<!-- site specific styling -->
   
   #<!-- flowplayer depends on jQuery 1.7.1+ (for now) -->
template::head::add_javascript -src "http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js" -order 0

   #<!-- include flowplayer -->
   template::head::add_javascript -src "flowplayer.min.js" -order 1

