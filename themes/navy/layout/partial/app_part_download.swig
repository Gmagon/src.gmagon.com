<div class="article-content" itemprop="articleBody">
    <div class="app-store-download container">
        <div class="app-store-download-wrap">
            <div class="app-download-main">
                <div>
                    <p>
                    For detailed info on <b>what's new</b>, read the <a href="./changelog.html">release notes</a>
                    </p>
                </div>
                {% for downloadObj in page.downloads %}
                <h4>Ver {{ downloadObj.version }}</h4>
                <table class="app-download-table">
                        <thead>
                        <tr>
                            <th>Release name</th>
                            <th>OS</th>
                            <th>File size</th>
                            <th>Release date</th>
                            {# <th>Download count</th> #}
                        </tr>
                        </thead>
                        <tbody>
                        
                            {% for item in downloadObj.macos  %}
                            <tr>
                            <td><a href="{{ item.url }}">{{ item.name }} </a></td>
                            <td>macOS</td>
                            <td><a href="{{ item.url }}">{{ item.size }}</a></td>
                            <td>{{ downloadObj.date }}</td>
                            {# <td>9999</td> #}
                            </tr>
                            {% endfor %}

                            {% for item in downloadObj.windows  %}
                            <tr>
                            <td>{{ item.name }}</td>
                            <td>windows</td>
                            <td>{{ item.size }}</td>
                            <td>{{ downloadObj.date }}</td>
                            {# <td>9999</td> #}
                            </tr>
                            {% endfor %}
                           
                        </tbody>
                </table>
                {% endfor %} 
            </div>
        </div>
    </div>
</div>