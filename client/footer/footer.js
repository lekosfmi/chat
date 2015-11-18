Template.footer.helpers({
  "username": function() {
    return Meteor.users().username;
  }
});
Template.footer.events({
  'keypress input': function(e) {
    var inputVal = $('.input-box_text').val();
    if(!!inputVal) {
      var charCode = (typeof e.which == "number") ? e.which : e.keyCode;
      if (charCode == 13) {
        e.stopPropagation();

        Meteor.call('newMessage', {
            text: $('.input-box_text').val(),
            channel: Session.get('channel')
        });

        $('.input-box_text').val("");
        return false;
     }
    }
  },
  'submit #channelform': function(event) {
    event.preventDefault();
    var channel = event.target.channel.value;

    Meteor.call("newChannel", channel);
  }
});
