#config
Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  notFoundTemplate: 'notfound'

Router.map ->
  @.route '/',
    template: 'home'

  @.route '/weather',
    template: 'weather'

