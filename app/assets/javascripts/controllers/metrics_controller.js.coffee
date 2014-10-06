@weowepro.controller 'MetricsCtrl', ['$scope', 'Metrics', 'Users',
  @WeoweFormsCtrl = ($scope, Metrics, Users) ->

    $scope.total = ->
      total = 0
      angular.forEach $scope.metrics.dealer_total_value, (dealer_total) ->
        total += dealer_total
        return

      total

    Metrics.index (data) ->
      $scope.metrics = data

    Users.index (data) ->
      $scope.weoweUsers = data
]
