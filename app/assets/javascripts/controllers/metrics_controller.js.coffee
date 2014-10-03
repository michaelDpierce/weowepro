@weowepro.controller 'MetricsCtrl', ['$scope', 'Metrics',
  @WeoweFormsCtrl = ($scope, Metrics) ->

    $scope.predicate =
      value: '-custom_date'

    $scope.totalDisplayed = 25

    $scope.loadMore = ->
      $scope.totalDisplayed += 25

    Metrics.index (data) ->
      $scope.metrics = data
]
