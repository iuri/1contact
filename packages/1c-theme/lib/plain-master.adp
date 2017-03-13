<master src="/www/blank-master">
<<<<<<< HEAD
<if @doc@ defined><property name="&doc">doc</property></if>
<if @body@ defined><property name="&body">body</property></if>
<if @head@ not nil><property name="head">@head;noquote@</property></if>
<if @focus@ not nil><property name="focus">@focus;noquote@</property></if>
<property name="skip_link">@skip_link;noquote@</property>


=======
>>>>>>> 1c25353865b4f810e20e44ec5e5b28b4518efa5d


<!-- Início do Wrapper -->
<div class='wrapper' >

	<!-- Início da header -->
	<div class='header' >
<<<<<<< HEAD
		<include src='header' />
		<!-- Carregando Header -->
=======
		<!-- Carregando Header -->
		<include src="contents/header" />
>>>>>>> 1c25353865b4f810e20e44ec5e5b28b4518efa5d
	</div>
	<!-- Fim da header -->

	<!-- Início da tela -->
<<<<<<< HEAD
	<slave>







<!-- Início do footer -->
  <if @num_of_locales@ gt 1 or @locale_admin_url@ not nil>
  <div id="footer">
    <div id="footer-links">
      <ul class="compact">
      <if @num_of_locales@ gt 1>
        <li><a href="@change_locale_url@">#acs-subsite.Change_locale_label#</a></li>
      </if>
      <else>
        <if @locale_admin_url@ not nil>
          <li><a href="@locale_admin_url@">Install locales</a></li>
        </if>
      </else>
      </ul>
      		<include src='footer' />

    </div>
  </div> <!-- /footer -->
  </if>
<!-- Fim do footer -->

</div>
<!-- Fim do Wrapper -->





<!--  Google Analytics -->
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36229399-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
=======
	<div class='plane' >
		<!-- Carregando barra de navegação -->
		<div class='navbar' >
			<include src='contents/navbar' />
		</div>
		<!-- Carregando o conteúdo -->
		     <slave>
	</div>
	<!-- Fim da tela -->

	<!-- Início do footer -->
	<div class='footer' >
		<!-- Carregando footer -->
		<include src='contents/footer' />
	</div>
	<!-- Fim do footer -->

</div>
<!-- Fim do Wrapper -->
>>>>>>> 1c25353865b4f810e20e44ec5e5b28b4518efa5d

