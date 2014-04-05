@weowepro.controller 'PendingFormsCtrl', ['$scope', 'PendingForms',
  @WeoweFormsCtrl = ($scope, PendingForms) ->

    $scope.predicate =
      value: 'custom_date'

    $scope.deleteRow = (form) ->
      $scope.pendingForms.splice $scope.pendingForms.indexOf(form), 1

    PendingForms.index (data) ->
      $scope.pendingForms = data
]
