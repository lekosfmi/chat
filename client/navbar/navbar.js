Template.navbar.helpers({
  currentChannel: function() {
    return Session.get('channel');
  }
})

Template.navbar.events({
  "click #menu-toggle": function(event) {
    event.preventDefault();
    $("#wrapper").toggleClass("toggled");
    $(".footer").toggleClass("toggled");

    console.log("Toggle");
  }
})
