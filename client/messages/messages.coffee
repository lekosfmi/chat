Template.messages.helpers
  messages: -> Messages.find()

Template.messages.rendered = ->
  self = this
  self.autorun -> self.subscribe 'messages', Session.get 'channel'
