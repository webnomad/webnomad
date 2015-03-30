{% extends "layout.html" %}


{% block extra_css %}
    <style>
    #map {
        width: 100%;
        height: 500px;
    }
    </style>
{% endblock %}

{% block extra_js %}
    <!--<script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCiKD-uSteYf-XzBi_bVQD5781YXOfnkSY">
    </script>-->
    <script type="text/javascript">
      function initialize() {
        var mapOptions = {
          center: {lat: 38.5977691, lng: -90.2497072},
          zoom: 12
        };
        var map = new google.maps.Map(document.getElementById('map'),
            mapOptions);
        var marker = new google.maps.Marker({
            position: {lat: 38.5977691, lng: -90.2497072},
            map: map,
            title: 'Coffee 1'
        });
        var infowindow = new google.maps.InfoWindow({
            content: "<h1>Coffee 1</h1><p>Great place</p>"
        });
        google.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map, marker);
        });
      }
      //google.maps.event.addDomListener(window, 'load', initialize);
    </script>
{% endblock %}

{% block main %}
<section id="find">
    <div id="map">
        <h2>List of available places around you</h2>
        <ul>
            <li each={spots}>
                <h3>{title}</h3>
                <img src="{image}" alt="Night bar" />
                <p>wifi: {wifi}, power: {power}, outdoor: {outdoor}, tranquility: {tranquility}/5</p>
            </li>
        </ul>
    </div>
</section>

<section id="addlocation">
    <ui-form method="post">
        <form-string name="name" label="Location name"></form-string>
        <form-latlng names="lat,lng" labels="Latitude,Longitude" auto="true"></form-latlng>
        <form-rate name="wifi" range="1,5" label="Wifi quality"></form-rate>
        <form-rate name="tranquility" range="1,5" label="Tranquility"></form-rate>
        <form-check name="power" label="Power"></form-check>
        <form-check name="outdoor" label="Outdoor"></form-check>
        <form-submit label="Add"></form-submit>
    </ui-form>
</section>
{% endblock %}
