{% if config.algolia %}
{{ js('js/autocomplete/autocomplete.min.js') }}
{{ js('js/autocomplete/autocomplete.jquery.min.js') }}
{{ css('js/docsearch/docsearch.css') }}
{{ js('js/docsearch/docsearch.js') }}


<script type="text/javascript">
  $(document).ready(function(){
    document.getElementById('search-input-wrap').classList.add('on');

    docsearch({
        appId: '{{config.algolia.applicationID}}',
        apiKey: '{{config.algolia.apiKey}}',
        indexName: '{{config.algolia.indexName}}',
        inputSelector: '#search-input',
        debug: true,
        autocompleteOptions: {
          debug: false
        },
        algoliaOptions:{
            hitsPerPage: 10
        }
    });
    
    // add autocomplete
    // see: https://github.com/algolia/autocomplete.js
    var enableAutoComplete = false;
    if (enableAutoComplete) {
        var algolia_client = __algolia.algoliasearch('{{config.algolia.applicationID}}', '{{config.algolia.apiKey}}');
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
        });
    }

  })
</script>
{% endif %}