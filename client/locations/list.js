Template.locations.helpers({
  locations: function () {
    var locations = Locations.find({});
    console.log('locations', location);
    return locations;
  },

  locationToAttributes: function(location) {
    var l = location.hash.location;
    return  {
      latitude: l.lat.toString(),
      longitude: l.lng.toString(),
      title: l.name
    };
  }
});

Template.locations.rendered = function() {
  geolocalize(function(coords) {
    // Move the map
    var map = $('#mapcanvas').get(0);
    map.zoom = 12;
    map.latitude = coords.latitude;
    map.longitude = coords.longitude;
  })
};
