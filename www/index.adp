<master>















<!--
  Below we include the Login Button social plugin. This button uses
    the JavaScript SDK to present a graphical Login button that triggers
      the FB.login() function when clicked.
      -->

<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
</fb:login-button>

<div id="status">
</div>






<div id="fb-root"></div>





<a href="https://www.facebook.com/v2.8/dialog/oauth?client_id=1352605191467865&redirect_uri=@return_url@">Login</a>