<div class="article-content" itemprop="articleBody">
    <div class="app-store-download container">
        <div class="app-store-download-wrap">
            <div class="app-download-main">
                <div>
                    <p>
                    For detailed info on <b>what's new</b>, read the <a href="./changelog.html">release notes</a>
                    </p>
                </div>
                
                <table class="app-download-table">
                        <thead>
                        <tr>
                            <th>Version</th>
                            <th>Release name</th>
                            <th>OS</th>
                            <th>File size</th>
                            <th>Release date</th>
                            {# <th>Download count</th> #}
                        </tr>
                        </thead>
                        <tbody>
                        {% for downloadObj in page.downloads %}
                        
                            {% for i, item in downloadObj.macos  %}
                            <tr>
                            {% if i == 0 %}
                            <td class="app-download-version">Ver {{ downloadObj.version }}</td>
                            {% else %}
                            <td></td>
                            {% endif %}
                            
                            <td><a href="{{ item.url }}">{{ item.name }} </a></td>
                            <td><i class="fa fa-apple fa-2x" aria-hidden="true"></i> {{ item.os }}</td>
                            <td><a href="{{ item.url }}">{{ item.size }}</a></td>
                            <td>{{ downloadObj.date }}</td>
                            {# <td>9999</td> #}
                            </tr>
                            {% endfor %}

                            {% for item in downloadObj.windows  %}
                            <tr>
                            <td>{{ item.name }}</td>
                            <td>{{ item.os }}</td>
                            <td>{{ item.size }}</td>
                            <td>{{ downloadObj.date }}</td>
                            {# <td>9999</td> #}
                            </tr>
                            {% endfor %}
                        {% endfor %}   
                        </tbody>
                </table>
                 
            </div>
        </div>
    </div>
</div>