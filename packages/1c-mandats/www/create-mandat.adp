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

		<!--  -->
		<h4>#1c-mandats.InfosAboutRequestedRealty#</h4>

		<!-- Tipo de negociação (locação ou venda) -->
		<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='Tipo de negócio' style='width:11.5em;' >
			<select name='atypetransaction' id='atypetransaction' multiple='multiple' style='width:100%;' >
				<option value='1' >#1c-mandats.Rent#</option>
				<option value='2' >#1c-mandats.Buy#</option>
			</select>
			<input type='text' name='type_of_transaction' id='type_of_transaction' hidden />
		</div>

		<!-- Tipo de imóvel -->
		<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='Tipo de propriedade' style='width:18em;' >
			<select name='atypeproperty' id='atypeproperty' multiple='multiple' style='width:100%;' >
				<option value='1' >#1c-realties.House#</option>
				<option value='2' >#1c-realties.Apartment#</option>
				<option value='3' >#1c-realties.Commerce#</option>
			</select>
			<input type='text' name='type_of_property' id='type_of_property' hidden />
		</div>

		<!-- Num de cômodos -->
		<div class='input-control text' style='width:5.5em;' >
			<input type='number' name='rooms' id='rooms' placeholder='Cômodos' min='0' max='999' style='width:100%;' />
		</div>

		<!-- Área total -->
		<div class='input-control text' style='width:5.5em;' >
			<input type='text' name='surface' id='surface' placeholder='Área total' style='width:100%;' />
		</div>

		<!-- Preço min  -->
		<div class='input-control text' style='width:5em;' >
			<input type='text' name='price_min' id='price_min' placeholder='Preço min' style='width:100%;' />
		</div>

		<!-- Preço max  -->
		<div class='input-control text' style='width:5em;' >
			<input type='text' name='price_max' id='price_max' placeholder='Preço max' style='width:100%;' />
		</div>

		<br>
		<!-- Localidade e mapa -->
		<div>
			<b>#1c-mandats.ChooseDesirebleAreas#<b><br>
			<iframe src='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d914.8077890098408!2d-46.73154277301919!3d-23.48818211105614!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94cef93f1aa3352b%3A0xa426edb6bd4edaab!2sAv.+Mutinga%2C+477+-+Vila+Pirituba%2C+S%C3%A3o+Paulo+-+SP!5e0!3m2!1spt-BR!2sbr!4v1489423781796' width='534' height='300' frameborder='0' style='border:0' ></iframe><br>
			<div class='input-control text' style='width:534px' >
				<input type='text' name='unwanted_areas' id='unwanted_areas' placeholder='Áreas ou ruas indesejadas' style='width:100%;' />
			</div>
		</div>

	</div>

	<!-- Características obrigatórias -->
	<div class='box' >
		<h4>#1c-realties.RequiredChars#</h4>
		<include src='../../1c-realties/lib/charac-req' />
	</div>

	<br>

	<!-- Características opcionais -->
	<div class='box' >
		<h4>#1c-realties.OptionalChars#</h4>
		<include src='../../1c-realties/lib/charac-opt' />
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
		<span class='caption' >Inativo</span>
	</label>
	<label class='input-control radio small-check' >
		<input type='radio' name='status' id='status_ctive' />
		<span class='check' ></span>
		<span class='caption' >Ativo</span>
	</label>
	<label class='input-control radio small-check' >
		<input type='radio' name='status' id='status_closed' />
		<span class='check' ></span>
		<span class='caption' >Encerrado</span>
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