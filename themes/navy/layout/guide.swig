<div class="class-content-wrap">
  <div class="wrapper">
    <div class="inner">
        <h2 id="banner-app-title">{{ page.title }}</h2>
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
                {{ gen_slider_links(page.externalLinks, "gmagon-guide-page-item", {list_number: false}) }}
              </div>
            </aside>
            
          </div>
        </article>
        {{ partial('partial/sidebar') }}
      </div>
    </div>
</div>