@weowepro.controller 'AnalyticsCtrl', ['$scope',
  @AnalyticsControllerCtrl = ($scope) ->
    $scope.today1 = ->
      $scope.dt1 = new Date()
      return

    $scope.today2 = ->
      $scope.dt2 = new Date()
      return

    $scope.today1()
    $scope.today2()

    $scope.open1 = ($event) ->
      $event.preventDefault()
      $event.stopPropagation()
      $scope.opened1 = true
      return

    $scope.open2 = ($event) ->
      $event.preventDefault()
      $event.stopPropagation()
      $scope.opened2 = true
      return

    $scope.dateOptions =
      "year-format": "'yy'"
      "starting-day": 1

    return
]
