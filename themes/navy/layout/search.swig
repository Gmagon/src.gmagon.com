<div class="class-content-wrap">
    <div class="inner width-100per">
        <div class="inner-wrap fill-bunting font-white">
            <div class="searchbox-container">
                <div class="input-group">
                    <input id="searchbox-q" type="text" class="form-control"><span class="input-group-btn"></span>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="class-content-wrap">
  <div class="inner">
        <section class="searchbox-display-section">
            {#
            <aside>
                <h5><i class="fa fa-chevron-right"></i> Genres</h5>
                <div id="genres"></div>
                <h5><i class="fa fa-chevron-right"></i> Ratings</h5>
                <div id="ratings"></div>
            </aside>
            #}
            <article>
                <div id="stats" class="text-right text-muted"></div>
                <hr>
                <div id="hits"></div>
                <div id="pagination" class="text-center"></div>
            </article>
        </section>
  </div>
</div>

<!-- Algolia -->
{{ partial('partial/algolia') }}

<div class="class-content-wrap">
  <div class="inner">
    <div class="inner-wrap landing-bunting">
      <div class="intro-sub-content-wrap">
      </div>
    </div>
  </div>
</div>