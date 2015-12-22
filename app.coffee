'use strict'

myApp = angular.module('myApp', [ 'ui.router' ])

myApp.config ($stateProvider, $urlRouterProvider, $locationProvider) ->
  $stateProvider
  .state 'home',
    url: '/'
    templateUrl: 'views/home.html'
  .state 'spot',
    url: '/spot/:spot'
    templateUrl: 'views/spot.html'
    controller: 'SpotCtrl'
  .state 'feedback',
    url: '/feedback'
    templateUrl: 'views/feedback.html'
  $urlRouterProvider.otherwise '/'
  return

myApp.controller 'SpotCtrl', ($scope, $http, SPOT_DATA, $stateParams) ->
  $scope.loaded = false
  $scope.prevs = {}
  $scope.spotname = SPOT_DATA[$stateParams.spot].name
  $http
    method: 'GET'
    url: SPOT_DATA[$stateParams.spot]['api_url']
  .then ((response) ->
    $scope.prevs = response.data
    $scope.loaded = true
    return
  ), (response) ->
    console.log response.status
    return

myApp.constant 'SPOT_DATA',
  'le-touquet':
    'api_url': 'https://api.import.io/store/connector/b64690c3-60c9-4e1b-84f7-6203e157ef74/_query?input=webpage/url:http%3A%2F%2Fwww.meteociel.fr%2Fprevisions-wrf-1h%2F33632%2Fle_touquet_paris_plage.htm&&_apikey=03f366f40edd4f2b8fe9ba8dab29c1153466c48ec9ad6372ac86a2583e82a9fbc0e293cd19896c165df279f29596caa96ac73a633523e4d82982a07d3962e7ad794a3b616bcdbd515c2138a42652aaaa'
    'name': 'Le Touquet'
  'le-crotoy':
    'api_url': 'https://api.import.io/store/connector/b64690c3-60c9-4e1b-84f7-6203e157ef74/_query?input=webpage/url:http%3A%2F%2Fwww.meteociel.fr%2Fprevisions-wrf-1h%2F33632%2Fle_touquet_paris_plage.htm&&_apikey=03f366f40edd4f2b8fe9ba8dab29c1153466c48ec9ad6372ac86a2583e82a9fbc0e293cd19896c165df279f29596caa96ac73a633523e4d82982a07d3962e7ad794a3b616bcdbd515c2138a42652aaaa'
    'name': 'Le Crotoy'
  'cayeux':
    'api_url': 'https://api.import.io/store/connector/b64690c3-60c9-4e1b-84f7-6203e157ef74/_query?input=webpage/url:http%3A%2F%2Fwww.meteociel.fr%2Fprevisions-wrf-1h%2F33632%2Fle_touquet_paris_plage.htm&&_apikey=03f366f40edd4f2b8fe9ba8dab29c1153466c48ec9ad6372ac86a2583e82a9fbc0e293cd19896c165df279f29596caa96ac73a633523e4d82982a07d3962e7ad794a3b616bcdbd515c2138a42652aaaa'
    'name': 'Cayeux-sur-mer'
