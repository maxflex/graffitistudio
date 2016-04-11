# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
angular.module('Graffitistudio')
.config ["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]
.controller 'FreeCtrl', ($scope, $http) ->
    console.log "FreeCtrl STARTER!!!"
    $scope.info = ''

    $scope.addUrl = ->
      $http.post '/free/addUrl',
        url: $scope.siteUrl
      .then (response) ->
        if response.data.status == "true"
          $scope.info = 'Ваш сайт успешно добавлен'
        else
          switch response.data.error_code
            when "1"
              $scope.info = 'Такой сайт уже существует'
            when "1025"
               $scope.info = 'Не установлен баннер'
          console.log "response>>>>", $scope.info
