@weowepro.controller 'WeoweFormsCtrl', ['$scope', 'WeoweForms',
  @WeoweFormsCtrl = ($scope, WeoweForms) ->
    $scope.sorter =
      value: 'custom_date'

    WeoweForms.index (data) ->
      $scope.weoweForms = data
]
