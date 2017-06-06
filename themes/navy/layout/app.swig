<header id="banner" class="wrapper">
  <div class="inner">
    <img src="./images/logo/logo_128x128.png">
    <h2 id="banner-app-title">{{ page.subtitle }}</h2>
    {# <div id="banner-start">
      {% if !page.isIndexPage %}
        <a id="banner-start-link" href="./index.html"><i class="fa fa-arrow-left"></i></a><span id="banner-start-description">Back to Overview</span>
      {% endif %}
    </div> #}
    <div class="banner-menu app-menus">
      <nav>
        <a href="./index.html" class="main-nav-link {{ nav_link_active(page.current, 'index') }} ">OVERVIEW</a>
        <a href="./features.html" class="main-nav-link {{ nav_link_active(page.current, 'features') }} ">FEATURES</a>
        <a href="./download.html" class="main-nav-link {{ nav_link_active(page.current, 'download') }} ">DOWNLOAD</a>
        <a href="./buy.html" class="main-nav-link {{ nav_link_active(page.current, 'buy') }} ">BUY ONLINE</a>
        <a href="./docs.html" class="main-nav-link {{ nav_link_active(page.current, 'docs') }} ">MANUAL</a>
        <a href="./changelog.html" class="main-nav-link {{ nav_link_active(page.current, 'changelog') }} ">RELEASE NOTES</a>
        <a href="./faq.html" class="main-nav-link {{ nav_link_active(page.current, 'faq') }} ">FAQ</a>
        <a href="https://gitter.im/Gmagon/support" target="_blank" class="main-nav-link">SUPPORT</a>
      </nav>
    </div>
  </div>
</header>

<div id="content-wrap">
  <div class="wrapper">
    <div class="inner">
        <article class="article-container" itemscope itemtype="http://schema.org/Article">
          <div class="article-inner">
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
                <strong class="sidebar-title">{{ __('page.contents') }}</strong>
                {{ toc(page.content, {list_number: false}) }}
                <a href="#" id="article-toc-top">{{ __('page.back_to_top') }}</a>
              </div>
            </aside>
          </div>
        </article>
        {{ partial('partial/sidebar') }}
      </div>
    </div>
</div>
