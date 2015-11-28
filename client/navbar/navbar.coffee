Template.navbar.helpers
  currentChannel: -> Session.get 'channel'
  currentUser: -> Meteor.user()

Template.navbar.events
  "click .logout": -> Meteor.logout()

  "click .navbar-toggle": ->
    $('.navbar-toggle').toggleClass "toggle-active"

  "click .facebook-login": ->
    Meteor.loginWithFacebook()
