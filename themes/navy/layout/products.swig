<div class="class-content-wrap">
  <div class="inner">
    <div class="inner-wrap">
      <h2 id="banner-title">{{ __('products.solutions_description') }}</h2>
      <div id="banner-start">
        <a id="banner-start-link" href="https://gitter.im/Gmagon/support" target="_blank">We're here to help.</a>
      </div>
    </div>
  </div>
</div>

<div class="class-content-wrap">
  <div class="wrapper">
    <div class="inner">
      <header id="product-list-header">
        <h3 id="product-list-title">{{ page.title }}</h3>
        <input type="search" id="product-search-input" placeholder="Search">
        <div id="product-list-count">{{ products_count(site.data[page.data]) }} items</div>
      </header>

      <div id="product-list-show-area">
      {% for category in site.data[page.data] %}
        <h3 class="product-list-category"> {{ category.name }} </h3>
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
    <div class="inner-wrap">
      <div class="intro-sub-content-wrap">
      </div>
    </div>
  </div>
</div>

<script>window.SEARCH_INDEX = {{ lunr_index(site.data[page.data], 'products') }}</script>
