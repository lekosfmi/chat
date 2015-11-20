Meteor.publish 'messages', (channel) -> Messages.find channel: channel

Meteor.publish "allUsernames", ->
  Meteor.users.find {}, fields: "username": 1, "services.github.username": 1

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
