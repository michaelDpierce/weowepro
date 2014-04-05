@weowepro.controller 'CompletedFormsCtrl', ['$scope', 'CompletedForms',
  @WeoweFormsCtrl = ($scope, CompletedForms) ->

    $scope.predicate =
      value: '-custom_date'

    $scope.totalDisplayed = 50

    $scope.loadMore = ->
      $scope.totalDisplayed += 100

    CompletedForms.index (data) ->
      $scope.completedForms = data
]
