@weowepro.controller 'PendingFormsCtrl', ['$scope', 'PendingForms',
  @WeoweFormsCtrl = ($scope, PendingForms) ->

    $scope.predicate =
      value: '-custom_date'

    $scope.totalDisplayed = 20

    $scope.loadMore = ->
      $scope.totalDisplayed += 50

    $scope.customMsg = (form) ->
      YES = "Form for #{form.customer_first_name}
              #{form.customer_last_name}
              has been approved and moved to service.
              Copy sent to customer via email."
      NO = "Form for #{form.customer_first_name}
              #{form.customer_last_name}
              has been approved and moved to service.
              Please provide customer with paper copy."
      message = if form.customer_email then YES else NO

    $scope.customAlert = (form) ->
      alert = if form.customer_email then 'warning' else 'info'

    $scope.alerts = []

    $scope.addAlert = (alert, message) ->
      $scope.alerts = []
      $scope.alerts.push
        type: 'info'
        msg: message

    $scope.closeAlert = (index) ->
      $scope.alerts.splice index, 1



    $scope.deleteRow = (form) ->
      $scope.pendingForms.splice $scope.pendingForms.indexOf(form), 1

    PendingForms.index (data) ->
      $scope.pendingForms = data
]
