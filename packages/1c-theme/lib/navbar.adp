<form method='post' id='search_form' action='javascript:proceed_search();' >

<div class='navbar_row' >

<!-- Botoões de pesquisa ou oferta -->
<div class='navbar_cell' >
	<div class='radio_button' >

		<div class='search_research' >
			<input type='radio' name='search_origin' id='search_research' />
			<label for='search_research' >#1c-theme.Research#</label>
		</div>
		<div class='search_offer' >
			<input type='radio' name='search_origin' id='search_offer' class='button2' />
			<label for='search_offer' >#1c-theme.Offer#</label>
		</div>

	</div>
</div>

<!-- campo do local ou endereço -->
<div class='navbar_cell' >
	<div class='input-control text' style='width:13em;' >
		<input type='text' name='search_place' id='search_place' placeholder='#1c-theme.PlaceOrAddress#' style='width:100%;' />
	</div>
</div>

<!-- Campo de seleção do tipo do imóvel (residencial ou comercial) -->
<div class='navbar_cell' >
	<div class='input-control select' data-role='select' data-allow-clear='true' data-placeholder='#1c-theme.TypeOfProperty#' style='width:13.5em;' >
		<select name='search_type' id='search_type' multiple='multiple' style='width:100%;' >
			<option value='1' >#1c-theme.Residential#</option>
			<option value='1' >#1c-theme.Commercial#</option>
		</select>
	</div>
</div>

<!-- Campo de seleção do tipo de negócio (locação ou compra) -->
<div class='navbar_cell' >
	<div class='input-control select' data-role='select' data-allow-clear='true' data-placeholder='#1c-theme.TypeOfTransaction#' style='width:10em;' >
		<select name='search_transaction' id='search_transaction' multiple='multiple' style='width:100%;' >
			<option value='1' >#1c-theme.Rent#</option>
			<option value='2' >#1c-theme.Buy#</option>
		</select>
	</div>
</div>

<!-- Características do imóvel -->
<div class='navbar_cell' >
	<div class='input-control select' data-role='select' data-allow-clear='true' data-placeholder='#1c-theme.Characteristics#' style='width:14em;' >
		<select name='search_characteristics' id='search_characteristics' multiple='multiple' style='width:100%;' >
		  <multiple name='characs'>
			<option value='@characs.id@'>@characs.name@</option>
		  </multiple>
		</select>
	</div>
</div>

<!-- Preço mínimo e máximo -->
<div class='navbar_cell' >
	<div class='input-control text' style='width:9em;' >
		<input type='text' name='search_budget' id='search_budget' placeholder='#1c-theme.Budget#' title='#1c-theme.BudgetHelp#' onChange='javascript:checkBudget();' style='width:100%;' />
	</div>
</div>

<!-- Botão de pesquisar -->
<div class='navbar_cell' >
	<div class='submit_button' onClick="javascript:$('#search_form').submit();" >Ok</div>
</div>

</div>

</form>

<script type='text/javascript' >

	/* Verificação e correção dos valores minimo e máximo */
	function checkBudget() {
		var bud = $('#search_budget').val();
		var v = bud.split('a');

		var x = parseInt(v[0]);
		var y = parseInt(v[1]);

		if ( isNaN(x) ) { var x = 0; }
		if ( isNaN(y) ) { var y = 0; }

		if ( y < x ) { xx = y; yy = x; } else { xx = x; yy = y; }

		$('#search_budget').val(xx+' a '+yy);
	}

	/* Realizando a pesquisa */
	function proceed_search() {
		alert('pesquisar');
	};

</script>