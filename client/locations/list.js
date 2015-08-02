Template.locations.helpers({
  locations: function () {
    var locations = Locations.find({});
    console.log('locations', locations.fetch());
    return locations;
  },

  locationToAttributes: function(loc) {
    var l = loc.hash.loc;
    return  {
      latitude: l.coordinates.length && l.coordinates[0],
      longitude: l.coordinates.length && l.coordinates[1],
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
