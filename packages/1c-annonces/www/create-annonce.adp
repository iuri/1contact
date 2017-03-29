<master>
  <property name="context">@context;literal@</property>
  <property name="doc(title)">@page_title;literal@</property>
  <property name="focus">create_annonce_form.title</property>



<form method='post' action='javascript:form_submit();' id='create_annonce_form'  enctype='multipart/form-data' >

<div style='position:relative;' >

	<h3>#1c-annonces.CreateNewAnnonce#</h3>

	<div class='box' >

		<h4>#1c-annonces.GeneralChars#</h4>

		<!-- Título -->
		<div class='input-control text' style='width:16.5em;' >
			<input type='text' name='title' id='title' placeholder='#1c-annonces.Title#' title='#1c-annonces.Title#' style='width:100%;' />
		</div>

		<!-- Tipo de negociação (locação ou venda) -->
		<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='#1c-annonces.TypeOfTransaction#' style='width:11.5em;' >
			<select name='atypetransaction' id='atypetransaction' multiple='multiple' title='#1c-annonces.TypeOfTransaction#' style='width:100%;' >
				<option value='1' >#1c-annonces.Rent#</option>
				<option value='2' >#1c-annonces.Purchase#</option>
			</select>
			<input type='text' name='type_of_transaction' id='type_of_transaction' hidden />
		</div>

		<!-- Tipo de imóvel -->
		<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='#1c-realties.TypeOfProperty#' style='width:18em;' >
			<select name='atypeproperty' id='atypeproperty' multiple='multiple' title='#1c-realties.TypeOfProperty#' style='width:100%;' >
				<option value='1' >#1c-realties.House#</option>
				<option value='2' >#1c-realties.Apartment#</option>
				<option value='3' >#1c-realties.Commerce#</option>
			</select>
			<input type='text' name='type_of_property' id='type_of_property' hidden />
		</div>

		<!-- Preço  -->
		<div class='input-control text' style='width:6em;' >
			<input type='text' name='price' id='price' placeholder='#1c-annonces.Price#' title='#1c-annonces.Price#' min='0' onChange='javascript:updateValue();' style='width:100%;' />
		</div>

		<!-- Taxas -->
		<div class='input-control text' style='width:6em;' >
			<input type='text' name='taxes' id='taxes' placeholder='#1c-annonces.Taxes#' title='#1c-annonces.Taxes#' min='0' onChange='javascript:updateValue();' style='width:100%;' />
		</div>

		<!-- Valor total -->
		<div class='input-control text' style='width:6em;' >
			<input type='text' name='total_value' id='total_value' placeholder='#1c-annonces.TotalValue#' title='#1c-annonces.TotalValue#' readonly style='width:100%;' />
		</div>

		<!-- Data de disponibilidade -->
		<div class='input-control text' data-role='datepicker' data-scheme='darcula' data-locale='pt' data-format='dd.mm.yyyy' style='width:13em;' >
			<input type='text' name='available_date' id='available_date' placeholder='#1c-annonces.AvailabilityDate#' title='#1c-annonces.AvailabilityDate#' style='width:100%;' />
			<button class='button clear' ><span class='mif-calendar' ></span></button>
		</div>

		<!-- Num de cômodos -->
		<div class='input-control text' style='width:6em;' >
			<input type='number' name='room_qty' id='room_qty' placeholder='#1c-realties.RoomQty#' title='#1c-realties.RoomQty#' min='0' max='999' style='width:100%;' />
		</div>

		<!-- Num de quartos -->
		<div class='input-control text' style='width:6em;' >
			<input type='number' name='badroom_qty' id='badroom_qty' placeholder='#1c-realties.BedroomQty#' title='#1c-realties.BedroomQty#' min='0' max='999' style='width:100%;' />
		</div>

		<!-- Num de lavabos -->
		<div class='input-control text' style='width:6em;' >
			<input type='number' name='lavatory_qty' id='lavatory_qty' placeholder='#1c-realties.LavatoryQty#' title='#1c-realties.LavatoryQty#' min='0' max='999' style='width:100%;' />
		</div>

		<!-- Num de banheiros -->
		<div class='input-control text' style='width:6em;' >
			<input type='number' name='bathroom_qty' id='bathroom_qty' placeholder='#1c-realties.BathroomQty#' title='#1c-realties.BathroomQty#' min='0' max='999' style='width:100%;' />
		</div>

		<!-- Num de andares -->
		<div class='input-control text' style='width:6em;' >
			<input type='number' name='floors_qty' id='floors_qty' placeholder='#1c-realties.FloorQty#' title='#1c-realties.FloorQty#' min='0' max='999' style='width:100%;' />
		</div>

		<!-- Área interna -->
		<div class='input-control text' style='width:6em;' >
			<input type='text' name='inner_surface' id='inner_surface' placeholder='#1c-realties.InnerArea#' title='#1c-realties.InnerArea#' onChange='javascript:updateArea();' style='width:100%;' />
		</div>

		<!-- Área externa -->
		<div class='input-control text' style='width:6em;' >
			<input type='text' name='outer_surface' id='outer_surface' placeholder='#1c-realties.OuterArea#' title='#1c-realties.OuterArea#' onChange='javascript:updateArea();' style='width:100%;' />
		</div>

		<!-- Área total -->
		<div class='input-control text' style='width:6em;' >
			<input type='text' name='total_surface' id='total_surface' placeholder='#1c-realties.TotalArea#' title='#1c-realties.TotalArea#' readonly style='width:100%;' />
		</div>

		<!-- Tipo de anunciante -->
		<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='#1c-annonces.Announcer#' title='#1c-annonces.Announcer#' style='width:14.5em;' >
			<select name='aannouncer' id='aannouncer' multiple='multiple' style='width:100%;' >
				<option value='1' >#1c-annonces.Owner#</option>
				<option value='2' >#1c-annonces.Guarantor#</option>
				<option value='3' >#1c-annonces.Agent#</option>
			</select>
			<input type='text' name='announcer' id='announcer' hidden />
		</div>

	</div>

	<br>

	<!-- Características obrigatórias -->
	<div class='box' >
		<h4>#1c-realties.RequiredChars#</h4>
		<include src="../../1c-realties/lib/charac-req" />
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

	<br>

	<!-- Endereço e mapa -->
	<div class='box' >

		<h4>#1c-annonces.Address#</h4>

		<div class='input-control text' style='width:30em;' >
			<input type='text' name='address' id='address' placeholder='#1c-theme.ResearchAddress#' title='#1c-theme.ResearchAddress#' onFocus='javascript:geolocate();' style='width:100%;' />
			<button class='button white' onClick='javascript:clearAddress();return false;' ><span class='mif-search' ></span></button>
		</div>
		<br>
		<div class='input-control text' style='width:4em;' >
			<input type='text' name='street_number' id='street_number' placeholder='#1c-realties.Number#' title='#1c-realties.Number#' style='width:100%;' />
		</div>
		<div class='input-control text' style='width:15em;' >
			<input type='text' name='route' id='route' placeholder='#1c-realties.Route#' title='#1c-realties.Route#' style='width:100%;' />
		</div>
		<div class='input-control text' style='width:15em;' >
			<input type='text' name='complement' id='complement' placeholder='#1c-realties.Complement#' title='#1c-realties.Complement#' style='width:100%;' />
		</div>
		<div class='input-control text' style='width:15em;' >
			<input type='text' name='sublocality' id='sublocality' placeholder='#1c-realties.Neighborhood#' title='#1c-realties.Neighborhood#' style='width:100%;'  />
		</div>
		<div class='input-control text' style='width:15em;' >
			<input type='text' name='locality' id='locality' placeholder='#1c-realties.City#' title='#1c-realties.City#' style='width:100%;'  />
		</div>
		<div class='input-control text' style='width:15em;' >
			<input type='text' name='administrative_area_level_1' id='administrative_area_level_1' placeholder='#1c-realties.State#' title='#1c-realties.Complement#' style='width:100%;' />
		</div>
		<div class='input-control text' style='width:15em;' >
			<input type='text' name='country' id='country' placeholder='#1c-realties.Country#' title='#1c-realties.Country#' style='width:100%;'  />
		</div>
		<div class='input-control text' style='width:15em;' >		
			<input type='text' name='postal_code' id='postal_code' placeholder='#1c-realties.PostalCode#' title='#1c-realties.PostalCode#' style='width:100%;'  />
		</div>
	</div>

	<br>

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

	<!-- Descrição -->
	<div class='box' >
		<h4>#1c-annonces.Description#</h4>
		<div class='input-control textarea' data-role='input' data-text-auto-resize='true' style='width:30em;' >
			<textarea name='description' id='description' title='#1c-annonces.Description#' ></textarea>
		</div>
	</div>

	<br>

	<!-- Status da publicação (publicado / nao publicado) -->
	<div class='box' style='vertical-align:top;' >
		<h4>#1c-annonces.Status#</h4>
		<label class='input-control radio small-check' >
			<input type='radio' name='status' id='status_inactive' checked='checked' value='0' />
			<span class='check' ></span>
			<span class='caption' for='status_inactive' >#1c-annonces.Inactive#</span>
		</label>
		<label class='input-control radio small-check' >
			<input type='radio' name='status' id='status_ctive' value='1' />
			<span class='check' ></span>
			<span class='caption' for='status_ctive' >#1c-annonces.Active#</span>
		</label>
		<label class='input-control radio small-check' >
			<input type='radio' name='status' id='status_closed' value='2' />
			<span class='check' ></span>
			<span class='caption' for='status_closed' >#1c-annonces.Closed#</span>
		</label>
	</div>

	<!-- Termos e condições -->
	<div class='box' style='vertical-align:top;' >
		<h4>#1c-annonces.Terms#</h4>
		<label class='input-control checkbox small-check' >
			<input type='checkbox' name='terms' id='terms' required />
			<span class='check' ></span>
			<span class='caption' >#1c-annonces.IAcceptTheTerms#</span>
		</label>
	</div>

	<!-- Submit -->
	<span style='position:absolute;right:0;bottom:0;' >
		<input type='submit' class='button' value='#1c-theme.Save#' />
	</span>

	<!-- Modo de salvamento inválido, apenas se torna válido quando recarregar a página com o formulário preenchido -->
	<input type='text' name='mode' id='mode' hidden />

</div>

</form>

<!-- Mensagem de formulário salvo com sucesso -->
<div id='create_annonce_success' data-role='dialog' data-overlay='true' data-overlay-color='dialog_overlay' data-close-button='true' class='padding20' >
	<p><b>#1c-annonces.Success#</b></p>
</div>

<!-- Mensagem de erro durante o save do formulário -->
<div id='create_annonce_required_err' data-role='dialog' data-overlay='true' data-overlay-color='dialog_overlay' data-hide='3000' data-close-button='true' class='padding20' >
	<p><b>Fill all the fields before save the form.</b></p>
</div>

<!-- Call google maps api -->
<script src='https://maps.googleapis.com/maps/api/js?key=AIzaSyDzF7IlGi2Ue-EI6E6bizGVZ69NhFU7yGI&signed_in=true&libraries=places&callback=initAutocomplete' async defer >
</script>