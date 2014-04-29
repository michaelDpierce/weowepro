@weowepro.controller 'WeoweFormsCtrl', ['$scope', 'WeoweForms',
  @WeoweFormsCtrl = ($scope, WeoweForms) ->

    $scope.predicate =
      value: '-custom_date'

    $scope.totalDisplayed = 20

    $scope.loadMore = ->
      $scope.totalDisplayed += 50

    WeoweForms.index (data) ->
      $scope.weoweForms = data
]
