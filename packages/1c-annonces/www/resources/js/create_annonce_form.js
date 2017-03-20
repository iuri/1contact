function form_submit() {

	// Tipo de negócio
	var business = "";
	$('#abusiness option:selected').each( function() {
		business += ($(this).val()+',') ;
	});
	$('#business').val(business);

	// Tipo de imóvel
	var type = "";
	$('#atype option:selected').each( function() {
		type += ($(this).val()+',') ;
	});
	$('#type').val(type);

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

	// Processando a gravação dos dados no banco
	$.ajax({
		type: "POST",
		url: "save-annonce",
		data: $("#create_form").serialize(),
		success: function(data) {
			alert(data);
		}
	});

}