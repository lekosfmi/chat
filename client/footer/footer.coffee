Template.footer.helpers
  "username": -> Meteor.users().username

Template.footer.events
  'submit #newMessage': (event) ->
    event.preventDefault()

    message = event.target.message.value
    channel = Session.get 'channel'

    clear = ->
      $('.input-box_text').val ""
      $('.input-box_text').attr('placeholder', "")

    if event.target.message.value is ""
      $('.input-box_text').attr('placeholder', "You haven't type anything! >.<")
    else if !Meteor.userId()
      $('#alert').modal 'show'
      clear()
    else
      Meteor.call 'newMessage', message, channel
      clear()


  "click #menu-toggle": (event) ->
    event.preventDefault()
    $("#wrapper, .footer, .btn-list").toggleClass "toggled"
    $('#menu-toggle').toggleClass "toggle-active"
