@weowepro.controller 'CompletedFormsCtrl', ['$scope', 'CompletedForms',
  @WeoweFormsCtrl = ($scope, CompletedForms) ->

    $scope.predicate =
      value: '-custom_date'

    $scope.totalDisplayed = 25

    $scope.loadMore = ->
      $scope.totalDisplayed += 25

    CompletedForms.index (data) ->
      $scope.completedForms = data
]
