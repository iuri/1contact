ad_page_contract {
    It displays Google Map, using Google Maps API

}




#https://developers.google.com/maps/documentation/javascript/

# <!-- This stylesheet contains specific styles for displaying the map
# on this page. Replace it with your own styles as described in the documentation:
# https://developers.google.com/maps/documentation/javascript/tutorial -->

#template::head::add_javascript -scr "/maps/documentation/javascript/demos/demos.css" 



template::head::add_style -style "
 html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 100%;
      }
"



template::head::add_javascript -script "
var map;
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
      zoom: 4,
          center: {lat: -28, lng: 137}
	    });

  // NOTE: This uses cross-domain XHR, and may not work on older browsers.
    map.data.loadGeoJson('https://storage.googleapis.com/maps-devrel/google.json');
    }
" -order 0
