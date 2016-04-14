# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
angular.module('Graffitistudio')
  .controller 'PromoteCtrl', ($scope, $http) ->
      console.log "PromoteCtrl was started"
      $scope.prefix = 'http://'
      secure = false
      $scope.info = false

      $scope.sitchHttp = ->
        secure = !secure
        if secure
          $scope.prefix = 'https://'
          $scope.secure = 'http-success'
        else
          $scope.prefix = 'http://'
          $scope.secure = ''
      $scope.addRequest = ->
        $scope.success = ''
        $scope.errors = ''

        $http.post '/promote/add-request',
          email: $scope.email
          url: $scope.siteUrl
          desc: $scope.desc
          subject: $scope.subject
          fio: $scope.fio
        .success (response) ->
          $scope.info = true
          $scope.success = 'Ваша завка отправлена, и будет обработна в близжайшее время'
        .error (response) ->
          $scope.info = true
          $scope.errors = response.errors
