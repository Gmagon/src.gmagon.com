<li class="product on" data-refid="{{ category.name + '-' + product.appID }}">
  <div class="product-screenshot">
    <img src="{{ url_for('products/screenshots/' + product.appID + '.' + product.thumbType) }}" class="product-screenshot-img">
    {% if product.preview %}
    <a href="{{ product.preview }}" class="product-preview-link"><i class="fa fa-eye"></i></a>
    {% endif %}
  </div>
  <a href="{{ product.link }}" class="product-name">{{ product.name }}</a>
  <p class="product-desc">{{ product.description }}</p>
  <div class="product-tag-list">
    {% for tag in product.tags %}
      <a href="#{{ tag }}" class="product-tag">{{ tag }}</a>
    {% endfor %}
  </div>
</li>
