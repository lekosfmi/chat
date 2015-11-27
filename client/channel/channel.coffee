Meteor.startup -> Session.set 'channel', 'general'

Template.channel.helpers
  active: -> "active" if Session.get 'channel' is @name

Template.channel.events
  'click .channel': -> Session.set 'channel', @name
