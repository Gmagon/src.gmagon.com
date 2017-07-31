{% if config.algolia %}

<script type="text/javascript">
(function(){
    document.getElementById('search-input-wrap').classList.add('on');
    window.AlgoliaConfig = {
        appId: '{{config.algolia.applicationID}}',
        apiKey: '{{config.algolia.apiKey}}',
        indexName: '{{config.algolia.indexName}}',
        urlSync: {}
    }
})();
</script>

{{ css('js/instantsearch/instantsearch.min.css') }}
{{ css('js/instantsearch/instantsearch-theme-algolia.min.css') }}
{{ js('js/instantsearch/instantsearch.min.js') }}
{{ js('js/search') }}

{% endif %}