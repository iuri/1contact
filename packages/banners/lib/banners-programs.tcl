set package_id 710
set user_id [ad_conn user_id]



set base_url [site_node::get_url_from_object_id -object_id $package_id]
template::head::add_css -href "/resources/banners/banners.css"
template::head::add_javascript -src "/resources/banners/banners-programs.js"

set list_options ""

db_multirow -extend {publish_image} banners select_banners {} {

	set image_id [ImageMagick::util::get_image_id -item_id $banner_id]
	if {![empty_string_p $image_id]} { 
	  set publish_image "${base_url}image/$image_id"
	} else {
	  set publish_image ""
	}

	append list_options "{image: \"$publish_image\", url:\"$url\", title: \"$name\"},"

}

ah::requires -sources "jquery,jcarousel"

template::head::add_javascript -script " 
	var carouselItemList = \[
		$list_options
	\];
"


template::head::add_javascript -script {


	$( document ).ready(
		function()
		{
			$( "#slide-image" ).jcarousel(
				{
					wrap: "circular",
					scroll: 1,
					visible: 4,
					size: carouselItemList.length,
					itemVisibleInCallback: {onBeforeAnimation: carouselVisibleIn},
        				itemVisibleOutCallback: {onAfterAnimation: carouselVisibleOut}
				}
			);

		    var arrTopo = [ "bcktopo001.jpg", "bcktopo002.jpg" , "bcktopo003.jpg", "bcktopo004.jpg" ];

			var intRandom = ( Math.round( Math.random() * ( arrTopo.length - 1 ) ) );
			$( "#destaques" ).css( {background: "url('/resources/banners/images/prorams/" + arrTopo[ intRandom ] + "') top left no-repeat", width: 600, height: 165, position: "relative"} );
		   		    
		}
	);
} -order 4

