Router.configure
  layoutTemplate: 'layout'


Router.route '/:channel', ->
  Session.set 'channel', this.params.channel
  @subscribe 'messages'
  @subscribe 'allUsernames'
  @render 'messages'


Router.route '/', ->
  @subscribe 'channels'
  @subscribe 'messages'
  @redirect '/#general'
