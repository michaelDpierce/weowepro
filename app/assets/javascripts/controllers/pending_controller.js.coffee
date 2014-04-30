@weowepro.controller 'PendingFormsCtrl', ['$scope', 'PendingForms',
  @WeoweFormsCtrl = ($scope, PendingForms) ->

    $scope.predicate =
      value: '-custom_date'

    $scope.totalDisplayed = 25

    $scope.loadMore = ->
      $scope.totalDisplayed += 50

    PendingForms.index (data) ->
      $scope.pendingForms = data
]
