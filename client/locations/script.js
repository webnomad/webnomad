function addMarker(location, map) {
  var coordinates = location.coordinates;
    var marker = new google.maps.Marker({
      position: {lat: coordinates[0], lng: coordinates[1]},
      map: map,
      title: location.name
    });

    infowindow = new google.maps.InfoWindow({
      content: location.name
    });

    google.maps.event.addListener(marker, 'click', function() {
      infowindow.open(map, marker);
    });
}

Template.locations.destroyed = function() {
    this.locationsObserver.stop();
}

Template.locations.rendered = function() {
    var mapOptions = {
      center: {
        lat: 38.5977691,
        lng: -90.2497072
      },
      zoom: 8
    };
    var map = new google.maps.Map(document.querySelector('.map'), mapOptions);

    this.locationsObserver = Locations.find().observe({
      added: function(location) {
        addMarker(location, map);
      }
    });
    Locations.find().forEach(function(location) {
      addMarker(location, map);
    });

    navigator.geolocation.getCurrentPosition(function geolocationSucess(position) {
      //var coords = {lat: position.coords.latitude, lng: position.coords.longitude};
      var coords = {lat: Math.random()+41, lng: Math.random()+2};
      document.querySelector('[name=lat]').value = coords.lat;
      document.querySelector('[name=lng]').value = coords.lng;
      map.setCenter(coords);
    },
    function geolocationError(err) {
      console.error(err);
    });
};

Template.locations.events({
  'click [name=add_new]': function(e) {
    e.preventDefault();
    var location = Locations.insert({
      name: document.querySelector('[name=name]').value,
      wifi: parseInt(document.querySelector('[name=wifi]').value, 10),
      power: document.querySelector('[name=power]').value,
      coordinates: [parseFloat(document.querySelector('[name=lat]').value),
                    parseFloat(document.querySelector('[name=lng]').value)],
      creation_date: new Date(),
    });
  }
});
