<master>

<form method='post' action='javascript:form_submit();' id='create_mandat_form'  enctype='multipart/form-data' >

<div style='position:relative;' >

	<h3>#1c-mandats.NewMandat#</h3>

	<div style='display:table;width:100%;vertical-align:top;' >

		<!-- Carregando lista de clientes -->
		<div style='display:table-cell;width:30%;padding-right:.5rem;' >
			<include src='../lib/customer-form' />
		</div>

		<!-- Carregando lista de conjuge/colocatário -->
		<div style='display:table-cell;width:30%;padding-right:.5rem;' >
			<include src='../lib/cotenant-form' />
		</div>

		<!-- Carregando lista de fiador -->
		<div style='display:table-cell;width:30%;padding-right:.5rem;' >
			<include src='../lib/guarantor-form' />
		</div>

	</div>

	<div class='box' >
	
		<div style='padding:.5rem;' >

			<h4>#1c-mandats.InfosAboutRequestedRealty#</h4>
			<!-- Tipo de negociação (locação ou venda) -->
			<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='#1c-mandats.TypeOfTransaction#' title='#1c-mandats.TypeOfTransaction#' style='width:11.5em;' >
				<select name='atypetransaction' id='atypetransaction' multiple='multiple' style='width:100%;' >
					<option value='1' >#1c-mandats.Rent#</option>
					<option value='2' >#1c-mandats.Buy#</option>
				</select>
				<input type='text' name='type_of_transaction' id='type_of_transaction' hidden />
			</div>
			<!-- Tipo de imóvel -->
			<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='#1c-realties.TypeOfProperty#' title='#1c-realties.TypeOfProperty#' style='width:18em;' >
				<select name='atypeproperty' id='atypeproperty' multiple='multiple' style='width:100%;' >
					<option value='1' >#1c-realties.House#</option>
					<option value='2' >#1c-realties.Apartment#</option>
					<option value='3' >#1c-realties.Commerce#</option>
				</select>
				<input type='text' name='type_of_property' id='type_of_property' hidden />
			</div>
			<!-- Num de cômodos -->
			<div class='input-control text' style='width:5.5em;' >
				<input type='number' name='rooms' id='rooms' placeholder='#1c-mandats.RoomsQty#' title='#1c-mandats.RoomsQty#' min='0' max='999' style='width:100%;' />
			</div>
			<!-- Área total -->
			<div class='input-control text' style='width:5.5em;' >
				<input type='text' name='surface' id='surface' placeholder='#1c-mandats.TotalArea#' title='#1c-mandats.TotalArea#' style='width:100%;' />
			</div>
			<!-- Preço min  -->
			<div class='input-control text' style='width:5em;' >
				<input type='text' name='price_min' id='price_min' placeholder='#1c-mandats.PriceMin#' title='#1c-mandats.PriceMin#' style='width:100%;' />
			</div>
			<!-- Preço max  -->
			<div class='input-control text' style='width:5em;' >
				<input type='text' name='price_max' id='price_max' placeholder='#1c-mandats.PriceMax#' title='#1c-mandats.PriceMax#' style='width:100%;' />
			</div>
			<!-- Localidade e mapa -->
			<div>
				<b>#1c-mandats.ChooseDesirebleAreas#<b><br>
				<!-- Exibição do mapa -->
				<br><br>(Renato's map will appear here)<br><br>
				<!-- Áreas indesejadas -->
				<div class='input-control text' style='width:534px' >
					<input type='text' name='unwanted_areas' id='unwanted_areas' placeholder='#1c-mandats.Undesired#' title='#1c-mandats.Undesired#' style='width:100%;' />
				</div>
			</div>

		</div>
		<!-- Características obrigatórias -->
		<div class='box' >
			<h4>#1c-realties.RequiredChars#</h4>
			<include src='../../1c-realties/lib/charac-req' />
			<input type='text' name='charac_required' id='charac_required' hidden />
		</div>
		<br>
		<!-- Características opcionais -->
		<div class='box' >
			<h4>#1c-realties.OptionalChars#</h4>
			<include src='../../1c-realties/lib/charac-opt' />
			<input type='text' name='charac_opt_gen' id='charac_opt_gen' hidden />
			<input type='text' name='charac_opt_arc' id='charac_opt_arc' hidden />
			<input type='text' name='charac_opt_vic' id='charac_opt_vic' hidden />
		</div>

	</div>
	<!-- Upload arquivios -->
	<div class='box' style='vertical-align:top;' >
		<h4>#1c-theme.AddFiles#</h4>
		<div class='input-control file' data-role='input' style='width:20em;' >
			<input type='file' name='upload_file' id='upload_file' multiple='multiple' title='#1c-theme.AddFiles#' onChange='javascript:showFiles();' >
			<button class='button clear' ><span class='mif-folder' ></span></button>
		</div>
		<br>
		<div id='files_names' ></div>
	</div>
	<!-- Observações -->
	<div class='box' >
		<h4>#1c-mandats.Requests#</h4>
		<div class='input-control textarea' data-role='input' data-text-auto-resize='true' style='width:30em;' >
			<textarea name='requests' id='requests' title='#1c-mandats.Requests#' ></textarea>
		</div>
	</div>
	<br>
	<!-- Status do mandato -->
	<div class='box' style='vertical-align:top;' >
		<h4>#1c-mandats.Status#</h4>
		<label class='input-control radio small-check' >
			<input type='radio' name='status' id='status_inactive' checked='checked' />
			<span class='check' ></span>
			<span class='caption' >#1c-mandats.Inactive#</span>
		</label>
		<label class='input-control radio small-check' >
			<input type='radio' name='status' id='status_ctive' />
			<span class='check' ></span>
			<span class='caption' >#1c-mandats.Active#</span>
		</label>
		<label class='input-control radio small-check' >
			<input type='radio' name='status' id='status_closed' />
			<span class='check' ></span>
			<span class='caption' >#1c-mandats.Closed#</span>
		</label>
	</div>
	<!-- Termos de uso -->
	<div class='box' style='vertical-align:top;' >
		<h4>#1c-mandats.Terms#</h4>
		<label class='input-control checkbox small-check' >
			<input type='checkbox' name='terms' id='terms' required />
			<span class='check' ></span>
			<span class='caption' >#1c-mandats.AcceptTerms#</span>
		</label>
	</div>
	<!-- Salvando o formulário -->
	<span style='position:absolute;right:0;bottom:0;' >
		<input type='submit' class='button' value='Salvar' required />
	</span>
	<!-- Propriedade que indica quando o formulário será salvo (alterado pelo javascript) -->
	<input type='text' name='mode' id='mode' hidden />

</div>

</form>

<!-- Mensagem de formulário salvo com sucesso -->
<div id='create_mandat_success' data-role='dialog' data-overlay='true' data-overlay-color='dialog_overlay' data-close-button='true' class='padding20' >
	<p><b>#1c-mandats.Success#</b></p>
</div>

<!-- Mensagem de erro durante o save do formulário -->
<div id='create_mandat_required_err' data-role='dialog' data-overlay='true' data-overlay-color='dialog_overlay' data-hide='3000' data-close-button='true' class='padding20' >
	<p><b>Fill all the fields before save the form.</b></p>
</div>