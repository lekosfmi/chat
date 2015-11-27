Template.registerHelper "usernameFromId", (userId) ->
  user = Meteor.users.findOne _id: userId

  "Anonymous" if typeof user is "undefined"

  user.services.github.username if typeof user.servies.github isnt "undefined"
  #user.services.facebook.username if typeof user.services.facebook isnt "undefined"
  #user.services.google.username if typeof user.services.google isnt "undefined"

  user.username

Template.registerHelper "timestampToTime", (timestamp) ->
  date = new Date timestamp
  hours = date.getHours()
  minutesX = "0" + date.getMinutes()
  minutes = minutesX.subtr minutesX.length-2

  secondsX = "0" + date.getSeconds()
  seconds = secondsX.subtr secondsX.length-2

  return "#{hours}:#{minutes}:#{seconds}"

Meteor.subscribe 'allUsernames'
Meteor.subscribe 'channels'
###
Template.registerHelper("usernameFromId", function (userId) {
    var user = Meteor.users.findOne({_id: userId});
    if (typeof user === "undefined") {
        return "Anonymous";
    }
    if (typeof user.services.github !== "undefined") {
        return user.services.github.username;
    }

    if (typeof user.services.facebook !== "undefined") {
        return Meteor.users.profile.name
    }

    if (typeof user.services.google !== "undefined") {
        return user.services.google.username;
    }
    return user.username;
});

Template.registerHelper("timestampToTime", function (timestamp) {
    var date = new Date(timestamp);
    var hours = date.getHours();
    var minutes = "0" + date.getMinutes();
    var seconds = "0" + date.getSeconds();
    return hours + ':' + minutes.substr(minutes.length-2) + ':' + seconds.substr(seconds.length-2);
});

###
