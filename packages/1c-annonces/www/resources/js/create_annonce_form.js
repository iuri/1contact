function updateValue() {
	var price = $('#price').val();
	var taxes = $('#taxes').val();
	$('#total_value').val( Number(price) + Number(taxes) );
}

function updateArea() {
	var inner = $('#inner_surface').val();
	var outer = $('#outer_surface').val();
	$('#total_surface').val( Number(inner) + Number(outer) );
}

function showFiles() {

	var names = $('#files_names');
	names.empty();

	var files = $('#upload_file')[0].files;

	for (var i = 0; i < files.length; i++) {

		var n = files[i].name.split('.');

		if ( ['jpg', 'png', 'gif', 'tif'].includes(n[1]) ) {
			icon = 'file-image';
		} else if ( ['zip', '7z', 'rar', 'arc'].includes(n[1]) ) {
			icon = 'file-zip';
		} else if ( ['txt', 'doc', 'rtf'].includes(n[1]) ) {
			icon = 'file-word';
		} else if ( ['xls', 'xlsx'].includes(n[1]) ) {
			icon = 'file-excel';
		} else if ( ['pdf'].includes(n[1]) ) {
			icon = 'file-pdf';
		} else {
			icon = '';
		}

 		names.append ( "<span class='mif-"+icon+"' ><span class='normal_text' >&nbsp;"+n[0]+("</span></span>") );

 		if ( files.length > 1 && i < (files.length-1) ) { names.append( '&nbsp;' ); }
 	}

}

function form_submit() {

	// Tipo de negócio
	var transaction = "";
	$('#atypetransaction option:selected').each( function() {
		transaction += ($(this).val()+',') ;
	});
	$('#type_of_transaction').val(transaction);

	// Tipo de imóvel
	var property = "";
	$('#atypeproperty option:selected').each( function() {
		property += ($(this).val()+',') ;
	});
	$('#type_of_property').val(property);

	// Tipo de anunciante
	var announcer = "";
	$('#aannouncer option:selected').each( function() {
		announcer += ($(this).val()+',') ;
	});
	$('#announcer').val(announcer);

	// Características obrigatórias
	var charac_req = "";
	$("input[type='radio']").each( function() {
		if ( $(this).attr('name').includes('charac_req_') ) {
			if ( $(this).is(':checked') ) {
				charac_req += ($(this).val()+',');
			}
		}
	});
	$('#charac_required').val(charac_req);

	// Características generais
	var charac_gen = "";
	$('#charac_gen option:selected').each( function() {
		charac_gen += ($(this).val()+',') ;
	});
	$('#charac_opt_gen').val(charac_gen);

	// Características arquitetura
	var charac_arc = "";
	$('#charac_arc option:selected').each( function() {
		charac_arc += ($(this).val()+',') ;
	});
	$('#charac_opt_arc').val(charac_arc);

	// Características vizinhança
	var charac_vic = "";
	$('#charac_vic option:selected').each( function() {
		charac_vic += ($(this).val()+',') ;
	});
	$('#charac_opt_vic').val(charac_vic);

	// Dizendo ao tcl que o formulário está pronto para ser salvo
	$('#mode').val('save');

	// Verifica se todos os campos [required] foram preenchidos (para naveadores que não suportam a tag required do HTML5)
	var process = true;
    $('#create_annonce_form :input:visible[required="required"]').each( function () {
		if (!this.validity.valid) {
   			metroDialog.open('#create_annonce_required_err');
   			process = false;
   		}
   	});

	// Processando a gravação dos dados no banco
	if ( process ) {
		$.ajax({
			url: 'create-annonce',
			type: 'POST',
			data: new FormData( $("#create_annonce_form")[0] ),
			processData: false,
			contentType: false,
			success: function (data) {
				if ( data.toString() != "" ) {
					metroDialog.open('#create_annonce_success');
					setTimeout( function(){ window.location.href = '/' }, 3000);
				}
			}
		});
	}

}

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

function initAutocomplete() {
  autocomplete = new google.maps.places.Autocomplete(
  	(document.getElementById('address')),
  	{types: ['geocode']});
  autocomplete.addListener('place_changed', fillInAddress);
}

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

function clearAddress() {
	$('#number').val('');
    $('#complement').val('');
	for (var component in componentForm) {
		document.getElementById(component).value = '';
    }
}