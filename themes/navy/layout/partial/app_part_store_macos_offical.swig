
<div class="store-buy container">
    <div class="store-buy-wrap">
        <div class="buy-main">
            <div class="text text-2">
                <div class="proImg proImg-2">
                    <img src="{{ url_for('asset/images/apple_128x128.png') }}">
                    <ul class="rating bigRating">
                        <li class="on"></li>
                        <li class="on"></li>
                        <li class="on"></li>
                        <li class="on"></li>
                        <li class="half"></li>
                    </ul>
                </div>
                <div class="info">
                    <h1>{{ page.macos_offical_purchaseTitle }}</h1>
                    <ul class="dot mb20 font-bold">
                        <li>Keycode will be sent to you automatically within minutes</li>
                        <li>Free technical support service</li>
                        <li>Free update </li>
                    </ul>
                    <p class="mb10"><strong class="font-bold">Requirements:</strong> {{ page.macos_systemRequirements }}<br></p>
                    <img src="{{  url_for( 'asset/images/accept-pic.jpg') }}" class=" maxW ">
                </div>
        		<div class=" row-fluid item ">
                    <div class="span span2 noBor ">
                        <p class="mb10 font-bold">Purchase License for one-time fee and free lifetime update.</p>
                        <p class="price font-bold">
                                                        <del>
                                {{ page.macos_offical_maxPrices }}                                                            </del>
                                                        <strong>
                                {{ page.macos_offical_curPrices }}                                                            </strong> 
                         </p>
							<a href="{{ page.macos_offical_buyUrl }}" class="orangeBtn-b
                        " target="_blank" rel="nofollow me noopener noreferrer">Add to Cart</a> 
                    </div>
                    <div class="clear "></div>
                </div>
            </div>
			<div class="sideArea sideArea-2 "> <img src="{{ url_for('asset/images/guarantee.jpg') }} ">
			  <hr>
		  </div>
		</div>
	</div>
</div>