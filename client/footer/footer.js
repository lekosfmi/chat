Template.footer.helpers({
  "username": function() {
    return Meteor.users().username;
  },
  "Channels": function() {
    return Channels.find({});
  }
});
Template.footer.events({
  'keypress input': function(e) {
    var inputVal = $('.input-box_text').val();
    if(!!inputVal) {
      var charCode = (typeof e.which == "number") ? e.which : e.keyCode;
      if (charCode == 13) {
        e.stopPropagation();

        if(!Meteor.user()) {
          $('#alert').modal('show');
          $('.input-box_text').val("");
        } else {
          Meteor.call('newMessage', {
              text: $('.input-box_text').val(),
              channel: Session.get('channel')
          });
          $('.input-box_text').val("");
        }
        return false;
     }
    }
  },
  'submit #channelform': function(event) {
    event.preventDefault();

    var channelValue = event.target.channel.value;
    var channelRemoveSpace = channelValue.replace(/ /g, '_');
    var channelLowercase = channelRemoveSpace.toLowerCase();
    var channel = "#" + channelLowercase;

    if (event.target.channel.value == "") {
      alert("All Fields Are required");
    } else {
      Meteor.call("newChannel", channel);
      $('#newChannels').modal('hide');
      event.target.value = "";
    }

  },
  'click .glyphicon-remove': function() {
    Meteor.call("deleteChannel", this._id);
  }
});
