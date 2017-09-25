<div class="class-content-wrap class-content-wrap-margin-auto">
  <div class="inner">
    <div class="inner-wrap fill-bunting font-e3">
      <h2 id="banner-title">{{ page.bannerTitle }}</h2>
      <div class="support-need"> Need service or support? </div>
      <div class="support-ways">
        <p> 
        <a class="btn btn-static-secondary btn-shadow" href="https://gitter.im/Gmagon/support" target="_blank" rel="nofollow me noopener noreferrer">
        Start your request online</a> 
        or send an email to 
        <a class="btn btn-static-secondary btn-shadow" href="mailto:support@gmagon.com" target="_blank" rel="nofollow me noopener noreferrer">
        support@gmagon.com 
        </a>
        and we’ll give you a solution. 
        </p>
      </div>
    </div>
  </div>
</div>

<div class="class-content-wrap">
  <div class="wrapper">
    <div class="inner">
       {{ page_anchor(page.content) }}
    </div>
  </div>  
  
  <div class="container-support">
  </div>
  
  <div class="wrapper">
    <div class="inner">
      <footer class="article-footer">
        <time class="article-footer-updated" datetime="{{ date_xml(page.updated) }}" itemprop="dateModified">{{ __('page.last_updated', date(page.updated)) }}</time>
        {{ page_nav() }}
      </footer>
      {{ partial('partial/share') }}
      {{ partial('partial/comment') }}
    </div>
  </div>
</div>


