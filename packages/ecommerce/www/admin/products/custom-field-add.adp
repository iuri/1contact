<master>
  <property name="doc(title)">@title;noquote@</property>
  <property name="context">@context;noquote@</property>
<h2>@title@</h2>

    <form method=post action=custom-field-add-2>
    <table noborder>
      <tr>
        <td>Unique Identifier</td>
        <td><input type=text size=15 name=field_identifier maxlength=100></td>
        <td>No spaces or special characters (just lowercase letters).  The customers won't see this, but the site
    	administrator might, so make it indicative of what the field is.</td>
      </tr>
      <tr>
        <td>Field Name</td>
        <td><input type=text size=25 name=field_name maxlength=100></td>
        <td>This is the name that the customers will see (if you choose to display this field on the site) and
    	the name you'll see when adding/updating products.</td>
      </tr>
      <tr>
        <td>What kind of information will this field hold?</td>
        <td colspan=2>@custom_field_type_html;noquote@</td>
      </tr>
      <tr>
        <td>Default Value (if any)</td>
        <td><input type=text size=15 name=default_value maxlength=100></td>
        <td>For <b>Date</b> type, entering "0" here will set the default value to the current time of each new item. For other dates, use the format "YYYY-MM-DD"</td>       
</tr>
    </table>
    
    <center>
      <input type=submit value="Submit">
    </center>
    </form>
