

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

function loadMap(coords) {
  var map = new google.maps.Map(document.getElementById('map-canvas'), {
      center: coords,
      zoom: 14
  });

  this.locationsObserver = Locations.find().observe({
    added: function(location) {
      addMarker(location, map);
    }
  });
  Locations.find().forEach(function(location) {
    addMarker(location, map);
  });
}

Template.locations.rendered = function() {
  navigator.geolocation.getCurrentPosition(
    function geolocateSuccess(position) {
      var coords = {lat: position.coords.latitude, lng: position.coords.longitude};
      //var coords = {lat: Math.random()+41, lng: Math.random()+2};
      document.querySelector('[name=lat]').value = coords.lat;
      document.querySelector('[name=lng]').value = coords.lng;

      console.info('You were geolocated at', coords);
      loadMap(coords);
    },
    function geolocateError(err) {
      console.error(err);
    }
  );
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
