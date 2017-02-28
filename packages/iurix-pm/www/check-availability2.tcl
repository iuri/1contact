ad_page_contract {}


# template::head::add_javascript -src "http://code.jquery.com/jquery-1.10.2.js" -order 0
# template::head::add_css -href "http://code.jquery.com/" 
template::head::add_css -href "http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" 
template::head::add_javascript -src "http://code.jquery.com/jquery-1.8.2.js"
template::head::add_javascript -src "http://code.jquery.com/ui/1.9.0/jquery-ui.js"
 

template::head::add_javascript -script {
  $(function() {
      $( "#checkin" ).datepicker({
	  showButtonPanel:true,
	  dateFormat: 'dd-mm-yy',
	  changeMonth: true,
	  changeYear: true
	  showOtherMonths: true,
        selectOtherMonths: true

      });
      $( "#checkout" ).datepicker({
	  showButtonPanel:true,
	  dateFormat: 'dd-mm-yy'
      });
  });
}





 
#template::head::add_css -href "http://www.eyecon.ro/bootstrap-datepicker/datepicker.css"
#template::head::add_css -href "http://www.eyecon.ro/bootstrap-datepicker/js/google-code-prettify/prettify.css"



# template::head::add_javascript -src "http://http://jqueryui.com/datepicker/resources/demos/style.css" -order 1
