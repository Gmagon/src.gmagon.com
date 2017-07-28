<div class="class-content-wrap">
  <div class="inner">
    <div class="inner-wrap fill-bunting font-white">
      <h2 id="banner-title">{{ __('products.solutions_description') }}</h2>
      <div id="banner-start">
        <a class="btn btn-static-secondary btn-shadow" href="https://gitter.im/Gmagon/support" target="_blank">Need help?</a>
      </div>
    </div>
  </div>
</div>

<div class="class-content-wrap">
  <div class="wrapper">
    <div class="inner">
      <header id="product-list-header">
        <input type="search" id="product-search-input" class="elevation1" placeholder="Search the products">
        <div id="product-list-count">{{ products_count(site.data[page.data]) }} items</div>
      </header>

      <div id="product-list-show-area">
      {% for category in site.data[page.data] %}
        <div class="product-list-category"> {{ category.name }} </div>
        <ul class="product-list">
          {% for product in category.list %}
            {{ partial('partial/' + page.partial, {product: product, category:category}) }}
          {% endfor %}
        </ul>
      {% endfor %}
      </div>
    </div>
  </div>
</div>

<div class="class-content-wrap">
  <div class="inner">
    <div class="inner-wrap landing-bunting">
      <div class="intro-sub-content-wrap">
      </div>
    </div>
  </div>
</div>

<script>window.SEARCH_INDEX = {{ lunr_index(site.data[page.data], 'products') }}</script>
