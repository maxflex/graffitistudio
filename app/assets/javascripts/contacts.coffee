# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
angular.module('Graffitistudio')
.controller 'feedbackCtrl', ($scope, $http) ->
  $scope.name = ''
  $scope.email = ''
  $scope.messages = ''
  # console.log 'messages>>>', $scope.messages

  $http.get '/contacts/getAllMessages'
    .then (response) ->
      console.log response
      $scope.messages = response.data
      console.log 'messages>>>', $scope.messages

  $scope.sendFeedback = ->
    $scope.success = ''
    $scope.errors = ''

    $http.post '/contacts',
      name: $scope.name
      email: $scope.email
      message: $scope.message
    .success (response) ->
      $scope.info = true
      $('input').val('')
      $('textarea').val('')
      $scope.success = 'Ваша завка отправлена, и будет обработна в близжайшее время'
    .error (response) ->
      $scope.info = true
      $scope.errors = response.errors
