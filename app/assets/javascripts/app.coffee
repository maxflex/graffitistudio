angular.module('Graffitistudio', ['ng-rails-csrf'])
.controller 'MainCtrl', [
  '$scope'
  ($scope) ->
    $scope.test = 'Hello world!'
    $scope.test2html = 'This is firs ctrl'

]
