window.addEventListener('load', function() {
  document.querySelector('body').className = Router.current().name;
});
