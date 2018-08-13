---
layout: post
date: 2018-07-06
github: https://gitlab.mitre.org/inspec/cis-docker-ce-profile.git
category: profile


# inspec.yml
name: cis-docker-ce-profile
title: CIS Docker Community Edition
maintainer: MITRE InSpec Team
copyright: 
copyright_email: inspec_support@mitre.org
license: Apache-2.0
summary: The CIS Docker Community Edition Benchmark v1.1.0 InSpec profile.
version: 1.1.0
---

# cis-docker-community-edition-profile

CIS Docker Community Edition Benchmark InSpec Profile



# Configuration through attributes.yml
<table class="table">
  <thead class="thead">
  <tr>
    <th>Attribute</th>
    <th>Default Value</th>
  </tr>
  </thead>
  {% for attr in site.data.2018-07-06-cis-docker-ce-profile-attrs  %}
    <tr>
      <td>{{attr[0]}}</td>
      <td>{% for val in attr[1] %}
        {{val}}{% unless forloop.last %}, {% endunless %}
      {% endfor %}</td>
    </tr>
  {% endfor %}
</table>

