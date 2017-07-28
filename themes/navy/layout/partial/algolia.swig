{% if config.algolia %}
<link rel="stylesheet" href="https://cdn.jsdelivr.net/docsearch.js/2/docsearch.min.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/docsearch.js/2/docsearch.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    document.getElementById('search-input-wrap').classList.add('on');
    docsearch({
        appId: '{{config.algolia.applicationID}}',
        apiKey: '{{config.algolia.apiKey}}',
        indexName: '{{config.algolia.indexName}}',
        inputSelector: '#search-input',
        debug: true,
        hits: {"per_page":10}
    });
  })

</script>
{% endif %}