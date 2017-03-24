// Localizando cliente por email
function search_customer_email() {
	fd = new FormData('userinfo');
	fd.append( 'mode', 'search customer email '+$('#customer_email').val() );
	process_search('customer', fd);
}

// Localizando cliente por número de celular
function search_customer_mobilenumber() {
	fd = new FormData();
	fd.append( 'mode', 'search customer mobilenumber '+$('#customer_mobilenumber').val() );
	process_search('customer', fd);
}

// Localizando cliente por número de telefone
function search_customer_phonenumber() {
	fd = new FormData();
	fd.append( 'mode', 'search customer phonenumber '+$('#customer_phonenumber').val() );
	process_search('customer', fd);
}

// Obtendo dados do cliente
function process_search(field, formdata) {
	$.ajax({
		url: 'userinfo',
		type: 'POST',
		data: formdata,
		processData: false,
		contentType: false,
		success: function (data) {
			overite_infos(field, data);
		}
	});
}

// Preenchendo os campos com os dados do usuário, caso ele exista
function overite_infos(field, data) {

	var json = JSON.parse(data);

	$('#'+field+'_name').val(json.name);
	$('#'+field+'_surname').val(json.surname);
	$('#'+field+'_email').val(json.email);

	//metroDialog.open('#'+field+'_exists');

}