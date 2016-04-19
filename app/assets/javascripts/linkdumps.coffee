# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
angular.module('Graffitistudio')
  .factory "Linkdump", ($resource) ->
    $resource '/linkdump/:id'
  .controller 'LinkdumpCtrl', ($scope, $http, Linkdump) ->
    $scope.prefix = 'http://'
    secure = false

    $scope.sitchHttp = ->
      secure = !secure
      if secure
        $scope.prefix = 'https://'
        $scope.secure = 'http-success'
      else
        $scope.prefix = 'http://'
        $scope.secure = ''

    $scope.addUrl = ->
      $scope.success = ''
      $scope.errors = ''

      link = new Linkdump {
        url: $scope.prefix + $scope.url
      }

      Linkdump.save link, (res) ->
        $scope.success = 'Ссылка успешно добавлена'
      , (errors) ->
        $scope.errors = errors.data.url
      #
      # link.$save()
      #   .then (res)->
      #     console.log "res>>>>", res
      #   # .errors (res) ->
        #   console.log "res>>>>", res
      # console.log "errors>>>", errors
      # console.log "errors.$$state>>>", errors.$$state.status
