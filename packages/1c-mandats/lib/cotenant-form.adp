<!-- Informações do cliente -->
<div class='box' style='width:100%;vertical-align:top;' >
	<h4>Informações do conjuge/locatário</h4>
	<!-- Email -->
	<div class='input-control email' style='width:100%;' >
		<input type='email' name='cotenant_email' id='cotenant_email' placeholder='Email' style='width:100%;' />
	</div>
	<br>
	<!-- Celular -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='cotenant_mobilenumber' id='cotenant_mobilenumber' placeholder='Celular' style='width:100%;' />
	</div>
	<br>
	<!-- Telefone -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='cotenant_phonenumber' id='cotenant_phonenumber' placeholder='Telefone' style='width:100%;' />
	</div>
	<br>
	<!-- Tratamento -->
	<div class='input-control select' style='width:100%;' >
		<select name='cotenant_entitlement' id='cotenant_entitlement' style='width:100%;' >
			<option value='' disabled selected hidden >Tratamento</option>
			<option value='1' >Senhor</option>
			<option value='2' >Senhora</option>
			<option value='3' >Senhorita</option>
		</select>
	</div>
	<br>
	<!-- Nome -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='cotenant_name' id='cotenant_name' placeholder='Nome' style='width:100%;' />
	</div>
	<br>
	<!-- Sobrenome -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='cotenant_surname' id='cotenant_surname' placeholder='Sobrenome' style='width:100%;' />
	</div>
	<br>
	<!-- Data de nascimento -->
	<div class='input-control text' data-role='datepicker' data-scheme='darcula' data-locale='pt' data-format='dd.mm.yyyy' style='width:100%;' >
		<input type='text' name='cotenant_birthday' id='cotenant_birthday' placeholder='Data de nascimento' style='width:100%;' />
		<button class='button clear' ><span class='mif-calendar' ></span></button>
	</div>
	<br>
	<!-- Nacionalidade -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='cotenant_nationality' id='cotenant_nationality' placeholder='Nacionalidade' style='width:100%;' />
	</div>
	<br>
	<!-- Estado civil -->
	<div class='input-control select' style='width:100%;' >
		<select name='cotenant_civilstate' id='cotenant_civilstate' style='width:100%;' >
			<option value='' disabled selected hidden >Estado civil</option>
			<option value='0' >Solteiro</option>
			<option value='1' >Em um relacionamento</option>
			<option value='2' >Casado(a)</option>
			<option value='3' >Separado(a)</option>
			<option value='4' >Divorciado(a)</option>
			<option value='5' >Viúvo(a)</option>
		</select>
	</div>
	<br>
	<!-- Filhos -->
	<div class='input-control text' style='width:100%;' >
		<input type='number' name='cotenant_children_qty' id='cotenant_children_qty' placeholder='Filhos' min='0' style='width:100%;' />
	</div>
	<br>
	<!-- Idades dos filhos -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='cotenant_children_ages' id='cotenant_children_ages' placeholder='Idades dos filhos' style='width:100%;' />
	</div>
	<br>
	<!-- Animais -->
	<div class='input-control select' style='width:100%;' >
		<select name='cotenant_animals' id='cotenant_animals' style='width:100%;' >
			<option value='' disabled selected hidden >Animais</option>
			<option value='true' >Animais: Sim</option>
			<option value='false' >Animais: Não</option>
		</select>
	</div>
	<br>
	<!-- Tipo de animais -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='cotenant_animals_type' id='cotenant_animals_type' placeholder='Tipo de animais' style='width:100%;' />
	</div>
	<br>
	<!-- Quantidade de animais -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='cotenant_animals_qty' id='cotenant_animals_qty' placeholder='Quantidade de animais' style='width:100%;' />
	</div>
	<br>
	<!-- Contrato por tempo indeterminado -->
	<div class='input-control select' style='width:100%;' >
		<select name='cotenant_noexpirecontract' id='cotenant_noexpirecontract' style='width:100%;' >
			<option value='' disabled selected hidden >Contrato tempo por indeterminado</option>
			<option value='true' >Contrato tempo por indeterminado: Sim</option>
			<option value='false' >Contrato tempo por indeterminado: Não</option>
		</select>
	</div>
	<h4>Informações profissionais</h4>
	<!-- Profissão -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='cotenant_job' id='cotenant_job' placeholder='Proissão' style='width:100%;' />
	</div>
	<br>
	<!-- Ramo da profissão -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='cotenant_jobactivity' id='cotenant_jobactivity' placeholder='Ramo da atividade' style='width:100%;' />
	</div>
	<br>
	<!-- Data de início do trabalho -->
	<div class='input-control text' data-role='datepicker' data-scheme='darcula' data-locale='pt' data-format='dd.mm.yyyy' style='width:100%;' >
		<input type='text' name='cotenant_date_start_job' id='cotenant_date_start_job' placeholder='Data de início' style='width:100%;' />
		<button class='button clear' ><span class='mif-calendar' ></span></button>
	</div>
	<br>
	<!-- Salário mensal -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='cotenant_salary' id='cotenant_salary' placeholder='Salário mensal' style='width:100%;' />
	</div>
	<br>
	<!-- Meses de salario -->
	<div class='input-control select' style='width:100%;' >
		<select name='cotenant_salary_month' id='cotenant_salary_month' style='width:100%;' >
			<option value='' disabled selected hidden >Mêses de salário</option>
			<option value='12' >Mêses de salário: 12</option>
			<option value='13' >Mêses de salário: 13</option>
		</select>
	</div>
	<br>
	<!-- Autônomo -->
	<div class='input-control select' style='width:100%;' >
		<select name='cotenant_independentjob' id='cotenant_independentjob' style='width:100%;' >
			<option value='' disabled selected hidden >Autônomo</option>
			<option value='true' >Autônomo: Sim</option>
			<option value='false' >Autônomo: Não</option>
		</select>
	</div>
	<br>
	<!-- Outra ocupação -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='cotenant_jobother' id='cotenant_jobother' placeholder='Outra ocupação' style='width:100%;' />
	</div>
	<br>
	<!-- Outra fonte de renda -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='cotenant_otherincoming' id='cotenant_otherincoming' placeholder='Outra fonte de renda' style='width:100%;' />
	</div>
	<h4>Informações de residência</h4>
	<!-- Endereço atual -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='cotenant_address' id='cotenant_address' placeholder='Endereço atual' style='width:100%;' />
	</div>
	<br>
	<!-- Propridade do imóvel atual -->
	<div class='input-control select' style='width:100%;' >
		<select name='cotenant_houseproperty' id='cotenant_houseproperty' style='width:100%;' >
			<option value='' disabled selected hidden >Propriedade do imóvel</option>
			<option value='1' >Propriedade do imóvel: Própria</option>
			<option value='2' >Propriedade do imóvel: Alugada</option>
			<option value='3' >Propriedade do imóvel: Outro</option>
		</select>
	</div>
	<br>
	<!-- Proprietário do imóvel -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='cotenant_houseproprietary' id='cotenant_houseproprietary' placeholder='Proprietário do imóvel (nome ou imobiliária)' style='width:100%;' />
	</div>
	<br>
	<!-- Hipoteca -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='cotenant_mortgage' id='cotenant_mortgage' placeholder='Hipoteca' style='width:100%;' />
	</div>
</div>