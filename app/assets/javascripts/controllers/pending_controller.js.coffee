@weowepro.controller 'PendingFormsCtrl', ['$scope', 'PendingForms',
  @WeoweFormsCtrl = ($scope, PendingForms) ->

    $scope.predicate =
      value: '-custom_date'

    $scope.alerts = []

    $scope.addAlert = (data) ->
      $scope.alerts = []
      $scope.alerts.push
        type: "success"
        msg: "Form for #{data.customer_first_name} #{data.customer_last_name} approved and sent to Service."

    $scope.closeAlert = (index) ->
      $scope.alerts.splice index, 1

    $scope.totalDisplayed = 50

    $scope.loadMore = ->
      $scope.totalDisplayed += 100

    $scope.deleteRow = (form) ->
      $scope.pendingForms.splice $scope.pendingForms.indexOf(form), 1

    PendingForms.index (data) ->
      $scope.pendingForms = data
]
