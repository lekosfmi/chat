Template.registerHelper "usernameFromId", (userId) ->
  user = Meteor.users.findOne _id: userId

  if typeof user is "undefined" then "Anonymous" else user.username

  #if typeof user.services.facebook isnt "undefined" then user.profile.name

#  if typeof user isnt "undefined" then user.profile.name



Template.registerHelper "timestampToTime", (timestamp) ->
  date = new Date timestamp
  hours = date.getHours()
  minutesX = "0" + date.getMinutes()
  minutes = minutesX.substr minutesX.length-2

  secondsX = "0" + date.getSeconds()
  seconds = secondsX.substr secondsX.length-2

  "#{hours}:#{minutes}:#{seconds}"
