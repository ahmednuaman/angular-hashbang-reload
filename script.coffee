class AService
  constructor: (@$http) ->

  fetch: () ->
    @$http.post 'data.json'

class AppController
  constructor: (@aService) ->
    debugger;
    aService.fetch()

routeConfig = ($provide, $routeProvider, $locationProvider) ->
  $provide.decorator '$sniffer', ['$delegate', ($delegate) ->
    $delegate.history = false
    $delegate
  ]

  $routeProvider
    .when '/foo',
      template: '<div>woop!</div>'
      controller: 'AppController'

  $routeProvider.otherwise
      redirectTo: '/foo'

  $locationProvider.html5Mode true

angular.module 'app', ['ngRoute']

app = angular.module 'app'
app.config ['$provide', '$routeProvider', '$locationProvider', routeConfig]
app.service 'aService', ['$http', AService]
app.controller 'AppController', ['aService', AppController]