<!-- Informações do cliente -->
<div class='box' style='width:100%;vertical-align:top;margin: auto 0;' >
	<h4>Informações pessoais</h4>
	<!-- Email -->
	<div class='input-control email' style='width:100%;' >
		<input type='email' name='customer_email' id='customer_email' placeholder='Email' title='Email' onChange='javascript:search_customer_email();' style='width:100%;' />
	</div>
	<br>
	<!-- Celular -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='customer_mobilenumber' id='customer_mobilenumber' placeholder='Celular' title='Celular' style='width:100%;' />
	</div>
	<br>
	<!-- Telefone -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='customer_phonenumber' id='customer_phonenumber' placeholder='Telefone' title='Telefone' style='width:100%;' />
	</div>
	<br>
	<!-- Tratamento -->
	<div class='input-control select' style='width:100%;' >
		<select name='customer_entitlement' id='customer_entitlement' title='Tratamento' style='width:100%;' >
			<option value='' disabled selected hidden >Tratamento</option>
			<option value='1' >Senhor</option>
			<option value='2' >Senhora</option>
			<option value='3' >Senhorita</option>
		</select>
	</div>
	<br>
	<!-- Nome -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='customer_name' id='customer_name' placeholder='Nome' title='Nome' style='width:100%;' />
	</div>
	<br>
	<!-- Sobrenome -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='customer_surname' id='customer_surname' placeholder='Sobrenome' title='Sobrenome' style='width:100%;' />
	</div>
	<br>
	<!-- Data de nascimento -->
	<div class='input-control text' data-role='datepicker' data-scheme='darcula' data-locale='pt' data-format='dd.mm.yyyy' style='width:100%;' >
		<input type='text' name='customer_birthday' id='customer_birthday' placeholder='Data de nascimento' title='Data de nascimento' style='width:100%;' />
		<button class='button clear' ><span class='mif-calendar' ></span></button>
	</div>
	<br>
	<!-- Nacionalidade -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='customer_nationality' id='customer_nationality' placeholder='Nacionalidade' title='Nacionalidade' style='width:100%;' />
	</div>
	<br>
	<!-- Estado civil -->
	<div class='input-control select' style='width:100%;' >
		<select name='customer_civilstate' id='customer_civilstate' title='Estado civil' style='width:100%;' >
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
		<input type='number' name='customer_children_qty' id='customer_children_qty' placeholder='Filhos' title='Filhos' min='0' style='width:100%;' />
	</div>
	<br>
	<!-- Idades dos filhos -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='customer_children_ages' id='customer_children_ages' placeholder='Idades dos filhos' title='Idades dos filhos' style='width:100%;' />
	</div>
	<br>
	<!-- Animais -->
	<div class='input-control select' style='width:100%;' >
		<select name='customer_animals' id='customer_animals' title='Animais' style='width:100%;' >
			<option value='' disabled selected hidden >Animais</option>
			<option value='true' >Animais: Sim</option>
			<option value='false' >Animais: Não</option>
		</select>
	</div>
	<br>
	<!-- Tipo de animais -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='customer_animals_type' id='customer_animals_type' placeholder='Tipo de animais' title='Tipo de animais' style='width:100%;' />
	</div>
	<br>
	<!-- Quantidade de animais -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='customer_animals_qty' id='customer_animals_qty' placeholder='Quantidade de animais' title='Quantidade de animais' style='width:100%;' />
	</div>
	<br>
	<!-- Contrato por tempo indeterminado -->
	<div class='input-control select' style='width:100%;' >
		<select name='customer_noexpirecontract' id='customer_noexpirecontract' title='Aceita contrato tempo por indeterminado' style='width:100%;' >
			<option value='' disabled selected hidden >Contrato tempo por indeterminado</option>
			<option value='true' >Contrato tempo por indeterminado: Sim</option>
			<option value='false' >Contrato tempo por indeterminado: Não</option>
		</select>
	</div>
	<h4>Informações profissionais</h4>
	<!-- Profissão -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='customer_job' id='customer_job' placeholder='Proissão' title='Proissão' style='width:100%;' />
	</div>
	<br>
	<!-- Ramo da profissão -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='customer_jobactivity' id='customer_jobactivity' placeholder='Ramo da atividade' title='Ramo da atividade' style='width:100%;' />
	</div>
	<br>
	<!-- Data de início do trabalho -->
	<div class='input-control text' data-role='datepicker' data-scheme='darcula' data-locale='pt' data-format='dd.mm.yyyy' style='width:100%;' >
		<input type='text' name='customer_datestartjob' id='customer_datestartjob' placeholder='Data de contratação' title='Data contratação' style='width:100%;' />
		<button class='button clear' ><span class='mif-calendar' ></span></button>
	</div>
	<br>
	<!-- Salário mensal -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='customer_salary' id='customer_salary' placeholder='Salário mensal' title='Salário mensal' style='width:100%;' />
	</div>
	<br>
	<!-- Meses de salario -->
	<div class='input-control select' style='width:100%;' >
		<select name='customer_salary_month' id='customer_salary_month' title='Mêses de salário' style='width:100%;' >
			<option value='' disabled selected hidden >Mêses de salário</option>
			<option value='12' >Mêses de salário: 12</option>
			<option value='13' >Mêses de salário: 13</option>
		</select>
	</div>
	<br>
	<!-- Autônomo -->
	<div class='input-control select' style='width:100%;' >
		<select name='customer_independentjob' id='customer_independentjob' title='Autônomo' style='width:100%;' >
			<option value='' disabled selected hidden >Autônomo</option>
			<option value='true' >Autônomo: Sim</option>
			<option value='false' >Autônomo: Não</option>
		</select>
	</div>
	<br>
	<!-- Outra ocupação -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='customer_jobother' id='customer_jobother' placeholder='Outra ocupação' title='Outra ocupação' style='width:100%;' />
	</div>
	<br>
	<!-- Outra fonte de renda -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='customer_otherincoming' id='customer_otherincoming' placeholder='Outra fonte de renda' title='Outra fonte de renda' style='width:100%;' />
	</div>
	<h4>Informações de residência</h4>
	<!-- Endereço atual -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='customer_address' id='customer_address' placeholder='Endereço atual' title='Endereço atual' style='width:100%;' />
	</div>
	<br>
	<!-- Propridade do imóvel atual -->
	<div class='input-control select' style='width:100%;' >
		<select name='customer_houseproperty' id='customer_houseproperty' title='Propriedade do imóvel' style='width:100%;' >
			<option value='' disabled selected hidden >Propriedade do imóvel</option>
			<option value='1' >Propriedade do imóvel: Própria</option>
			<option value='2' >Propriedade do imóvel: Alugada</option>
			<option value='3' >Propriedade do imóvel: Outro</option>
		</select>
	</div>
	<br>
	<!-- Proprietário do imóvel -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='customer_houseproprietary' id='customer_houseproprietary' placeholder='Proprietário do imóvel (nome ou imobiliária)' title='Proprietário do imóvel (nome ou imobiliária)' style='width:100%;' />
	</div>
	<br>
	<!-- Hipoteca -->
	<div class='input-control text' style='width:100%;' >
		<input type='text' name='customer_mortgage' id='customer_mortgage' placeholder='Hipoteca' title='Hipoteca' style='width:100%;' />
	</div>
</div>

<!-- Mensagem de atualização de dados do usuário -->
<div id='customer_exists' data-role='dialog' data-overlay='true' data-overlay-color='dialog_overlay' data-hide='3000' data-close-button='true' class='padding20' >
	<p>Customer localized in the system.<br>Its name will be update when the mandat be saved.</p>
</div>