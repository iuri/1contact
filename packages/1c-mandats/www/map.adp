<!DOCTYPE html>
<html>
  <head>
      <style type="text/css">
            html, body { height: 100%; margin: 0; padding: 0; }
	          #map { height: 100%; }
		      </style>
		        </head>
			  <body>
			      <div id="map"></div>
			          <script type="text/javascript">

var map;
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 46.2, lng: 6.13},
          zoom: 8
	    });
	    }

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDzF7IlGi2Ue-EI6E6bizGVZ69NhFU7yGI&callback=initMap" async defer></script>



		    </body>
		    </html>