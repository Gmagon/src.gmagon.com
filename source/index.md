layout: index
comments: false
title: Gmagon Software - handy and professional Mac apps 
keywords: Gmagon Software, Gmagon Mac solutions, Gmagon Apple Mac apps, Mac software from Gmagon
description: Gmagon provides simple&reliable software solutions running on Mac OS X. Find Mac XLSX to CSV Converter, Mac GIF Converter, Mac CSS Generator... from Gmagon. 
noWithConfigTitle: true
recommend_products:
    - name: XLS2csv
      link: products/store/xls2csv
      description: Batch convert your Excel files to CSV format on Mac.

    - name: Gmagon CSS Maker 
      link: products/store/gmagon_css_maker
      description: An intuitive app to generate CSS codes on your Mac. 

    - name: Gmagon Gif
      link: products/store/gmagon_gif
      description: Convert GIF files to animated PNGs in simple steps. 

    - name: APNGToGifConverter
      link: products/store/apngtogifconverter
      description: A fast and simple tool to convert APNG files to GIFs.  

intro_feature_list:
    - name: Our Software Solutions
      icon: fa fa-bolt
      link:
      description: We deliver simple, innovative, reliable and high-value Mac desktop applications throughout a wide range of fields. 

    - name: Our Attitude 
      icon: fa fa-users
      link: /support
      description: We keep close to what our customers need, and develop customer-centric software solutions for Mac OS X users. 


    - name: Our Team
      icon: fa fa-space-shuttle
      link:
      description: We have an enthusiastic, professional and reliable team. We efficiently integrate cross-disciplinary talents with a well-defined development process. 


    - name: Why Choose Us?
      icon: fa fa-cubes
      link: /products
      description: Intuitive and stable programs; 100% clean and secure; 30-day money back guarantee; 24/7 online customer support. 
---

<div class="class-content-wrap">
    <div class="full-height-jumbotron top">
    </div>
    <section class="home-recommend-products">
        <div class="recommend-container">
        {% for product in recommend_products %}
            <a href="{{ product.link }}" class="recommend-product-link">
                <div class="recommend-product-item">
                    <div class="product-item-image"><img src=" {{ product.link  }}/images/logo/logo_128x128.png"></div>
                    <div class="product-item-title"> {{ product.name }}</div>
                    <div class="product-item-description">{{ product.description }} </div>
                </div>
            </a>
        {% endfor %}
        </div>
    </section>
    <section class="home-recommend-features">
        <ul class="intro-feature-list">
            {% for feature in intro_feature_list %}
            <li class="intro-feature-wrap">
                <div class="intro-feature">
                    <div class="intro-feature-icon">
                        <i class="{{ feature.icon }}"></i>
                    </div>
                    {% if feature.link %}
                    <a href="{{ feature.link }}" class="intro-feature-link">
                        <h3 class="intro-feature-title">
                            {{ feature.name }}
                        </h3>
                    </a>    
                    {% else %}
                    <h3 class="intro-feature-title">
                        {{ feature.name }}
                    </h3>
                    {% endif %}
                    <p class="intro-feature-desc"> {{ feature.description }} </p>
                </div>
            </li>
            {% endfor %}
        </ul>
    </section>
    <section class="home-recommend-services">
    </section>
    <section class="home-recommend-reviews">
    </section>
</div>

