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

	var files = $('#files')[0].files;

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
				var id = $(this).attr("id");
				charac_req += (id + ',');
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

	// Processando a gravação dos dados no banco
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
	/*
	$.post(
		'create-annonce',
		$("#create_annonce_form").serialize(),
		function (data) {
			if ( data.toString() != "" ) {
				metroDialog.open('#create_annonce_success');
				setTimeout( function(){ window.location.href = '/' }, 3000);
			}
		}
	);
	*/

}