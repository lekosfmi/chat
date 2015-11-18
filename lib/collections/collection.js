Messages = new Mongo.Collection("messages");

Messages.allow({
  insert: function (userId, doc) {
    return (userId && doc.user === userId);
  }
});

Channels = new Mongo.Collection("channels");
