ad_page_contract {
    This is the main page for the package.
    It displays all of the Notes and pro
    @author Your Name (you@example.com)
    @cvs-id $Id: index.tcl,v 1.2 2004/02/04 16:47:34 joela Exp $
}
set page_title [ad_conn instance_name]
set context [list]

template::head::add_css -href "/resources/evex-core/css/base.css"
template::head::add_css -href "/resources/evex-core/css/style.css"

template::head::add_javascript -src "/resources/evex-core/vendor/jquery.min.js" -order 0

template::head::add_javascript -src "/resources/evex-core/vendor/noframework.waypoints.min.js" -order 1
template::head::add_javascript -src "/resources/evex-core/vendor/jquery.magnific-popup.min.js" -order 2
  
template::head::add_javascript -src "/resources/evex-core/js/responsive-nav.js" -order 3

template::head::add_javascript -src "/resources/evex-core/vendor/swiper.jquery.js" -order 16

template::head::add_javascript -src "/resources/evex-core/js/form-submit.js" -order 5

template::head::add_javascript -src "/resources/evex-core/js/popup.js" -order 6

template::head::add_javascript -src "/resources/evex-core/js/reveal-animation.js" -order 7

template::head::add_javascript -src "/resources/evex-core/js/bg-videos.js" -order 8

template::head::add_javascript -src "/resources/evex-core/js/background-parallax.js" -order 9

template::head::add_javascript -src "/resources/evex-core/js/page-script.js" -order 10

template::head::add_javascript -script {
    var fonts = {
	"Montserrat": {
	    "family": "Montserrat",
	    "source": "google",
	    "subsets": [
			"latin"
		       ],
	    "variants": [
			 "700",
			 "regular"
			]
	},
	"Roboto": {
	    "family": "Roboto",
	    "source": "google",
	    "subsets": [
			"cyrillic",
			"cyrillic-ext",
			"greek",
			"greek-ext",
			"latin",
			"latin-ext",
			"vietnamese"
		       ],
	    "variants": [
			 "100",
			 "100italic",
			 "300",
			 "300italic",
			 "500",
			 "500italic",
			 "700",
			 "700italic",
			 "900",
			 "900italic",
			 "italic",
			 "regular"
			]
	}
    };
} -order 11

template::head::add_javascript -src "/resources/evex-core/vendor/webfontloader.js" -order 12

template::head::add_javascript -src "/resources/evex-core/js/fontloader.js" -order 13

template::head::add_javascript -script {
    
    $(document).ready(function(){
        $("a[rel=modal]").click( function(ev){
	    ev.preventDefault();
	    var id = $(this).attr("href");
	    var alturaTela = $(document).height();
	    var larguraTela = $(window).width();
	    //colocando o fundo preto
	    $('#mascara').css({'width':larguraTela,'height':alturaTela});
	    $(".window1").hide();
	    $("#fechar").show();
	    $('#mascara').fadeIn(1000);
	    $('#mascara').fadeTo("slow",0.8);
	    //var left = ($(window).width() /2) - ( $(id).width() / 2 );
	    //var top = ($(window).height() / 2) - ( $(id).height() / 2 );
	    var top = 30;
	    var left = 30;
	    $(id).css({'top':top,'left':left});
	    $(id).show();
	});
	
	$("#mascara").click( function(){
	    $(this).hide();
	    $(".window").hide();
	    $(".window1").show();
	    $(".fechar").hide();
	});
	
	$('.fechar').click(function(ev){
	    ev.preventDefault();
	    $("#mascara").hide();
	    $(".window").hide();
	    $(".window1").show();
	    $(".fechar").hide();
	    
	});
	
	
	
	$("#submit").click( function(){
	    alert("TESTE");
	    $(".confirm").show();
	});	
    });
} -order 14









