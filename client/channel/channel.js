Meteor.startup(function() {
    Session.set('channel', 'general');
});

Template.channel.helpers({
    active: function () {
        if (Session.get('channel') === this.name) {
            return "active";
        } else {
            return "";
        }
    }
});

Template.channel.events({
    'click .channel': function (e) {
        Session.set('channel', this.name);
    }
});
