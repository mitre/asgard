---
layout: post
date: 2018-07-06
github: https://gitlab.mitre.org/inspec/mitre-cis-linux-baseline.git
category: profile


# inspec.yml
name: mitre-cis-linux-baseline
title: InSpec Profile
maintainer: The Authors
copyright: The Authors
copyright_email: you@example.com
license: All Rights Reserved
summary: An InSpec Compliance Profile
version: 0.1.0
---

# Example InSpec Profile

This example shows the implementation of an InSpec [profile](../../docs/profiles.rst).



# Configuration through attributes.yml
<table class="table">
  <thead class="thead">
  <tr>
    <th>Attribute</th>
    <th>Default Value</th>
  </tr>
  </thead>
  {% for attr in site.data.2018-07-06-mitre-cis-linux-baseline-attrs  %}
    <tr>
      <td>{{attr[0]}}</td>
      <td>{% for val in attr[1] %}
        {{val}}{% unless forloop.last %}, {% endunless %}
      {% endfor %}</td>
    </tr>
  {% endfor %}
</table>

