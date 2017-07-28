{% if config.algolia %}
<script src="https://cdn.jsdelivr.net/algoliasearch/3/algoliasearch.min.js"></script>
<script src="https://cdn.jsdelivr.net/autocomplete.js/0/autocomplete.jquery.min.js"></script>

<script type="text/javascript">
  $(document).ready(function(){
    document.getElementById('search-input-wrap').classList.add('on');

    // add autocomplete
    // see: https://github.com/algolia/autocomplete.js
    var enableAutoComplete = true;
    if (enableAutoComplete) {
        var algolia_client = algoliasearch('{{config.algolia.applicationID}}', '{{config.algolia.apiKey}}');
        var index = algolia_client.initIndex('{{config.algolia.indexName}}');
        $('#search-input').autocomplete({ hint: false }, [
            {
            source: $.fn.autocomplete.sources.hits(index, { hitsPerPage: 5 }),
            displayKey: 'title',
            templates: {
                suggestion: function(suggestion) {
                return suggestion._highlightResult.title.value;
                }
            }
            }
        ]).on('autocomplete:selected', function(event, suggestion, dataset) {
            console.log(suggestion, dataset);
            window.open(suggestion.permalink)
        });
    }

  })
</script>
{% endif %}