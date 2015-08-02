Router.route('/', function () {
  this.render('home');
  this.name = 'home'
});

Router.route('/locations', function () {
  this.render('locations');
  this.name = 'locations'
});

Router.route('/locations/add', {name: 'locations.add'}, function () {
  this.render('locationsAdd');
  this.name = 'locations-add'
});
