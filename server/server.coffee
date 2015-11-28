Meteor.publish 'messages', (channel) ->
  Messages.find channel: channel

Meteor.publish "allUsernames", ->
  Meteor.users.find {}, fields: "username"
  Meteor.users.find {}, fields: "name"

Meteor.publish 'channels', -> Channels.find()

Meteor.methods
  newMessage: (message, channel) ->

    timestamp = Date.now()
    user = Meteor.userId()

    Messages.insert
      text: message,
      channel: channel
      timestamp: timestamp
      user: user

  newChannel: (channel) -> Channels.insert name: channel

  deleteChannel: (channelId) -> Channels.remove _id: channelId


Meteor.startup ->

  Accounts.loginServiceConfiguration.remove
    service: "facebook"

  Accounts.loginServiceConfiguration.insert
    service: "facebook"
    appId: "916134298481275"
    secret: "5e98c633eb67780f52b2c240cf3e187e"
