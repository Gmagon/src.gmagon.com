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
                            <th>Last 7days</th>
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
                            
                            <td class="on elevation1"><a href="{{ item.url }}">{{ item.name }} </a></td>
                            <td><i class="fa fa-apple fa-2x" aria-hidden="true"></i> {{ item.os }}</td>
                            <td class="on elevation1"><a href="{{ item.url }}">{{ item.size }}</a></td>
                            <td>{{ downloadObj.date }}</td>
                            <td><a href="{{ item.url }}"><i class="fa fa-download" aria-hidden="true"></i> {{ random_download_count(item.lastWeekDownloadsMin) }}</a></td>
                            </tr>
                            {% endfor %}

                            {% for item in downloadObj.windows  %}
                            <tr>
                            <td class="on elevation1"><a href="{{ item.url }}">{{ item.name }} </a></td>
                            <td>{{ item.os }}</td>
                            <td class="on elevation1"><a href="{{ item.url }}">{{ item.size }}</a></td>
                            <td>{{ downloadObj.date }}</td>
                            <td><a href="{{ item.url }}"><i class="fa fa-download" aria-hidden="true"></i> {{ random_download_count(item.lastWeekDownloadsMin) }}</a></td>
                            </tr>
                            {% endfor %}
                        {% endfor %}   
                        </tbody>
                </table>
                 
            </div>
        </div>
    </div>
</div>