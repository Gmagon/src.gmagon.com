<div class="class-content-wrap">
  <div class="wrapper">
    <div class="inner">
        <article class="article-container" itemscope itemtype="http://schema.org/Article">
          <div class="article-inner article-inner-margin-0">
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
            {# Note: remove aside iansun 2017.09.02
            <aside id="article-toc" role="navigation">
              <div id="article-toc-inner">
                <strong class="sidebar-title">{{ __('page.contents') }}</strong>
                {{ toc(page.content, {list_number: false}) }}
                <a href="#" id="article-toc-top">{{ __('page.back_to_top') }}</a>
              </div>
            </aside>
            #}
          </div>
        </article>
        {{ partial('partial/sidebar') }}
      </div>
    </div>
</div>