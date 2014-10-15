@weowepro.controller 'WeoweFormsCtrl', ['$scope', 'WeoweForms', 'Users', 'Sales'
  @WeoweFormsCtrl = ($scope, WeoweForms, Users, Sales) ->

    $scope.predicate =
      value: '-custom_date'

    $scope.predicateUsers =
      value: 'last_name'

    $scope.selected = undefined;

    $scope.totalDisplayed = 25

    $scope.loadMore = ->
      $scope.totalDisplayed += 25

    Users.index (data) ->
      $scope.weoweUsers = data

    Sales.index (data) ->
      $scope.salesStaff = data

    WeoweForms.index (data) ->
      $scope.weoweForms = data
]
