<div class="class-content-wrap">
  <div class="inner">
    <div class="inner-wrap fill-bunting font-e3">
      <h2 id="banner-title">Special Topic for everyone.</h2>
      <div id="banner-start">
        <a class="btn btn-static-secondary btn-shadow" href="https://gitter.im/Gmagon/support" target="_blank" rel="nofollow me noopener noreferrer" >Need help?</a>
      </div>
    </div>
  </div>
</div>

<div id="content-wrap">
  <div class="wrapper">
    <div class="inner">
      {% for post in page.posts %}
        {% if loop.index == 0 %}
          {{ partial('partial/post', {post: post}) }}
        {% else %}
          <article class="article post archive-post" itemscope itemtype="http://schema.org/Article">
            <a class="archive-post-link" href="{{ url_for(post.path) }}">
              <strong class="archive-post-title" itemprop="name">{{ loop.index + '. ' + post.title }}</strong>
              <span class="archive-post-date">{{ time_tag(post.date) }}</span>
            </a>
          </article>
        {% endif %}
      {% endfor %}
    </div>
  </div>
</div>