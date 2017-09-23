<div class="class-content-wrap gmagon-guide-page">
  <div class="inner">
    <div class="inner-wrap fill-bunting font-e3">
      <h2 id="banner-title" class="padding-0"> {{ page.title }} </h2>
      <div id="banner-start">
        <a class="btn btn-static-secondary btn-shadow" href="https://gitter.im/Gmagon/support" ttarget="_blank" rel="nofollow me noopener noreferrer" >Need help?</a>
      </div>
    </div>
  </div>
</div>

<div class="class-content-wrap">
  <div class="wrapper">
    <div class="inner">
        <article class="article-container" itemscope itemtype="http://schema.org/Article">
          <div class="article-inner gmagon-guide-page">
            <div class="article">
              <div class="inner">
                <div class="article-content" itemprop="articleBody">
                  {{ page_anchor(page.content) }}
                </div>
                <footer class="article-footer">
                  <time class="article-footer-updated" datetime="{{ date_xml(page.updated) }}" itemprop="dateModified">{{ __('page.last_updated', date(page.updated)) }}</time>
                  {{ page_nav() }}
                </footer>
                {{ partial('partial/share') }}
                {{ partial('partial/comment') }}
              </div>
            </div>
            
            <aside id="article-toc" role="navigation">
              <div id="article-toc-inner">
                {{ gen_slider_links(page.externalLinksTitle, page.externalLinks, "gmagon-guide-page-item", {list_number: false}) }}
              </div>
            </aside>
            
          </div>
        </article>
        {{ partial('partial/sidebar') }}
      </div>
    </div>
</div>