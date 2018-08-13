---
title: MITRE InSPEC
layout: minton
---
<!-- HOME -->
<section class="home bg-img-1 parallax" data-stellar-background-ratio="0.5">
   <div class="bg-overlay"></div>
   <div class="container">
      <div class="row">
         <div class="col-sm-12">
            <div class="home-wrapper text-center">
               <h1 class="animated fadeInDown wow" data-wow-delay=".1s">The MITRE Suite for InSpec Development</h1>
               <p class="animated fadeInDown wow" data-wow-delay=".2s">View profiles, compare evaluations, or edit and deploy profiles. </p>
               <!-- <a href="" class="btn btn-primary btn-rounded w-lg animated fadeInDown wow" data-wow-delay=".4s">Check it out</a> -->
               <div class="clearfix"></div>

            </div>
         </div>
      </div>
   </div>
</section>
<!-- END HOME -->



<!-- SERVICES -->
<section class="section" id="Vulcan">
   <div class="container">

      <div class="row">
         <div class="col-sm-12 text-center">
            <h2 class="title zoomIn animated wow" data-wow-delay=".1s">Vulcan</h2>
            <p class="sub-title zoomIn animated wow" data-wow-delay=".2s">A development kit for InSpec profiles which exports to a variety file formats</p>
         </div>
      </div>

      <div class="row">
         <div class="col-md-4">
            <div class="service-item animated fadeInLeft wow" data-wow-delay=".1s">
               <i class=" ti-ruler"></i>
               <div class="service-detail">
                  <h4>View Security Specifications</h4>
                  <p>Upload and view SRGs and STIGs within the Vulcan framework.</p>
               </div>
               <!-- /service-detail -->
            </div>
            <!-- /service-item -->
         </div>
         <!-- /col -->

         <div class="col-md-4">
            <div class="service-item animated fadeInDown wow" data-wow-delay=".3s">
               <i class=" ti-pencil-alt"></i>
               <div class="service-detail">
                  <h4>Design STIG Verifiers</h4>
                  <p>Develop and run InSpec profiles directly from Vulcan.</p>
               </div>
               <!-- /service-detail -->
            </div>
            <!-- /service-item -->
         </div>
         <!-- /col -->

         <div class="col-md-4">
            <div class="service-item animated fadeInRight wow" data-wow-delay=".5s">
               <i class=" ti-cloud-down"></i>
               <div class="service-detail">
                  <h4>Export Developed Specifications</h4>
                  <p>Export newly developed profiles as the XCCDF, STIG, or InSpec formats.</p>
               </div>
               <!-- /service-detail -->
            </div>
            <!-- /service-item -->
         </div>
         <!-- /col -->
      </div>
      <!--end row -->

   </div>
</section>
<!-- END SERVICES -->


<!-- HOME -->
<section class="fun-facts bg-img-heim parallax" data-stellar-background-ratio="0.5">
   <div class="bg-overlay"></div>
   <div class="container">

      <div class="row text-center">
         <div class="col-sm-12">
            <div class="home-wrapper text-center">
               <h1 class="animated fadeInDown wow" data-wow-delay=".1s">Utilize MITRE Heimdall for online STIG viewing</h1>
               <p class="animated fadeInDown wow" data-wow-delay=".1s">Browser based analysis and comparison of the findings in STIG evaluations</p>
               <a href="{{site.url}}{{site.heimdall2}}" class="btn btn-primary btn-rounded w-lg animated fadeInDown wow" data-wow-delay=".4s">Check it out</a>
               <div class="clearfix"></div>

            </div>
         </div>
      </div>
   </div>
</section>

<!-- HEIMDAL DESC -->
<section class="section bg-gray" id="features">
   <div class="container">

      <div class="row">
         <div class="col-sm-6">
            <div class="col-sm-6 text-center">
               <img src="{{ "assets/images/logo.png " | relative_url }}" class="img-fluid">
            </div>
            <div class="feature-detail">
               <h2 class="title fadeIn animated wow" data-wow-delay=".1s"></h2>
               <p class="sub fadeIn animated wow" data-wow-delay=".2s">Review Compliance with Heimdall</p>

               <ul class="list-unstyled">
                  <li>
                     <i class=" ti-arrow-circle-right"></i> Visualize STIG coverage from an InSpec evaluation.
                  </li>
                  <li>
                     <i class=" ti-arrow-circle-right"></i> Compare InSpec evaluations graphically and textually.
                  </li>
                  <li>
                     <i class=" ti-arrow-circle-right"></i> Filter out controls which have not changed between evaluations.
                  </li>

               </ul>

            </div>
         </div>

         <div class="col-sm-6 text-center">
            <img src="{{ "assets/images/heimdall-graph-compare.png " | relative_url }}" class="img-fluid">
         </div>


      </div>
   </div>
</section>
<!-- HEIMDALL DESC -->


<!-- DOCS -->
<section class="section " id="README">
  <div class="container">
    <div class="row">
      <div class="col-sm-12 text-center">
        <h2 class="title">Official Documentation</h2>
      </div>
    </div>
    {% assign rows = site.categories.readme | size | divided_by: 2.0 | ceil %}
    {% for i in (1..rows) %}
      {% assign offset = forloop.index0 | times: 2 %}
      <div class="card-deck mt-4">
        {% for post in site.categories.readme limit: 2 offset:offset %}
        <div class="card">
          <div class="card-body">
            <a href="{{ post.url | relative_url}}.html">
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

<!-- END DOCS -->

<!-- PROFILES -->

<section class="section bg-gray" id="profiles">
  <div class="container">
    <div class="row">
      <div class="col-sm-12 text-center">
        <h2 class="title">InSpec Profiles</h2>
      </div>
    </div>

    <table class="table">
      <thead class="thead-light">
    	  <tr>
          <th>Profile Name</th>
          <th>Summary</th>
          <th>License</th>
    	    <th>Maintainer</th>
          <th>Git Source URL</th>
        </tr>
      </thead>
      <tbody >
        {% for profile in site.categories.profile %}
          <tr>
            <td>
              <a href="{{ profile.url | relative_url }}">{{ profile.title }}</a>
            </td>
            <td>{{ profile.summary }}</td>
            <td>{{ profile.license }}</td>
            <td>
              <a href="mailto:{{ profile.copyright_email }}">{{ profile.maintainer }}</a>
            </td>
				<td><a href="{{ profile.github }}">{{profile.name}}</a></td>
          </tr>
        {% endfor %}
      </tbody>

    </table>
  </div>
</section>
<!-- END PROFIES -->
