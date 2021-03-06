<%

    #
    #  Copyright (C) 2001, 2002 MIT
    #
    #  This file is part of dotLRN.
    #
    #  dotLRN is free software; you can redistribute it and/or modify it under the
    #  terms of the GNU General Public License as published by the Free Software
    #  Foundation; either version 2 of the License, or (at your option) any later
    #  version.
    #
    #  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
    #  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
    #  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
    #  details.
    #

%>

<div id="banners_tworow">
					<ul id="large" class="jcarousel-skin-tworows">
						<multiple name="banners">
							<if @banners.rownum@ odd>
								<li>
							 </if>
										<span><a href="@banners.url@" title="@banners.name@" onclick="window.open(this.href); return false"><img src="@banners.publish_image@" alt="@banners.name@" /></a></span>
							<if @banners.rownum@ even>
								</li>
							</if>
						</multiple>
						<if @banners:rowcount@ odd>
							</li>
						</if>
					</ul>
</div>

<script type="text/javascript">
jQuery(document).ready(function() {
    jQuery('#large').jcarousel();
});

</script>
