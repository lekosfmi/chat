###
Meteor.startup ->
  Channels.insert name: "#general" if Channels.find().count() is 0
###
