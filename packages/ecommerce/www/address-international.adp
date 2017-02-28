<master>
  <property name="doc(title)">@title;noquote@</property>
  <property name="context">@context;noquote@</property>

  <property name="signatory">@ec_system_owner;noquote@</property>

<if @address_type@ eq "shipping">
  <include src="/packages/ecommerce/lib/checkout-progress" step="1">
  <h2>Your shipping address</h2>
</if>
<else>
  <if @referer@ ne "gift-certificate-billing">
    <include src="/packages/ecommerce/lib/checkout-progress" step="4">
  </if>
  <h2>Your billing address</h2>
</else>

<form method="post" action="address-international-2">
  @hidden_form_vars;noquote@
  <blockquote>
    <table>
      <tr>
	  <td>First Name</td>
          <td><input type="text" name="first_names" size="30" value="@user_first_names_with_quotes_escaped@">
        </tr>
        <tr>
	  <td>Last Name</td>
	  <td><input type="text" name="last_name" size="30" value="@user_last_name_with_quotes_escaped@"></td>
      </tr>
      <tr>
	<td>Address</td>
	<td><input type="text" name="line1" size="50" <if @line1@ not nil>value="@line1@"</if>></td>
      </tr>
      <tr>
	<td>2nd line (optional)</td>
	<td><input type="text" name="line2" size="50" <if @line2@ not nil>value="@line2@"></if>></td>
      </tr>
      <tr>
	<td>City</font></td>
	<td><input type="text" name="city" size="20" <if @city@ not nil>value="@city@"</if>></td>
      </tr>
      <tr>
	<td>Province or Region</td>
	<td><input type="text" name="full_state_name" size="15" <if @full_state_name@ not nil>value="@full_state_name@"</if>></td>
      </tr>
      <tr>
	<td>Postal Code</td>
	<td><input type="text" maxlength="10" name="zip_code" size="10" <if @zip_code not nil>value="@zip_code@"</if>></td>
      </tr>
      <tr>
	<td>Country</td>
	<td>@country_widget;noquote@</td>
      </tr>
      <tr>
	<td>Phone</td>
	<td>
	  <input type="text" name="phone" size="20" maxlength="20" <if @phone@ not nil>value="@phone@"</if>>
          <input type="radio" name="phone_time" value="d"<if @phone_time@ nil or @phone_time@ not eq "e"> checked</if>>day&nbsp;&nbsp;&nbsp;<input type="radio" name="phone_time" value="e"<if @phone_time@ not nil and @phone_time@ eq "e"> checked</if>> evening
	</td>
      </tr>
    </table>
  </blockquote>
  <center>
    <input type="submit" value="Continue">
  </center>
</form>
