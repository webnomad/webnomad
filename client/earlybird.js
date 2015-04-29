
Template.earlybird.events({
  'submit form': function(event) {
    event.preventDefault();
    var emailTag = document.querySelector('[name=email]');

    var inserted = Subscribers.insert({
      email: emailTag.value,
      date: new Date()
    });
    emailTag.value = "";
    Session.set('confirmation', true);
  },

  'focus input[type=email]': function(event) {
    Session.set('confirmation', false);
  }
});


Template.earlybird.helpers({
    confirmation: function() {
        return Session.get('confirmation');
    }
});
