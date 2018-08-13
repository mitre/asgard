---
layout: post
date: 2018-07-06
github: https://gitlab.mitre.org/inspec/cis_apache_tomcat_benchmark_8.git
category: profile


# inspec.yml
name: CIS_Apache_Tomacat_8_Benchmark
title: InSpec Profile
maintainer: The Authors
copyright: The Authors
copyright_email: you@example.com
license: Apache-2.0
summary: An InSpec Compliance Profile
version: 0.1.0
---

# Example InSpec Profile

This example shows the implementation of an InSpec profile.



# Configuration through attributes.yml
<table class="table">
  <thead class="thead">
  <tr>
    <th>Attribute</th>
    <th>Default Value</th>
  </tr>
  </thead>
  {% for attr in site.data.2018-07-06-cis_apache_tomacat_8_benchmark-attrs  %}
    <tr>
      <td>{{attr[0]}}</td>
      <td>{% for val in attr[1] %}
        {{val}}{% unless forloop.last %}, {% endunless %}
      {% endfor %}</td>
    </tr>
  {% endfor %}
</table>

