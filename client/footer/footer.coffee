Template.footer.helpers
  "username": -> Meteor.users().username

  "Channels": -> Channels.find({})

Template.footer.events
  'submit #newMessage': (event) ->
    event.preventDefault()

    message = event.target.message.value
    channel = Session.get 'channel'

    if Meteor.user()
      Meteor.call 'newMessage', message, channel
      $('.input-box_text').val ""
    else
      $('#alert').modal 'show'
      $('.input-box_text').val ""


  'submit #channelform': (event) ->
    event.preventDefault()

    channelValue = event.target.channel.value
    channelRemoveSpace = channelValue.replace(/ /g, '_')
    channelLowercase = channelRemoveSpace.toLowerCase()
    channel = "#" + channelLowercase

    if event.target.channel.value is ""
      alert "All Fields Are required"
    else
      Meteor.call "newChannel", channel
      $('#newChannels').modal 'hide'
      event.target.value = ""

  'click .glyphicon-remove': -> Meteor.call "deleteChannel", this._id

  "click #menu-toggle": (event) ->
    event.preventDefault()
    $("#wrapper, .footer, .btn-list").toggleClass "toggled"
