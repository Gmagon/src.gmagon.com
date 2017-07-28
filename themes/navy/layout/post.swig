<div class="class-content-wrap">
  <div class="wrapper">
    <div class="inner">
      <article class="article-container" itemscope itemtype="http://schema.org/Article">
        <div class="article-inner">
          <div class="article">
          {{ partial('partial/post', {post: page}) }}
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
    </div>
  </div>
</div>

<div class="class-content-wrap">
  <div class="inner">
    <div class="inner-wrap">
      <div class="intro-sub-content-wrap">
      </div>
    </div>
  </div>
</div>


