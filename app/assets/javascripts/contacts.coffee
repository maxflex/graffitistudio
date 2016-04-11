# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
angular.module('Graffitistudio')
.config ["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]
.controller 'feedbackCtrl', ($scope, $http) ->
  console.log 'feedbackCtrl was started!'
  # $scope.error = false
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
    $scope.error = false

    if !$scope.name.length
      console.log $scope.name.length
      $scope.error = true
      $scope.info = "Имя не может быть пустым"

    if !$scope.email.length
      console.log $scope.email.length
      $scope.error = true
      $scope.info = "Email не может быть пустым, и должен быть в формате example@example.ru"

    if !$scope.error
      $http.post '/contacts',
        name: $scope.name
        email: $scope.email
        message: $scope.message
      ,
      (response) ->
        if response
          $scope.info = "Ваше сообщение отправлено на премодерацию"
        console.log response
