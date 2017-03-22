<master src="/www/blank-master">



 <style>

							     </style>
							       </head>
							         <body>
								     <div id="map"></div>
<script>

function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 11,
          center: {lat: 41.876, lng: -87.624}
	    });

  var ctaLayer = new google.maps.KmlLayer({
      url: 'http://googlemaps.github.io/js-v2-samples/ggeoxml/cta.kml',
          map: map
	    });
	    }

    </script>
