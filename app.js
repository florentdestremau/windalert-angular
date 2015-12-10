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

myApp.controller('HomeCtrl', function ($scope) {
  console.log('Hello home');
})

myApp.controller('MainCtrl', function ($scope) {
  console.log('Hello main');
})
