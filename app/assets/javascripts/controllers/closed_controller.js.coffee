@weowepro.controller 'ClosedFormsCtrl', ['$scope', 'ClosedForms',
  @WeoweFormsCtrl = ($scope, ClosedForms) ->

    $scope.predicate =
      value: 'custom_date'

    PendingForms.index (data) ->
      $scope.closedForms = data
]
