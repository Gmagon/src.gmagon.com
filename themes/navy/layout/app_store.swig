<link rel="stylesheet" href="{{ url_for('asset/styles/store_buy.css')}}">

{{ partial('partial/app_header') }}


<div class="class-content-wrap">
  <div class="wrapper">
    <div class="inner">

    {% if page.macos_buy_enable %}
      {{ partial('partial/app_part_store_macos') }}
    {% endif %}

    </div>
   </div>
</div>