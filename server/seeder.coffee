
Meteor.startup ->
  if Channels.find().count() is 0
    Channels.insert name: "#general"
    Channels.insert name: "#random"
