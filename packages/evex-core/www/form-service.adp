       <form action="/mail/send-mail" method="post">
         <table width="95%"><tr><td>
      	   <input style="background: transparent; border:0; border-bottom:1px solid #737373; width:100%;" type="text" name="name" id="nome" value="Nome" onfocus="if(this.value == 'Nome') { this.value = '';}"><br><br>
      	   <input style="background: transparent; border:0; border-bottom:1px solid #737373; width:100%;" type="text" name="email" id="email" value="Email" onfocus="if(this.value == 'Email') { this.value = '';}"><br><br>
      	   <input style="background: transparent; border:0; border-bottom:1px solid #737373; width:100%;" type="text" name="phone" id="phone" value="Telefone" onfocus="if(this.value == 'Telefone') { this.value = '';}"></td></tr>
	 <tr><td><br><br><textarea name="body" style="background: transparent;border:0; border-bottom:1px solid #737373; width:100%;" cols="66" rows="4" onfocus="if(this.value == 'Descricao dos Servicos') { this.value = '';}">Descricao dos Servicos</textarea></td></tr>
	 <tr><td align="right"><input style="background: transparent;" type="submit" value="Enviar"></td></tr></table>
       </form>
