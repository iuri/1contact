<master>

<form method='post' action='javascript:form_submit()' id='create_form' >

<div style='position:relative;' >

	<h3>#1c-annonces.CreateNewAnnonce#</h3>

	<div class='box' >

		<h4>#1c-annonces.GeneralChars#</h4>

		<!-- Título -->
		<div class='input-control text' style='width:16em;' >
			<input type='text' name='title' id='title' placeholder='#1c-annonces.Title#' style='width:100%;' />
		</div>

		<!-- Tipo de negociação (locação ou venda) -->
		<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='#1c-annonces.TipeOfTransaction#' style='width:11.5em;' >
			<select name='abusiness' id='abusiness' multiple='multiple' style='width:100%;' >
				<option value='1' >#1c-annonces.Rent#</option>
				<option value='2' >#1c-annonces.Purchase#</option>
			</select>
			<input type='text' name='business' id='business' hidden />
		</div>

		<!-- Tipo de imóvel -->
		<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='#1c-realties.TypeOfProperty#' style='width:18em;' >
			<select name='atype' id='atype' multiple='multiple' style='width:100%;' >
				<option value='1' >#1c-realties.House#</option>
				<option value='2' >#1c-realties.Apartment#</option>
				<option value='3' >#1c-realties.Commerce#</option>
			</select>
			<input type='text' name='type' id='type' hidden />
		</div>

		<!-- Preço  -->
		<div class='input-control text' style='width:5em;' >
			<input type='text' name='price' id='price' placeholder='#1c-annonces.Price#' min='0' style='width:100%;' />
		</div>

		<!-- Taxas -->
		<div class='input-control text' style='width:5em;' >
			<input type='text' name='taxes' id='taxes' placeholder='#1c-annonces.Taxes#' min-='0' style='width:100%;' />
		</div>

		<!-- Data de disponibilidade -->
		<div class='input-control text' data-role='datepicker' data-scheme='darcula' data-locale='pt' data-format='dd.mm.yyyy' style='width:13em;' >
			<input type='text' name='availability_date' id='availability_date' placeholder='#1c-annonces.AvailabilityDate#' style='width:100%;' />
			<button class='button clear' ><span class='mif-calendar' ></span></button>
		</div>

		<!-- Num de cômodos -->
		<div class='input-control text' style='width:5.5em;' >
			<input type='number' name='room_qty' id='room_qty' placeholder='#1c-realties.RoomQty#' min='0' max='999' style='width:100%;' />
		</div>

		<!-- Num de lavabos -->
		<div class='input-control text' style='width:5.5em;' >
			<input type='number' name='lavatory_qty' id='lavatory_qty' placeholder='#1c-realties.LavatoryQty#' min='0' max='999' style='width:100%;' />
		</div>

		<!-- Num de banheiros -->
		<div class='input-control text' style='width:5.5em;' >
			<input type='number' name='bathroom_qty' id='bathroom_qty' placeholder='#1c-realties.BathroomQty#' min='0' max='999' style='width:100%;' />
		</div>

		<!-- Num de andares -->
		<div class='input-control text' style='width:5.5em;' >
			<input type='number' name='floors_aty' id='floors_aty' placeholder='#1c-realties.FloorQty#' min='0' max='999' style='width:100%;' />
		</div>

		<!-- Área total -->
		<div class='input-control text' style='width:5.5em;' >
			<input type='text' name='surface' id='surface' placeholder='#1c-realties.TotalArea#' style='width:100%;' />
		</div>

		<!-- Tipo de anunciante -->
		<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='#1c-annonces.Announcer#' style='width:14.5em;' >
			<select name='aannouncer' id='aannouncer' multiple='multiple' style='width:100%;' >
				<option value='1' >#1c-realties.Owner#</option>
				<option value='2' >#1c-realties.Guarantor#</option>
				<option value='3' >#1c-realties.Agent#</option>
			</select>
			<input type='text' name='announcer' id='announcer' hidden />
		</div>

	</div>

	<br>

	<!-- Características obrigatórias -->
	<div class='box' >
		<h4>#1c-annonces.RequiredChars#</h4>
		<include src='../../1c-realties/lib/charac-req' />
		<input type='text' name='charac_required' id='charac_required' hidden />
	</div>

	<br>

	<!-- Características opcionais -->
	<div class='box' >
		<h4>#1c-annonces.OptionalChars#</h4>
		<include src='../../1c-realties/lib/charac-opt' />
		<input type='text' name='charac_opt_gen' id='charac_opt_gen' hidden />
		<input type='text' name='charac_opt_arc' id='charac_opt_arc' hidden />
		<input type='text' name='charac_opt_vic' id='charac_opt_vic' hidden />
	</div>

	<br>

	<!-- Descrição -->
	<div class='box' >
		<h4>#1c-annonces.Description#</h4>
		<div class='input-control textarea' data-role='input' data-text-auto-resize='true' style='width:25em;' >
			<textarea name='description' id='description' ></textarea>
		</div>
	</div>

	<!-- Upload fotos -->
	<div class='box' style='vertical-align:top;' >
		<h4>#1c-annonces.AddFiles#</h4>
		<div class='input-control file' data-role='input' >
    		<input type='file' multiple='multiple' >
    		<button class='button clear' ><span class='mif-folder' ></span></button>
		</div>
	</div>

	<!-- Status da publicação (publicado / nao publicado) -->
	<div class='box' style='vertical-align:top;' >
		<h4>#1c-annonces.Status#</h4>
		<label class='input-control radio small-check' >
			<input type='radio' name='status' id='status_inactive' checked='checked' value='0' />
			<span class='check' ></span>
			<span class='caption' for='status_inactive' >#1c-annonces.Innactive#</span>
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
			<input type='checkbox' name='terms' id='terms' />
			<span class='check' ></span>
			<span class='caption' >#1c-annonces.IAcceptTheTerms#</span>
		</label>
	</div>

	<!-- Submit -->
	<span style='position:absolute;right:0;bottom:0;' >
		<input type='submit' class='button' value='Salvar' />
	</span>

</div>

</form>

<div id='success' data-role='dialog' data-close-button='true' data-overlay='true' data-overlay-color='dialog_overlay' >
	Registrado com sucesso!
</div>