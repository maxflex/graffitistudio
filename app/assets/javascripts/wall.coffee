# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
angular.module('Graffitistudio')
  .controller 'WallCtrl', ($scope, $http) ->
    console.log "WallCtrl was started"
    $scope.banners = ''
    $scope.formAddBanner = false
    $scope.prefix = 'http://'
    secure = false

    $http.post '/wall/get-banners'
    .then (response) ->
      console.log response
      $scope.banners = response.data.banners

    $scope.showForm = ->
      $scope.formAddBanner = !$scope.formAddBanner

    $scope.sitchHttp = ->
      secure = !secure
      if secure
        $scope.prefix = 'https://'
        $scope.secure = 'http-success'
      else
        $scope.prefix = 'http://'
        $scope.secure = ''

    $scope.addBanner = ->
      $scope.success = ''
      $scope.errors = ''

      $http.post '/wall/add-banner',
        site_url: $scope.prefix + $scope.siteUrl
        site_title: $scope.siteTitle
        banner_url: $scope.prefix + $scope.bannerUrl
      .success (response) ->
        $scope.success = 'Ваш сайт успешно добавлен на стену'
      .error (response) ->
        $scope.errors = response.errors
