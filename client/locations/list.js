/*

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
*/

Template.locations.rendered = function() {
  navigator.geolocation.getCurrentPosition(
    function geolocateSuccess(position) {
      var coords = {lat: position.coords.latitude, lng: position.coords.longitude};
      console.info('You were geolocated at', coords);
      // Fill the form
      $('[name=lat]').val(coords.lat);
      $('[name=lng]').val(coords.lng);
      // Move the map
      $('#mapcanvas').get(0).latitude = coords.lat;
      $('#mapcanvas').get(0).longitude = coords.lng;
    },
    function geolocateError(err) {
      console.error("You were not geolocated", err);
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
