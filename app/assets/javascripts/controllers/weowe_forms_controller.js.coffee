@weowepro.controller 'WeoweFormsCtrl', ['$scope', 'WeoweForms', 'Users'
  @WeoweFormsCtrl = ($scope, WeoweForms, Users) ->

    $scope.predicate =
      value: '-custom_date'

    $scope.predicateUsers =
      value: 'last_name'

    $scope.totalDisplayed = 25

    $scope.loadMore = ->
      $scope.totalDisplayed += 25
      
    Users.index (data) ->
      $scope.weoweUsers = data

    WeoweForms.index (data) ->
      $scope.weoweForms = data
]
