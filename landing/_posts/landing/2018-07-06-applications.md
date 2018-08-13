---
title: Applications
layout: minton
permalink: /apps
category: landing
---

<section class="section content" id="apps-list">
  <div class="container">
    <div class="row">
      <div class="col-sm-12 text-center">
        <h2 class="title">Application Documentation</h2>
      </div>
    </div>

    {% assign rows = site.categories.readme | size | divided_by: 2.0 | ceil %}
    {% for i in (1..rows) %}
      {% assign offset = forloop.index0 | times: 2 %}
      <div class="card-deck mt-4">
      {% for post in site.categories.readme limit: 2 offset:offset %}
        <div class="card">
          <div class="card-body">
            <a href="{{ post.url | relative_url }}.html">
              <h4 class="card-title">{{ post.title }}</h4>
            </a>
            <p class="card-text">{{ post.desc }}</p>
          </div>
        </div>
      {% endfor %}
      </div>
    {% endfor %}
  </div>
</section>
