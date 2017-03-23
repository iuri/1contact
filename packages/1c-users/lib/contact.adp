<div id='contact_form_popup' data-role='dialog' data-close-button='true' data-overlay='true' data-overlay-color='dialog_overlay' class='padding20' >

<form method='post' id='contact_form' >

	<div style='display:table;width:100%;' >

		<div style='display:table-cell;vertical-align:top;' >
			<!-- Campos do formulário -->
			<div class='input-control text' style='width:15em;' >
				<input type='text' name='name' id='name' placeholder='Name' style='width:100%;' />
			</div>
			<br>
			<div class='input-control text' style='width:15em;' >
				<input type='text' name='surname' id='surname' placeholder='Surname' style='width:100%;' />
			</div>
			<br>
			<div class='input-control email' style='width:15em;' >
				<input type='text' name='email' id='email' placeholder='Email' style='width:100%;' />
			</div>
		</div>

		<div style='display:table-cell;text-align:right;vertical-align:top;' >

			<!-- Logo e endereço -->
			<div align='right'>
				<div style='display:table;margin-top:.25rem;' >
					<div style='display:table-cell;text-align:right;vertical-align:top;padding-right:.5rem' >
						<img src='/resources/1c-theme/images/logo.png' style='height:70px;width:auto;' />
					</div>
					<div style='display:table-cell;text-align:left;vertical-align:bottom;' >
						45 Rue de la Servette<br>1202 Genève SUISSE<br>
						+41 022 782 8370<br>info@1contact.ch
					</div>
				</div>
			</div>

		</div>

	</div>

	<!-- Campo do texto -->
	<div class='input-control textarea' style='width:35em;height:10em;' >
		<textarea name='text' id='text' style='width:100%;' placeholder='Message' ></textarea>
	</div>

	<!-- Botão enviar -->
	<div align='right' >
		<div class='input-control submit' >
			<input type='submit' value='Send' />
		</div>
	</div>

</form>

</div>