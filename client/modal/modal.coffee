Template.modal.helpers
  "Channels": -> Channels.find()

Template.modal.events
  'submit #channelform': (event) ->
    event.preventDefault()

    channelValue = event.target.channel.value
    channelRemoveSpace = channelValue.replace(/ /g, '_')
    channelLowercase = channelRemoveSpace.toLowerCase()
    channel = "#" + channelLowercase

    if event.target.channel.value is ""
      # nothing
    else if !Meteor.user()
      $('#newChannels').modal 'hide'
      $('#alert').modal 'show'
    else
      Meteor.call "newChannel", channel
      $('#newChannels').modal 'hide'
      event.target.value = ""


  'submit #register': (event) ->
    event.preventDefault()

    username = event.target.username.value
    email = event.target.email.value
    password = event.target.password.value

    clear = ->
      event.target.username.value = ""
      event.target.email.value = ""
      event.target.password.value = ""

    Accounts.createUser
      username: username
      email: email
      password: password
      , (error) ->
        if error
          alert(error.reason)
          clear()
        else
          clear()
          Meteor.logout ->
            $('#register_modal').modal "hide"
            $('#login_modal').modal "show"


  'submit #login': (event) ->
    event.preventDefault()

    input = event.target.loginInput.value
    password = event.target.password.value

    clear = ->
      event.target.loginInput.value = ""
      event.target.password.value = ""

    Meteor.loginWithPassword input, password, (error) ->
      if error
        clear()
        alert error.reason
      else
        clear()
        $('#login_modal').modal "hide"
        Router.go "/#general"


  'click .glyphicon-remove': ->

    if !Meteor.user()
      $('#deleteChannels').modal "hide"
      $('#alert').modal "show"
    else
      Meteor.call "deleteChannel", this._id
