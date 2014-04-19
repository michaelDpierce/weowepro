@weowepro.controller 'PendingFormsCtrl', ['$scope', 'PendingForms',
  @WeoweFormsCtrl = ($scope, PendingForms) ->

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
        msg: "Form for #{form.customer_first_name}
              #{form.customer_last_name}
              has been approved and moved to service."

    $scope.closeAlert = (index) ->
      $scope.alerts.splice index, 1

    $scope.deleteRow = (form) ->
      $scope.pendingForms.splice $scope.pendingForms.indexOf(form), 1

    PendingForms.index (data) ->
      $scope.pendingForms = data
]
