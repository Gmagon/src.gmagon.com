<li class="product on elevation1" data-refid="{{ category.name + '-' + product.appID }}">
  {% if product.preview %}
  <a href="{{ product.preview }}">
  {% endif %}
  <div class="product-screenshot">
    <img src="{{ url_for('products/screenshots/' + product.appID + '.' + product.thumbType) }}" class="product-screenshot-img">
  </div>
    {% if product.preview %}
  </a>
  {% endif %}
  
  <a href="{{ product.link }}" class="product-name">{{ product.name }}</a>
  <p class="product-desc">{{ product.description }}</p>
  <div class="product-tag-list">
    {% for tag in product.tags %}
      <a href="#{{ tag }}" class="product-tag">{{ tag }}</a>
    {% endfor %}
  </div>
</li>
