{% if config.algolia %}

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/instantsearch.js@2.0.2/dist/instantsearch.min.css">
<script src="https://cdn.jsdelivr.net/npm/instantsearch.js@2.0.2/dist/instantsearch.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/instantsearch.js@2.0.2/dist/instantsearch-theme-algolia.min.css">

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

{{ js('js/search') }}

{% endif %}