'use strict';

var pathFn = require('path');
var _ = require('lodash');
var url = require('url');
var cheerio = require('cheerio');
var lunr = require('lunr');

var localizedPath = ['docs', 'api'];

function startsWith(str, start){
  return str.substring(0, start.length) === start;
}

hexo.extend.helper.register('products_count', function(categoryList){
  var result = 0;
  _.each(categoryList, function(category){
    _.each(category.list, function(product){
      ++result;
    })
  })

  return result;
});

hexo.extend.helper.register('nav_link_active', function(current, compare){
  if (current === compare) {
    return 'main-nav-link-active';
  }

  return '';
});

hexo.extend.helper.register('page_nav', function(){
  var type = this.page.canonical_path.split('/')[0];
  var sidebar = this.site.data.sidebar[type];
  var path = pathFn.basename(this.path);
  var list = {};
  var prefix = 'sidebar.' + type + '.';

  for (var i in sidebar){
    for (var j in sidebar[i]){
      list[sidebar[i][j]] = j;
    }
  }

  var keys = Object.keys(list);
  var index = keys.indexOf(path);
  var result = '';

  if (index > 0){
    result += '<a href="' + keys[index - 1] + '" class="article-footer-prev" title="' + this.__(prefix + list[keys[index - 1]]) + '">' +
      '<i class="fa fa-chevron-left"></i><span>' + this.__('page.prev') + '</span></a>';
  }

  if (index < keys.length - 1){
    result += '<a href="' + keys[index + 1] + '" class="article-footer-next" title="' + this.__(prefix + list[keys[index + 1]]) + '">' +
      '<span>' + this.__('page.next') + '</span><i class="fa fa-chevron-right"></i></a>';
  }

  return result;
});

hexo.extend.helper.register('doc_sidebar', function(className){
  var type = this.page.canonical_path.split('/')[0];
  var sidebar = this.site.data.sidebar[type];
  var path = pathFn.basename(this.path);
  var result = '';
  var self = this;
  var prefix = 'sidebar.' + type + '.';

  _.each(sidebar, function(menu, title){
    result += '<strong class="' + className + '-title">' + self.__(prefix + title) + '</strong>';

    _.each(menu, function(link, text){
      var itemClass = className + '-link';
      if (link === path) itemClass += ' current';

      result += '<a href="' + link + '" class="' + itemClass + '">' + self.__(prefix + text) + '</a>';
    })
  });

  return result;
});

hexo.extend.helper.register('gen_slider_links', function(links, className, options){
   var self = this;
   var result = '';
   var contentTitle = "External Links"

   if(!links) return result;

   try{
    result += '<strong class="sidebar-title">' + contentTitle + '</strong>';
    result += '<ol class="toc ' + className + '">';
    _.each(links, function(obj){
      var name = obj.name;
      var url = obj.url; 

      var li_s = '\n<li class="toc-item toc-level-2 ' + className + '">';
      var a = '<a class="toc-link ' + className + '" href="' + url + '" target="_blank" title="' + name +'" > <span class="toc-text">' + name + '</span></a>';
      var li_e = '</li>';

      result += li_s + a + li_e;
    }) 
    result += '</ol>';
   }catch(e){
     console.error(e)
   }

   return result;
})

hexo.extend.helper.register('header_menu', function(className){
  var menu = this.site.data.menu;
  var result = '';
  var self = this;
  var lang = this.page.lang;
  var isEnglish = lang === 'en';

  _.each(menu, function(path, title){
    if (!isEnglish && ~localizedPath.indexOf(title)) path = lang + path;

    result += '<a href="' + self.url_for(path) + '" class="' + className + '-link">' + self.__('menu.' + title) + '</a>';
  });

  return result;
});

hexo.extend.helper.register('canonical_url', function(lang){
  var path = this.page.canonical_path;
  if (lang && lang !== 'en') path = lang + '/' + path;

  return this.config.url + '/' + path;
});

hexo.extend.helper.register('url_for_lang', function(path){
  var lang = this.page.lang;
  var url = this.url_for(path);

  if (lang !== 'en' && url[0] === '/') url = '/' + lang + url;

  return url;
});

hexo.extend.helper.register('raw_link', function(path){
  return 'https://github.com/hexojs/site/edit/master/source/' + path;
});

hexo.extend.helper.register('page_anchor', function(str){
  var $ = cheerio.load(str, {decodeEntities: false});
  var headings = $('h1, h2, h3, h4, h5, h6');

  if (!headings.length) return str;

  var wantProcess = false;
  if (wantProcess) {
    headings.each(function(){
      var id = $(this).attr('id');

      $(this)
        .addClass('article-heading')
        .append('<a class="article-anchor" href="#' + id + '" aria-hidden="true"></a>');
    });
  }
  return $.html();
});

hexo.extend.helper.register('lunr_index', function(data, page_data){
  if (!page_data) {
    var index = lunr(function(){
      this.field('name', {boost: 10});
      this.field('tags', {boost: 50});
      this.field('description');
      this.ref('id');
    });

    _.sortBy(data, 'name').forEach(function(item, i){
      index.add(_.assign({id: i}, item));
    });

    return JSON.stringify(index.toJSON());
  }

  if (page_data === 'products') {
    var index = lunr(function(){
      this.field('name', {boost: 10});
      this.field('tags', {boost: 50});
      this.field('description');
      this.ref('id');
    });

    _.each(data, function(category){
        _.sortBy(category.list, 'name').forEach(function(item, i){
          var refId = category.name + '-' + item.appID;
          index.add(_.assign({id: refId}, item));
        });
    })

    return JSON.stringify(index.toJSON());
  }

});

hexo.extend.helper.register('canonical_path_for_nav', function(){
  var path = this.page.canonical_path;

  if (startsWith(path, 'docs/') || startsWith(path, 'api/')){
    return path;
  } else {
    return '';
  }
});

hexo.extend.helper.register('lang_name', function(lang){
  var data = this.site.data.languages[lang];
  return data.name || data;
});

hexo.extend.helper.register('disqus_lang', function(){
  var lang = this.page.lang;
  var data = this.site.data.languages[lang];

  return data.disqus_lang || lang;
});
