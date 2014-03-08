@weowepro.controller 'WeoweFormsCtrl', ['$scope', 'WeoweForms',
  @WeoweFormsCtrl = ($scope, WeoweForms) ->

    $scope.predicate =
      value: 'custom_date'

    WeoweForms.index (data) ->
      $scope.weoweForms = data
]
