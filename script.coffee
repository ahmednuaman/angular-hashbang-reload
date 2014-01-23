class AService
  constructor: (@$http) ->

  fetch: () ->
    @$http.post 'data.json'

class AppController
  constructor: (@aService) ->
    aService.fetch()

routeConfig = ($routeProvider, $locationProvider) ->
  $routeProvider
    .when '/foo',
      template: '<div>woop!</div>'
      controller: 'AppController'

  $routeProvider.otherwise
      redirectTo: '/foo'

  $locationProvider.html5Mode true

angular.module 'app', ['ngRoute']

app = angular.module 'app'
app.config ['$routeProvider', '$locationProvider', routeConfig]
app.service 'aService', ['$http', AService]
app.controller 'AppController', ['aService', AppController]