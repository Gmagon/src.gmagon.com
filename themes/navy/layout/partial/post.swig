<div class="hide-wrap-head-top"></div>
<article class="article post" itemscope itemtype="http://schema.org/Article">
  <header class="article-header">
    {% if is_post() %}
      <h1 class="article-title" itemprop="name">{{ post.title }}</h1>
    {% else %}
      <h1>
        <a href="{{ url_for(post.path) }}" class="article-title" itemprop="name">{{ post.title }}</a>
      </h1>
    {% endif %}
    <a href="{{ url_for(post.path) }}" class="article-date">{{ time_tag(post.date) }}</a>
  </header>
  <div class="article-content" itemprop="articleBody">
    
    <div class="post-authors">
      <table class="app-download-table"> 
      <thead> 
        <tr> 
        <th>Article Media</th> 
        <th>Links</th> 
        </tr> 
      </thead> 
      <tbody> 
        <tr> 
        <td class="app-download-version">FaceBook</td> 
        <td class="on elevation1"><a href="https://www.facebook.com/groups/winandmac">https://www.facebook.com/groups/winandmac </a></td> 
        </tr> 
        <tr> 
        <td class="app-download-version">Twitter</td> 
        <td class="on elevation1"><a href="https://twitter.com/gmagonshare">https://twitter.com/gmagonshare </a></td> 
        </tr> 
      </tbody> 
      </table>
    </div>
    {{ page_anchor(post.content) }}
  </div>
  {{ partial('partial/share') }}
  {{ partial('partial/comment') }}
  {{ partial('partial/audio_support')}}
</article>
