var map;
var infowindow;
var directionsService;
var directionsDisplay;
var geocoder;
var infoWindow;
var marker;


function initialize() {
    google.load('maps', '3.7', {
        'other_params' :
        'sensor=false&libraries=places&language=' + 'pt-BR',
        'callback' : mapsLoaded
    });
}

function mapsLoaded() {
    var refreshLink = document.getElementById('refresh');
    refreshLink.addEventListener('click', function() {
        window.location.reload();
    });
    directionsService = new google.maps.DirectionsService();
    geocoder = new google.maps.Geocoder();
    infowindow = new google.maps.InfoWindow();
      
    var lat = document.getElementById('lat').value;
    var lng = document.getElementById('lng').value;  
      //alert (lat + " " + lng);
    var torun = new google.maps.LatLng(lat,lng);

    map = new google.maps.Map(document.getElementById('map_canvas'), {
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        center: torun,
        zoom:14
    });
    google.maps.event.addListener(map, 'click', function(e) {
        geocoder.geocode(
            {'latLng': e.latLng},
            function(results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    if (results[0]) {
			if (marker) {
			    marker.setPosition(e.latLng);
			} else {
			    marker = new google.maps.Marker({
				position: e.latLng,
				map: map});
			}
			infowindow.setContent(results[0].formatted_address);
			infowindow.open(map, marker);
                    } else {
			document.getElementById('geocoding').innerHTML =
                            'No results found';
                    }
                } else {
                    document.getElementById('geocoding').innerHTML =
			'Geocoder failed due to: ' + status;
                }
            });
    });
    showDirections();
}

function showDirections() {
    directionsDisplay = new google.maps.DirectionsRenderer({
        map: map,
        preserveViewport: true,
        draggable: true
    });
    directionsDisplay.setPanel(document.getElementById('textbox'));
     
    //  alert (document.getElementById('saddr').value + " " + document.getElementById('daddr').value);

    var sampleRequest = {
	origin: document.getElementById('saddr').value,  
        destination: document.getElementById('daddr').value,
        travelMode: google.maps.TravelMode.DRIVING,
        unitSystem: google.maps.UnitSystem.METRIC
    };
    directionsService.route(sampleRequest, function(response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
        }
    });
}

 