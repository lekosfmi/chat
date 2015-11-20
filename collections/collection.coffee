@Messages = new Mongo.Collection "messages"

Messages.allow
  insert: (userId, doc) -> userId and doc.user is userId

@Channels = new Mongo.Collection "channels"
