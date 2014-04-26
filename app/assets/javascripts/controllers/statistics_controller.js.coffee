@weowepro.controller "TimepickerDemoCtrl", ($scope, $http) ->
  $scope.sharedDate = new Date(new Date().setMinutes(0))
  $scope.sharedDate2 = new Date(new Date().setMinutes(0))
  return
