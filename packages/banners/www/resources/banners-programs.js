  	function carouselVisibleIn(carousel, item, i, state, evt)
	{
	    var idx = carousel.index( i, carouselItemList.length );
	    carousel.add( i, carouselGetItemHTML(carouselItemList[ idx - 1 ] ) );
	}

	function carouselVisibleOut(carousel, item, i, state, evt)
	{
	    carousel.remove( i );
	}

	function carouselGetItemHTML( item )
	{
	    return "<a href=\"" + item.url + "\" target=\"_blank\"><img width='200' src=\"" + item.image + "\" alt=\"" + item.title + "\" /></a>";
	}	



