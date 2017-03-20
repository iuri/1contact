<master>

<form method='post' action='javascript:form_submit()' id='create_form' >

<div style='position:relative;' >

	<h3>Criar um novo anúncio</h3>

	<div class='box' >

		<h4>Características gerais</h4>

		<!-- Título -->
		<div class='input-control text' style='width:16em;' >
			<input type='text' name='title' id='title' placeholder='Título' required style='width:100%;' />
		</div>

		<!-- Tipo de negociação (locação ou venda) -->
		<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='Tipo de negócio' style='width:11.5em;' >
			<select name='abusiness' id='abusiness' multiple='multiple' required style='width:100%;' >
				<option value='1' >#1c-realties.Rent#</option>
				<option value='2' >#1c-realties.Purchase#</option>
			</select>
			<input type='text' name='business' id='business' hidden />
		</div>

		<!-- Tipo de imóvel -->
		<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='Tipo de propriedade' style='width:18em;' >
			<select name='atype' id='atype' multiple='multiple' required style='width:100%;' >
				<option value='1' >Casa</option>
				<option value='2' >Apartamento</option>
				<option value='3' >Comércio</option>
			</select>
			<input type='text' name='type' id='type' hidden />
		</div>

		<!-- Preço  -->
		<div class='input-control text' style='width:5em;' >
			<input type='text' name='price' id='price' placeholder='Preço' min='0' required style='width:100%;' />
		</div>

		<!-- Taxas -->
		<div class='input-control text' style='width:5em;' >
			<input type='text' name='taxes' id='taxes' placeholder='Taxas' min-='0' required style='width:100%;' />
		</div>

		<!-- Data de disponibilidade -->
		<div class='input-control text' data-role='datepicker' data-scheme='darcula' data-locale='pt' data-format='dd.mm.yyyy' style='width:13em;' >
			<input type='text' name='availability_date' id='availability_date' placeholder='Data de disponibilidade' required style='width:100%;' />
			<button class='button clear' ><span class='mif-calendar' ></span></button>
		</div>

		<!-- Num de cômodos -->
		<div class='input-control text' style='width:5.5em;' >
			<input type='number' name='room_qty' id='room_qty' placeholder='Cômodos' min='0' max='999' required style='width:100%;' />
		</div>

		<!-- Num de lavabos -->
		<div class='input-control text' style='width:5.5em;' >
			<input type='number' name='lavatory_qty' id='lavatory_qty' placeholder='Lavabo' min='0' max='999' required style='width:100%;' />
		</div>

		<!-- Num de banheiros -->
		<div class='input-control text' style='width:5.5em;' >
			<input type='number' name='bathroom_qty' id='bathroom_qty' placeholder='Banheiro' min='0' max='999' required style='width:100%;' />
		</div>

		<!-- Num de andares -->
		<div class='input-control text' style='width:5.5em;' >
			<input type='number' name='floors_aty' id='floors_aty' placeholder='Andares' min='0' max='999' required style='width:100%;' />
		</div>

		<!-- Área total -->
		<div class='input-control text' style='width:5.5em;' >
			<input type='text' name='surface' id='surface' placeholder='Área total' required style='width:100%;' />
		</div>

		<!-- Tipo de anunciante -->
		<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='Tipo de anunciante' required style='width:14.5em;' >
			<select name='aannouncer' id='aannouncer' multiple='multiple' style='width:100%;' >
				<option value='1' >Dono</option>
				<option value='2' >Fiador</option>
				<option value='3' >Agente</option>
			</select>
			<input type='text' name='announcer' id='announcer' hidden />
		</div>

	</div>

	<br>

	<!-- Características obrigatórias -->
	<div class='box' >
		<h4>Características obrigatórias</h4>
		<include src='../../1c-realties/lib/charac-req' />
		<input type='text' name='charac_required' id='charac_required' hidden />
	</div>

	<br>

	<!-- Características opcionais -->
	<div class='box' >
		<h4>Características opcionais</h4>
		<include src='../../1c-realties/lib/charac-opt' />
		<input type='text' name='charac_opt_gen' id='charac_opt_gen' hidden />
		<input type='text' name='charac_opt_arc' id='charac_opt_arc' hidden />
		<input type='text' name='charac_opt_vic' id='charac_opt_vic' hidden />
	</div>

	<br>

	<!-- Descrição -->
	<div class='box' >
		<h4>Descrição</h4>
		<div class='input-control textarea' data-role='input' data-text-auto-resize='true' required style='width:25em;' >
			<textarea name='description' id='description' ></textarea>
		</div>
	</div>

	<!-- Upload fotos -->
	<div class='box' style='vertical-align:top;' >
		<h4>Adicionar fotos</h4>
		<div class='input-control file' data-role='input' >
    		<input type='file' multiple='multiple' >
    		<button class='button clear' ><span class='mif-folder' ></span></button>
		</div>
	</div>

	<!-- Status da publicação (publicado / nao publicado) -->
	<div class='box' style='vertical-align:top;' >
		<h4>Status</h4>
		<label class='input-control radio small-check' >
			<input type='radio' name='status' id='status_inactive' checked='checked' value='0' />
			<span class='check' ></span>
			<span class='caption' for='status_inactive' >Inativo</span>
		</label>
		<label class='input-control radio small-check' >
			<input type='radio' name='status' id='status_ctive' value='1' />
			<span class='check' ></span>
			<span class='caption' for='status_ctive' >Ativo</span>
		</label>
		<label class='input-control radio small-check' >
			<input type='radio' name='status' id='status_closed' value='2' />
			<span class='check' ></span>
			<span class='caption' for='status_closed' >Encerrado</span>
		</label>
	</div>

	<!-- Termos e condições -->
	<div class='box' style='vertical-align:top;' >
		<h4>Termos e condições</h4>
		<label class='input-control checkbox small-check' >
			<input type='checkbox' name='terms' id='terms' required />
			<span class='check' ></span>
			<span class='caption' >Concordo com os termos e condições</span>
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