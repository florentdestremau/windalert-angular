'use strict';

var myApp = angular.module('myApp', ['ui.router']);

myApp.config(function($stateProvider, $urlRouterProvider, $locationProvider) {
  $urlRouterProvider.otherwise('/');
  $stateProvider
    .state('home', {
      url: '/',
      templateUrl: 'views/home.html',
      controller: 'HomeCtrl',
    });
});

myApp.controller('HomeCtrl', function ($scope, $http) {
  $scope.data = {};
  $scope.data_retrieved = false;
  $http({
    method: 'GET',
    url: 'https://api.import.io/store/connector/b64690c3-60c9-4e1b-84f7-6203e157ef74/_query?input=webpage/url:http%3A%2F%2Fwww.meteociel.fr%2Fprevisions-wrf-1h%2F33632%2Fle_touquet_paris_plage.htm&&_apikey=03f366f40edd4f2b8fe9ba8dab29c1153466c48ec9ad6372ac86a2583e82a9fbc0e293cd19896c165df279f29596caa96ac73a633523e4d82982a07d3962e7ad794a3b616bcdbd515c2138a42652aaaa'
  }).then(function successCallBack(response){
    $scope.data_retrieved = true;
    $scope.data = response.data;
  }, function errorCallback(response){
    console.log(response.status);
  });
})

myApp.controller('MainCtrl', function ($scope) {
  console.log('Hello main');
})
