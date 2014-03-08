@weowepro.controller 'UsersCtrl', ['$scope', 'Users',
  @WeoweFormsCtrl = ($scope, Users) ->

    $scope.predicate =
      value: 'last_name'

    Users.index (data) ->
      $scope.weoweUsers = data
]
