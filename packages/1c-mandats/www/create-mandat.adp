<master>

<form method='post' action='javascript:form_submit();' id='create_mandat_form'  enctype='multipart/form-data' >

<div style='position:relative;' >

	<h3 class='noprint' >#1c-mandats.NewMandat#</h3>
	
	<h4>#1c-mandats.InfosAboutRequestedRealty#</h4>

	<div class='box' style='margin-left:0;' >
		<!-- Tipo de negociação (locação ou venda) -->
		<div class='input-control select' data-role='select' data-placeholder='#1c-mandats.TypeOfTransaction#' title='#1c-mandats.TypeOfTransaction#' style='width:11.5em;' >
			<select name='type_of_transaction' id='type_of_transaction' required onChange='javascript:alterTypeofTransaction();' style='width:100%;' >
				<option value='' disabled selected hidden >Tipe of transaction</option>
				<option value='1' >#1c-mandats.Rent#</option>
				<option value='2' >#1c-mandats.Buy#</option>
			</select>
		</div>
		<!-- Tipo de imóvel -->
		<div class='input-control select' data-role='select' data-placeholder='#1c-realties.TypeOfProperty#' title='#1c-realties.TypeOfProperty#' style='width:10em;' >
			<select name='type_of_property' id='type_of_property' onChange='change_business();' required style='width:100%;' >
				<option value='' disabled selected hidden >Tipe of business</option>
				<option value='1' >Residential</option>
				<option value='2' >Commercial</option>
			</select>
		</div>

		<!-- Subipo de imóvel (residencial) -->
		<div class='input-control select' data-role='select' data-allow-clear='true' data-placeholder='#1c-realties.TypeOfProperty#' title='#1c-realties.TypeOfProperty#' id='subtype_residential' style='width:15em;display:none;' >
			<select name='subtype_res' id='subtype_res' multiple style='width:100%;' >
				<option value='1' >House</option>
				<option value='2' >Apartment</option>
			</select>
		</div>

		<!-- Subipo de imóvel (comercial) -->
		<div class='input-control select' data-role='select' data-allow-clear='true' data-placeholder='#1c-realties.TypeOfProperty#' title='#1c-realties.TypeOfProperty#' id='subtype_comercial' style='width:15em;display:none;' >
			<select name='subtype_com' id='subtype_com' multiple style='width:100%;' >
				<option value='1' >Arcade</option>
				<option value='2' >Locaux</option>
				<option value='3' >Depot</option>
			</select>
		</div>

		<input type='text' name='subtype_of_property' id='subtype_of_property' hidden />

		<!-- Num de cômodos -->
		<div class='input-control text' style='width:6em;' >
			<input type='number' name='rooms_qty' id='rooms_qty' placeholder='#1c-realties.RoomQty# min' title='#1c-realties.RoomQty# min' min='0' max='999' required style='width:100%;' />
		</div>
		<!-- Área total -->
		<div class='input-control text' style='width:7em;' >
			<input type='text' name='surface' id='surface' placeholder='Superfície min' title='Superfície min' required style='width:100%;' />
		</div>
		<!-- Preço  -->
		<div class='input-control text' style='width:9em;' >
			<input type='text' name='budget' id='budget' placeholder='#1c-theme.Budget#' title='#1c-theme.BudgetHelp#' onChange='javascript:mandatCheckBudget();' required style='width:100%;' />
		</div>
		<input type='text' name='budget_min' id='budget_min' readonly hidden />
		<input type='text' name='budget_max' id='budget_max' readonly hidden />
	</div>

	<!-- Características obrigatórias -->
	<div class='box' style='margin-left:0;' >
		<h4>#1c-realties.RequiredChars#</h4>
		<include src='../../1c-realties/lib/charac-req' />
		<input type='text' name='charac_required' id='charac_required' hidden />
	</div>

	<!-- Exibição do mapa -->
	<div class='box noprint' style='width:100%;margin-left:0;position:relative;' >
		<include src='/packages/1c-realties/lib/map' />
	</div>

	<div style='display:table;width:100%;vertical-align:top;margin-left:0;' >
		<!-- Carregando lista de clientes -->
		<div style='display:table-cell;width:30%;padding-right:.5rem;' >
			<include src='../lib/customer-form' />
		</div>
		<!-- Carregando lista de conjuge/colocatário -->
		<div style='display:table-cell;width:30%;padding-right:.5rem;' >
			<include src='../lib/cotenant-form' />
		</div>
		<!-- Carregando lista de fiador -->
		<div style='display:table-cell;width:30%;padding-right:.5rem;' id='guarantor_fields' >
			<include src='../lib/guarantor-form' />
		</div>
	</div>

	<!-- Upload arquivios -->
	<div class='box noprint' style='vertical-align:top;margin-left:0;' >
		<h4>#1c-theme.AddFiles#</h4>
		<div class='input-control file' data-role='input' style='width:20em;' >
			<input type='file' name='upload_file' id='upload_file' multiple='multiple' title='#1c-theme.AddFiles#' onChange='javascript:showFiles();' >
			<button class='button clear' ><span class='mif-folder' ></span></button>
		</div>
		<br>
		<div id='files_names' ></div>
	</div>

	<!-- Observações -->
	<div class='box' style='margin-left:0;' >
		<h4>#1c-mandats.Requests#</h4>
		<div class='input-control textarea' data-role='input' data-text-auto-resize='true' style='width:30em;' >
			<textarea name='extra_info' id='extra_info' title='#1c-mandats.Requests#' ></textarea>
		</div>
	</div>

	<!-- Status do mandato -->
	<div class='box noprint' style='vertical-align:top;margin-left:0;' >
		<h4>#1c-mandats.Status#</h4>
		<label class='input-control radio small-check' >
			<input type='radio' name='status' id='status_inactive' checked='checked' value='0' required />
			<span class='check' ></span>
			<span class='caption' >#1c-mandats.Inactive#</span>
		</label>
		<label class='input-control radio small-check' >
			<input type='radio' name='status' id='status_active' value='1' required />
			<span class='check' ></span>
			<span class='caption' >#1c-mandats.Active#</span>
		</label>
		<label class='input-control radio small-check' >
			<input type='radio' name='status' id='status_closed' value='2' required />
			<span class='check' ></span>
			<span class='caption' >#1c-mandats.Closed#</span>
		</label>
	</div>

	<!-- Salvando o formulário -->
	<span class='noprint' style='position:absolute;right:0;bottom:0;' >
		<input type='submit' class='button noprint' value='Salvar' required />
	</span>

	<!-- Propriedade que indica quando o formulário será salvo (alterado pelo javascript) -->
	<input type='text' name='mode' id='mode' hidden />

