<master>

<script type='text/javascript' >
	$('#create_mandat_form').submit(function() {
		alert(1);
	}
</script>

<form method='post' action='javascript:func()' id='create_mandat_form' >

<div style='position:relative;' >

	<h3>Criar um novo anúncio</h3>

	<div class='box' >

		<h4>Características gerais</h4>

		<!-- Título -->
		<div class='input-control text' style='width:16em;' >
			<input type='text' name='announce_title' placeholder='Título' required style='width:100%;' />
		</div>

		<!-- Tipo de negociação (locação ou venda) -->
		<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='Tipo de negócio' style='width:11.5em;' >
			<select name='announce_business' multiple='multiple' required style='width:100%;' >
				<option value='0' >Locação</option>
				<option value='1' >Venda</option>
			</select>
		</div>

		<!-- Tipo de imóvel -->
		<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='Tipo de propriedade' style='width:18em;' >
			<select name='announce_type' multiple='multiple' required style='width:100%;' >
				<option value='0' >Casa</option>
				<option value='1' >Apartamento</option>
				<option value='2' >Comércio</option>
			</select>
		</div>

		<!-- Preço  -->
		<div class='input-control text' style='width:5em;' >
			<input type='text' name='announce_price' placeholder='Preço' min='0' required style='width:100%;' />
		</div>

		<!-- Taxas -->
		<div class='input-control text' style='width:5em;' >
			<input type='text' name='announce_taxes' placeholder='Taxas' min-='0' required style='width:100%;' />
		</div>

		<!-- Data de disponibilidade -->
		<div class='input-control text' data-role='datepicker' data-scheme='darcula' data-locale='pt' data-format='dd.mm.yyyy' style='width:13em;' >
			<input type='text' name='announce_availability' placeholder='Data de disponibilidade' required style='width:100%;' />
			<button class='button clear' ><span class='mif-calendar' ></span></button>
		</div>

		<!-- Num de cômodos -->
		<div class='input-control text' style='width:5.5em;' >
			<input type='number' name='announce_rooms' placeholder='Cômodos' min='0' max='999' required style='width:100%;' />
		</div>

		<!-- Num de lavabos -->
		<div class='input-control text' style='width:5.5em;' >
			<input type='number' name='announce_lavatory' placeholder='Lavabo' min='0' max='999' required style='width:100%;' />
		</div>

		<!-- Num de banheiros -->
		<div class='input-control text' style='width:5.5em;' >
			<input type='number' name='announce_bathroom' placeholder='Banheiro' min='0' max='999' required style='width:100%;' />
		</div>

		<!-- Num de andares -->
		<div class='input-control text' style='width:5.5em;' >
			<input type='number' name='announce_floor' placeholder='Andares' min='0' max='999' required style='width:100%;' />
		</div>

		<!-- Área total -->
		<div class='input-control text' style='width:5.5em;' >
			<input type='text' name='announce_surface' placeholder='Área total' required style='width:100%;' />
		</div>

		<!-- Tipo de anunciante -->
		<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='Tipo de anunciante' style='width:14.5em;' >
			<select name='announce_announcer' multiple='multiple' required style='width:100%;' >
				<option value='0' >Dono</option>
				<option value='1' >Fiador</option>
				<option value='2' >Agente</option>
			</select>
		</div>

	</div>

	<br>

	<!-- Características do matching -->
	<div class='box' >
		<h4>Características obrigatórias</h4>
		<include src='../../1c-realties/lib/charaq-req' />
	</div>

	<br>

	<!-- Características gerais -->
	<div class='box' >
		<h4>Características opcionais</h4>
		<include src='../../1c-realties/lib/charaq-opt' />
	</div>

	<br>

	<!-- Descrição -->
	<div class='box' >
		<h4>Descrição</h4>
		<div class='input-control textarea' data-role='input' data-text-auto-resize='true' style='width:25em;' >
			<textarea></textarea>
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
			<input type='radio' name='announce_status' id='announce_status_inactive' checked='checked' />
			<span class='check' ></span>
			<span class='caption' >Inativo</span>
		</label>
		<label class='input-control radio small-check' >
			<input type='radio' name='announce_status' id='announce_status_ctive' />
			<span class='check' ></span>
			<span class='caption' >Ativo</span>
		</label>
		<label class='input-control radio small-check' >
			<input type='radio' name='announce_status' id='announce_status_closed' />
			<span class='check' ></span>
			<span class='caption' >Encerrado</span>
		</label>
	</div>

	<!-- Termos e condições -->
	<div class='box' style='vertical-align:top;' >
		<h4>Termos e condições</h4>
		<label class='input-control checkbox small-check' >
			<input type='checkbox' name='announce_terms' id='announce_terms' />
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