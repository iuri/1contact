// Localizando cliente por email
function search_customer_email() {
	//if ( validateEmail($('#customer_email').val()) ) {
		fd = new FormData('userinfo');
		fd.append( 'mode', 'search customer email '+$('#customer_email').val() );
		process_search('customer', fd);
	//} else {
	//	alert('not a valid email');
	//}
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

	//$('#'+field+'_email').val(json.email);
	$('#'+field+'_mobilenumber').val(json.mobilenumber);
	$('#'+field+'_phonenumber').val(json.phonenumber);
	$('#'+field+'_entitlement').val(json.entitlement);
	$('#'+field+'_name').val(json.name);
	$('#'+field+'_surname').val(json.surname);
	var date = new Date(json.birthday);
	$('#'+field+'_birthday').val( date.getDate()+'.'+(date.getMonth()+1)+'.'+date.getFullYear() );
	$('#'+field+'_nationality').val(json.nationality);
	$('#'+field+'_civilstate').val(json.civilstate);
	$('#'+field+'_children_qty').val(json.children_qty);
	$('#'+field+'_children_ages').val(json.children_ages);
	if ( json.animal_p == 't' ) {
		$('#'+field+'_animals').val('true');
	} else {
		$('#'+field+'_animals').val('false');
	}
	$('#'+field+'_animals_type').val(json.animals_type);
	$('#'+field+'_animals_qty').val(json.animals_qty);
	if ( json.noexpirecontract_p == 't' ) {
		$('#'+field+'_noexpirecontract').val('true');
	} else {
		$('#'+field+'_noexpirecontract').val('false');
	}
	$('#'+field+'_job').val(json.job);
	$('#'+field+'_jobactivity').val(json.jobactivity);
	var date = new Date(json.datestartjob);
	$('#'+field+'_datestartjob').val( date.getDate()+'.'+(date.getMonth()+1)+'.'+date.getFullYear() );
	$('#'+field+'_salary').val(json.salary);
	$('#'+field+'_salary_month').val(json.salary_month);
	if ( json.independentjob_p == 't' ) {
		$('#'+field+'_independentjob').val('true');
	} else {
		$('#'+field+'_independentjob').val('false');
	}
	$('#'+field+'_jobother').val(json.jobother);
	$('#'+field+'_otherincoming').val(json.otherincoming);
	$('#'+field+'_address').val(json.address);
	$('#'+field+'_houseproperty').val(json.houseproperty);
	$('#'+field+'_houseproprietary').val(json.houseproprietary);
	$('#'+field+'_mortgage').val(json.mortgage);

	metroDialog.open('#'+field+'_exists');

}

function validateEmail($email) {
  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
  return emailReg.test( $email );
}