Meteor.startup(function() {
  process.env.MAIL_URL = 'smtp://lephankoby.meteor%40gmail.com:kobymeteor@smtp.gmail.com:465/';
});

Accounts.config({
  sendVerificationEmail: true
});

Meteor.publish('messages', function (channel) {
    return Messages.find({channel: channel});
});

Meteor.publish("allUsernames", function () {
  return Meteor.users.find({}, {fields: {
    "username": 1,
    "services.github.username": 1
  }});
});

Meteor.publish('channels', function () {
    return Channels.find();
});

Meteor.methods({
  newMessage: function (message) {
    message.timestamp = Date.now();
    message.user = Meteor.userId();
    Messages.insert(message);
  },
  newChannel: function(channel) {
    Channels.insert({
      name: channel
    });
  },
  deleteChannel: function(channelId) {
    Channels.remove({ _id: channelId });
  }
});
