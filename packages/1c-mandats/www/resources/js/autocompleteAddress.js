var placeSearch, autocomplete;
var componentForm = {
	street_number: 'short_name',
	route: 'long_name',
	locality: 'long_name',
	sublocality: 'long_name',
	administrative_area_level_1: 'short_name',
	country: 'long_name',
	postal_code: 'short_name',
};

function fillInAddress() {
  var place = autocomplete.getPlace();
  for (var component in componentForm) {
    document.getElementById(component).value = '';
  }
  for (var i = 0; i < place.address_components.length; i++) {
    var addressType = place.address_components[i].types[0];
    if (componentForm[addressType]) {
      var val = place.address_components[i][componentForm[addressType]];
      document.getElementById(addressType).value = val;
    }
  }
}

function geolocate() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var geolocation = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      var circle = new google.maps.Circle({
        center: geolocation,
        radius: position.coords.accuracy
      });
      autocomplete.setBounds(circle.getBounds());
    });
  }
}

autocompleteCustomer = new google.maps.places.Autocomplete( (document.getElementById('customer_address')), {types: ['geocode']} );
autocompleteCustomer.addListener('place_changed', fillInAddress);

autocompleteCotenant = new google.maps.places.Autocomplete( (document.getElementById('cotenant_address')), {types: ['geocode']} );
autocompleteCotenant.addListener('place_changed', fillInAddress);

autocompleteGuarantor = new google.maps.places.Autocomplete( (document.getElementById('guarantor_address')), {types: ['geocode']} );
autocompleteGuarantor.addListener('place_changed', fillInAddress);