Template.locations.helpers({
  locations: function () {
    return Locations.find({});
  },

  locationToAttributes: function(loc) {
    var l = loc.hash.loc;
    if(!(l.coordinates && l.coordinates.length && l.name)) {
      return {};
    }
    return  {
      latitude: l.coordinates[0],
      longitude: l.coordinates[1],
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
