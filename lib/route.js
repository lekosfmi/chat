Router.configure({
  layoutTemplate: 'layout'
});
/*
Router.route('/:channel', function () {
	Session.set('channel', this.params.channel);
	this.render('messages');
});
*/
Router.route('/', function () {
	this.render('layout');
});
