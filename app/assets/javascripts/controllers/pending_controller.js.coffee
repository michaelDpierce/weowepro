@weowepro.controller 'PendingFormsCtrl', ['$scope', 'PendingForms',
  @WeoweFormsCtrl = ($scope, PendingForms) ->

    $scope.predicate =
      value: 'custom_date'

    PendingForms.index (data) ->
      $scope.pendingForms = data
]
