<link rel="stylesheet" href="{{ url_for('asset/styles/store_buy.css')}}">

{{ partial('partial/app_header') }}


<div class="class-content-wrap">
  <div class="wrapper">
    <div class="inner">

    {% if page.macos_buy_enable %}
      {{ partial('partial/app_part_store_macos') }}
    {% endif %}

    <footer class="article-footer">
      <time class="article-footer-updated" datetime="{{ date_xml(page.updated) }}" itemprop="dateModified">{{ __('page.last_updated', date(page.updated)) }}</time>
      {{ page_nav() }}
    </footer>
    {{ partial('partial/share') }}
    {{ partial('partial/comment') }}
    </div>
   </div>
</div>