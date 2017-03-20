function form_submit() {

	// Tipo de negócio
	var annonce_business = "";
	$('#abusiness option:selected').each( function() {
		annonce_business += ($(this).val()+',') ;
	});
	$('#annonce_business').val(annonce_business);

	// Tipo de imóvel
	var annonce_type = "";
	$('#atype option:selected').each( function() {
		annonce_type += ($(this).val()+',') ;
	});
	$('#annonce_type').val(annonce_type);

	// Tipo de anunciante
	var annonce_annoncer = "";
	$('#aannoncer option:selected').each( function() {
		annonce_annoncer += ($(this).val()+',') ;
	});
	$('#annonce_annoncer').val(annonce_annoncer);

	// Características obrigatórias
	var annonce_charac_req = "";
	$("input[type='radio']").each( function() {
		if ( $(this).attr('name').includes('charac_req_') ) {
			if ( $(this).is(':checked') ) {
				var id = $(this).attr("id");
				annonce_charac_req += (id + ',');
			}
		}
	});
	$('#charac_required').val(annonce_charac_req);

	// Características generais
	var annonce_charac_gen = "";
	$('#charac_gen option:selected').each( function() {
		annonce_charac_gen += ($(this).val()+',') ;
	});
	$('#annonce_charac_opt_gen').val(annonce_charac_gen);

	// Características arquitetura
	var annonce_charac_arc = "";
	$('#charac_arc option:selected').each( function() {
		annonce_charac_arc += ($(this).val()+',') ;
	});
	$('#annonce_charac_opt_arc').val(annonce_charac_arc);

	// Características vizinhança
	var annonce_charac_vic = "";
	$('#charac_vic option:selected').each( function() {
		annonce_charac_vic += ($(this).val()+',') ;
	});
	$('#annonce_charac_opt_vic').val(annonce_charac_vic);

	$.ajax({
		type: "POST",
		url: url,
		data: $("#create_annonce_form").serialize(),
		success: function(data) {
			alert(data);
		}
	});

}