<master>

<property name="title">@page_title;noquote@</property>
<property name="context">{@page_title;noquote@}</property>

<h1>@page_title;noquote@</h1>

<form name="annonce_ae" action="annonce-ae" method="post">
<input type="hidden" id="annonce_id" name="annonce_id" value="@annonce_id@">
 
<table>
  <tr>
    <td width="10%">#1c-annonce.Title#</td>
    <td><input type="text" name="title" id="title" value="@title@"></td>
  </tr>
  <tr>
    <td width="10%">#1c-annonce.Reference#</td>
    <td><input type="text" name="reference" id="ref_number" value="@reference@"></td>
  </tr>
  <tr>
    <td width="10%">#1c-annonce.Type_of_Transaction#</td>
    <td>
      <select name="type_of_transaction" id="type_of_transaction">
        <option value="0">#1c-annonce.Select_Option#</option>
        <option value="1">#1c-annonce.Location#</option>
        <option value="2">#1c-annonce.Vente#</option>
        <option value="3">#1c-annonce.Sous-Location#</option>
        <option value="4">#1c-annonce.Fonds_de_Commerce#</option>
        <option value="5">#1c-annonce.Autre#</option>
      </select>
    </td>
  </tr>
  <tr>
    <td width="10%">#1c-annonce.Je_suis#</td>
    <td>
      <select name="type_of_owner" id="type_of_owner">
        <option value="0">#1c-annonce.Locataire#</option>
        <option value="1">#1c-annonce.Proprietaire#</option>
        <option value="2">#Sous-Location#</option>
      </select>
    </td>
  </tr>
  <tr>
    <td width="10%">#1c-annonce.Type_of_Property#</td>
    <td>
      <input id="type1" type="checkbox" name="typeofprops[]" value="1" />
      <label for="Type1">#1c-annonce.Maison#</label>
<br />
    <input id="type2" type="checkbox" name="typeofprops[]" value="Olives" />
    <label for="Type2">#1c-annonce.Parking#</label>
<br />
    </td>
  </tr>
</table>
<table>
  <tr>
    <td valign="top" align="right"><input type=submit name=@submit_name@.x value="@submit_value@"></td>
    <td valign="top" align="right"><input type=submit name=cancel.x value=#1c-annonce.Cancel#></td>
  </tr>

</table>
</form>