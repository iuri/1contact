<header>

	<link rel='stylesheet' href='css/navbar.css' type='text/css' />

</header>

<body>

	<div class='navbar_wrapper' >

		<div class='navbar_row' >

			<div class='navbar_cell' >

					
					<div class='radio_button' >
						<input type='radio' name='search_origin' id='p' />
						<label for='p' >Procura</label>
						<input type='radio' name='search_origin' id='o' />
						<label for='o' >Oferta</label>
					</div>

			</div>

			<div class='navbar_cell' >
				<div class='input-control' style='width:15em;' >
					<input type='text' name='search_place' id='search_place' placeholder='Local' style='width:100%;' />
				</div>
			</div>

			<div class='navbar_cell' >
				<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='Tipo' style='width:8em;' >
					<select name='search_type' id='search_type' multiple='multiple' style='width:100%;' >
						<option value='1' >Residencial</option>
						<option value='1' >Comercial</option>
					</select>
				</div>
			</div>

			<div class='navbar_cell' >
				<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='Negócio' style='width:8em;' >
					<select name='search_transaction' id='search_transaction' multiple='multiple' style='width:100%;' >
						<option value='0' >Alugar</option>
						<option value='1' >Comprar</option>
					</select>
				</div>
			</div>

			<div class='navbar_cell' >
				<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='Caracteristicas' style='width:10em;' >
					<select name='search_characteristics' id='search_characteristics' multiple='multiple' style='width:100%;' >
						<option value='0' >Bela Vista</option>
						<option value='1' >Lareira</option>
						<option value='2' >Teto alto</option>
						<option value='3' >Piso antigo</option>
						<option value='4' >Máquina de lavar</option>
						<option value='5' >Secadora de roupas</option>
						<option value='6' >Lavadoura de louças</option>
						<option value='7' >Cozinha aberta</option>
						<option value='8' >Cozinha grande</option>
					</select>
				</div>
			</div>

			<div class='navbar_cell' >

				<div class='input-control number' style='width:5.5em;' >
					<input type='number' name='search_budget_min' id='search_budget_min' placeholder='Valor min' min='0' max='999999' style='width:100%;' />
				</div>
				<div class='input-control number' style='width:5.5em;' >
					<input type='number' name='search_budget_max' id='search_budget_max' placeholder='Valor max' min='0' max='999999' style='width:100%;' />
				</div>

			</div>

		</div>


	</div>

</body>

<script type='text/javascript' >

	var request;
	var type;
	var transaction;
	var characteristics;
	var place;
	var budget_min;
	var budget_max;

	$( "#search_request" ).change( function() {
		request = $( "#search_request" ).val();
		proceed_search();
	});

	$( "#search_type" ).change( function() {
		type = $( "#search_type" ).val();
		proceed_search();
	});

	$( "#search_transaction" ).change( function() {
		transaction = $( "#search_transaction" ).val();
		proceed_search();
	});

	$( "#search_characteristics" ).change( function() {
		characteristics = $( "#search_characteristics" ).val();
		proceed_search();
	});

	$( "#search_place" ).change( function() {
		place = $( "#search_place" ).val();
		proceed_search();
	});

	$( "#search_budget_min" ).change( function() {
		budget_min = $( "#search_budget_min" ).val();
		proceed_search();
	});

	$( "#search_budget_max" ).change( function() {
		budget_max = $( "#search_budget_max" ).val();
		proceed_search();
	});

	function proceed_search() {
		//metroDialog.open('dialog');
	};

</script>