Template.messages.helpers({
  messages: function() {
    return Messages.find({});
  }
});

Template.messages.rendered = function() {
  var self = this;
  self.autorun(function() {
    self.subscribe('messages', Session.get('channel'));
  });
};
