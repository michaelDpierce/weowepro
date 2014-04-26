@weowepro.controller 'TimepickerDemoCtrl', ['$scope', '$http',
  @TimePickerDemo = ($scope, $http) ->

    $scope.sharedDate = new Date(new Date().setMinutes(0))
    $scope.sharedDate2 = new Date(new Date().setMinutes(0))
    return
]
