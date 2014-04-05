@weowepro.controller 'PendingFormsCtrl', ['$scope', 'PendingForms',
  @WeoweFormsCtrl = ($scope, PendingForms) ->

    $scope.predicate =
      value: 'custom_date'

    $scope.totalDisplayed = 50

    $scope.loadMore = ->
      $scope.totalDisplayed += 100

    $scope.deleteRow = (form) ->
      $scope.pendingForms.splice $scope.pendingForms.indexOf(form), 1

    PendingForms.index (data) ->
      $scope.pendingForms = data
]
