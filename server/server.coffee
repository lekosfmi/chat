Meteor.startup ->
  mail = 'smtp://lephankoby.meteor%40gmail.com:kobymeteor@smtp.gmail.com:465/'
  process.env.MAIL_URL = mail

Accounts.config
  sendVerificationEmail: true

Meteor.publish 'messages', (channel) -> Messages.find channel: channel

Meteor.publish "allUsernames", ->
  Meteor.users.find {}, fields: "username": 1, "services.github.username": 1


Meteor.publish 'channels', -> Channels.find()

Meteor.methods
  newMessage: (message, channel) ->
    message.timestamp = Date.now()
    message.user = Meteor.userId()
    Messages.insert
      text: message,
      channel: channel

  newChannel: (channel) -> Channels.insert name: channel

  deleteChannel: (channelId) -> Channels.remove _id: channelId
