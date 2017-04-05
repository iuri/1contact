<property name='focus' >@focus;literal@</property>

<div id='login_form_popup' data-role='dialog' data-close-button='true' data-overlay='true' data-overlay-color='dialog_overlay' >
	<div style='text-align:center;position:relative;padding: 1rem 4rem;' >
		<p style='text-align:center;' ><b>#1c-users.Login#</b></p>

		<!-- Início do formulário -->
		<formtemplate class='' id='login' ></formtemplate>
		<!-- Fim do formulário -->

		<p style='text-align:center;' ><b>#1c-users.or_using#</b></p>
		<div>
			<a href='#' ><img src='/resources/1c-users/images/logo-google.svg' style='height:50px;width:auto;margin-right:1rem;' /></a>

<!-- 			<a href="https://www.facebook.com/v2.8/dialog/oauth?client_id=1352605191467865&redirect_uri=@return_url@"><img src='/resources/1c-users/images/logo-facebook.svg' style='height:50px;width:auto;margin-right:1rem;' /></a> -->

 			<a href="" onClick='javascript:checkLoginState();'><img src='/resources/1c-users/images/logo-facebook.svg' style='height:50px;width:auto;margin-right:1rem;' /></a>




		</div>
		<br>
		<div style='position:absolute;right:.75rem;text-align:right;' >
			<a href='@register_url@' >#acs-subsite.Register#</a><br>
			<a href='@forgotten_pwd_url@' style='float:right' >#acs-subsite.Forgot_your_password#</a>
		</div>
		<br style='line-height:1.5rem;height:1.5rem;' >
	</div>

</div>







<!--
<script>

// This is called with the results from from FB.getLoginStatus().
function statusChangeCallback(response) {
  console.log('statusChangeCallback');
  console.log(response);
    
  // The response object is returned with a status field that lets the
  // app know the current login status of the person.
  // Full docs on the response object can be found in the documentation
  // for FB.getLoginStatus().
  if (response.status === 'connected') {
    // Logged into your app and Facebook.
    FB.login();
  } else {
    // The person is not logged into your app or we are unable to tell.
    document.getElementById('status').innerHTML = 'Please log ' + 'into this app.';
    //FB.login();
  }
}

// This function is called when someone finishes with the Login
// Button.  See the onlogin handler attached to it in the sample code below.
function checkLoginState() {
  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });
}


window.fbAsyncInit = function() {
  FB.init({
    appId      : '1352605191467865',
    cookie     : true,  // enable cookies to allow the server to access the session
    xfbml      : true,  // parse social plugins on this page
    version    : 'v2.8' // use graph api version 2.8
  });

  // Now that we've initialized the JavaScript SDK, we call FB.getLoginStatus().
  // This function gets the state of the person visiting this page and can return one of three states to
  // the callback you provide.  They can be:
  //
  // 1. Logged into your app ('connected')
  // 2. Logged into Facebook, but not your app ('not_authorized')
  // 3. Not logged into Facebook and can't tell if they are logged into
  //    your app or not.
  //
  // These three cases are handled in the callback function.

  
  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });
  
  //FB.login(function(){
  //    FB.api('/me', {fields: 'name, email'}, function(response){
  //    	console.log(response);
  //    });
  // }, {scope: 'email'});


};


// Load the SDK asynchronously
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;

  js.src = "//connect.facebook.net/en_US/sdk.js";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));


// Here we run a very simple test of the Graph API after login is
// successful.  See statusChangeCallback() for when this call is made.
FB.login( function() {
  console.log('Welcome!  Fetching your information.... ');



  FB.api('/me',{fields: 'id, name, email'}, function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML = 'Thanks for logging in, ' + response.name + ' Email: ' + response.email  +'!';

      alert(response.email);
      console.log(response);

  });
}, { scope: 'id, name, email' } );


</script>

<fb:login-button scope="email,public_profile" onlogin="checkLoginState();">
</fb:login-button>

<div id="status">
</div>

-->

<script>

window.fbAsyncInit = function() {
  FB.init({
    appId   : '1352605191467865',
    cookies : true,
    xfbml   : true,
    version : 'v2.8'
  });
  FB.AppEvents.logPageView();
};

(function(d, s, id){
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) {return;}
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

function statusChangeCallback(response) {
  console.log('statusChangeCallback');
  console.log(response);
  if (response.status === 'connected') {
    myFacebookLogin();
  } else {
    document.getElementById('status').innerHTML = 'Please log ' + 'into this app.';
  }
}

function checkLoginState() {
  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });
}

function myFacebookLogin() {
  FB.login(function(response) {
    FB.api('/me?fields=id, name, email', function(response) {
      console.log(response);
      document.getElementById('status').innerHTML = 'Thanks for logging in, ' + response.name + ' Email: ' + response.email  +'!';
    });
  }, {
    scope: 'public_profile, email',
    return_scopes: true
  });
}

</script>


<!-- <button  >Login with Facebook</button>
<div id='status'></div>
-->