<div class='navbar_row' >

<!-- Botoões de pesquisa ou oferta -->
<div class='navbar_cell' >
	<div class='radio_button' >

		<div>
			<input type='radio' name='search_origin' id='search_research' />
			<label for='search_research' >Procura</label>
		</div>
		<div>
			<input type='radio' name='search_origin' id='search_offer' />
			<label for='search_offer' >Oferta</label>
		</div>

	</div>
</div>

<!-- campo do local ou endereço -->
<div class='navbar_cell' >
	<div class='input-control' style='width:14em;' >
		<input type='text' name='search_place' id='search_place' placeholder='Local ou endereço' style='width:14em;' />
	</div>
</div>

<!-- Campo de seleção do tipo do imóvel (residencial ou comercial) -->
<div class='navbar_cell' >
	<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='Tipo' style='width:14em;' >
		<select name='search_type' id='search_type' multiple='multiple' style='width:14em;' >
			<option value='1' >Residencial</option>
			<option value='1' >Comercial</option>
		</select>
	</div>
</div>

<!-- Campo de seleção do tipo de negócio (locação ou compra) -->
<div class='navbar_cell' >
	<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='Negócio' style='width:14em;' >
		<select name='search_transaction' id='search_transaction' multiple='multiple' style='width:14em;' >
			<option value='0' >Alugar</option>
			<option value='1' >Comprar</option>
		</select>
	</div>
</div>

<!-- Características do imóvel -->
<div class='navbar_cell' >
	<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='Caracteristicas' style='width:14em;' >
		<select name='search_characteristics' id='search_characteristics' multiple='multiple' style='width:14em;' >
		  <multiple name='characs'>
			<option value='@characs.id@'>@characs.name@</option>
		  </multiple>
		</select>
	</div>
</div>

<!-- Preço mínimo e máximo -->
<div class='navbar_cell' >
	<div class='input-control number' style='width:5.2em;' >
		<input type='number' name='search_budget_min' id='search_budget_min' placeholder='Valor min' min='0' max='999999' style='width:100%;' />
	</div>
	<div class='input-control number' style='width:5.2em;' >
		<input type='number' name='search_budget_max' id='search_budget_max' placeholder='Valor max' min='0' max='999999' style='width:100%;' />
	</div>
</div>

<!-- Botão de pesquisar -->
<div class='navbar_cell' >
	<input type='submit' class='button white' value='Ok' />
</div>

</div>

<script type='text/javascript' >

	var type;
	var transaction;
	var characteristics;
	var place;
	var budget_min;
	var budget_max;

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