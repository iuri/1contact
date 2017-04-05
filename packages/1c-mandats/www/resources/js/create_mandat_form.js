function form_submit() {

	// Subtipo de propriedade
	var sub_property = "";
	if ( $('#type_of_property').val() == 1 ) {
		$('#subtype_res option:selected').each( function() {
			sub_property += ($(this).val()+',') ;
		});
	}
	if ( $('#type_of_property').val() == 2 ) {
		$('#subtype_com option:selected').each( function() {
			sub_property += ($(this).val()+',') ;
		});
	}
	$('#subtype_of_property').val(sub_property);

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

	// Verifica se todos os campos [required] foram preenchidos (para naveadores que não suportam a tag required do HTML5)
	var process = true;
    $('#create_mandat_form :input:visible[required="required"]').each( function () {
		if (!this.validity.valid) {
   			//metroDialog.open('#create_mandat_required_err');
   			//process = false;
   		}
   	});

    // Dizendo ao tcl que o formulário está pronto para ser salvo
	$('#mode').val('save');

	// Processando a gravação dos dados no banco
	if ( process ) {
		$.ajax({
			url: 'create-mandat',
			type: 'POST',
			data: new FormData( $("#create_mandat_form")[0] ),
			processData: false,
			contentType: false,
			success: function (data) {
				if ( data.toString() != "" ) {
					metroDialog.open('#create_mandat_success');
					setTimeout( function(){ window.location.href = '/' }, 3000);
				}
			}
		});
	}

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