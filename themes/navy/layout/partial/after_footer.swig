<!-- Scripts -->
<!-- build:js build/js/main.js -->
{{ js('js/lang_select') }}
{{ js('js/scrollingelement') }}
{{ js('js/toc') }}
{{ js('js/mobile_nav') }}
<!-- endbuild -->
<!-- <script src="https://cdn.jsdelivr.net/retinajs/1.3.0/retina.min.js" async></script> -->

<!-- totop -->
{{ partial('totop') }}
{{ js('js/totop') }}

{% if page.layout === 'plugins' %}
<!-- Plugin search -->
<script src="https://cdn.jsdelivr.net/lunr/0.6.0/lunr.min.js"></script>
<!-- build:js build/js/plugins.js -->
{{ js('js/plugins') }}
<!-- endbuild -->
{% endif %}

{% if page.layout === 'products' %}
<!-- Plugin search -->
<script src="https://cdn.jsdelivr.net/lunr/0.6.0/lunr.min.js"></script>
<!-- build:js build/js/plugins.js -->
{{ js('js/products') }}
<!-- endbuild -->
{% endif %}

<!-- Google Analytics -->
{{ partial('google_analytics') }}
