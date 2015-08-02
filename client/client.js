window.addEventListener('load', function() {
  document.querySelector('body').className = Router.current().name;
});

geolocalize = function(callback) {
  navigator.geolocation.getCurrentPosition(
    function geolocateSuccess(position) {
      console.info('You were geolocated at', position.coords);
      callback(position.coords);
    },
    function geolocateError(err) {
      console.error("You were not geolocated", err);
    }
  );
};
