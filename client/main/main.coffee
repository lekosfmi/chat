Template.registerHelper "usernameFromId", (userId) ->
  user = Meteor.users.findOne _id: userId

  if user? then user.username else "Anonymous"

  #user.services.github.username if user.services.github?
  #user.services.facebook.username if typeof user.services.facebook isnt "undefined"
  #user.services.google.username if typeof user.services.google isnt "undefined"



Template.registerHelper "timestampToTime", (timestamp) ->
  date = new Date timestamp
  hours = date.getHours()
  minutesX = "0" + date.getMinutes()
  minutes = minutesX.substr minutesX.length-2

  secondsX = "0" + date.getSeconds()
  seconds = secondsX.substr secondsX.length-2

  "#{hours}:#{minutes}:#{seconds}"
