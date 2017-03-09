<header>

</header>

<body>

	<!-- Inicio das opções de filtro -->
	<div class='filter_options' >
		<div class='filter_options_row' >
			
			<!-- Filtro por nome -->
			<div class='filter_option' >
				<div class='input-control text' >
					<input type='text' name='name' placeholder='Nome' />
				</div>
			</div>

			<!-- Filtro por intervalo de preços -->
			<div class='filter_option' >
				
				<div class='input-control number' style='width:6.5em;' >
					<input type='number' name='budget_min' placeholder='Valor min' style='width:100%;' />
				</div>
				
				<div class='input-control number' style='width:6.5em;' >
					<input type='number' name='budget_max' placeholder='Valor max' style='width:100%;' />
				</div>

			</div>

			<!-- Filtro por status -->
			<div class='filter_option' >

				<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='Status' style='width:15em;' >
					<select id='filter_status' name='filter_status' multiple='multiple' style='width:100%;' >
						<option>Ativos</option>
						<option>Suspenso</option>
						<option>Em conclusão</option>
						<option>Desistido</option>
						<option>Concluído</option>
						<option>Pendencia de documentos</option>
					</select>
				</div>

			</div>

			<!-- Filtro por mandatos -->
			<div class='filter_option' >

				<div class='input-control text' data-role='datepicker' data-scheme='darcula' data-locale='pt' data-format='dd.mm.yyyy' style='width:12em;' >
					<input type='text' name='inscription_date_min' id='inscription_date_min' placeholder='Data inicial' style='width:100%;' />
					<button class='button' ><span class='mif-calendar' ></span></button>
				</div>
				

				<div class='input-control text' data-role='datepicker' data-scheme='darcula' data-locale='pt' data-format='dd.mm.yyyy' style='width:12em;' >
					<input type='text' name='inscription_date_max' id='inscription_date_max' placeholder='Data final' style='width:100%;' />
					<button class='button' ><span class='mif-calendar' ></span></button>
				</div>
				

				<div class='input-control' data-role='select' data-allow-clear='true' data-placeholder='Tipo de pagamento' style='width:12em;' >
					<select id='filter_inscriptions' name='filter_inscription_paytype' multiple='multiple' style='width:100%;' >
						<option>Todos</option>
						<option>Dinheiro</option>
						<option>Visa</option>
						<option>Mastercard</option>
						<option>Postcard</option>
						<option>Maestro</option>
						<option>Outros</option>
					</select>
				</div>

			</div>

		</div>
		<!-- Fim das opções de filtro -->

	</div>

</body>