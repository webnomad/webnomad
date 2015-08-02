Template.locationsAdd.rendered = function() {
  geolocalize(function(coords) {
    // Fill the form
    $('[name=lat]').val(coords.latitude);
    $('[name=lng]').val(coords.longitude);
  });
};

Template.locationsAdd.events({
  'click [type=cancel]': function(event) {
    Router.go('locations');
  },

  'click [type=submit]': function(event) {
    $('form').submit();
  },

  'submit': function(event) {
    event.preventDefault();
    Locations.insert({
      name: $('[name=name]').val(),
      wifi: parseInt($('[name=wifi]').val(), 10),
      power: $('[name=power]').val(),
      coordinates: [parseFloat($('[name=lat]').val()),
                    parseFloat($('[name=lng]').val())],
      creation_date: new Date()
    }, function(err, id) {
      if(!err) {
        Router.go('locations');
      }
    });
  }
});
