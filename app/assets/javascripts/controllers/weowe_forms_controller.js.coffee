@weowepro.controller 'WeoweFormsCtrl', ['$scope', 'WeoweForms',
  @WeoweFormsCtrl = ($scope, WeoweForms) ->

    $scope.predicate =
      value: '-custom_date'

    $scope.totalDisplayed = 20

    $scope.loadMore = ->
      $scope.totalDisplayed += 50

    $scope.alerts = []

    $scope.addAlert = (form) ->
      $scope.alerts = []
      $scope.alerts.push
        type: "success"
        msg: "Service has been completed for #{form.customer_first_name}
              #{form.customer_last_name} and they have been notified by email."

    $scope.closeAlert = (index) ->
      $scope.alerts.splice index, 1

    $scope.deleteRow = (form) ->
      $scope.weoweForms.splice $scope.weoweForms.indexOf(form), 1

    WeoweForms.index (data) ->
      $scope.weoweForms = data
]
