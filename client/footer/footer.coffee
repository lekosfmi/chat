Template.footer.helpers
  "username": -> Meteor.users().username

Template.footer.events
  'submit #newMessage': (event) ->
    event.preventDefault()

    message = event.target.message.value
    channel = Session.get 'channel'

    if Meteor.userId()
      Meteor.call 'newMessage', message, channel
      $('.input-box_text').val ""
    else
      $('#alert').modal 'show'
      $('.input-box_text').val ""

  "click #menu-toggle": (event) ->
    event.preventDefault()
    $("#wrapper, .footer, .btn-list").toggleClass "toggled"
