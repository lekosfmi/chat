Router.configure
  layoutTemplate: 'layout'


Router.route '/:channel', ->
  Session.set 'channel', this.params.channel
  @render 'messages'

Router.route '/', -> @render 'layout'
