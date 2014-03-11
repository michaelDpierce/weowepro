@weowepro.controller 'CompletedFormsCtrl', ['$scope', 'CompletedForms',
  @WeoweFormsCtrl = ($scope, CompletedForms) ->

    $scope.predicate =
      value: 'custom_date'

    CompletedForms.index (data) ->
      $scope.completedForms = data
]
