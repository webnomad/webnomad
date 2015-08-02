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
