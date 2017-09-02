<div class="store-buy container">
    <div class="store-buy-wrap">
        <div class="buy-main">
            <div class="text text-2">
                <div class="proImg proImg-2">
                    <img src="{{ url_for('asset/images/mac_appstore_128x128.png') }}">
                    <ul class="rating bigRating">
                        <li class="on"></li>
                        <li class="on"></li>
                        <li class="on"></li>
                        <li class="on"></li>
                        <li class="half"></li>
                    </ul>
                </div>
                <div class="info">
                    <h1>{{ page.macos_mas_purchaseTitle }}</h1>
                    <p class="mb10"><strong class="font-bold">Requirements:</strong> {{ page.macos_systemRequirements }}<br></p>
                </div>
        		<div class=" row-fluid item ">
                    <div class="span span2 noBor ">
                        <p class="mb10 font-bold">Purchase License for one-time fee and free lifetime update.</p>
                        <p class="price font-bold">
                                                        <del>
                                {{ page.macos_mas_maxPrices }}                                                            </del>
                                                        <strong>
                                {{ page.macos_mas_curPrices }}                                                            </strong> 
                         </p>
							<a href="{{ page.macos_mas_buyUrl }}" class="orangeBtn-b
                        " target="_blank" rel="nofollow me noopener noreferrer" >App Store</a> 
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