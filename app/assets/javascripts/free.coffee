# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
angular.module('Graffitistudio')
  .controller 'FreeCtrl', ($scope, $http) ->
      $scope.addUrl = ->
        $scope.success = ''
        $scope.errors = ''

        $http.post '/free/add-url',
          url: $scope.siteUrl
        .success (response) ->
          $scope.success = 'Ваш сайт успешно добавлен'
        .error (response) ->
          $scope.errors = response.errors
