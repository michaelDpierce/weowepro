@weowepro.controller 'WeoweFormsCtrl', ['$scope', 'WeoweForms',
  @WeoweFormsCtrl = ($scope, WeoweForms) ->

    $scope.predicate =
      value: '-custom_date'

    $scope.alerts = []

    $scope.addAlert = (data) ->
      $scope.alerts = []
      $scope.alerts.push
        type: "success"
        msg: "Service for #{data.customer_first_name} #{data.customer_last_name}
        has been completed and they have been notified by email. "

    $scope.closeAlert = (index) ->
      $scope.alerts.splice index, 1

    $scope.totalDisplayed = 50

    $scope.loadMore = ->
      $scope.totalDisplayed += 100

    $scope.deleteRow = (form) ->
      $scope.weoweForms.splice $scope.weoweForms.indexOf(form), 1

    WeoweForms.index (data) ->
      $scope.weoweForms = data
]
