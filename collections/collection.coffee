@Messages = new Mongo.Collection "messages"
@Channels = new Mongo.Collection "channels"

Messages.allow
  insert: (userId, doc) -> userId and doc.user is userId
