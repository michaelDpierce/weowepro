@weowepro.controller 'WeoweFormsCtrl', ['$scope', 'WeoweForms',
  @WeoweFormsCtrl = ($scope, WeoweForms) ->

    $scope.predicate =
      value: 'custom_date'

    $scope.deleteRow = (form) ->
      $scope.weoweForms.splice $scope.weoweForms.indexOf(form), 1

    WeoweForms.index (data) ->
      $scope.weoweForms = data
]
