# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
angular.module('Graffitistudio')
.config ["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]
.controller 'FreeCtrl', ($scope, $http) ->
    console.log "FreeCtrl STARTER!!!"
    $scope.addUrl = ->
      $http.post '/free/addUrl',
        url: $scope.siteUrl
      ,
      (rescponse) ->
        console.log rescponse
