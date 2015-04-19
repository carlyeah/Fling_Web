'use strict'

###*
 # @ngdoc function
 # @name flingApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the flingApp
###
angular.module 'flingApp'
  .controller 'AboutCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
