Router.configure
  layoutTemplate: 'layout'


Router.route '/:channel', ->
  Session.set 'channel', this.params.channel
  @subscribe 'channels'
  @subscribe 'messages'
  @subscribe 'allUsernames'


Router.route '/', ->
  @subscribe 'channels'
  @subscribe 'messages'
  @subscribe 'allUsernames'
