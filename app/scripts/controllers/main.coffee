'use strict'

###*
 # @ngdoc function
 # @name flingApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the flingApp
###
angular.module 'flingApp'
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
