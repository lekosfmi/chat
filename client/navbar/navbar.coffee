Template.navbar.helpers
  currentChannel: -> Session.get 'channel'
  currentUser: -> Meteor.user()

Template.navbar.events
  "click .logout": -> Meteor.logout()