</div>

</form>

<!-- Mensagem de formulário salvo com sucesso -->
<div id='create_mandat_success' data-role='dialog' data-type='success' data-overlay='true' data-overlay-color='dialog_overlay' data-close-button='true' class='padding20' >
	<p><b>#1c-mandats.Success#</b></p>
</div>

<!-- Mensagem de erro durante o save do formulário -->
<div id='create_mandat_required_err' data-role='dialog' data-type='alert' data-overlay='true' data-overlay-color='dialog_overlay' data-hide='3000' data-close-button='true' class='padding20' >
	<p><b>Fill all the fields before save the form.</b></p>
</div>

<script type='text/javascript' >

	// Mostarando ou escondendo campo de fiador de acordo com o tipo de negócio
	function alterTypeofTransaction() {
		if ( $('#type_of_transaction').val() == 2 ) {
			$('#guarantor_fields').hide();
		} else {
			$('#guarantor_fields').show();
		}
	}

	// Mostrando as sub propriedades dos imóveis de acordo com o tipo (residencial ou comercial)
	function change_business() {
		if ( $('#type_of_property').val() == 1 ) {
			$('#subtype_residential').show();
			$('#subtype_comercial').hide();
		} else {
			$('#subtype_residential').hide();
			$('#subtype_comercial').show();
		}
	}

	/* Verificação e correção dos valores minimo e máximo */
	function mandatCheckBudget() {
		var bud = $('#budget').val();
		var v = bud.split('a');

		var x = parseInt(v[0]);
		var y = parseInt(v[1]);

		if ( isNaN(x) ) { var x = 0; }
		if ( isNaN(y) ) { var y = 0; }

		if ( y < x ) { xx = y; yy = x; } else { xx = x; yy = y; }

		$('#budget').val(xx+' a '+yy);
		$('#budget_min').val(xx);
		$('#budget_max').val(yy);
	}

</script>