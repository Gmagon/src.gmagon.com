<li class="product on elevation1" data-refid="{{ category.name + '-' + product.appID }}">
  {% if product.preview %}
  <a href="{{ product.preview }}" target="_blank" rel="nofollow me noopener noreferrer" >
  {% endif %}
  <div class="product-screenshot">
    <img src="{{ url_for('.' + product.link + 'images/logo/logo_128x128.png') }}" class="product-screenshot-img">
  </div>
    {% if product.preview %}
  </a>
  {% endif %}

  <a href="{{ product.link }}" class="product-name"vtarget="_blank" rel="nofollow me noopener noreferrer" >{{ product.name }}</a>
  <p class="product-desc">{{ product.description }}</p>
  <div class="product-tag-list">
    {% for tag in product.tags %}
      <a href="#{{ tag }}" class="product-tag" >{{ tag }}</a>
    {% endfor %}
  </div>
</li>
