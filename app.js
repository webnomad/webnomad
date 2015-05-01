Router.route('/', function () {
  this.render('home');
  this.name = 'home'
});

Router.route('/locations', function () {
  this.render('locations');
  this.name = 'locations'
});
